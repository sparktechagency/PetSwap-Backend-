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
            $category->icon = asset('uploads/' . $category->icon);
        }
        return response()->json(['status' => true, 'data' => $categories], 200);
    }

    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'icon' => 'sometimes|mimes:png,jpg,jpeg',
            // 'name' => 'required|string|max:255',
            // 'subcategories' => 'nullable|array',
            // 'subcategories.*' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        if ($request->hasFile('icon')) {
            $final_name = time() . '.' . $request->icon->extension();
            $request->icon->move(public_path('uploads/category'), $final_name);
            $image_path = 'category/' . $final_name;
        }
        $category = Category::create([
            'name' => $request->name,
            'icon' => $image_path,
        ]);

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

        $category = Category::findOrFail($id);

            // Update the category's name
            $category->update([
                'name' => $request->name,
            ]);

            if ($request->hasFile('icon')) {
                $photo_location = public_path('uploads/');
                $old_photo_location = $photo_location . $category->icon;
                if (file_exists($old_photo_location)) {
                    unlink($old_photo_location);
                }

                $final_name = time() . '.' . $request->icon->extension();
                $request->icon->move(public_path('uploads/category'), $final_name);
                $image_path = 'category/' . $final_name;
                $category->icon = $image_path;
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


    }

    public function delete($id)
    {
        try {
            $category = Category::findOrFail($id);
            $photo_location = public_path('uploads/');
            $old_photo_location = $photo_location . $category->icon;
            if (file_exists($old_photo_location)) {
                unlink($old_photo_location);
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
