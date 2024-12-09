<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function order(Request $request)
    {
        $per_page = $request->per_page ?? 10;
        $orders = null;

        if ($request->type == 'my_orders') {
            $orders = Payment::with('seller:id,name,avatar,address', 'product')->where('buyer_id', Auth::user()->id)
                ->orderBy("id", "desc")
                ->paginate($per_page);
        }

        if ($request->type == 'sell_orders') {
            $orders = Payment::with('buyer:id,name,avatar,address', 'product')->where('seller_id', Auth::user()->id)
                ->orderBy("id", "desc")
                ->paginate($per_page);
        }

        if ($orders) {
            $orders->getCollection()->transform(function ($order) {

                if (is_string($order->product->images)) {
                    $order->product->images = json_decode($order->product->images, true);
                }
                $order->product->images = array_map(function ($image) {
                    return url($image); 
                }, $order->product->images);

                return $order;
            });
        }

        return response()->json([
            'status' => true,
            'data' => $orders,
        ], 200);
    }

}
