<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class SettingController extends Controller
{

    public function getSetting(Request $request)
    {
        $setting = Setting::query();
        if ($request->type == 'Terms and Conditions') {
            $setting = $setting->where('type', $request->type);
        }
        if ($request->type == 'Legal Notes') {
            $setting = $setting->where('type', $request->type);
        }
        if ($request->type == 'Our Platform') {
            $setting = $setting->where('type', $request->type);
        }
        $setting = $setting->first();
        return response()->json([
            'status' => true,
            'data' => $setting,
        ], 200);
    }

    public function settingUpdate(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'data' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $setting = Setting::where('type', $request->type)->first();
        $setting->update([
            'data' => $request->data,
        ]);
        return response()->json([
            'status' => true,
            'data' => $setting,
        ], 200);
    }
}
