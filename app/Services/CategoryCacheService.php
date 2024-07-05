<?php

namespace App\Services;

use App\Http\Resources\CategoryResource;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class CategoryCacheService
{

    public function reCacheCateories()
    {
        $this->clear();
        $this->cacheCategories();
    }

    public function clear()
    {
        $response = Http::get(env('LOAD_BALANCER_BASE_URL') . '/api/clear_cache.php');
        // Check if the response is successful
        if ($response->successful()) {
            return $response->body();
        }
        return response()->json(['error' => 'Unable to fetch categories'], $response->status());
    }

    public function cacheCategories()
    {
        $response = Http::get(env('LOAD_BALANCER_BASE_URL') . '/api/cache.php');
        // Check if the response is successful
        if ($response->successful()) {
            return $response->body();
        }
        return response()->json(['error' => 'Unable to fetch categories'], $response->status());
    }

    public function getCachedCategories()
    {
        // Define the backend URL and make the request
        $response = Http::get(env('LOAD_BALANCER_BASE_URL') . '/api/categories.php');
        // Check if the response is successful
        if ($response->successful()) {
            $data = $response->json()['data'];
            // Transform the data using the CategoryResource
            return collect($data)->map(function ($item) {
                return (object)$item;
            });
        }
        return response()->json(['error' => 'Unable to fetch categories'], $response->status());
    }

}