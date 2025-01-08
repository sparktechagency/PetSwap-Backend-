<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Rating;
use App\Models\UserPlan;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $per_page = $request->per_page ?? 10;
        $products = Product::with('user:id,name,email,avatar')->withCount('wishlists')->where('title', 'LIKE', '%' . $request->search . '%');
        if (Auth::user()->role == 'USER') {
            $products = $products->where('user_id', Auth::user()->id)->where('status', 'Approved');
        }

        $products = $products->latest('id')->paginate($per_page);
        $formattedProducts = $products->getCollection()->map(function ($product) {
            $product->images = json_decode($product->images);
            if (is_array($product->images)) {
                $product->images = array_map(function ($image) {
                    return asset('storage/' . $image);
                }, $product->images);
            } else {
                $product->images = [];
            }

            return $product;
        });
        $products->setCollection($formattedProducts);
        return response()->json([
            'status' => true,
            'message' => 'Product retrieved successfully',
            'data' => $products,
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_id' => 'required|numeric',
            'sub_category_ids' => 'required|array',
            'title' => 'required|string|max:255',
            'price' => 'required|numeric',
            'images' => 'nullable|array|max:5',
            'images.*' => 'image|mimes:jpeg,png,jpg|max:10240',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $user = Auth::user();
        $current_plan = UserPlan::where('plan_type', $user->subscription_plan)->first();
        if ($current_plan->max_can_upload > $user->product_upload) {

            if ($request->hasFile('images')) {
                foreach ($request->file('images') as $image) {
                    $final_name = time() . uniqid() .'.' . $image->extension();
                    $image->move(public_path('uploads/product'), $final_name);
                    $image_path = 'product/' . $final_name;
                    $imagePaths[] = $image_path;
                }
            }

            $product = Product::create([
                'user_id' => Auth::user()->id,
                'category_id' => $request->category_id,
                'sub_category_id' => $request->sub_category_ids,
                'title' => $request->title,
                'description' => $request->description,
                'images' => json_encode($imagePaths),
                'price' => $request->price,
                'brand' => $request->brand,
                'condition' => $request->condition,
                'is_food' => $request->is_food,
                'weight' => $request->weight,
            ]);

            $user->product_upload += 1;
            $user->save();
            return response()->json([
                'status' => true,
                'message' => "Product added successfully.",
                'data' => $product,
            ], 200);
        }
        return response()->json([
            'status' => true,
            'message' => "You have exceeded the plan's capacity. Please Upgread your plan",
        ], 200);
    }

    public function update(Request $request, $id)
    {

        $validator = Validator::make($request->all(), [
            'category_id' => 'required|numeric',
            'sub_category_ids' => 'required|array',
            'title' => 'required|string|max:255',
            'price' => 'required|numeric',
            'images' => 'nullable|array|max:5',
            'images.*' => 'image|mimes:jpeg,png,jpg|max:10240',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        try {
            $product = Product::find($id);
            $imagePaths = json_decode($product->images, true) ?? [];
            return $imagePaths;
            if ($request->hasFile('images')) {
                foreach ($imagePaths as $path) {
                    $photo_location = public_path('uploads/');
                    $old_photo_location = $photo_location . $path;
                    if (file_exists($old_photo_location)) {
                        unlink($old_photo_location);
                    }
                }
            }



            $product->update([
                'category_id' => $request->category_id ?? $product->category_id,
                'sub_category_id' => $request->sub_category_ids,
                'title' => $request->title ?? $product->title,
                'description' => $request->description ?? $product->description,
                'images' => json_encode($imagePaths),
                'price' => $request->price ?? $product->price,
                'brand' => $request->brand ?? $product->brand,
                'condition' => $request->condition ?? $product->condition,
                'is_food' => $request->is_food ?? $product->is_food,
                'weight' => $request->weight ?? $product->weight,
            ]);

            return response()->json([
                'status' => true,
                'message' => "Product updated successfully.",
                'data' => $product,
            ], 200);
        } catch (Exception $e) {
            Log::error('Product update: ' . $e->getMessage());
            return response()->json([
                'status' => false,
                'message' => "Product not found.",
            ], 404);
        }
    }

    public function delete($id)
    {
        try {
            $product = Product::findOrFail($id);
            $imagePaths = json_decode($product->images, true) ?? [];
            if ($imagePaths) {
                // delete old images
                foreach ($imagePaths as $path) {
                    $oldPath = str_replace(asset('storage/'), '', $path);
                    if (Storage::disk('public')->exists($oldPath)) {
                        Storage::disk('public')->delete($oldPath);
                    }
                }
            }
            $product->delete();
            return response()->json([
                'status' => true,
                'message' => "Product delete successfully.",
                'data' => $product,
            ], 200);
        } catch (Exception $e) {
            Log::error('Product delete: ' . $e->getMessage());
            return response()->json([
                'status' => false,
                'message' => "Product not found.",
            ], 404);
        }
    }

    public function show(Request $request, $id)
    {
        try {
            $product = Product::with('user:id,name,email,avatar')->where('id', $id)->firstOrFail();
            $product->images = json_decode($product->images, true) ?? [];

            // Get the latest rating and count ratings
            $last_rating = Rating::with('buyer')->where('products_id', $product->id)->latest()->first();
            $rating_count = Rating::where('products_id', $product->id)->count();

            // Increment view count if the authenticated user is not the owner
            if (Auth::user()->id != $product->user_id) {
                $product->view_count += 1;
                $product->save();
            }

            // Prepare the rating data
            $rating_data = $last_rating ? [
                'id' => $last_rating->id,
                'rating' => $last_rating->rating,
                'review' => $last_rating->review,
                'total_rating_count' => $rating_count,
                'rating_user' => $last_rating->buyer ? [
                    'id' => $last_rating->buyer->id,
                    'name' => $last_rating->buyer->name,
                    'avatar' => $last_rating->buyer->avatar,
                ] : null,
            ] : null;

            // Prepare the product response
            $response = [
                'id' => $product->id,
                'user_id' => $product->user_id,
                'category_id' => $product->category_id,
                'sub_category_id' => $product->sub_category_id,
                'title' => $product->title,
                'description' => $product->description,
                'images' => array_map(function ($image) {
                    return asset('uploads/'.$image);
                }, $product->images),
                'price' => $product->price,
                'platform_fee' => $product->platform_fee,
                'brand' => $product->brand,
                'condition' => $product->condition,
                'is_food' => $product->is_food,
                'weight' => $product->weight,
                'view_count' => $product->view_count,
                'status' => $product->status,
                'created_at' => $product->created_at,
                'updated_at' => $product->updated_at,
                'rating' => $rating_data, // Include the rating data or null
            ];

            return response()->json([
                'status' => true,
                'data' => $response,
            ], 200);

        } catch (Exception $e) {
            Log::error('Product show: ' . $e->getMessage());
            return response()->json([
                'status' => false,
                'message' => "Product not found.",
            ], 404);
        }
    }

    public function statusUpdate(Request $request, $id)
    {
        try {
            $product = Product::findOrFail($id);
            $product->status = $request->status;
            $product->save();
            return response()->json([
                'status' => true,
                'message' => 'Product status updated successfully',
                'data' => $product,
            ], 200);
        } catch (Exception $e) {
            Log::error('Product status: ' . $e->getMessage());
            return response()->json([
                'status' => false,
                'message' => "Product not found.",
            ], 404);
        }
    }
}
