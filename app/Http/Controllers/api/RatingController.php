<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Rating;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class RatingController extends Controller
{

    public function index(Request $request)
    {
        $ratings = Rating::with('buyer:id,name,avatar')
            ->where('seller_id', Auth::user()->id)
            ->paginate();

        return response()->json([
            'status' => true,
            'data' => $ratings,
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'seller_id' => 'required|numeric',
            'products_id' => 'required|numeric',
            'rating' => 'nullable|numeric|max:5',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()], 400);
        }
        try {
            $rating = Rating::create([
                'seller_id' => $request->seller_id,
                'buyer_id' => Auth::user()->id,
                'products_id' => $request->products_id,
                'rating' => $request->rating,
                'review' => $request->review,
            ]);
            return response()->json([
                'status' => true,
                'message' => "Rating added successfully.",
                'data' => $rating,
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'status' => false,
                'message' => "Product id not found no the database.",
            ], 200);
        }
    }
    public function update(Request $request, $id)
    {}
    public function delete(Request $request, $id)
    {}
}
