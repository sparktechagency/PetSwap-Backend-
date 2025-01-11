<?php

namespace App\Http\Controllers;

use Exception;
use Stripe\Stripe;
use App\Models\Fee;
use Stripe\Account;
use App\Models\User;
use Stripe\AccountLink;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class StripeController extends Controller
{
    public function createStripeConnectedAccount(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        $user = User::where('email', $request->email)->first();
        Stripe::setApiKey(env('STRIPE_SECRET'));
        try {
            $account = Account::create([
                'type' => 'standard', // Can also be 'express' based on your needs
                'country' => 'US',
                'email' => $user->email,
                'capabilities' => [
                    'transfers' => ['requested' => true],
                    'card_payments' => ['requested' => true],
                ],
            ]);

            $user->stripe_account_id = $account->id;
            $user->save();

            $accountLink = AccountLink::create([
                'account' => $account->id,
                'refresh_url' => url('/vendor/reauth'),
                'return_url' => url('/vendor/dashboard'),
                'type' => 'account_onboarding',
            ]);

            return response()->json([
                'message' => 'Stripe Connect account created successfully',
                'onboarding_url' => $accountLink->url,
            ]);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function buyProductIntent(Request $request)
    {
        $request->validate([
            'amount' => 'required|integer|min:1',
        ]);
        // Stripe::setApiKey(env('STRIPE_SECRET'));

        $fee = Fee::first();
        $platformFee = $fee->platform_fee;
        $buyer_protection_fee = $fee->buyer_protection_fee;
        $amount = $request->amount;

        $remaining_after_platform_fee = $amount - $platformFee;
        $calculate_buyer_protection_fee = ($remaining_after_platform_fee * $buyer_protection_fee) / 100;
        $final_amount_for_transfer = $remaining_after_platform_fee - $calculate_buyer_protection_fee;
        $final_amount_for_admin = $calculate_buyer_protection_fee + $platformFee;

        return [
            'total_payment' => $amount,
            'platform_fee' => $platformFee,
            'total percent' => $calculate_buyer_protection_fee,
            'amount for transfer seller ' => $final_amount_for_transfer,
            'amount for admin get' => $final_amount_for_admin,
        ];













        try {
            // Create a PaymentIntent
            $paymentIntent = PaymentIntent::create([
                'amount' => $amount,
                'currency' => 'usd',
                'payment_method_types' => ['card'],
                'transfer_data' => [
                    'destination' => $vendor->stripe_account_id,
                ],
                'application_fee_amount' => $platformFee,
            ]);

            return response()->json([
                'client_secret' => $paymentIntent->client_secret,
                'payment_intent_id' => $paymentIntent->id,
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

}
