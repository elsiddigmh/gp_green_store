<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\ProductResource;
use App\Services\ProductCacheService;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Facades\Log;


class CategoryController extends Controller
{

    private ProductCacheService $productCacheService;

    public function __construct(ProductCacheService $productCacheService)
    {
        $this->productCacheService = $productCacheService;
    }

    public function index()
    {
        $catregories = Category::with(['translation', 'child_categories'])
            ->where('is_active', 1)
            ->get();
        return CategoryResource::collection($catregories);
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
        if ($cachedProductsArray->count() > 0) {
            Log::info('Reading Products from the cache for category ' . $slug);
            return $cachedProductsArray;
        }
        return $this->readFromPrimaryDatabse($slug, $type);
    }

    public function readFromPrimaryDatabse($slug, $type)
    {
        $products = Product::where('is_active', 1)
            ->where('product_type', $type)
            ->whereHas('category', function (Builder $query) use ($slug) {
                $query->where('slug', $slug);
            })
            ->orderBy('slug')
            ->paginate(15);
        return ProductResource::collection($products);
    }
}
