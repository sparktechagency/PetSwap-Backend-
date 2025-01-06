<?php

namespace App\Http\Controllers;

use App\Models\UserPlan;
use Illuminate\Http\Request;

class SubcriptionPlanController extends Controller
{
    public function subcriptionPlan(){
        $plan=UserPlan::get();
        return response()->json([
            'status'=>true,
            'message'=>'User Plan retreive successfully',
            'data'=>$plan,
        ]);
    }
}
