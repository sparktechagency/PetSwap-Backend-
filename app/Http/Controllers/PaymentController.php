<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Stripe\PaymentIntent;
use Stripe\Stripe;

class PaymentController extends Controller
{
    public function createPayment(Request $request)
    {
        try {
            Stripe::setApiKey(env('STRIPE_SECRET'));
            $product = Product::findOrFail($request->product_id);
            $seller = User::findOrFail($product->user_id);

            $platformFee = 2;
            $sellerAmount = $product->price - $platformFee;
            $paymentIntent = PaymentIntent::create([
                'amount' => $product->price * 100, // Amount in cents
                'currency' => 'usd',
                'payment_method' => $request->payment_method_id, // Payment method from frontend
                'automatic_payment_methods' => [
                    'enabled' => true, // Enable automatic payment methods
                    'allow_redirects' => 'never', // Disable redirect-based payment methods
                ],
                // 'transfer_data' => [
                //     'destination' => $seller->stripe_account_id, // Seller's Stripe account ID
                // ],
                // 'application_fee_amount' => $platformFee * 100, // Platform fee in cents
            ]);

            Payment::create([
                'buyer_id' => Auth::id(),
                'seller_id' => $seller->id,
                'product_id' => $product->id,
                'amount' => $product->price,
                'platform_fee' => $platformFee,
                'seller_amount' => $sellerAmount,
                'stripe_payment_id' => $paymentIntent->id,
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Payment initiated',
                'client_secret' => $paymentIntent->client_secret,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Payment failed: ' . $e->getMessage(),
            ], 400);
        }

    }
}
