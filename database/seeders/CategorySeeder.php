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
            [
                'name'       => 'Dog',
                'icon'       => 'category/dog.png',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name'       => 'Cat',
                'icon'       => 'category/cat.png',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name'       => 'Small Pets',
                'icon'       => 'category/smal_pets.png',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name'       => 'Fish',
                'icon'       => 'category/fish.png',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name'       => 'Bird',
                'icon'       => 'category/bird.png',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name'       => 'Reptiles',
                'icon'       => 'category/reptile.png',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];
        Category::insert($categories);
    }
}
