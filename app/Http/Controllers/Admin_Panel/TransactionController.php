<?php

namespace App\Http\Controllers\Admin_Panel;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    public function transaction(Request $request)
    {
        $per_page = $request->per_page;
        $transaction = Payment::with('buyer', 'product')->latest('id');
        $transaction = $transaction->paginate($per_page ?? 10);
        return response()->json([
            'status' => true,
            'message' => 'Data restrive successfully',
            'data' => $transaction,
        ]);
    }
}
