<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class ManageCacheController extends Controller
{
    public function index(){
        return view("backend.administration.manage_cache.index");
    }
    // Add All Products Records to Redis Cache
    public function addProductCache(){
        $products = Product::select('id','slug')->get();

        if(isset($products) && !empty($products)){
            foreach($products as $product){
                Redis::set('product_info_'.$product->slug, $product->id);
            }
            return redirect()->route('cache.index')->with('success', _lang('All Products Records Cached Successfully'));
        }else{
            return redirect()->route('cache.index')->with('error', _lang('Something went wrong'));
        }
    }
    
    // Delete All Products Records Cached in Redis
    public function deleteProductCache(Request $request){
        //Redis::del(Redis::keys('products:*'));
    }
}
