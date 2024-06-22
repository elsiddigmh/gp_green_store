<?php

namespace App\Services;

use App\Http\Resources\CategoryResource;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;

class CategoryCacheService {

    public function getCachedCategoriesByStatus($status)
    {
        // Example category data for status checking (this should come from your cache or a predefined array)
        return $this->getCachedCategoriesAsJsonArray();
        // Filter Categories and return
//        $cachedCategoriesArrayCollect = collect($cachedCategoriesArray);
//        return $this->filterCategories($cachedCategoriesArrayCollect, $status);
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
       return $this->getCachedCategories();
    }

    public function reCacheCateories()
    {
        $this->clear();
        $categories = Category::all();
        $this->cacheCategories($categories);
    }

    public function clear()
    {
        CacheService::$AppCache['categories'] = [];
        Log::info( 'Cached categories cleared, new count = '. count(CacheService::$AppCache['categories']));
    }

    public function cacheCategories($categories)
    {
        CacheService::$AppCache['categories'] = $categories;
        Log::info( 'Cached categories with count = '. count(CacheService::$AppCache['categories']));
    }

    public function getCachedCategories()
    {
        if (isset(CacheService::$AppCache['categories']))
            return CacheService::$AppCache['categories'];
        return CacheService::$AppCache['categories'] = [];
    }

}