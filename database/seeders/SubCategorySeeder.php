<?php
namespace Database\Seeders;

use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Database\Seeder;

class SubCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories    = Category::all();
        $subcategories = [
            'Dog'        => ['Dry Dog Food', 'Wet Dog Food', 'Dog Treats', 'Dog Toys'],
            'Cat'        => ['Dry Cat Food', 'Wet Cat Food', 'Cat Treats', 'Cat Toys'],
            'Small Pets' => ['Small Pet Food', 'Small Pet Cages', 'Bedding', 'Small Pet Toys'],
            'Fish'       => ['Fish Food', 'Aquariums', 'Filters & Pumps', 'Aquarium Decorations'],
            'Bird'       => ['Bird Food', 'Bird Cages', 'Perches & Stands', 'Bird Toys'],
            'Reptiles'   => ['Reptile Food', 'Terrariums', 'Heating & Lighting', 'Reptile Accessories'],
        ];

        foreach ($categories as $category) {
            if (isset($subcategories[$category->name])) {
                foreach ($subcategories[$category->name] as $subcategoryName) {
                    SubCategory::create([
                        'category_id' => $category->id,
                        'name'        => $subcategoryName,
                    ]);
                }
            }
        }
    }

}
