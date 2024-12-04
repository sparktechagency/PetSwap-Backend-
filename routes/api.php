<?php

use App\Http\Controllers\api\AuthController;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'api'], function ($router) {

    Route::prefix('auth/')->group(function () {
        // user registration routes
        Route::post('register', [AuthController::class, 'register'])->name('register');
        Route::post('login', [AuthController::class, 'login'])->name('login');
        Route::post('social-login', [AuthController::class, 'socialLogin'])->name('social_login');
        Route::post('account-verification', [AuthController::class, 'verifyAccount'])->name('verify_account');
        // reset password routes
        Route::post('forget-password', [AuthController::class, 'forgetPassword'])->name('forget_password');
        Route::post('otp-verification', [AuthController::class, 'otpVerify'])->name('otp_verification');
        Route::post('reset-password', [AuthController::class, 'resetPassword'])->name('reset_password');
    });

    // verified user routes
    Route::middleware(['auth:api', 'verified.user'])->prefix('/')->group(function () {
        // profile
        Route::get('profile', [AuthController::class, 'profile'])->name('profile');
        Route::post('edit-profile', [AuthController::class, 'editProfile'])->name('edit_profile');
        Route::post('change-password', [AuthController::class, 'changePassword'])->name('change_password');
        Route::post('refresh', [AuthController::class, 'refresh'])->name('refresh_token');
        Route::post('logout', [AuthController::class, 'logout'])->name('logout');




        
        // user routes
        Route::middleware('user')->as('user')->group(function () {

        });

        // admin routes
        Route::middleware('admin')->prefix('admin/')->as('admin')->group(function () {

        });
    });
});
