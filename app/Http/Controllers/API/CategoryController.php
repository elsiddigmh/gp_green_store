<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\ProductResource;
use App\Services\CategoryCacheService;
use App\Services\ProductCacheService;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Facades\Log;


class CategoryController extends Controller
{

    private ProductCacheService $productCacheService;
    private CategoryCacheService $categoryCacheService;

    public function __construct(ProductCacheService $productCacheService, CategoryCacheService $categoryCacheService)
    {
        $this->productCacheService = $productCacheService;
        $this->categoryCacheService = $categoryCacheService;
    }

    public function index()
    {
        $categories = $this->categoryCacheService->getCachedCategories();
        return CategoryResource::collection($categories);
    }

    public function show($slug)
    {
        $category = Category::where('slug', $slug)->first();
        return new CategoryResource($category);
    }

    public function products($slug)
    {
        $type = 'general';
        $cachedProductsArray = $this->productCacheService->getCachedProductsByCatgorySlugAndProductType($slug, $type);
        // print_r($cachedProductsArray);
        if ($cachedProductsArray->count() > 0) {
            Log::info('Reading Products from the cache for category ' . $slug);
            return $cachedProductsArray;
        }
        return $this->readFromPrimaryDatabase($slug, $type);
    }

    public function readFromPrimaryDatabase($slug, $type)
    {    
        $products = Product::join('product_translations','products.id','=','product_translations.product_id')
        ->select('products.*', 'product_translations.*')
            ->where('product_type', $type)
            ->whereHas('category', function (Builder $query) use ($slug) {
                $query->where('slug', $slug);
            })->orderBy('slug')
            ->paginate(15);
        return ProductResource::collection($products);
    }
}
