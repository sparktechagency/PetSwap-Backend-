<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Fee;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            UserSeeder::class,
            CategorySeeder::class,
            SubCategorySeeder::class,
            ProductSeeder::class,
            SliderSeeder::class,
            FAQSeeder::class,
            WishlistSeeder::class,
            RatingSeeder::class,
            SettingSeeder::class,
            UserPlanSeeder::class,
            FeeSeeder::class,
        ]);
    }
}
