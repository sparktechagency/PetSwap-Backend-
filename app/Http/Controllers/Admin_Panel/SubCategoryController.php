<?php

namespace App\Http\Controllers\Admin_panel;

use App\Http\Controllers\Controller;
use App\Models\SubCategory;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class SubCategoryController extends Controller
{
    public function index()
    {
        $subcategories = SubCategory::with('category:id,name,icon')->select('id', 'name', 'category_id', 'created_at')->get();
        return response()->json(['status' => true, 'data' => $subcategories], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'category_id' => 'required|numeric',
            'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $subcategory = SubCategory::create([
            'category_id' => $request->category_id,
            'name' => $request->name,
        ]);
        return response()->json([
            'status' => true,
            'message' => 'Subcategory created successfully',
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $subcategory = SubCategory::findOrFail($id);
        $subcategory->update([
            'name' => $request->name,
        ]);
        return response()->json([
            'status' => true,
            'message' => 'Subcategory update successfully',
        ], 200);
    }

    public function delete($id)
    {
        try {
            $subcategory = SubCategory::findOrFail($id);
            $subcategory->delete();
            return response()->json([
                'status' => true,
                'message' => 'Subcategory delete successfully',
            ], 200);
        } catch (Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
