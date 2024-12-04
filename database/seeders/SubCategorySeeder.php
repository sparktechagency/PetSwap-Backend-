<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;

class SubCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories=Category::all();
        $faker = Faker::create();

        $adjectives = ['Clothing', 'Collars', 'Bowls', 'Grooming', 'Beds', 'Toys', 'Training', 'Carriers'];
        $extras = ['& accessories', '& leads', '& feeders', '', '& blankets', '', 'accessories', '& crates'];


        foreach (range(1, 30) as $index) {
            SubCategory::create([
                'category_id' => $categories->random()->id,
                'name' => $faker->randomElement($adjectives) . ' ' . $faker->randomElement($extras),
            ]);
        }
    }
}
