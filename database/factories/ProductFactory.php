<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\SubCategory;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Arr;
use Nette\Utils\Random;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
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
        $randomCategoryId = Arr::random($categories);
        $subCategories = SubCategory::where('category_id', $randomCategoryId)->pluck('id')->toArray();
        $petFoodBrands = [
            'Royal Canin', 'Pedigree', 'Blue Buffalo', 'Hill\'s Science Diet',
            'Purina Pro Plan', 'Iams', 'Eukanuba', 'Nutro',
            'Wellness CORE', 'Taste of the Wild', 'Whiskas', 'Fancy Feast',
            'Friskies', 'Sheba', 'Meow Mix', 'Purina ONE',
            'Natural Balance', 'Orijen', 'Acana', 'Solid Gold',
            'Nature\'s Variety Instinct', 'Blue Basics', 'Canidae',
            'Rachael Ray Nutrish', 'American Journey', 'The Honest Kitchen',
            'Merrick', 'Halo', 'NutriSource', 'Earthborn Holistic',
        ];
        $conditions = ['New', 'Used'];
        $isFood = fake()->boolean();
        $weights = [0.5, 1, 1.5, 2, 2.5];

        return [
            'user_id' => Arr::random($users),
            'category_id' => $randomCategoryId,
            'sub_category_id' => json_encode(Arr::random($subCategories, rand(1, 5))),
            'title' => implode(' ', fake()->words(rand(1, 3))),
            'description' => implode(' ', fake()->sentences(rand(1, 4))),
            'images' => json_encode([
                fake()->imageUrl(640, 480, '640', true, '480'),
                fake()->imageUrl(640, 480, '640', true, '480'),
            ]),
            'price' => fake()->randomFloat(2, 10, 1000),
            'platform_fee' => 2,
            'brand' => Arr::random($petFoodBrands),
            'condition' => Arr::random($conditions),
            'is_food' => $isFood,
            'weight' => $isFood ? Arr::random($weights) : null,
        ];
    }

}
