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
            $photo_location = 'sliders/';
            $uploaded_photo = $request->file('image');
            $new_photo_name = time() . '.' . $uploaded_photo->getClientOriginalExtension();
            $new_photo_location = $photo_location . $new_photo_name;
            $uploaded_photo->storeAs('public/' . $photo_location, $new_photo_name);
        }

        $slider = Slider::create([
            'image' => $new_photo_location,
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
                    $relativeImagePath = $slider->image;
                    if (Storage::disk('public')->exists($relativeImagePath)) {
                        Storage::disk('public')->delete($relativeImagePath);
                    }
                }
                // Store the new image
                $path = $request->file('image')->store('sliders', 'public');
                $slider->image =$path;


                $user = User::findOrFail($id);
                if ($user->profile_photo != 'default_profile.jpg') {
                    //delete old photo
                    $photo_location = 'public/uploads/profile_photo/';
                    $old_photo_location = $photo_location . $user->profile_photo;
                    unlink(base_path($old_photo_location));
                }
                if ($request->hasFile('image')) {
                    $photo_location = 'sliders/';
                    $uploaded_photo = $request->file('image');
                    $new_photo_name = time() . '.' . $uploaded_photo->getClientOriginalExtension();
                    $new_photo_location = $photo_location . $new_photo_name;
                    $uploaded_photo->storeAs('public/' . $photo_location, $new_photo_name);
                }

                $slider = Slider::create([
                    'image' => $new_photo_location,
                ]);


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
            $relativeImagePath = $slider->image;

            // Delete the image file from storage
            if (Storage::disk('public')->exists($relativeImagePath)) {
                Storage::disk('public')->delete($relativeImagePath);
            }
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
