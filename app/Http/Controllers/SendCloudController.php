<?php
namespace App\Http\Controllers;

use App\Models\Payment;
use App\Models\Product;
use App\Models\Shipping;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class SendCloudController extends Controller
{
    protected $baseUrl;
    protected $publicKey;
    protected $secretKey;
    public function __construct()
    {
        $this->baseUrl   = 'https://panel.sendcloud.sc/api/v2/';
        $this->publicKey = env('SENDCLOUD_API_PUBLIC');
        $this->secretKey = env('SENDCLOUD_API_SECRET');
    }

    public function getShippingMethods()
    {
        $response = Http::withBasicAuth($this->publicKey, $this->secretKey)
            ->get($this->baseUrl . 'shipping_methods');

        return $response->json();
    }

    public function getShippingPrice(Request $request)
    {
        $request->validate([
            'shipping_method_id' => 'required|numeric',
            'weight'             => 'required|numeric',
        ]);

        $response = Http::withBasicAuth($this->publicKey, $this->secretKey)
            ->get($this->baseUrl . 'shipping-price', [
                'shipping_method_id' => $request->shipping_method_id,
                'from_country'       => 'GB',
                'to_country'         => 'GB',
                'weight'             => $request->weight,
                'weight_unit'        => 'kilogram',
            ]);

        if (! $response->successful()) {
            return response()->json([
                'status'  => false,
                'message' => 'Failed to retrieve shipping price.',
                'error'   => $response->json(),
            ], $response->status());
        }

        return response()->json([
            'status' => true,
            'data'   => $response->json(),
        ]);
    }

    public function createParcel(Request $request)
    {
        $validated = $request->validate([
            'order_id'        => 'required|exists:payments,id',
            'shipping_method' => 'required|numeric',
        ]);

        $order   = Payment::findOrFail($validated['order_id']);
        $product = Product::findOrFail($order->product_id);
        $buyer   = User::findOrFail($order->buyer_id);
        $parcel  = [
            'name'            => $buyer->name,
            'address'         => $buyer->address,
            'city'            => $order->city,
            'postal_code'     => $order->zip,
            'country'         => $order->country,
            'email'           => $buyer->email,
            'order_number'    => $order->id,
            'weight'          => $product->weight,
            'shipping_method' => $validated['shipping_method'],
            'request_label'   => true,
            'parcel_items'    => [[
                'description' => $product->title,
                'quantity'    => 1,
                'weight'      => $product->weight,
                'value'       => $product->price,
            ]],
        ];

        if (! empty($request->to_service_point) && ! empty($request->to_post_number)) {
            $parcel['to_service_point'] = $request->to_service_point;
            $parcel['to_post_number']   = $request->to_post_number;
        }

        $response = Http::withBasicAuth($this->publicKey, $this->secretKey)
            ->post($this->baseUrl . 'parcels', ['parcel' => $parcel]);

        $data = $response->json();

        if (! isset($data['parcel'])) {
            Log::error('Parcel creation failed', ['response' => $data]);
            return response()->json(['error' => 'Parcel creation failed'], 500);
        }

        $parcelData = $data['parcel'];

        Shipping::create([
            'payment_id'      => $order->id,
            'parcel_id'       => $parcelData['id'],
            'tracking_number' => $parcelData['tracking_number'] ?? '',
            'tracking_url'    => $parcelData['tracking_url'] ?? '',
            'shipping_status' => 'Pending',
        ]);

        return response()->json([
            'status'  => true,
            'message' => 'Parcel created successfully.',
            'parcel'  => $parcelData,
        ]);
    }

    public function generateLabel($parcelId)
    {
        $response = Http::withBasicAuth($this->publicKey, $this->secretKey)
            ->get($this->baseUrl . 'labels/' . $parcelId);

        $labelData = $response->json();

        $labelInfo = $labelData['label'] ?? null;

        if (! is_array($labelInfo) || empty($labelInfo['label_printer'])) {
            return response()->json([
                'status'  => false,
                'message' => 'Label not yet available.',
                'data'    => $labelData,
            ], 404);
        }

        $shipping = Shipping::where('parcel_id', $parcelId)->first();
        if ($shipping) {
            $shipping->label_url       = $labelInfo['label_printer'];
            $shipping->shipping_status = 'Label Generated';
            $shipping->save();
        }

        return response()->json([
            'status'    => true,
            'message'   => 'Label fetched successfully.',
            'label_url' => $labelInfo['label_printer'],
        ]);
    }
    public function downloadLabel(Request $request)
    {
        $validated = $request->validate([
            'order_id'  => 'required|numeric',
            'parcel_id' => 'required|numeric',
        ]);
        $parcelId = $request->parcel_id;
        $order_id = $request->order_id;
        $response = Http::withBasicAuth($this->publicKey, $this->secretKey)
            ->get($this->baseUrl . "labels/label_printer/{$parcelId}");

        if ($response->successful()) {
            $order         = Payment::findOrFail($order_id);
            $order->status = 'On Process';
            $order->save();
            $shipping = Shipping::where('parcel_id', $parcelId)->first();
            if ($shipping) {
                $shipping->shipping_status = 'Label Downloaded';
                $shipping->save();
            }

            $headers = [
                'Content-Type'        => 'application/pdf',
                'Content-Disposition' => 'attachment; filename="label_' . $parcelId . '.pdf"',
            ];

            return response($response->body(), 200, $headers);
        }

        return response()->json(['error' => 'Failed to download label'], 500);
    }

   public function trackParcel($parcelId)
{
    $response = Http::withBasicAuth($this->publicKey, $this->secretKey)
        ->get($this->baseUrl . 'parcels/' . $parcelId);

    $parcel = $response->json();

    if (! $response->successful()) {
        return response()->json([
            'status'  => false,
            'message' => 'Failed to fetch parcel info.',
            'error'   => $parcel,
        ], 500);
    }

    // Main fix: check parcel['parcel']['status'] instead of parcel['status']
    if (! isset($parcel['parcel']['status'])) {
        return response()->json([
            'status'  => false,
            'message' => 'Parcel not found or no status available.',
            'data'    => $parcel,
        ], 404);
    }

    return response()->json([
        'status'   => true,
        'message'  => 'Parcel status fetched successfully.',
        'tracking' => [
            'tracking_number' => $parcel['parcel']['tracking_number'] ?? null,
            'tracking_url'    => $parcel['parcel']['tracking_url'] ?? null,
            'status'          => $parcel['parcel']['status']['message'] ?? 'No status message',
        ],
    ]);
}


}
