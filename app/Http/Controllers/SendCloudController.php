<?php
namespace App\Http\Controllers;

use App\Models\Payment;
use App\Models\Product;
use App\Models\Shipping;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

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

    // 1️⃣ Get Shipping Methods
    public function getShippingMethods()
    {
        $response = Http::withBasicAuth($this->publicKey, $this->secretKey)
            ->get($this->baseUrl . 'shipping_methods');

        return response()->json($response->json());
    }

    // 2️⃣ Create Parcel + Save Tracking + Label
    public function createParcel(Request $request)
    {
        $validated = $request->validate([
            'order_id'        => 'required|exists:payments,id',
            'shipping_method' => 'required|numeric',
        ]);

        $order_info   = Payment::findOrFail($request->order_id);
        $product_info = Product::findOrFail($order_info->product_id);

        $buyer_info = User::findOrFail($order_info->buyer_id);
        $parcelData = [
            'parcel' => [
                'name'            => $buyer_info->name,
                'address'         => $buyer_info->address,
                'city'            => $order_info->city,
                'postal_code'     => $order_info->zip,
                'country'         => $order_info->country,
                'email'           => $buyer_info->email,
                'weight'          => $product_info->weight,
                'shipping_method' => $validated['shipping_method'],
            ],
        ];

        // Create Parcel
        $response = Http::withBasicAuth($this->publicKey, $this->secretKey)
            ->post($this->baseUrl . 'parcels', $parcelData);

        $data = $response->json();

        if (! isset($data['parcel'])) {
            return response()->json(['error' => 'Failed to create parcel'], 500);
        }

        $parcel = $data['parcel'];

        // 🔄 Get Label via Parcel ID
        $labelRes = Http::withBasicAuth($this->publicKey, $this->secretKey)
            ->get($this->baseUrl . 'labels/' . $parcel['id']);

        $label = $labelRes->json();

        // ✅ Save to Shipping
        $shipping                  = new Shipping();
        $shipping->tracking_number = $parcel['tracking_number'] ?? null;
        $shipping->tracking_url    = $parcel['tracking_url'] ?? null;
        $shipping->label_url       = $label['label']['label_printer'] ?? null;
        $shipping->shipping_status = 'shipped';
        $shipping->save();

        // ✅ Update the order
        $order_info->status = 'On Process';
        $order_info->save();
        return response()->json([
            'status'       => true,
            'message'      => 'Parcel created and label generated.',
            'tracking_url' => $shipping->tracking_url,
            'label_url'    => $shipping->label_url,
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

}
