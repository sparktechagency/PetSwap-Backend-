<?php

namespace App\Http\Controllers;

use App\Models\Fee;
use App\Models\Payment;
use App\Models\Product;
use App\Models\ProductPromotion;
use App\Models\Subcription;
use App\Models\User;
use App\Models\UserPlan;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Stripe\Stripe;

class PaymentController extends Controller
{
    public function createPayment(Request $request)
    {
        try {
            Stripe::setApiKey(env('STRIPE_SECRET'));
            $product = Product::findOrFail($request->product_id);
            $seller = User::findOrFail($product->user_id);

            $fee = Fee::first();
            $platformFee = $fee->platform_fee;
            $buyer_protection_fee = $fee->buyer_protection_fee;
            $calculate_buyer_protection_fee = ($product->price * $buyer_protection_fee) / 100;
            $payment = Payment::create([
                'buyer_id' => Auth::id(),
                'seller_id' => $seller->id,
                'product_id' => $product->id,
                'amount' => $product->price,
                'currency' => 'USD',
                'platform_fee' => $platformFee,
                'buyer_protection_fee' => $calculate_buyer_protection_fee,
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Payment Successfull.',
                'data' => $payment,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Payment failed: ' . $e->getMessage(),
            ], 400);
        }

    }

    public function productPromotion(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'promoted_amount' => 'required|numeric',
            'promotion_start' => 'required',
            'promotion_end' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        try {
            $product = Product::findOrFail($id);
            $product->is_promoted = 1;
            $product->save();
            $promotion = ProductPromotion::create([
                'product_id' => $id,
                'promoted_amount' => $request->promoted_amount,
                'promotion_start' => $request->promotion_start,
                'promotion_end' => $request->promotion_end,
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Product Promoted Successfully',
                'data' => $promotion,
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Product not found.',
            ], 404);
        }
    }

    public function userSubscription(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'subscription_type' => 'required|in:Monthly,Yearly',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $userPlan = UserPlan::where('plan_type', $request->subscription_type)->first();

        if (!$userPlan) {
            return response()->json([
                'status' => false,
                'message' => 'Subscription plan not found.',
            ], 404);
        }

        $subscription_start = Carbon::now()->format('Y-m-d');
        $subscription_end = $request->subscription_type === 'Monthly'
        ? Carbon::now()->addMonth()->format('Y-m-d')
        : Carbon::now()->addYear()->format('Y-m-d');
        $user = Auth::user();

        $subcription = Subcription::create([
            'user_id' => $user->id,
            'subscription_amount' => $userPlan->plan_price,
            'subscription_start' => $subscription_start,
            'subscription_end' => $subscription_end,
        ]);

        $user->subscription_plan = $userPlan->plan_type;
        $user->product_upload = 0;
        $user->save();

        return response()->json([
            'status' => true,
            'message' => 'User Subscription Successfully',
            'subcription' => $subcription,
            'user' => $user,
        ]);
    }

}
