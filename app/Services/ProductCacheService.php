<?php

namespace App\Services;

use App\Http\Resources\ProductResource;
use App\Models\Product;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;

class ProductCacheService
{

    public static $AppCache = [];
    public function getCachedProductsByCatgorySlugAndProductType($slug, $type)
    {
        $cachedProducts = $this->getCachedProductAsJsonArray();
        $cachedProductsArray = collect($cachedProducts);
        return $this->filterCachedProductsByCategorySlug($slug, $cachedProductsArray, $type);
    }

    private function filterCachedProductsByCategorySlug($slug, $cachedProductsArray, $type)
    {
        // Example category data for slug checking (this should come from your cache or a predefined array)
        $categories = $this->getCachedCategoriesAsJsonArray();
        // Filter products
        $filteredProducts = $this->filterProductsByTypeAndSlug($cachedProductsArray, $categories, $slug, $type);

        // print_r($filteredProducts);

        // Paginate the results
        $page = request()->get('page', 1); // Get the current page or default to 1
        $perPage = 15;
        $total = $filteredProducts->count();
        // print_r($total);
        $results = $filteredProducts->slice(($page - 1) * $perPage, $perPage)->all();

        $paginatedProducts = new LengthAwarePaginator($results, $total, $perPage, $page, [
            'path' => request()->url(),
            'query' => request()->query(),
        ]);

        // Convert to Product models
        $cached_products = collect($paginatedProducts->items())->map(function ($product) {
            return $this->mapProductItem($product);
        });

        // Construct pagination links
        $paginationLinks = [];
        $paginationLinks[] = [
            'url' => $paginatedProducts->previousPageUrl(),
            'label' => '&laquo; Previous',
            'active' => false,
        ];
        for ($i = 1; $i <= $paginatedProducts->lastPage(); $i++) {
            $paginationLinks[] = [
                'url' => $paginatedProducts->url($i),
                'label' => (string)$i,
                'active' => $paginatedProducts->currentPage() == $i,
            ];
        }
        $paginationLinks[] = [
            'url' => $paginatedProducts->nextPageUrl(),
            'label' => 'Next &raquo;',
            'active' => false,
        ];

        //Return the paginated ProductResource collection
        return ProductResource::collection($cached_products)->additional([
            'links' => [
                'first' => $paginatedProducts->url(1),
                'last' => $paginatedProducts->url($paginatedProducts->lastPage()),
                'prev' => $paginatedProducts->previousPageUrl(),
                'next' => $paginatedProducts->nextPageUrl(),
            ],
            'meta' => [
                'current_page' => $paginatedProducts->currentPage(),
                'from' => $paginatedProducts->firstItem(),
                'last_page' => $paginatedProducts->lastPage(),
                'links' => $paginationLinks,
                'path' => request()->url(),
                'per_page' => $paginatedProducts->perPage(),
                'to' => $paginatedProducts->lastItem(),
                'total' => $paginatedProducts->total()
            ]
        ]);
    }

    private function filterProductsByTypeAndSlug($cachedProductsArray, $categories, $slug, $type)
    {
        return $cachedProductsArray->filter(function ($product) use ($slug, $categories, $type) {  // Check if the product's category slug matches
            $category = collect($categories)->firstWhere('id', $product['category_id']);
            if ($slug && (!$category || $category['slug'] != $slug)) {
                return false;
            }
            // Check if product is active
            if ($product['is_active'] != 1) {
                return false;
            }
            // Check if product type is 'general'
            if ($product['product_type'] != $type) {
                return false;
            }
            return true;
        })
            ->sortBy('slug')
            ->values(); // Re-index the collection
    }

    private function getCachedProductAsJsonArray()
    {
        return json_decode(Cache::get('products'), true);
    }

    private function getCachedCategoriesAsJsonArray()
    {
        return json_decode(Cache::get('categories'), true);
    }

    public function getCachedProductsByProductName($keyword)
    {
        $cachedProducts = $this->getCachedProductAsJsonArray();
        $cachedProductsArray = collect($cachedProducts);
        $filterCachedProductsByName = $this->filterCachedProductsByName($cachedProductsArray, $keyword);
        // Convert to Product models
        return collect($filterCachedProductsByName)->map(function ($product) {
            return $this->mapProductItem($product);
        });
    }

    private function filterCachedProductsByName($cachedProductsArray, $keyword)
    {
        return $cachedProductsArray->filter(function ($product) use ($keyword) {  // Check if the product's category slug matches
            if ($product['is_active'] != 1) {
                return false;
            }
            $product_translations = collect($product['translations']);
            if ($product_translations->count() > 0 && $product_translations[0]) {
//                print_r($product_translations);
                if (!Str::contains($product_translations[0]['name'], $keyword,true)) {
                    return false;
                }
            }
            return true;
        })->sortBy('slug')
            ->values(); // Re-index the collection
    }

    function mapProductItem($product): Product
    {
        $cached_product = new Product();

        $cached_product->id = $product['id'];
        $cached_product->category_id = $product['category_id'];
        $cached_product->unit_id = $product['unit_id'];
        $cached_product->unit_number = $product['unit_number'];
        $cached_product->price = $product['price'];
        $cached_product->special_price = $product['special_price'];
        $cached_product->in_stock = $product['in_stock'];
        $cached_product->is_active = $product['is_active'];
        $cached_product->thumbnail = $product['thumbnail'];
        $cached_product->slug = $product['slug'];

        return $cached_product;
    }

    public function reCacheProducts()
    {
        $this->clear();
        $products = Product::with('translations')->get();
        Cache::put('products',$products->toJson());
    }

    public function clear()
    {
        Cache::forget('products');
    }
    public function cacheCategories($categories)
    {
       self::$AppCache['categories'] = $categories;
    }

    public function cacheProducts($products)
    {
       self::$AppCache['products'] = $products;
    }

    public function getCachedProducts()
    {
       return self::$AppCache['products'];
    }



}