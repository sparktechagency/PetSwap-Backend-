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

            $product->images = json_decode($product->images);
            if (is_array($product->images)) {
                $product->images = array_map(function ($image) {
                    return asset('uploads/' . $image);
                }, $product->images);
            } else {
                $product->images = [];
            }
            return $product;
        });
        $total_product = Product::where('user_id', $id)->where('status', 'Approved')->count();
        $total_sell = Payment::where('seller_id', $id)->sum('amount');
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
        $type = $request->input('type', 'weekly');
        $currentDate = now();
        $result = [];

        switch ($type) {
            case 'weekly':
                for ($i = 6; $i >= 0; $i--) {
                    $date = $currentDate->copy()->subDays($i);
                    $totalRevenue = Payment::where('seller_id', $id)
                        ->whereDate('created_at', $date)
                        ->sum('amount');
                    $result[] = [
                        'week_day' => $date->format('l'),
                        'Total Revenue' => round($totalRevenue,2),
                    ];
                }
                break;

            case 'monthly':
                $currentYear = $currentDate->year;
                $revenueData = Payment::where('seller_id', $id)
                    ->whereYear('created_at', $currentYear)
                    ->selectRaw('MONTH(created_at) as month, SUM(amount) as total_revenue')
                    ->groupBy('month')
                    ->orderBy('month', 'asc')
                    ->get()
                    ->keyBy('month');
                for ($month = 1; $month <= 12; $month++) {
                    $result[] = [
                        'month' => date('F', mktime(0, 0, 0, $month, 1)),
                        'Total Revenue' => isset($revenueData[$month]) ? round($revenueData[$month]->total_revenue,2) : 0,
                    ];
                }
                break;
            case 'yearly':
                $startYear = $currentDate->year - 4;
                $endYear = $currentDate->year;
                for ($year = $startYear; $year <= $endYear; $year++) {
                    $totalRevenue = Payment::where('seller_id', $id)
                        ->whereYear('created_at', $year)
                        ->sum('amount');

                    $result[] = [
                        'year' => $year,
                        'Total Revenue' => round($totalRevenue, 2),
                    ];
                }
                break;
            default:
                return response()->json([
                    'status' => false,
                    'message' => 'Invalid type parameter',
                    'data' => [],
                ]);
        }
        return response()->json([
            'status' => true,
            'message' => 'Data retrieved successfully',
            'data' => $result,
        ]);
    }

}
