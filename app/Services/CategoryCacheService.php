<?php

namespace App\Services;

use App\Http\Resources\CategoryResource;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Facades\Cache;

class CategoryCacheService {

    public function getCachedCategoriesByStatus($status)
    {
        // Example category data for status checking (this should come from your cache or a predefined array)
        $cachedCategoriesArray = $this->getCachedCategoriesAsJsonArray();
        // Filter Categories and return
        $cachedCategoriesArrayCollect = collect($cachedCategoriesArray);
        return collect($this->filterCategories($cachedCategoriesArrayCollect, $status))->map(function ($cat) {
            $category = new Category();

            $category->id = $cat['id'];
            $category->icon = $cat['icon'];
            $category->image = $cat['image'];
            $category->parent_id = $cat['parent_id'];
            $category->slug = $cat['slug'];
            $category->is_active = $cat['is_active'];
            $category->banner = $cat['banner'];
            $category->created_at = $cat['created_at'];
            $category->updated_at = $cat['updated_at'];

            return $category;
        });
    }
    private function filterCategories($cachedCategoriesArray, $status)
    {
        return $cachedCategoriesArray->filter(function ($category) use ($status) {  // Check if the Category's category status matches
            // Check if Category is active
            if ($category['is_active'] != $status) {
                return false;
            }
            return true;
        })->values();
    }

    private function getCachedCategoriesAsJsonArray()
    {
       return json_decode(Cache::get('categories'), true);
    }

    public function reCacheCateories()
    {
        $this->clear();
        $categories = Category::all();
        Cache::put('categories', $categories->toJson());
    }

    public function clear()
    {
        Cache::forget('categories');
    }

}