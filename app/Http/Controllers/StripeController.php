<?php
namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Stripe\Account;
use Stripe\AccountLink;
use Stripe\PaymentIntent;
use Stripe\Stripe;

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
                'type'         => 'express',
                'country'      => 'US',
                'email'        => $user->email,
                'capabilities' => [
                    'card_payments' => ['requested' => true],
                    'transfers'     => ['requested' => true],
                ],
            ]);
            $customReturnUrl = url("/connected?status=success&email={$user->email}&account_id={$account->id}");
            $accountLink     = AccountLink::create([
                'account'     => $account->id,
                'refresh_url' => url('/vendor/reauth'),
                'return_url'  => $customReturnUrl,
                'type'        => 'account_onboarding',
            ]);

            return response()->json([
                'message'        => 'Stripe Connect account created successfully',
                'onboarding_url' => $accountLink->url,
            ]);
        } catch (Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    // public function buyProductIntent(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'total_price' => 'required|min:1',
    //         'product_id'  => 'required|integer',
    //     ]);
    //     if ($validator->fails()) {
    //         return response()->json(['status' => false, 'message' => $validator->errors()], 400);
    //     }
    //     $total_price = $request->total_price;
    //     $product     = Product::with('user')
    //         ->where('id', $request->product_id)
    //         ->first();

    //     $product_price = $product->price;
    //     $platformFee   = $total_price - $product_price;

    //     $stripeAccountId = $product->user->stripe_account_id;
    //     if (! $stripeAccountId) {
    //         return response()->json([
    //             'status'  => false,
    //             'message' => 'This user doesnot connect with any stripe account.',
    //         ], 404);
    //     }

    //     Stripe::setApiKey(env('STRIPE_SECRET'));
    //     try {
    //         $paymentIntent = PaymentIntent::create([
    //             'amount'                 => (int) ($total_price * 100),
    //             'currency'               => 'usd',
    //             'payment_method'         => $request->payment_method,
    //             'transfer_data'          => [
    //                 'destination' => $stripeAccountId,
    //             ],
    //             'application_fee_amount' => (int) ($platformFee * 100),
    //         ]);

    //         return response()->json([
    //             'data' => $paymentIntent,
    //         ]);
    //     } catch (Exception $e) {
    //         return response()->json(['error' => $e->getMessage()], 500);
    //     }
    // }

    public function buyProductIntent(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'total_price' => 'required|numeric|min:1',
            'product_id'  => 'required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }

        $product = Product::with('user')->find($request->product_id);

        if (! $product) {
            return response()->json(['status' => false, 'message' => 'Product not found'], 404);
        }

        $productPrice = $product->price;
        $totalPrice   = $request->total_price;
        $platformFee  = $totalPrice - $productPrice;

        $stripeAccountId = $product->user->stripe_account_id;
        if (! $stripeAccountId) {
            return response()->json(['status' => false, 'message' => 'This user has no Stripe account connected'], 404);
        }

        Stripe::setApiKey(env('STRIPE_SECRET'));

        try {
            $paymentIntent = PaymentIntent::create([
                'amount'                    => (int) ($totalPrice * 100),
                'currency'                  => 'usd',
                'payment_method'            => $request->payment_method,
                'confirm'                   => true,
                'capture_method'            => 'manual', // Hold the payment
                'description'               => 'Product Purchase',
                'automatic_payment_methods' => [
                    'enabled'         => true,
                    'allow_redirects' => 'never',
                ],
            ]);
            return response()->json([
                'data' => $paymentIntent,
            ]);
        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function productPromotionIntent(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|integer',
            'amount'     => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        Stripe::setApiKey(env('STRIPE_SECRET'));
        try {
            $paymentIntent = PaymentIntent::create([
                'amount'         => $request->amount * 100,
                'currency'       => 'usd',
                'payment_method' => $request->payment_method,
            ]);
            return response()->json([
                'data' => $paymentIntent,
            ]);
        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

}
