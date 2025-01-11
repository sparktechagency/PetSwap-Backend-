<?php

namespace App\Http\Controllers\api;

use App\Models\Fee;
use App\Models\Product;
use Illuminate\Http\Request;
use function PHPSTORM_META\type;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class HomePageController extends Controller
{


    public function similarProduct(Request $request)
    {

        $per_page = $request->per_page;
        $productId = $request->product_id;
        $currentProduct = Product::find($productId);
        if (!$currentProduct) {
            return response()->json(['status' => false, 'message' => 'Product not found'], 404);
        }

        $products = Product::with('user:id,name,avatar')->whereNot('user_id', Auth::user()->id)
            ->where('status', 'Approved')
            ->where('category_id', $currentProduct->category_id)
            ->latest('view_count')
            ->latest('is_promoted')
            ->paginate($per_page ?? 10);

        // $products->getCollection()->transform(function ($product) {
        //     $product->images = json_decode($product->images, true);
        //     $product->wishlist_count = $product->wishlists->count();
        //     unset($product->wishlists);
        //     return $product;
        // });

        $fee = Fee::first();

        $products->getCollection()->transform(function ($product) use ($fee) {

            $product->images = array_map(function ($image) {
                return asset('uploads/' . $image);
            }, json_decode($product->images, true) ?? []);
            $calculate_buyer_protection_fee = ($product->price * $fee->buyer_protection_fee) / 100;
            $product->price_with_buyer_protection_fee= $calculate_buyer_protection_fee+$product->price;
            $product->wishlist_count = $product->wishlists->count();
            unset($product->wishlists);

            return $product;
        });
        return response()->json(['data' => $products]);
    }

    public function homePage(Request $request)
    {
        $fee = Fee::first();
        $per_page = $request->per_page;
        if ($request->type == 'recommended') {
            $products = Product::with(['wishlists', 'user:id,name,avatar'])->whereNot('user_id', Auth::user()->id)
                ->where('status', 'Approved')
                ->latest('view_count')
                ->latest('is_promoted')
                ->paginate($per_page ?? 10);


            $products->getCollection()->transform(function ($product) use ($fee) {
                $product->images = json_decode($product->images, true);
                $product->images = array_map(function ($image) {
                    return asset('uploads/' . $image);
                }, $product->images);
                $calculate_buyer_protection_fee = ($product->price * $fee->buyer_protection_fee) / 100;
                $product->price_with_buyer_protection_fee= $calculate_buyer_protection_fee+$product->price;
                $product->wishlist_count = $product->wishlists->count();
                unset($product->wishlists);
                return $product;
            });

            return response()->json(['message' => 'Show recommended product', 'data' => $products]);
        }
        if ($request->type == 'seller-collection') {
            $products = Product::with(['wishlists', 'user:id,name,avatar'])->whereNot('user_id', Auth::user()->id)
                ->where('status', 'Approved')
                ->latest('is_promoted')
                ->inRandomOrder()
                ->paginate($per_page ?? 10);

            $products->getCollection()->transform(function ($product)use ($fee) {
                $product->images = json_decode($product->images, true);
                $product->images = array_map(function ($image) {
                    return asset('uploads/' . $image);
                }, $product->images);
                $calculate_buyer_protection_fee = ($product->price * $fee->buyer_protection_fee) / 100;
                $product->price_with_buyer_protection_fee= $calculate_buyer_protection_fee+$product->price;
                $product->wishlist_count = $product->wishlists->count();
                unset($product->wishlists);

                $product->user = [
                    'id' => $product->user->id,
                    'name' => $product->user->name,
                    'avatar' => asset('uploads/user/' . $product->user->avatar),
                ];
                return $product;
            });
            return response()->json(['message' => 'Show seller collection product', 'data' => $products]);
        }
        if ($request->type == 'search') {
            $products = Product::with('user:id,name,avatar')
                ->where('status', 'Approved')
                ->latest('is_promoted')
                ->latest('view_count');

            if ($request->filled('search')) {
                $products->where(function ($query) use ($request) {
                    $query->where('title', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('brand', 'LIKE', '%' . $request->search . '%');
                });
            }

            if ($request->filled('category_id')) {
                $products->where('category_id', $request->category_id);
            }

            if ($request->has('sub_category_id')) {
                $products = $products->whereJsonContains('sub_category_id', $request->sub_category_id);
            }

            $products = $products->paginate($per_page);

            $userId = $request->user() ? $request->user()->id : null;

            $products->getCollection()->transform(function ($product) use ($userId,$fee)  {
                $product->images = json_decode($product->images, true);
                     $product->images = array_map(function ($image) {
                    return asset('uploads/' . $image);
                }, $product->images);
                $calculate_buyer_protection_fee = ($product->price * $fee->buyer_protection_fee) / 100;
                $product->price_with_buyer_protection_fee= $calculate_buyer_protection_fee+$product->price;
                $product->wishlist = $product->wishlists->contains('user_id', $userId);
                $product->wishlist_count = $product->wishlists->count();
                unset($product->wishlists);
                return $product;
            });

            return response()->json(['message' => 'Show search product', 'data' => $products]);
        }

        return response()->json(['message' => 'No data found! please select type first'], 404);
    }

}
