<?php
namespace App\Http\Controllers;

use App\Models\Payment;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class OrderController extends Controller
{
    public function order(Request $request)
    {
        $per_page = $request->per_page ?? 10;
        $orders   = null;

        if ($request->type == 'my_orders') {
            $orders = Payment::with('seller:id,name,avatar,address', 'product', 'shipping:id,payment_id,shipping_status,parcel_id')->where('buyer_id', Auth::user()->id)
                ->orderBy("id", "desc")
                ->paginate($per_page);
        }

        if ($request->type == 'sell_orders') {
            $orders = Payment::with('buyer:id,name,avatar,address', 'product', 'shipping:id,payment_id,shipping_status,parcel_id')->where('seller_id', Auth::user()->id)
                ->orderBy("id", "desc")
                ->paginate($per_page);
        }

        if ($orders) {
            $orders->getCollection()->transform(function ($order) {
                // Decode the images if stored as a JSON string
                if (is_string($order->product->images)) {
                    $order->product->images = json_decode($order->product->images, true);
                }

                // Ensure the images are properly formatted URLs
                $order->product->images = array_map(function ($image) {
                    // Check if the image already contains the base URL
                    if (str_starts_with($image, 'http')) {
                        return $image; // Return as-is if already a full URL
                    }
                    return asset('uploads/' . $image); // Prefix with asset base path
                }, $order->product->images);

                // Add wishlist count and remove wishlist collection
                $order->product->wishlist_count = $order->product->wishlists->count();
                unset($order->product->wishlists);

                return $order;
            });
        }

        return response()->json([
            'status' => true,
            'data'   => $orders,
        ], 200);
    }

    public function order_details($id)
    {
        try {
            $order                  = Payment::with('buyer:id,name,avatar', 'seller:id,name,avatar', 'product','shipping')->findOrFail($id);
            $order->product->images = json_decode($order->product->images, true);
            if (is_array($order->product->images)) {
                $order->product->images = array_map(function ($image) {
                    return asset('uploads/' . $image);
                }, $order->product->images);
            }
            return response()->json([
                'status'  => true,
                'message' => 'Order details retreive successfully',
                'data'    => $order,
            ], 200);
        } catch (Exception $e) {
            Log::error('Order Details' . $e->getMessage());
            return response()->json([
                'status'  => false,
                'message' => 'Order not found',
            ], 200);
        }
    }
}
