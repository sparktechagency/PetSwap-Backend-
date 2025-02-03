<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SettingController extends Controller
{

    // public function getSetting(Request $request)
    // {
    //     $setting = Setting::query();
    //     if ($request->type == 'Terms and Conditions'||$request->type == 'Terms_and_Conditions') {
    //         $setting = $setting->where('type', $request->type);
    //     }
    //     if ($request->type == 'Legal Notes'||$request->type == 'Legal_Notes') {
    //         $setting = $setting->where('type', $request->type);
    //     }
    //     if ($request->type == 'Our Platform'||$request->type == 'Our_Platform') {
    //         $setting = $setting->where('type', $request->type);
    //     }
    //     $setting = $setting->first();
    //     return response()->json([
    //         'status' => true,
    //         'data' => $setting,
    //     ], 200);
    // }

    public function getSetting(Request $request)
    {
        $allowedTypes = [
            'Terms and Conditions',
            'Legal Notes',
            'Our Platform',
        ];

        $type = str_replace('_', ' ', $request->type);

        $setting = in_array($type, $allowedTypes) ? Setting::where('type', $type)->first() : null;

        return response()->json([
            'status' => true,
            'data'   => $setting,
        ]);
    }

    public function settingUpdate(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'data' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $type = str_replace('_', ' ', $request->type);
        $setting = Setting::where('type', $type)->first();
        $setting->update([
            'data' => $request->data,
        ]);
        return response()->json([
            'status' => true,
            'data'   => $setting,
        ], 200);
    }
}
