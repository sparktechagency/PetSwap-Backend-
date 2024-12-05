<?php

use App\Http\Controllers\Admin_Panel\CategoryController;
use App\Http\Controllers\Admin_Panel\FAQController;
use App\Http\Controllers\Admin_Panel\SliderController;
use App\Http\Controllers\Admin_panel\SubCategoryController;
use App\Http\Controllers\api\AuthController;
use App\Http\Controllers\api\ProductController;
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
        Route::middleware(['user'])->group(function () {
            //get category and subcategory
            Route::get('category', [CategoryController::class, 'index'])->name('category.index');
            // slider route
            Route::get('slider', [SliderController::class, 'index'])->name('slider.index');
            // faq route
            Route::get('faq', [FAQController::class, 'index'])->name('faq.index');

            //product route
            Route::get('product', [ProductController::class, 'index'])->name('product.index');
            Route::post('product', [ProductController::class, 'store'])->name('product.store');
            Route::put('product/{id}', [ProductController::class, 'update'])->name('product.update');
            Route::delete('product/{id}', [ProductController::class, 'delete'])->name('product.delete');
        });





        // admin routes
        Route::middleware('admin')->group(function () {
            // category
            Route::post('category', [CategoryController::class, 'store'])->name('category.store');
            Route::put('category/{id}', [CategoryController::class, 'update'])->name('category.update');
            Route::delete('category/{id}', [CategoryController::class, 'delete'])->name('category.delete');

            //slider
            Route::post('slider', [SliderController::class, 'store'])->name('slider.store');
            Route::put('slider/{id}', [SliderController::class, 'update'])->name('slider.update');
            Route::delete('slider/{id}', [SliderController::class, 'delete'])->name('slider.delete');

            // subcategory
            Route::get('subcategory', [SubCategoryController::class, 'index'])->name('subcategory.index');
            Route::post('subcategory', [SubCategoryController::class, 'store'])->name('subcategory.store');
            Route::put('subcategory/{id}', [SubCategoryController::class, 'update'])->name('subcategory.update');
            Route::delete('subcategory/{id}', [SubCategoryController::class, 'delete'])->name('subcategory.delete');

            //faq
            Route::post('faq', [FAQController::class, 'store'])->name('faq.store');
            Route::put('faq/{id}', [FAQController::class, 'update'])->name('faq.update');
            Route::delete('faq/{id}', [FAQController::class, 'delete'])->name('faq.delete');
        });
    });
});
