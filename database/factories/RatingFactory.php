<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Arr;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Rating>
 */
class RatingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $users = User::all()->pluck('id')->toArray();
        $categories = Category::all()->pluck('id')->toArray();
        $products=Product::all()->pluck('id')->toArray();
        return [
            'seller_id'=>Arr::random($users),
            'buyer_id'=>Arr::random($users),
            'products_id'=>Arr::random($products),
            'rating'=>rand(1,5),
            'review'=>fake()->sentence(),
        ];
    }
}
