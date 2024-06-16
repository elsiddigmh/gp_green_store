<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Redis;

class ManageCacheController extends Controller
{
    public function index(){
        return view("backend.administration.manage_cache.index");
    }
    // Add All Products Records to Redis Cache
    public function addProductCache(){
        $products = Product::all();

        if(isset($products) && !empty($products)){
            foreach($products as $product){
                Cache::put('product_id_'.$product->id, $product->toJson());
            }
            return redirect()->route('cache.index')->with('success', _lang('All Products Records Cached Successfully'));
        }else{
            return redirect()->route('cache.index')->with('error', _lang('Something went wrong'));
        }
    }
    
    // Delete All Products Records Cached in Redis
    public function clearProductCache(Request $request){
        $products = Product::all();
        foreach($products as $product){
            if(Cache::get('product_id_'.$product->id) != null){
                Cache::forget('product_id_'.$product->id);
            }
        }
        return redirect()->route('cache.index')->with('success', _lang('Products Caching has been Cleard!'));
    }

    // Clear All Records Cached in Redis
    public function clearCache(Request $request){
        Cache::flush();
        return redirect()->route('cache.index')->with('success', _lang('Application Caching has been Cleard!'));
    }
}
