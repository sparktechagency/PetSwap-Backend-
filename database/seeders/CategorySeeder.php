<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            'Dog',
            'Cat',
            'Small Pets',
            'Fish',
            'Bird',
            'Reptiles',
        ];
        foreach ($categories as $category) {
            Category::create([
                'name' => $category,
            ]);
        }
    }
}
