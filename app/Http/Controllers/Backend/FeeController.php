<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Fee;

class FeeController extends Controller
{
    public function show()
    {
        $data = Fee::first();
        return response()->json([
            'status' => true,
            'message' => 'Fee retrieve successfully',
            'data' => $data,
        ]);
    }
}
