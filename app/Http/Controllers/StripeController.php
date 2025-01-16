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

            $user->stripe_account_id = $account->id;
            $user->save();

            $accountLink = AccountLink::create([
                'account'     => $account->id,
                'refresh_url' => url('/vendor/reauth'),
                'return_url'  => url('/vendor/dashboard'),
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

    public function buyProductIntent(Request $request)
    {
        $request->validate([
            'total_price' => 'required|integer|min:1',
            'product_id'  => 'required|integer',
        ]);
        $total_price = $request->total_price;
        $product     = Product::with('user')
            ->where('id', $request->product_id)
            ->first();

        $product_price = $product->price;
        $platformFee   = $total_price - $product_price;

        $stripeAccountId = $product->user->stripe_account_id;
        if (! $stripeAccountId) {
            return response()->json([
                'status'  => false,
                'message' => 'This use doesnot have any stripe account.',
            ], 404);
        }

        Stripe::setApiKey(env('STRIPE_SECRET'));
        try {
            $paymentIntent = PaymentIntent::create([
                'amount'                 => (int) ($total_price * 100),
                'currency'               => 'usd',
                'payment_method_types'   => ['card'],
                'transfer_data'          => [
                    'destination' => $stripeAccountId,
                ],
                'application_fee_amount' => (int) ($platformFee * 100),
            ]);

            return response()->json([
                'client_secret'     => $paymentIntent->client_secret,
                'payment_intent_id' => $paymentIntent->id,
            ]);
        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

}
