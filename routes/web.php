<?php

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/connected', function (Request $request) {
    $status                  = $request->query('status');
    $email                   = $request->query('email');
    $accountId               = $request->query('account_id');
    $user                    = User::where('email', $email)->first();
    $user->stripe_account_id = $accountId;
    $user->save();
});
