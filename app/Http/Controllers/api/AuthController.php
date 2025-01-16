<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Mail\OtpMail;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'address' => 'required|string|max:255',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $otp = rand(100000, 999999);
        $otp_expires_at = now()->addMinutes(10);
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'address' => $request->address,
            'password' => Hash::make($request->password),
            'role' => 'USER',
            'otp' => $otp,
            'otp_expires_at' => $otp_expires_at,
            'status' => 'inactive',
        ]);

        Mail::to($request->email)->send(new OtpMail($otp));

        return response()->json(['status' => true, 'message' => 'OTP sent to your registered email.', 'data' => $user], 201);
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['status' => false, 'message' => 'User not found.'], 404);
        }

        if ($user->email_verified_at == null) {
            return response()->json(['status' => false, 'message' => 'Your account is not verified.'], 403);
        }

        $credentials = $request->only(['email', 'password']);
        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['status' => false, 'message' => 'Invalid email or password.'], 401);
        }

        $success = $this->respondWithToken($token);

        return response()->json(['status' => true, 'message' => 'User login successfully.', 'data' => $success], 200);
    }

    public function socialLogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'google_id' => 'string|nullable',
            'facebook_id' => 'string|nullable',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $existingUser = User::where('email', $request->email)->first();

        if ($existingUser) {
            $socialId = ($request->has('google_id') && $existingUser->google_id === $request->google_id) || ($request->has('facebook_id') && $existingUser->facebook_id === $request->facebook_id);

            if ($socialId) {
                $token = JWTAuth::fromUser($existingUser);
                $success = $this->respondWithToken($token);
                return response()->json(['status' => true, 'message' => 'User login successfully.', 'data' => $success], 200);
            } elseif (is_null($existingUser->google_id) && is_null($existingUser->facebook_id)) {
                return response()->json(['message' => 'User already exists. Sign in manually.'], 422);
            } else {
                $existingUser->update([
                    'google_id' => $request->google_id ?? $existingUser->google_id,
                    'facebook_id' => $request->facebook_id ?? $existingUser->facebook_id,
                ]);
                $token = JWTAuth::fromUser($existingUser);
                $success = $this->respondWithToken($token);
                return response()->json(['status' => true, 'message' => 'User login successfully.', 'data' => $success], 200);
            }
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make(Str::random(16)),
            'role' => 'USER',
            'google_id' => $request->google_id ?? null,
            'facebook_id' => $request->facebook_id ?? null,
            'email_verified_at' => now(),
            'status' => 'active',
        ]);
        $token = JWTAuth::fromUser($user);
        $success = $this->respondWithToken($token);
        return response()->json(['status' => true, 'message' => 'User login successfully.', 'data' => $success], 200);
    }

    // public function verifyAccount(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'otp' => 'required|numeric',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json(['status' => false, 'message' => $validator->errors()], 400);
    //     }

    //     try {
    //         $user = User::where('otp', $request->otp)->first();
    //         if ($user->otp === $request->otp && $user->otp_expires_at >= now()) {
    //             $user->otp = null;
    //             $user->otp_expires_at = null;
    //             $user->email_verified_at = now();
    //             $user->save();
    //             $token = Auth::login($user);
    //             $success = $this->respondWithToken($token);

    //             return response()->json(['status' => true, 'message' => 'User login successfully.', 'data' => $success], 200);
    //         }
    //     } catch (Exception $e) {
    //         return response()->json(['status' => false, 'message' => 'OTP is incorrect or has expired.'], 400);
    //     }
    // }

    public function forgetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $user = User::where('email', $request->email)->first();
        $otp = rand(100000, 999999);
        $otp_expires_at = now()->addMinutes(10);
        $user->otp = $otp;
        $user->otp_expires_at = $otp_expires_at;
        $user->save();

        Mail::to($request->email)->send(new OtpMail($otp));
        return response()->json(['status' => true, 'message' => 'An OTP sent to your email.'], 200);
    }

    public function otpVerify(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'otp' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $user = User::where('email', $request->email)->where('otp', $request->otp)->first();
        if ($user->otp === $request->otp && $user->otp_expires_at >= now()) {
            if ($user->email_verified_at != null) {
                $user->otp = null;
                $user->otp_expires_at = null;
                $user->save();
            } else {
                $user->otp = null;
                $user->otp_expires_at = null;
                $user->email_verified_at = now();
                $user->status = 'active';
                $user->save();
            }
            $token = Auth::login($user);
            $success = $this->respondWithToken($token);
            return response()->json(['status' => true, 'message' => 'User login successfully.', 'data' => $success], 200);
        } else {
            return response()->json(['status' => false, 'message' => 'OTP is incorrect or has expired.'], 400);
        }
    }

    public function resetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6|same:c_password',
            'c_password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $user = User::where('email', $request->email)->first();
        if ($user) {
            $user->password = Hash::make($request->password);
            $user->save();
            return response()->json(['status' => true, 'message' => 'Password changed successfully.'], 200);
        }
        return response()->json(['status' => false, 'message' => 'User not found in the system.'], 400);
    }

    public function profile()
    {
        try {
            $user = auth()->user();
            if (!$user) {
                return response()->json(['status' => false, 'message' => 'Invalid token.'], 401);
            }
            // if ($user->avatar) {
            //     $user->avatar = asset('storage/' . $user->avatar);
            // } else {
            //     $user->avatar = asset('storage/user/default_avatar.jpeg');
            // }
            return response()->json(['status' => true, 'data' => $user], 200);
        } catch (Exception $e) {
            return response()->json(['status' => false, 'message' => 'User not authenticated.'], 401);
        }
    }
    public function editProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'nullable|string|max:255',
            'address' => 'nullable|string|max:255',
            'image' => 'sometimes|image|mimes:png,jpg,jpeg',
            'email' => 'nullable|email|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $user = Auth::user();
        $user->name = $request->name ?? $user->name;
        $user->address = $request->address ?? $user->address;
        $user->email = $request->email ?? $user->email;

        if ($request->hasFile('image')) {
            $photo_location = public_path('uploads/');
            $old_photo_location = $photo_location . $user->avatar;
            if (file_exists($old_photo_location)) {
                unlink($old_photo_location);
            }

            $final_name = time() . '.' . $request->image->extension();
            $request->image->move(public_path('uploads/user'), $final_name);
            $image_path = 'user/' . $final_name;
            $user->avatar = $image_path;
        }
        $user->save();

        return response()->json([
            'status' => true,
            'message' => 'Profile updated successfully',
            'data' => $user,
        ], 200);
    }

    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'new_password' => 'required|string|min:6|same:c_password',
            'c_password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $user = Auth::user();
        if (!Hash::check($request->current_password, $user->password)) {
            return response()->json(['status' => false, 'message' => 'Current password is incorrect.'], 400);
        }
        $user->password = Hash::make($request->new_password);
        $user->save();
        return response()->json(['status' => true, 'message' => 'Password changed successfully.'], 200);
    }

    public function refresh()
    {
        $token = $this->respondWithToken(auth()->refresh());
        return response()->json(['status' => true, 'message' => 'Token refresh successfully.', 'data' => $token], 200);
    }

    public function logout()
    {
        auth()->logout();
        return response()->json(['status' => true, 'message' => 'Successfully logged out.'], 200);
    }

    protected function respondWithToken($token)
    {
        return [
            'access_token' => $token,
            'user' => Auth::user(),
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
        ];
    }
}
