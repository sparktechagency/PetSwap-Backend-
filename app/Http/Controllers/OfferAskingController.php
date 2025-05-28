<?php
namespace App\Http\Controllers;

use App\Models\Fee;
use App\Models\OfferPrice;
use App\Models\Product;
use App\Models\User;
use App\Notifications\OfferAcceptNotification;
use App\Notifications\OfferAskingNotification;
use App\Notifications\OfferRejectNotification;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class OfferAskingController extends SendCloudController
{
    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'seller_id'    => 'required|numeric',
            'product_id'   => 'required|numeric',
            'asking_price' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $offer = OfferPrice::create([
            'seller_id'    => $request->seller_id,
            'buyer_id'     => Auth::user()->id,
            'product_id'   => $request->product_id,
            'asking_price' => $request->asking_price,
        ]);

        $buyer   = User::findOrFail(Auth::user()->id);
        $product = Product::findOrFail($request->product_id);

        $productImages = json_decode($product->images, true);
        $firstImage    = $productImages[0] ?? null;

        $notification_data = [
            'buyer_image' => $buyer->avatar,
            'buyer_name'  => $buyer->name,
            'product_id'  => $product->id,
            'offer_id'    => $offer->id,
        ];

        $seller = User::find($request->seller_id);
        if ($seller) {
            $seller->notify(new OfferAskingNotification($notification_data));
        }
        return response()->json([
            'status'  => true,
            'message' => "Offer asking successfully.",
            'data'    => $offer,
        ], 200);
    }

    public function accept_reject(Request $request, $id)
    {
        try {
            $offer = OfferPrice::findOrFail($id);
            if ($offer->status == 'pending') {
                $seller = User::findOrFail($offer->seller_id);
                if ($request->type == 'accept') {
                    $offer->status = 'accept';
                    $offer->save();

                    $notification_data = [
                        'seller_image' => $seller->avatar,
                        'seller_name'  => $seller->name,
                        'product_id'   => $offer->product_id,
                        'offer_id'     => $offer->id,
                    ];

                    if ($offer->buyer_id) {
                        $buyer = User::findOrFail($offer->buyer_id);
                        $buyer->notify(new OfferAcceptNotification($notification_data));
                    }

                    return response()->json([
                        'status'  => true,
                        'message' => "Offer accepted successfully.",
                        'data'    => $offer,
                    ], 200);
                }

                if ($request->type == 'reject') {
                    $offer->status = 'reject';
                    $offer->save();

                    $notification_data = [
                        'seller_image' => $seller->avatar,
                        'seller_name'  => $seller->name,
                        'product_id'   => $offer->product_id,
                        'offer_id'     => $offer->id,
                    ];

                    if ($offer->buyer_id) {
                        $buyer = User::findOrFail($offer->buyer_id);
                        $buyer->notify(new OfferRejectNotification($notification_data));
                    }

                    return response()->json([
                        'status'  => true,
                        'message' => "Offer rejected successfully.",
                        'data'    => $offer,
                    ], 200);
                }
            }
            return response()->json([
                'status'  => false,
                'message' => "You already made an action of this offer.",
            ], 400);

        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json([
                'status'  => false,
                'message' => "No data found.",
            ], 404);
        }
    }

    public function show(Request $request)
    {
        try {
            $offer_id = $request->offer_id;
            $offer    = OfferPrice::findOrFail($offer_id);
            return response()->json([
                'status'  => true,
                'message' => "Offer data get successfully",
                'data'    => $offer,
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'status'  => false,
                'message' => "Offer data get successfully",
                'data'    => null,
            ], 200);

        }
    }
    public function offerdetails($id)
    {
        $user = Auth::user();
        $fee  = Fee::first();
        try {
            $offer           = OfferPrice::findOrFail($id);
            $product         = Product::with('user:id,name,email,avatar,address', 'wishlists')->withCount('wishlists')->where('id', $offer->product_id)->firstOrFail();
            $product->images = json_decode($product->images, true) ?? [];

                // Determine shipping method and price
            $shippingMethods = config('shipping_methods');
            $shippingMethod  = $this->findShippingMethodByWeight(
                (float) $product->weight,
                $shippingMethods
            );
            $shipping_request_data = new Request([
                'shipping_method_id' => $shippingMethod['shipping_id'],
                'weight'             => (float) $product->weight,
            ]);
            $shippingApiResponse = $this->getShippingPrice($shipping_request_data);
            $data                = $shippingApiResponse->getData(true);

            $wishlist = $user ? $product->wishlists->contains(function ($wishlist) use ($user) {
                return $wishlist->user_id == $user->id;
            }) : false;

            $wishlist = $user ? $product->wishlists->contains(function ($wishlist) use ($user) {
                return $wishlist->user_id == $user->id;
            }) : false;
            $product_price = $product->price;
            if ($offer->status == 'accept') {
                $price = $offer->asking_price;
            } else {
                $price = $product->price;
            }

            $calculate_buyer_protection_fee  = round(($price * $fee->buyer_protection_fee) / 100, 2);
            $price_with_buyer_protection_fee = round($calculate_buyer_protection_fee + $price, 2);
                $shipping_fee                    = $data['data'][0]['price'];
            $perday_promotion                = $fee->per_day_promotion_amount;

            $response = [
                'id'                              => $product->id,
                'user_id'                         => $product->user_id,
                'category_id'                     => $product->category_id,
                'sub_category_id'                 => $product->sub_category_id,
                'title'                           => $product->title,
                'description'                     => $product->description,
                'images'                          => array_map(function ($image) {
                    return asset('uploads/' . $image);
                }, $product->images),
                'price'                           => $price,
                'brand'                           => $product->brand,
                'condition'                       => $product->condition,
                'is_food'                         => $product->is_food,
                'weight'                          => $product->weight,
                'price_with_buyer_protection_fee' => $price_with_buyer_protection_fee,
                'buyer_protection_fee'            => $calculate_buyer_protection_fee,
                'platform_fee'                    => $fee->platform_fee,
                'shipping_fee'                    => $shipping_fee,
                'final_price'                     => round($price + $calculate_buyer_protection_fee + $fee->platform_fee + $shipping_fee, 2),
                'offer_buying_status'             => $offer->is_buy,
                'offer_status'                    => $offer->status,
                'per_day_promotion_amount'        => $perday_promotion,
                'view_count'                      => $product->view_count,
                'wishlist_count'                  => $product->wishlists_count,
                'wishlist'                        => $wishlist,
                'created_at'                      => $product->created_at,
                'updated_at'                      => $product->updated_at,
                // 'rating' => $rating_data,
                'user'                            => [
                    'name'    => $product->user->name,
                    'email'   => $product->user->email,
                    'address' => $product->user->address,
                    'avatar'  => $product->user->avatar,
                ],
                      'shipping_method'                 => [
                    'shipping_id' => $shippingMethod['shipping_id'] ?? null,
                    'name'        => $shippingMethod['name'] ?? null,
                    'min_weight'  => $shippingMethod['min_weight'] ?? null,
                    'max_weight'  => $shippingMethod['max_weight'] ?? null,
                ],
            ];

            return response()->json([
                'status' => true,
                'data'   => $response,
            ], 200);

        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json([
                'status'  => false,
                'message' => "data not found.",
                'data'    => null,
            ]);
        }
    }

    public function change_status($id)
    {
        $offer         = OfferPrice::findOrFail($id);
        $offer->is_buy = 1;
        $offer->save();
        return response()->json([
            'status'  => true,
            'message' => 'Offer buyed successfully',
            'data'    => $offer,
        ]);
    }
  private function findShippingMethodByWeight(float $weight, array $shippingMethods): ?array
    {
        foreach ($shippingMethods as $method) {
            if ($weight >= $method['min_weight'] && $weight < $method['max_weight']) {
                return $method;
            }
        }
        return null;
    }

}
