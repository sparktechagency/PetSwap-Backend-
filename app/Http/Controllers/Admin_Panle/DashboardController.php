<?php

namespace App\Http\Controllers\Admin_Panle;

use App\Http\Controllers\Controller;
use App\Models\Payment;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function overview(Request $request)
    {
        $filter = $request->input('filter', 'weekly');

        switch ($filter) {
            case 'monthly':
                $startDate = now()->startOfMonth();
                $endDate = now()->endOfMonth();
                $previousStartDate = now()->subMonth()->startOfMonth();
                $previousEndDate = now()->subMonth()->endOfMonth();
                break;

            case 'yearly':
                $startDate = now()->startOfYear();
                $endDate = now()->endOfYear();
                $previousStartDate = now()->subYear()->startOfYear();
                $previousEndDate = now()->subYear()->endOfYear();
                break;

            case 'custom':
                $startDate = $request->start_date ? Carbon::parse($request->start_date) : null;
                $endDate = $request->end_date ? Carbon::parse($request->end_date) : null;
                $previousStartDate = null;
                $previousEndDate = null;
                break;

            case 'weekly':
            default:
                $startDate = now()->startOfWeek();
                $endDate = now()->endOfWeek();
                $previousStartDate = now()->subWeek()->startOfWeek();
                $previousEndDate = now()->subWeek()->endOfWeek();
                break;
        }

        $activeUsers = User::where('status', 'active')
            ->whereBetween('created_at', [$startDate, $endDate])
            ->count();

        $transactions = Payment::whereBetween('created_at', [$startDate, $endDate])
            ->sum('amount');

        $revenue = Payment::whereBetween('created_at', [$startDate, $endDate])
            ->sum('platform_fee');

        $daysCount = $startDate->diffInDays($endDate, false);
        $daysCount = ceil($daysCount);

        if ($previousStartDate && $previousEndDate) {
            $previousActiveUsers = User::where('status', 'active')
                ->whereBetween('created_at', [$previousStartDate, $previousEndDate])
                ->count();

            $previousTransactions = Payment::whereBetween('created_at', [$previousStartDate, $previousEndDate])
                ->sum('amount');

            $previousRevenue = Payment::whereBetween('created_at', [$previousStartDate, $previousEndDate])
                ->sum('platform_fee');

            $userDifference = $activeUsers - $previousActiveUsers;
            $transactionDifference = $transactions - $previousTransactions;
            $revenueDifference = $revenue - $previousRevenue;

            $userPercentageChange = $previousActiveUsers > 0
            ? ($userDifference / $previousActiveUsers) * 100
            : null;

            $transactionPercentageChange = $previousTransactions > 0
            ? ($transactionDifference / $previousTransactions) * 100
            : null;

            $revenuePercentageChange = $previousRevenue > 0
            ? ($revenueDifference / $previousRevenue) * 100
            : null;
        } else {
            $userDifference = null;
            $transactionDifference = null;
            $revenueDifference = null;
            $userPercentageChange = null;
            $transactionPercentageChange = null;
            $revenuePercentageChange = null;
        }

        $data = [
            'current_period' => [
                'active_users' => $activeUsers,
                'transactions' => $transactions,
                'revenue' => $revenue,
            ],
            'changes' => [
                'days_count' => $daysCount,
                'user_difference' => $userDifference,
                'transaction_difference' => $transactionDifference,
                'revenue_difference' => $revenueDifference,
            ],
        ];

        return response()->json([
            'status' => true,
            'message' => 'Data retrieved successfully',
            'data' => $data,
        ]);
    }

    public function statistics(Request $request)
    {
        $type = $request->input('type');
        $currentYear = now()->year;

        $allMonths = range(1, 12);
        $result = [];

        if ($type == 'active_user') {
            $activeUserData = User::where('status', 'active')
                ->whereYear('created_at', $currentYear)
                ->selectRaw('MONTH(created_at) as month, COUNT(id) as active_users')
                ->groupBy('month')
                ->orderBy('month', 'asc')
                ->get()
                ->keyBy('month');
            foreach ($allMonths as $month) {
                $result[] = [
                    'month' => $month,
                    'active_users' => isset($activeUserData[$month]) ? $activeUserData[$month]->active_users : 0,
                ];
            }
        } elseif ($type == 'revenue') {
            $revenueData = Payment::whereYear('created_at', $currentYear)
                ->selectRaw('MONTH(created_at) as month, SUM(platform_fee) as total_revenue')
                ->groupBy('month')
                ->orderBy('month', 'asc')
                ->get()
                ->keyBy('month');

            foreach ($allMonths as $month) {
                $result[] = [
                    'month' => $month,
                    'total_revenue' => isset($revenueData[$month]) ? $revenueData[$month]->total_revenue : 0,
                ];
            }
        }

        return response()->json([
            'status' => true,
            'message' => 'Data retrieved successfully',
            'data' => $result,
        ]);
    }

}
