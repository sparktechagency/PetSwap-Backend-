<?php

namespace Database\Seeders;

use App\Models\UserPlan;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserPlanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        UserPlan::create([
            'plan_type'=>'Free',
            'max_can_upload'=>1000,
            'plan_price'=>0,
        ]);
        UserPlan::create([
            'plan_type'=>'Monthly',
            'max_can_upload'=>2000,
            'plan_price'=>1,
        ]);
        UserPlan::create([
            'plan_type'=>'Yearly',
            'max_can_upload'=>3000,
            'plan_price'=>2,
        ]);
    }
}
