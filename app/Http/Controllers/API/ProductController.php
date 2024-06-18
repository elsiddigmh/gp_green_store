<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProductResource;
use App\Models\Product;
use App\Services\ProductCacheService;
use Illuminate\Database\Eloquent\Builder;

class ProductController extends Controller
{

    private ProductCacheService $productCacheService;

    public function __construct(ProductCacheService $productCacheService) {
        $this->productCacheService = $productCacheService;
    }

    public function search()
    {
        $keyword = request('keyword');
        if ($keyword == '') {
            return ProductResource::collection([]);
        }

        $products = Product::where('is_active', 1)
            ->whereHas('translation', function (Builder $query) use ($keyword) {
                $query->where('name', 'like', '%' . $keyword . '%');
            })
            ->orderBy('slug')
            ->limit(15)
            ->get();

        return ProductResource::collection($products);
    }

    public function offers()
    {
        $type = 'offer';
        $cachedProductsArray = $this->productCacheService->getCachedProductsByCatgorySlugAndProductType(null, $type);
        if ($cachedProductsArray->count() > 0) {
            return $cachedProductsArray;
        }
        return $this->readFromPrimaryDatabse($type);
    }

    public function readFromPrimaryDatabse($type)
    {
        $products = Product::where('is_active', 1)
            ->where('product_type', $type)
            ->orderBy('slug')
            ->paginate(15);
        return ProductResource::collection($products);
    }

}
