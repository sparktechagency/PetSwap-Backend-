<?php
namespace Database\Seeders;

use App\Models\Fee;
use Illuminate\Database\Seeder;

class FeeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Fee::create([
            'platform_fee'         => 1,
            'delivery_fee'=>5.74,
            'buyer_protection_fee' => 5,
            'per_day_promotion_amount'=>2
        ]);
    }
}
