<?php

namespace App\Http\Controllers\Admin_Panel;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\SubCategory;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::with('subcategories')->select('id', 'icon', 'name', 'created_at')->get();
        foreach ($categories as $category) {
            if ($category->icon) {
                $category->icon = asset('storage/' . $category->icon);
            } else {
                $category->icon = asset('storage/category/default_icon.jpeg');
            }
        }
        return response()->json(['status' => true, 'data' => $categories], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'icon' => 'required|mimes:png,jpg,jpeg',
            'name' => 'required|string|max:255',
            'subcategories' => 'nullable|array',
            'subcategories.*' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $category = Category::create([
            'name' => $request->name,
        ]);

        if ($request->hasFile('icon')) {
            if ($category->icon && $category->icon !== 'user/default_icon.png') {
                $existing_image_path = str_replace('storage/', '', $category->icon);
                Storage::disk('public')->delete($existing_image_path);
            }
            $uploaded_image = $request->file('icon');
            $final_name = $category->id . '.' . $uploaded_image->extension();
            $path = $uploaded_image->storeAs('category', $final_name, 'public');

            $category->icon = 'category/' . $final_name;
        }
        $category->save();

        if ($request->has('subcategories') && is_array($request->subcategories)) {
            foreach ($request->subcategories as $subcategoryName) {
                SubCategory::create([
                    'category_id' => $category->id,
                    'name' => $subcategoryName,
                ]);
            }
        }

        return response()->json([
            'status' => true,
            'message' => 'Category created successfully with subcategories',
            'data' => $category->load('subcategories'),
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'icon' => 'sometimes|mimes:png,jpg,jpeg',
            'name' => 'required|string|max:255',
            'subcategories' => 'nullable|array',
            'subcategories.*' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        try {
            $category = Category::findOrFail($id);

            // Update the category's name
            $category->update([
                'name' => $request->name,
            ]);

            // Update the category's icon if provided
            if ($request->hasFile('icon')) {
                if ($category->icon && $category->icon !== 'category/default_icon.png') {
                    $existing_image_path = str_replace('storage/', '', $category->icon);
                    Storage::disk('public')->delete($existing_image_path);
                }
                $uploaded_image = $request->file('icon');
                $final_name = $category->id . '.' . $uploaded_image->extension();
                $path = $uploaded_image->storeAs('category', $final_name, 'public');

                $category->icon = 'category/' . $final_name;
            }

            $category->save();

            // Handle subcategories
            if ($request->has('subcategories') && is_array($request->subcategories)) {
                foreach ($request->subcategories as $subcategoryName) {
                    // Check if the subcategory already exists
                    $subcategory = SubCategory::where('category_id', $category->id)
                                              ->where('name', $subcategoryName)
                                              ->first();

                    // If it doesn't exist, create it
                    if (!$subcategory) {
                        SubCategory::create([
                            'category_id' => $category->id,
                            'name' => $subcategoryName,
                        ]);
                    }
                }
            }

            return response()->json([
                'status' => true,
                'message' => 'Category updated successfully with subcategories',
                'data' => $category->load('subcategories'),
            ], 200);

        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'No data found',
            ], 404);
        }
    }

    public function delete($id)
    {
        try {
            $category = Category::findOrFail($id);
            if ($category->icon && $category->icon !== 'category/default_icon.png') {
                $existing_image_path = str_replace('storage/', '', $category->icon);
                Storage::disk('public')->delete($existing_image_path);
            }
            $category->delete();
            return response()->json([
                'status' => true,
                'message' => 'Category delete successfully',
                'data' => $category,
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Category not found',
            ], 404);
        }

    }
}
