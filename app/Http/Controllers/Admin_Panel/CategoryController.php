<?php

namespace App\Http\Controllers\Admin_Panel;

use App\Http\Controllers\Controller;
use App\Models\Category;
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
        return response()->json([
            'status' => true,
            'message' => 'Category created successfully',
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'icon' => 'sometimes|mimes:png,jpg,jpeg',
            'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $category = Category::findOrFail($id);
        $category->update([
            'name' => $request->name,
        ]);
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
        return response()->json([
            'status' => true,
            'message' => 'Category update successfully',
        ], 200);
    }

    public function delete($id)
    {
        $category = Category::findOrFail($id);
        if ($category->icon && $category->icon !== 'category/default_icon.png') {
            $existing_image_path = str_replace('storage/', '', $category->icon);
            Storage::disk('public')->delete($existing_image_path);
        }
        $category->delete();
        return response()->json([
            'status' => true,
            'message' => 'Category delete successfully',
        ], 200);
    }
}
