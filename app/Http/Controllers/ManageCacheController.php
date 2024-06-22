<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Services\CategoryCacheService;
use App\Services\ProductCacheService;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Redis;

class ManageCacheController extends Controller
{

    private ProductCacheService $productCacheService;
    private CategoryCacheService $categoryCacheService;
    public function __construct(ProductCacheService $productCacheService,CategoryCacheService $categoryCacheService){
        $this->productCacheService = $productCacheService;
        $this->categoryCacheService =  $categoryCacheService;
    }

    public function index(){
        return view("backend.administration.manage_cache.index");
    }
    // Add All Products Records to Redis Cache
    public function addProductCache(){
        $this->productCacheService->reCacheProducts();
        return redirect()->route('cache.index')->with('success', _lang('All Products Records Cached Successfully'));
    }
    
    // Delete All Products Records Cached in Redis
    public function clearProductCache(Request $request){
        $this->productCacheService->clear();
        return redirect()->route('cache.index')->with('success', _lang('Products Caching has been Cleard!'));
    }


    // Add All Categories Records to Redis Cache
    public function addCategoryCache(){
        $this->categoryCacheService->reCacheCateories();
        return redirect()->route('cache.index')->with('success', _lang('All Categories Records Cached Successfully'));
    }


    // Delete All Categories Records Cached in Redis
    public function clearCategoryCache(Request $request){
        $this->categoryCacheService->clear();
        return redirect()->route('cache.index')->with('success', _lang('Categories Caching has been Cleard!'));
    }

    // Clear All Records Cached in Redis
    public function clearCache(Request $request){
        Cache::flush();
        return redirect()->route('cache.index')->with('success', _lang('Application Caching has been Cleard!'));
    }


}
