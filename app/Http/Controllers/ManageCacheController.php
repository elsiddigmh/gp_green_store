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
    
    public function addProductCache(){
        $this->cacheProductsInAllNodes();
        return redirect()->route('cache.index')->with('success', _lang('All products data cached successfully'));
    }

    private function cacheProductsInAllNodes(){
        $this->productCacheService->reCacheProducts();
        $this->productCacheService->reCacheProducts();
        $this->productCacheService->reCacheProducts();
    }
    
    public function clearProductCache(Request $request){
        $this->clearProductsFromAllNodes();
        return redirect()->route('cache.index')->with('success', _lang('Products cache has been cleard!'));
    }

    public function addCategoryCache(){
        $this->cacheCategoriesInAllNodes();
        return redirect()->route('cache.index')->with('success', _lang('All categories data cached successfully'));
    }

    private function cacheCategoriesInAllNodes( ){
        $this->categoryCacheService->reCacheCateories();
        $this->categoryCacheService->reCacheCateories();
        $this->categoryCacheService->reCacheCateories();
    }


    public function clearCategoryCache(Request $request){
        $this->clearCategoriesFromAllNodes();
        return redirect()->route('cache.index')->with('success', _lang('Categories cache has been cleard!'));
    }

    public function cacheAll(Request $request){
        $this->cacheCategoriesInAllNodes();
        $this->cacheProductsInAllNodes();
        return redirect()->route('cache.index')->with('success', _lang('All application data has been cached successfully!'));
    }

    public function clearCache(Request $request){
        $this->clearCategoriesFromAllNodes();
        $this->clearProductsFromAllNodes();
        return redirect()->route('cache.index')->with('success', _lang('All application caches has been cleard!'));
    }

    private function clearCategoriesFromAllNodes(){
        $this->categoryCacheService->clear();
        $this->categoryCacheService->clear();
        $this->categoryCacheService->clear();
    }

    private function clearProductsFromAllNodes(){
        $this->productCacheService->clear();
        $this->productCacheService->clear();
        $this->productCacheService->clear();
    }


}
