<?php

namespace App\Providers;

use App\Services\CategoryCacheService;
use App\Services\ProductCacheService;
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Schema;

class AppServiceProvider extends ServiceProvider
{
    private CategoryCacheService $categoryCacheService;
    private ProductCacheService $productCacheService;

    public function register()
    {
        Schema::defaultStringLength(191);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
//        $this->cacheAllData();
        Paginator::useBootstrap();
    }

    private function cacheAllData()
    {
        $this->categoryCacheService = new CategoryCacheService();
        $this->productCacheService = new ProductCacheService($this->categoryCacheService);
        $this->productCacheService->reCacheProducts();
        $this->categoryCacheService->reCacheCateories();
    }
}
