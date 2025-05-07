<?php

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use Stripe\Account;
use Stripe\Stripe;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/connected', function (Request $request) {
    $status    = $request->query('status');
    $email     = $request->query('email');
    $accountId = $request->query('account_id');

    if (! $email || ! $accountId) {
        return response()->json(['status' => false, 'message' => 'Missing email or account_id.'], 400);
    }

    $user = User::where('email', $email)->first();
    if (! $user) {
        return response()->json(['status' => false, 'message' => 'User not found.'], 404);
    }

    Stripe::setApiKey(env('STRIPE_SECRET'));

    try {
        $account = Account::retrieve($accountId);

        if ($account->charges_enabled && $account->payouts_enabled) {
            $user->stripe_account_id = $accountId;
            $user->save();
            // Fully onboarded
            // return response()->json([
            //     'status'         => true,
            //     'message'        => 'Stripe account onboarding completed successfully.',
            //     'account_status' => 'completed',
            // ]);
        } else {
            // Onboarding not completed
            // return response()->json([
            //     'status'         => true,
            //     'message'        => 'Stripe account created but onboarding not completed.',
            //     'account_status' => 'incomplete',
            // ]);
        }
    } catch (\Exception $e) {
        Log::error('Stripe retrieve failed: ' . $e->getMessage());
        // return response()->json([
        //     'status'  => false,
        //     'message' => 'Something went wrong while checking Stripe account.',
        //     'error'   => $e->getMessage(),
        // ], 500);
    }
});
