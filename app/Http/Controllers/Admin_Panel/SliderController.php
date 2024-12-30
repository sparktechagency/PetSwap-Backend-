<?php

namespace App\Http\Controllers\Admin_Panel;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class SliderController extends Controller
{
    public function index(Request $request)
    {
        $per_page = $request->per_page ?? 10;

        $sliders = Slider::paginate($per_page);

        return response()->json([
            'status' => true,
            'data' => $sliders,
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|mimes:png,jpg,jpeg',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $imagePath = null;
        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('sliders', 'public');
            $imagePath = asset('storage/' . $path);
        }

        $slider = Slider::create([
            'image' => $imagePath,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Slider create successfully.',
            'data' => $slider,
        ], 200);
    }
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|mimes:png,jpg,jpeg',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        try {
            $slider = Slider::findOrFail($id);
            if ($request->hasFile('image')) {
                // Delete the old image if it exists
                if ($slider->image) {
                    $oldImagePath = str_replace(asset('storage/'), '', $slider->image);
                    Storage::disk('public')->delete($oldImagePath);
                }
                // Store the new image
                $path = $request->file('image')->store('sliders', 'public');
                $slider->image = asset('storage/' . $path);
            }
            $slider->save();

            return response()->json([
                'status' => true,
                'message' => 'Slider update successfully.',
                'data' => $slider,
            ], 200);
        } catch (Exception $e) {
            Log::error('Slider Update:' . $e->getMessage());
            return response()->json([
                'status' => true,
                'message' => 'Slider not found',
            ], 404);
        }
    }

    public function delete($id)
    {
        try {
            $slider = Slider::findOrFail($id);
            $oldImagePath = str_replace(asset('storage/'), '', $slider->image);
            Storage::disk('public')->delete($oldImagePath);
            $slider->delete();
            return response()->json([
                'status' => true,
                'message' => 'Slider delete successfully.',
            ], 200);
        } catch (Exception $e) {
            Log::error('Slider Delete:' . $e->getMessage());
            return response()->json([
                'status' => false,
                'message' => 'Slider not found',
            ], 404);
        }
    }
}
