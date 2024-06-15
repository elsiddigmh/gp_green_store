<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ManageCacheController extends Controller
{
    public function index(){
        return view("backend.administration.manage_cache.list");
    }
    // Add All Categories Records to Redis Cache
    public function addCategoryCache(){

    }
    
    // Delete All Categories Records Cached in Redis
    public function deleteCategoryCache(Request $request){

    }
}
