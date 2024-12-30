<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomePageController extends Controller
{

    // public function search(Request $request)
    // {
    //     $per_page = $request->get('per_page', 10);

    //     $products = Product::with('user:id,name,avatar')
    //         ->where('status', 'Approved')
    //         ->latest('view_count');

    //     if ($request->filled('search')) {
    //         $products->where(function ($query) use ($request) {
    //             $query->where('title', 'LIKE', '%' . $request->search . '%')
    //                 ->orWhere('brand', 'LIKE', '%' . $request->search . '%');
    //         });
    //     }

    //     if ($request->filled('category_id')) {
    //         $products->where('category_id', $request->category_id);
    //     }

    //     if ($request->has('sub_category_id')) {
    //         $subCategoryIds = is_array($request->sub_category_id)
    //         ? $request->sub_category_id
    //         : explode(',', $request->sub_category_id);

    //         $products->where(function ($query) use ($subCategoryIds) {
    //             foreach ($subCategoryIds as $subCategoryId) {
    //                 $query->orWhereJsonContains('sub_category_id', (int) $subCategoryId);
    //             }
    //         });
    //     }

    //     $products = $products->paginate($per_page);

    //     $products->getCollection()->transform(function ($product) {
    //         $product->images = json_decode($product->images, true);
    //         return $product;
    //     });

    //     return response()->json(['data' => $products]);
    // }

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

    public function homePage(Request $request)
    {
        $per_page = $request->per_page;
        if ($request->type == 'recommended') {
            $products = Product::with(['wishlists', 'user:id,name,avatar'])->whereNot('user_id', Auth::user()->id)
                ->where('status', 'Approved')
                ->latest('view_count')
                ->paginate($per_page ?? 10);

            $products->getCollection()->transform(function ($product) {
                $product->images = json_decode($product->images, true);
                $product->wishlist_count = $product->wishlists->count();
                unset($product->wishlists);
                return $product;
            });
            return response()->json(['message' => 'Show recommended product', 'data' => $products]);
        }
        if ($request->type == 'seller-collection') {
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
            return response()->json(['message' => 'Show seller collection product', 'data' => $products]);
        }
        if ($request->type == 'search') {
            $products = Product::with('user:id,name,avatar')
                ->where('status', 'Approved')
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
                $subCategoryIds = is_array($request->sub_category_id)
                ? $request->sub_category_id
                : explode(',', $request->sub_category_id);

                $products->where(function ($query) use ($subCategoryIds) {
                    foreach ($subCategoryIds as $subCategoryId) {
                        $query->orWhereJsonContains('sub_category_id', (int) $subCategoryId);
                    }
                });
            }

            $products = $products->paginate($per_page);

            $products->getCollection()->transform(function ($product) {
                $product->images = json_decode($product->images, true);
                return $product;
            });
            return response()->json(['message' => 'Show search product', 'data' => $products]);

        }
        return response()->json(['message' => 'No data found! please select type first'], 404);
    }

    // public function index(Request $request)
    // {
    //     $per_page = $request->per_page ?? 10;

    //     $products = Product::query();
    //     if ($request->has('category_id')) {
    //         $products = $products->where('category_id', $request->category_id);
    //     }

    //     if ($request->has('sub_category_id')) {
    //         $subCategoryIds = is_array($request->sub_category_id)
    //         ? $request->sub_category_id
    //         : explode(',', $request->sub_category_id);

    //         $products->where(function ($query) use ($subCategoryIds) {
    //             foreach ($subCategoryIds as $subCategoryId) {
    //                 $query->orWhereJsonContains('sub_category_id', (int) $subCategoryId);
    //             }
    //         });
    //     }

    //     $products = $products->paginate($per_page);
    //     return $products;

    //     $formattedProducts = $products->getCollection()->map(function ($product) {
    //         $product->images = json_decode($product->images);
    //         $product->sub_category_id = json_decode($product->sub_category_id);
    //         return $product;
    //     });
    //     $products->setCollection($formattedProducts);
    //     return response()->json([
    //         'status' => true,
    //         'message' => 'Product retrieved successfully',
    //         'data' => $products,
    //     ], 200);
    // }
}
