<?php
namespace Database\Seeders;
use App\Models\Category;
use App\Models\CategoryTranslation;
use App\Models\Product;
use App\Models\ProductTranslation;
use App\Models\Unit;
use App\Models\UnitTranslation;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder {
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run() {
        $this->call([
            EmailTemplateSeeder::class,
            UtilitySeeder::class,
        ]);

        // CategoryTranslation::factory()->create([
        // ]);

        // Category::factory()->create(
        //     [
        //     "name"=> "Category Name",
        //     "slug"=> "slug". uniqid(),
        //     'icon' => '<i class="icofont-category"></i>',
        //     'image' => asset('/uploads/default/default_category.png'),
        //     'parent_id' => null,
        //     ]
        // );
        // Unit::factory(1)->create();
        // UnitTranslation::create()->factory()->create([
        //     'name'=> 'Pices',
        //     'short_name'=> 'Pice',
        //     'unit_id'=> 1,
        // ]);
        // ProductTranslation::create()->factory(50)->create([
        //     'name' => "Product Name",
        //     'description' => null,
        // ]);

        // Product::create()->factory(50)->create([
        //     'unit_id' => 1,
        //     'category_id' => rand (4,9),
        //     'slug'=> 'slug'. uniqid(), 
        //     'unit_number' => rand(1,50),
        //     'price' => rand(10,230),
        //     'special_price' => null,
        //     'viewed' => 0,
        //     'is_active' => 1,
        //     'in_stock' => rand(1,100),
        //     'thumbnail' => null,
        //     'banner' => null,
        //     'product_type' => 'general',
        //     'created_at' => now()->format('Y-m-d H:i:s'),          
        // ]);
    }
}
