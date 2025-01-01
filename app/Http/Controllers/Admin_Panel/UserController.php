<?php

namespace App\Http\Controllers\Admin_Panel;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $per_page = $request->per_page;
        $users = User::where('role', 'USER')->whereNotNull('email_verified_at');
        if ($request->search) {
            $users = $users->where('name', 'LIKE', '%' . $request->search . '%')
                ->orWhere('email', 'LIKE', '%' . $request->search . '%')
                ->orWhere('address', 'LIKE', '%' . $request->search . '%');
        }
        $users = $users->latest('id')->paginate($per_page ?? 10);
        return response()->json([
            'status' => true,
            'message' => 'User retrieve successfully',
            'data' => $users,
        ]);
    }

    public function userDetails(Request $request, $id)
    {

        $per_page = $request->per_page;
        $user = User::findOrFail($id);
        $products = Product::where('user_id', $id)->where('status', 'Approved');
        if ($request->search) {
            $products = $products->where('title', 'LIKE', '%' . $request->search . '%');
        }
        $products = $products->paginate($per_page ?? 10);
        $products->getCollection()->transform(function ($product) {
            if (is_string($product->images)) {
                $product->images = json_decode($product->images, true);
            }
            return $product;
        });
        $total_product = Product::where('user_id', $id)->where('status', 'Approved')->count();
        $total_sell = Payment::where('seller_id', $id)->sum('seller_amount');
        $data = [
            'total_product' => $total_product,
            'total_sell' => $total_sell,
            'user' => $user,
            'products' => $products,
        ];
        return response()->json([
            'status' => true,
            'message' => 'data retrieve successfully',
            'data' => $data,
        ]);
    }

    public function userStatistics(Request $request, $id)
    {
        $period = $request->period;

        $currentDate = now();

        switch ($period) {
            case 'weekly':
                $startOfPeriod = $currentDate->copy()->startOfWeek();
                $endOfPeriod = $currentDate->copy()->endOfWeek();
                break;
            case 'monthly':
                $startOfPeriod = $currentDate->copy()->startOfMonth();
                $endOfPeriod = $currentDate->copy()->endOfMonth();
                break;
            case 'yearly':
                $startOfPeriod = $currentDate->copy()->startOfYear();
                $endOfPeriod = $currentDate->copy()->endOfYear();
                break;
            default:
                $startOfPeriod = $currentDate->copy()->startOfWeek();
                $endOfPeriod = $currentDate->copy()->endOfWeek();
                break;
        }

        if ($period == 'weekly') {
            $previousStartOfPeriod = now()->subWeek()->startOfWeek();
            $previousEndOfPeriod = now()->subWeek()->endOfWeek();
        } elseif ($period == 'monthly') {
            $previousStartOfPeriod = now()->subMonth()->startOfMonth();
            $previousEndOfPeriod = now()->subMonth()->endOfMonth();
        } elseif ($period == 'yearly') {
            $previousStartOfPeriod = now()->subYear()->startOfYear();
            $previousEndOfPeriod = now()->subYear()->endOfYear();
        }

        return $previousStartOfPeriod . ' ' . $previousEndOfPeriod;
    }

}
