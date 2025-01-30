<?php
namespace App\Http\Controllers\api;

use App\Models\Fee;
use App\Models\Product;
use App\Models\Wishlist;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class WishlistController extends Controller
{
    public function addToWishlist(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'product_id' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $wishlistItem = Wishlist::where('user_id', Auth::user()->id)
            ->where('product_id', $request->product_id)
            ->first();

        if ($wishlistItem) {
            $wishlistItem->delete();
            return response()->json([
                'status'  => true,
                'message' => "Item removed from wishlist.",
                'data'    => $wishlistItem,
            ], 200);
        } else {
            $wishlist = Wishlist::create([
                'user_id'    => Auth::user()->id,
                'product_id' => $request->product_id,
            ]);
            return response()->json([
                'status'  => true,
                'message' => "Item added to wishlist.",
                'data'    => $wishlist,
            ], 200);
        }
    }

    public function getWishlist(Request $request)
    {
        $fee = Fee::first();
        $per_page = $request->per_page ?? 10;
        $products = Product::with('wishlists')->whereHas('wishlists', function ($q) {
            $q->where('user_id', Auth::user()->id);
        })->paginate($per_page);

        $formattedProducts = $products->getCollection()->map(function ($product) use($fee) {
            $product->images = json_decode($product->images);
            if (is_array($product->images)) {
                $product->images = array_map(function ($image) {
                    return asset('uploads/' . $image);
                }, $product->images);
            } else {
                $product->images = [];
            }
            $calculate_buyer_protection_fee = ($product->price * $fee->buyer_protection_fee) / 100;
            $product->price_with_buyer_protection_fee= round($calculate_buyer_protection_fee+$product->price,2);
            return $product;
        });
        $products->setCollection($formattedProducts);
        return response()->json([
            'status'  => true,
            'message' => "wishlist retrieve successfully.",
            'data'    => $products,
        ], 200);
    }
}
