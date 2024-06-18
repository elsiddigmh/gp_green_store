<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SeedController extends Controller
{

    public function seedUnit()
    {

        for ($i = 1; $i <= 5; $i++) {
            DB::table("units")->insert(["id" => $i]);
        }

        for ($i = 1; $i <= 5; $i++) {
            DB::table("unit_translations")->insert([
                'name' => fake()->word(),
                'short_name' => 'PG',
                'unit_id' => $i,
            ]);
        }

        return redirect('/')->with('success', _lang('Units Added Successfully'));

    }

    public function seedCategory($num)
    {
        for ($i = 1; $i <= $num; $i++) {
            DB::table("categories")->insert([
                "slug" => fake()->slug,
                'icon' => '<i class="icofont-category"></i>',
                'banner' => null,
                'image' => asset('/uploads/default/default_category.png'),
                'parent_id' => null,
                'is_active' => 1,
            ]);
        }
        for ($i = 1; $i <= $num; $i++) {
            DB::table("category_translations")->insert([
                "category_id" => $i,
                "name" => fake()->word(),
                "description" => fake()->sentence(),
            ]);
        }
        return redirect('/')->with('success', _lang('Categories Added Successfully'));
    }


    public function seedProduct($num,$type,$category_id)
    {
        $last = DB::table('products') ->latest() ->first();
        $lastId = 1;
        if ($last) {
            $lastId = $last->id + 1;
        }

        for ($i = $lastId; $i <= $lastId + $num; $i++) {
            DB::table('products')->insert([
                'unit_id' => rand(1, 5),
                'category_id' => $category_id,
                'slug' => fake()->slug,
                'unit_number' => rand(1, 50),
                'price' => rand(10, 230),
                'special_price' => null,
                'viewed' => 0,
                'is_active' => 1,
                'in_stock' => rand(1, 100),
                'thumbnail' => null,
                'banner' => null,
                'product_type' => $type,
                'created_at' => now()->format('Y-m-d H:i:s'),
            ]);

            DB::table('product_translations')->insert([
                'product_id' => $i,
                'name' => fake()->text,
                'description' => fake()->paragraph(),
            ]);
        }
        return redirect('/')->with('success', _lang('Products Added Successfully'));

    }

}
