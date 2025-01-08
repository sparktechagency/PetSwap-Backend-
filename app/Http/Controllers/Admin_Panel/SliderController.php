<?php

namespace App\Http\Controllers\Admin_Panel;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class SliderController extends Controller
{
    public function index(Request $request)
    {
        $per_page = $request->per_page ?? 10;

        $sliders = Slider::paginate($per_page);
        $sliders->getCollection()->transform(function ($slider) {
            $slider->image = asset('uploads/' . $slider->image);
            return $slider;
        });

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

        if ($request->hasFile('image')) {
            $final_name = time() . '.' . $request->image->extension();
            $request->image->move(public_path('uploads/sliders'), $final_name);
            $image_path = 'sliders/' . $final_name;
        }

        $slider = Slider::create([
            'image' => $image_path,
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
                $photo_location = public_path('uploads/');
                $old_photo_location = $photo_location . $slider->image;
                if (file_exists($old_photo_location)) {
                    unlink($old_photo_location);
                }

                $final_name = time() . '.' . $request->image->extension();
                $request->image->move(public_path('uploads/sliders'), $final_name);
                $image_path = 'sliders/' . $final_name;
            }
            $slider->image = $image_path;
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
            $slider = Slider::find($id);
            $photo_location = public_path('uploads/');
            $old_photo_location = $photo_location . $slider->image;
            if (file_exists($old_photo_location)) {
                unlink($old_photo_location);
            }
            $slider->delete();
        } catch (Exception $e) {
            Log::error('Slider Delete:' . $e->getMessage());
            return response()->json([
                'status' => false,
                'message' => 'Slider not found',
            ], 404);
        }
    }
}
