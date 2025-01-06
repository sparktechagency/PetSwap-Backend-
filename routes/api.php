<?php

use App\Http\Controllers\Admin_Panel\CategoryController;
use App\Http\Controllers\Admin_Panel\FAQController;
use App\Http\Controllers\Admin_Panel\SliderController;
use App\Http\Controllers\Admin_panel\SubCategoryController;
use App\Http\Controllers\Admin_Panel\TransactionController;
use App\Http\Controllers\Admin_Panel\UserController;
use App\Http\Controllers\Admin_Panle\DashboardController;
use App\Http\Controllers\api\AuthController;
use App\Http\Controllers\api\HelpCenterController;
use App\Http\Controllers\api\HomePageController;
use App\Http\Controllers\api\ProductController;
use App\Http\Controllers\api\RatingController;
use App\Http\Controllers\Api\SettingController;
use App\Http\Controllers\api\WishlistController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\OfferAskingController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\PromotionController;
use App\Http\Controllers\SubcriptionPlanController;
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
            // homepage route
            Route::get('home-page', [HomePageController::class, 'homePage'])->name('home.page');
            Route::post('add-to-wishlist', [WishlistController::class, 'addToWishlist'])->name('home.add_to_wishlist');
            Route::get('similar-product', [HomePageController::class, 'similarProduct'])->name('home.similar_product');

            //product route
            // Route::get('home-product', [HomePageController::class, 'index'])->name('product.index');

            Route::get('product', [ProductController::class, 'index'])->name('product.index');
            Route::post('product', [ProductController::class, 'store'])->name('product.store');
            Route::get('product-detail/{id}', [ProductController::class, 'show'])->name('product.show');
            Route::put('product/{id}', [ProductController::class, 'update'])->name('product.update');
            Route::put('product/status/{id}', [ProductController::class, 'statusUpdate'])->name('product.StatusUpdate');
            Route::delete('product/{id}', [ProductController::class, 'delete'])->name('product.delete');

            //rating route
            Route::get('rating', [RatingController::class, 'index'])->name('rating.index');
            Route::post('rating', [RatingController::class, 'store'])->name('rating.store');
            // Route::put('rating/{id}', [RatingController::class, 'update'])->name('rating.update');
            // Route::delete('rating/{id}', [RatingController::class, 'delete'])->name('rating.delete');

            // offer asking
            Route::post('asking-offer', [OfferAskingController::class, 'store'])->name('offer.store');
            Route::post('offer-accept-reject/{id}', [OfferAskingController::class, 'accept_reject'])->name('offer.accept_reject');

            // notification route
            Route::get('notifications', [NotificationController::class, 'notifications'])->name('all_Notification');
            Route::get('mark-notification/{id}', [NotificationController::class, 'singleMark'])->name('singleMark');
            Route::get('mark-all-notification', [NotificationController::class, 'allMark'])->name('allMark');

            Route::post('payment', [PaymentController::class, 'createPayment'])->name('payment');

            //order
            Route::get('order', [OrderController::class, 'order'])->name('order');
            Route::get('order/{id}', [OrderController::class, 'order_details'])->name('orderDetails');

            //helpcenter
            Route::get('help-center', [HelpCenterController::class, 'index']);
            Route::post('help-center', [HelpCenterController::class, 'store']);
            Route::put('help-center/{id}', [HelpCenterController::class, 'update']);
            // Route::delete('product/{id}', [ProductController::class, 'delete'])->name('product.delete');

            //settings
            Route::get('setting', [SettingController::class, 'getSetting'])->name('setting.get');

            //product promotion
            Route::post('product-promotion/{id}', [PromotionController::class, 'productPromotion'])->name('productPromotion');

            //subcription plan
            Route::get('subcription-plan', [SubcriptionPlanController::class, 'subcriptionPlan']);
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
            // Route::get('subcategory', [SubCategoryController::class, 'index'])->name('subcategory.index');
            // Route::post('subcategory', [SubCategoryController::class, 'store'])->name('subcategory.store');
            Route::put('subcategory/{id}', [SubCategoryController::class, 'update'])->name('subcategory.update');
            // Route::delete('subcategory/{id}', [SubCategoryController::class, 'delete'])->name('subcategory.delete');

            //faq
            Route::post('faq', [FAQController::class, 'store'])->name('faq.store');
            Route::put('faq/{id}', [FAQController::class, 'update'])->name('faq.update');
            Route::delete('faq/{id}', [FAQController::class, 'delete'])->name('faq.delete');

            //settings
            Route::post('setting', [SettingController::class, 'settingUpdate'])->name('setting.update');

            // manage users
            Route::get('manage-user', [UserController::class, 'index']);
            Route::get('user-details/{id}', [UserController::class, 'userDetails']);
            Route::get('user-statistics/{id}', [UserController::class, 'userStatistics']);

            // transactions
            Route::get('transactions', [TransactionController::class, 'transaction']);

            // dashboard route
            Route::get('overview', [DashboardController::class, 'overview']);
            Route::get('statistics', [DashboardController::class, 'statistics']);

        });
    });
});
