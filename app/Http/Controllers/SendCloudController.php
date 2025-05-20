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

        return response()->json($response->json());
    }

    public function createParcel(Request $request)
    {
        $validated = $request->validate([
            'order_id'        => 'required|exists:payments,id',
            'shipping_method' => 'required|numeric',
        ]);

        $order_info   = Payment::findOrFail($validated['order_id']);
        $product_info = Product::findOrFail($order_info->product_id);
        $buyer_info   = User::findOrFail($order_info->buyer_id);
        $parcel       = [
            'name'            => $buyer_info->name,
            'address'         => $buyer_info->address,
            'city'            => $order_info->city,
            'postal_code'     => $order_info->zip,
            'country'         => $order_info->country,
            'email'           => $buyer_info->email,
            'order_number'    => $order_info->id,
            'weight'          => $product_info->weight,
            'parcel_items'    => [[
                'description' => $product_info->title,
                'quantity'    => 1,
                'weight'      => $product_info->weight,
                'value'       => $product_info->price,
            ]],
            'shipping_method' => $validated['shipping_method'],
        ];

        if (! empty($validated['to_service_point']) && ! empty($validated['to_post_number'])) {
            $parcel['to_service_point'] = $validated['to_service_point'];
            $parcel['to_post_number']   = $validated['to_post_number'];
        }

        $parcelData = [
            'parcel'        => $parcel,
            'request_label' => true,
        ];

        $response = Http::withBasicAuth($this->publicKey, $this->secretKey)
            ->post($this->baseUrl . 'parcels', $parcelData);

        $data = $response->json();

        if (! isset($data['parcel'])) {
            Log::error('Failed to create parcel', ['response' => $data]);
            return response()->json(['error' => 'Parcel creation failed'], 500);
        }

        $parcel                    = $data['parcel'];
        $shipping                  = new Shipping();
        $shipping->payment_id      = $order_info->id;
        $shipping->parcel_id       = $parcel['id'];
        $shipping->tracking_number = $parcel['tracking_number'] ?? '';
        $shipping->tracking_url    = $parcel['tracking_url'] ?? '';
        $shipping->label_url       = $label['label']['label_printer'] ?? '';
        $shipping->shipping_status = 'shipped';
        $shipping->save();

        return response()->json([
            'status'  => true,
            'message' => 'Parcel created successfully.',
            'parcel'  => $parcel,
        ]);
    }















    






    // 3️⃣ Track Order
    // public function trackOrder($orderId)
    // {
    //     $order = Order::findOrFail($orderId);
    //     return response()->json([
    //         'tracking_number' => $order->tracking_number,
    //         'tracking_url'    => $order->tracking_url,
    //     ]);
    // }

    // 4️⃣ Download Label (optional frontend route)
    // public function downloadLabel($orderId)
    // {
    //     $order = Order::findOrFail($orderId);

    //     if (! $order->label_url) {
    //         return response()->json(['error' => 'Label not available'], 404);
    //     }

    //     return redirect($order->label_url); // or download directly
    // }

    public function generateLabel($parcelId)
    {
        $labelRes = Http::withBasicAuth($this->publicKey, $this->secretKey)
            ->get($this->baseUrl . 'labels/' . $parcelId);

        $label = $labelRes->json();
        Log::info('Label fetch response', $label);

        if (! isset($label['label']) || ! isset($label['label']['label_printer'])) {
            return response()->json([
                'status'  => false,
                'message' => 'Label not yet available or failed to generate.',
                'data'    => $label,
            ], 404);
        }

        // Optional: Update DB if needed
        $shipping = Shipping::where('parcel_id', $parcelId)->first();
        if ($shipping) {
            $shipping->label_url = $label['label']['label_printer'];
            $shipping->save();
        }

        return response()->json([
            'status'    => true,
            'message'   => 'Label generated successfully.',
            'label_url' => $label['label']['label_printer'],
        ]);
    }

}
