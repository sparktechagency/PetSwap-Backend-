<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomePageController extends Controller
{
    public function recommended_to_you(Request $request)
    {
        $per_page = $request->per_page;
        $products = Product::whereNot('user_id', Auth::user()->id)
            ->where('status', 'Approved')
            ->latest('view_count')
            ->paginate($per_page ?? 10);

        $products->getCollection()->transform(function ($product) {
            $product->images = json_decode($product->images, true);
            return $product;
        });

        return response()->json(['data' => $products]);
    }

    public function seller_collection(Request $request)
    {
        $per_page = $request->per_page;

        $products = Product::with(['wishlists', 'user:id,name,avatar'])->whereNot('user_id', Auth::user()->id)
            ->where('status', 'Approved')
            ->inRandomOrder()
            ->paginate($per_page ?? 10);

        $products->getCollection()->transform(function ($product) {
            $product->images = json_decode($product->images, true);

            $product->wishlist_count = $product->wishlists->count();
            unset($product->wishlists);

            $product->user = [
                'id' => $product->user->id,
                'name' => $product->user->name,
                'avatar' => asset('storage/' . $product->user->avatar),
            ];
            return $product;
        });
        return response()->json(['data' => $products]);
    }

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
            ->paginate($per_page ?? 10);

        $products->getCollection()->transform(function ($product) {
            $product->images = json_decode($product->images, true);
            return $product;
        });

        return response()->json(['data' => $products]);
    }

    public function search(Request $request)
    {
        $per_page = $request->per_page;
        $products = Product::with('user:id,name,avatar')->whereNot('user_id', Auth::user()->id)
            ->where('status', 'Approved')
            ->latest('view_count')
            ->where('title', 'LIKE', '%' . $request->product_name . '%')
            ->paginate($per_page ?? 10);

        $products->getCollection()->transform(function ($product) {
            $product->images = json_decode($product->images, true);
            return $product;
        });

        return response()->json(['data' => $products]);
    }
}
