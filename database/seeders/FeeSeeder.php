<?php

namespace Database\Seeders;

use App\Models\Fee;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class FeeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
       Fee::create([
        'platform_fee'=>2,
        'buyer_protection_fee'=>5,
       ]);
    }
}
