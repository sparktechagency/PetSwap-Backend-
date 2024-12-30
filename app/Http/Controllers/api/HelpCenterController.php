<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Mail\HelpCenterAnswerMail;
use App\Mail\helpCenterMail;
use App\Models\HelpCenter;
use App\Models\User;
use App\Notifications\HelpCenterAnswerNotification as NotificationsHelpCenterAnswerNotification;
use App\Notifications\HelpCenterNotification;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class HelpCenterController extends Controller
{

    public function index(Request $request)
    {
        $per_page = $request->per_page;
        $help_center = HelpCenter::with('user:id,name,email,avatar')->latest('id')->paginate($per_page ?? 10);
        return response()->json([
            'status' => true,
            'data' => $help_center,
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subject' => 'required|string',
            'description' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $help_center = HelpCenter::create([
            'user_id' => Auth::user()->id,
            'subject' => $request->input('subject'),
            'description' => $request->input('description'),
        ]);
        $notification_data = [
            'user_image' => Auth::user()->avatar,
            'user_name' => Auth::user()->name,
        ];
        $admins = User::where('role', 'ADMIN')->get();
        if ($admins->isNotEmpty()) {
            foreach ($admins as $admin) {
                $admin->notify(new HelpCenterNotification($notification_data));

                Mail::to($admin->email)->send(new helpCenterMail($help_center));
            }
        } else {
            Log::info('No admin users found for notification.');
        }
        return response()->json([
            'status' => true,
            'message' => "Support added successfully.",
            'data' => $help_center->makeHidden(['user']),
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'answer' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        try {
            $help_center = HelpCenter::findOrFail($id);
            $help_center->update([
                'answer' => $request->input('answer'),
            ]);
            $user = User::where('id', $help_center->user_id)->first();
            $notification_data = [
                'user_image' => Auth::user()->avatar,
                'user_name' => Auth::user()->name,
            ];
            Mail::to($user->email)->send(new HelpCenterAnswerMail($user, $help_center));
            $user->notify(new NotificationsHelpCenterAnswerNotification($notification_data));
            return response()->json([
                'status' => true,
                'message' => "Support answer submitted successfully.",
                'data' => $help_center,
            ], 200);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json([
                'status' => false,
                'message' => "Data not found.",
            ], 200);
        }
    }
    
}
