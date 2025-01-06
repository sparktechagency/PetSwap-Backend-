<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductPromotion;
use Illuminate\Http\Request;

class PromotionController extends Controller
{
    public function productPromotion(Request $request, $id)
    {
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
        } catch (\Throwable $th) {
            return response()->json([
                'status' => false,
                'message' => 'Product not found.',
            ], 404);
        }

    }
}
