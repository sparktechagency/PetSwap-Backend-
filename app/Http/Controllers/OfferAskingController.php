<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\User;
use App\Models\Product;
use App\Models\OfferPrice;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Notifications\OfferAcceptNotification;
use App\Notifications\OfferAskingNotification;
use App\Notifications\OfferRejectNotification;

class OfferAskingController extends Controller
{
    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'seller_id' => 'required|numeric',
            'product_id' => 'required|numeric',
            'asking_price' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $offer = OfferPrice::create([
            'seller_id' => $request->seller_id,
            'buyer_id' => Auth::user()->id,
            'product_id' => $request->product_id,
            'asking_price' => $request->asking_price,
        ]);

        $buyer = User::findOrFail(Auth::user()->id);
        $product = Product::findOrFail($request->product_id);

        $productImages = json_decode($product->images, true);
        $firstImage = $productImages[0] ?? null;

        $notification_data = [
            'buyer_image' => $buyer->avatar,
            'buyer_name' => $buyer->name,
            'product_id' => $product->id,
            'offer_id' => $offer->id,
        ];

        $seller = User::find($request->seller_id);
        if ($seller) {
            $seller->notify(new OfferAskingNotification($notification_data));
        }
        return response()->json([
            'status' => true,
            'message' => "Offer asking successfully.",
            'data'=>$offer,
        ], 200);
    }

    public function accept_reject(Request $request, $id)
    {
        try {
            $offer = OfferPrice::findOrFail($id);
            if($offer->status == 'pending'){
                $seller = User::findOrFail($offer->seller_id);
                if ($request->type == 'accept') {
                    $offer->status = 'accept';
                    $offer->save();

                    $notification_data = [
                        'seller_image' => $seller->avatar,
                        'seller_name' => $seller->name,
                        'product_id' => $offer->product_id,
                        'offer_id' => $offer->id,
                    ];

                    if ($offer->buyer_id) {
                        $buyer = User::findOrFail($offer->buyer_id);
                        $buyer->notify(new OfferAcceptNotification($notification_data));
                    }

                    return response()->json([
                        'status' => true,
                        'message' => "Offer accepted successfully.",
                        'data'=>$offer,
                    ], 200);
                }

                if ($request->type == 'reject') {
                    $offer->status = 'reject';
                    $offer->save();

                    $notification_data = [
                        'seller_image' => $seller->avatar,
                        'seller_name' => $seller->name,
                        'product_id' => $offer->product_id,
                        'offer_id' => $offer->id,
                    ];

                    if ($offer->buyer_id) {
                        $buyer = User::findOrFail($offer->buyer_id);
                        $buyer->notify(new OfferRejectNotification($notification_data));
                    }

                    return response()->json([
                        'status' => true,
                        'message' => "Offer rejected successfully.",
                        'data'=>$offer,
                    ], 200);
                }
            }
            return response()->json([
                'status' => false,
                'message' => "You already made an action of this offer.",
            ], 400);

        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json([
                'status' => false,
                'message' => "No data found.",
            ], 404);
        }
    }


    public function show(Request $request) {
        try{
            $offer_id=$request->offer_id;
        $offer=OfferPrice::findOrFail($offer_id);
        return response()->json([
            'status' => true,
            'message' => "Offer data get successfully",
            'data'=>$offer,
        ], 200);
    }catch(Exception $e) {
        return response()->json([
            'status' => false,
            'message' => "Offer data get successfully",
            'data'=>null,
        ], 200);

        }
    }
}
