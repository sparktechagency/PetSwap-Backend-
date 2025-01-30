<?php
namespace Database\Factories;

use App\Models\Category;
use App\Models\SubCategory;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Arr;

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
        $users            = User::where('role', 'USER')->pluck('id')->toArray();
        $categories       = Category::all()->pluck('id')->toArray();
        $randomCategoryId = Arr::random($categories);
        $subCategories    = SubCategory::where('category_id', $randomCategoryId)->pluck('id')->toArray();

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

        $product_data = [
            // Dogs
            [
                'title'       => 'Natural Chicken & Rice Dog Food',
                'description' => 'Crafted with real chicken and wholesome rice, this formula ensures a balanced diet for your dog’s health.',
            ],
            [
                'title'       => 'Organic Dog Biscuits',
                'description' => 'Crunchy and packed with nutrients, these biscuits are perfect for training or as a daily treat.',
            ],
            [
                'title'       => 'Beef & Veggie Dog Chews',
                'description' => 'Long-lasting chews made with real beef and veggies to keep your dog busy and satisfied.',
            ],
            [
                'title'       => 'High-Protein Puppy Food',
                'description' => 'Specially designed for growing puppies, this food is rich in protein and DHA for brain development.',
            ],
            [
                'title'       => 'Dental Care Dog Treats',
                'description' => 'These treats clean teeth and freshen breath while being irresistibly tasty.',
            ],

            // Cats
            [
                'title'       => 'Salmon & Tuna Cat Kibble',
                'description' => 'A delicious mix of salmon and tuna flavors packed with omega-3 for a shiny coat.',
            ],
            [
                'title'       => 'Soft Chew Cat Treats',
                'description' => 'Soft, chewy treats that are easy to digest and perfect for picky eaters.',
            ],
            [
                'title'       => 'Grain-Free Kitten Food',
                'description' => 'Made without grains or fillers, this food supports your kitten’s energy and growth.',
            ],
            [
                'title'       => 'Gourmet Turkey Cat Stew',
                'description' => 'A savory turkey stew enriched with vitamins for adult cats.',
            ],
            [
                'title'       => 'Hairball Control Cat Food',
                'description' => 'Formulated to reduce hairballs and improve digestion in long-haired cats.',
            ],

            // Fish
            [
                'title'       => 'Tropical Fish Color Enhancer Flakes',
                'description' => 'Boost the vibrant colors of your tropical fish with this nutrient-packed formula.',
            ],
            [
                'title'       => 'High-Protein Betta Food',
                'description' => 'Specially crafted pellets to enhance the health and beauty of your betta fish.',
            ],
            [
                'title'       => 'Goldfish Veggie Pellets',
                'description' => 'Plant-based pellets designed to support digestion and overall health in goldfish.',
            ],
            [
                'title'       => 'Algae Wafers for Bottom Feeders',
                'description' => 'Ideal for plecos and other bottom-dwelling fish, these wafers provide essential nutrients.',
            ],
            [
                'title'       => 'Marine Fish Brine Shrimp',
                'description' => 'Freeze-dried brine shrimp to support the dietary needs of marine fish.',
            ],

            // Birds
            [
                'title'       => 'Sunflower & Millet Bird Seed',
                'description' => 'A premium blend of seeds to keep your parrot or cockatiel energized and happy.',
            ],
            [
                'title'       => 'Fruit-Infused Parakeet Mix',
                'description' => 'A delicious seed mix infused with dried fruits to provide essential vitamins.',
            ],
            [
                'title'       => 'Vitamin-Rich Canary Food',
                'description' => 'Enriched with vitamins and minerals to support the vibrant health of canaries.',
            ],
            [
                'title'       => 'Egg & Honey Bird Treats',
                'description' => 'Protein-packed treats with a hint of honey for added flavor.',
            ],
            [
                'title'       => 'Wild Bird Attracting Mix',
                'description' => 'A special blend of seeds and nuts to attract wild birds to your backyard.',
            ],

            // Reptiles
            [
                'title'       => 'Calcium-Enriched Turtle Sticks',
                'description' => 'Floating sticks packed with calcium to strengthen turtle shells.',
            ],
            [
                'title'       => 'Mealworm Mix for Lizards',
                'description' => 'A protein-rich mealworm mix to keep lizards active and healthy.',
            ],
            [
                'title'       => 'Herbal Tortoise Food',
                'description' => 'Plant-based food made from natural herbs and greens, ideal for tortoises.',
            ],
            [
                'title'       => 'Insect Pellets for Geckos',
                'description' => 'A mix of dried insects and pellets to meet the unique dietary needs of geckos.',
            ],
            [
                'title'       => 'Vitamin-Enriched Snake Food',
                'description' => 'Prey-based food fortified with essential vitamins for snakes.',
            ],

            // Small Pets (Hamsters, Rabbits, etc.)
            [
                'title'       => 'Timothy Hay for Rabbits',
                'description' => 'High-quality Timothy hay that promotes digestion and dental health in rabbits.',
            ],
            [
                'title'       => 'Nutty Hamster Treats',
                'description' => 'A mix of nuts and seeds to provide a fun and healthy snack for hamsters.',
            ],
            [
                'title'       => 'Pellet Mix for Guinea Pigs',
                'description' => 'Nutrient-rich pellets that support the dietary needs of guinea pigs.',
            ],
            [
                'title'       => 'Carrot-Flavored Chew Sticks',
                'description' => 'Delicious and durable chew sticks that support dental health for small pets.',
            ],
            [
                'title'       => 'Vitamin C Treats for Guinea Pigs',
                'description' => 'Specially formulated treats with extra vitamin C to boost guinea pig health.',
            ],
        ];

        $conditions = ['New', 'Used'];
        $isFood     = fake()->boolean();
        $weights    = [0.5, 1, 1.5, 2, 2.5];
        $status     = ['Approved', 'Pending', 'Canceled'];

        $randomProduct = Arr::random($product_data);
        $randomSubCategories = Arr::random($subCategories, rand(1, 4));

        return [
            'user_id'         => Arr::random($users),
            'category_id'     => $randomCategoryId,
            'sub_category_id' => array_map('strval', $randomSubCategories),
            'title'           => $randomProduct['title'],
            'description'     => $randomProduct['description'],
            'images'          => json_encode(
                collect($this->faker->randomElements(
                    range(1, 150),
                    $this->faker->numberBetween(1, 5)
                ))->map(function ($value) {
                    return 'product/'.$value .'.png';
                })
            ),
            'price'           => fake()->randomFloat(2, 10, 500),
            'brand'           => Arr::random($petFoodBrands),
            'condition'       => Arr::random($conditions),
            'is_food'         => $isFood,
            'weight'          => $isFood ? Arr::random($weights) : null,
            'status'          => Arr::random($status),
            'view_count'      => rand(1, 100),
        ];
    }
}
