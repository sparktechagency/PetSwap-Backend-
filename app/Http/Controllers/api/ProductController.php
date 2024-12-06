<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Product;
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
        $products = Product::where('user_id', Auth::user()->id)->paginate($per_page);
        $formattedProducts = $products->getCollection()->map(function ($product) {
            $product->images = json_decode($product->images);
            $product->sub_category_id = json_decode($product->sub_category_id);
            return $product;
        });
        $products->setCollection($formattedProducts);
        return response()->json([
            'status' => true,
            'data' => $products,
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_id' => 'required|numeric',
            'sub_category_ids' => 'required|array',
            'sub_category_ids.*' => 'exists:sub_categories,id',
            'title' => 'required|string|max:255',
            'price' => 'required|numeric',
            'images' => 'nullable|array|max:5',
            'images.*' => 'image|mimes:jpeg,png,jpg|max:10240',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $imagePaths = [];
        if ($request->has('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('product', 'public');
                $imagePaths[] = asset('storage/' . $path);
            }
        }
        $product = Product::create([
            'user_id' => Auth::user()->id,
            'category_id' => $request->category_id,
            'sub_category_id' => json_encode($request->sub_category_ids, true),
            'title' => $request->title,
            'description' => $request->description,
            'images' => json_encode($imagePaths),
            'price' => $request->price,
            'brand' => $request->brand,
            'condition' => $request->condition,
            'is_food' => $request->is_food,
            'weight' => $request->weight,
        ]);

        return response()->json([
            'status' => true,
            'message' => "Product added successfully.",
            'data' => $product,
        ], 200);
    }

    public function update(Request $request, $id)
    {

        $validator = Validator::make($request->all(), [
            'category_id' => 'required|numeric',
            'sub_category_ids' => 'required|array',
            'sub_category_ids.*' => 'exists:sub_categories,id',
            'title' => 'required|string|max:255',
            'price' => 'required|numeric',
            'images' => 'nullable|array|max:5',
            'images.*' => 'image|mimes:jpeg,png,jpg|max:10240',
        ]);

        try {
            if ($validator->fails()) {
                return response()->json(['status' => false, 'message' => $validator->errors()], 400);
            }
            $product = Product::findOrFail($id);
            $imagePaths = json_decode($product->images, true) ?? [];

            if ($request->has('images')) {
                // delete old images
                foreach ($imagePaths as $path) {
                    $oldPath = str_replace(asset('storage/'), '', $path);
                    if (Storage::disk('public')->exists($oldPath)) {
                        Storage::disk('public')->delete($oldPath);
                    }
                }
                // Save new images
                $imagePaths = [];
                foreach ($request->file('images') as $image) {
                    $path = $image->store('product', 'public');
                    $imagePaths[] = asset('storage/' . $path);
                }
            }

            $product->update([
                'category_id' => $request->category_id ?? $product->category_id,
                'sub_category_id' => $request->sub_category_ids
                ? json_encode($request->sub_category_ids, true)
                : $product->sub_category_id,
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
            ], 200);
        } catch (Exception $e) {
            Log::error('Product delete: ' . $e->getMessage());
            return response()->json([
                'status' => false,
                'message' => "Product not found.",
            ], 404);
        }
    }

    public function show($id)
    {
        try {
            $product = Product::findOrFail($id);
            $product->images = json_decode($product->images, true) ?? [];
            if (Auth::user()->id != $product->user_id) {
                $product->view_count = $product->view_count + 1;
                $product->save();
            }
            return response()->json([
                'status' => true,
                'data' => $product,
            ], 200);
        } catch (Exception $e) {
            Log::error('Product show: ' . $e->getMessage());
            return response()->json([
                'status' => false,
                'message' => "Product not found.",
            ], 404);
        }
    }
}
