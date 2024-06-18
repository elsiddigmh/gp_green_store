<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\ProductResource;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Log;


class CategoryController extends Controller
{

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
        // Example product data array
        $productsArray = json_decode(Cache::get('products'), true); // Retrieve from cache // open your mobile
        // Example category data for slug checking (this should come from your cache or a predefined array)
        $categories = json_decode(Cache::get('categories'), true);
        // Filter products
        $filteredProducts = $this->filterProducts($productsArray, $categories, $slug);

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
            $cached_product = new Product();

            $cached_product->id            = $product['id'];
            $cached_product->category_id   = $product['category_id'];
            $cached_product->unit_id       = $product['unit_id'];
            $cached_product->unit_number   = $product['unit_number'];
            $cached_product->price         = $product['price'];
            $cached_product->special_price = $product['special_price'];
            $cached_product->in_stock      = $product['in_stock'];
            $cached_product->is_active     = $product['is_active'];
            $cached_product->thumbnail     = $product['thumbnail'];

            return $cached_product;
        });

        //Return the paginated ProductResource collection
        return ProductResource::collection($cached_products)->additional([
        
                'total' => $paginatedProducts->total(),
                'per_page' => $paginatedProducts->perPage(),
                'current_page' => $paginatedProducts->currentPage(),
                'last_page' => $paginatedProducts->lastPage(),
                'from' => $paginatedProducts->firstItem(),
                'to' => $paginatedProducts->lastItem(),
        ]);



        // $productsArray = json_decode(Cache::get('products'), true);
        // // $products = $productsArray->map(function ($productData) {
        // //     return (new Product)->fill($productData);
        // // });

        // $cached_products = [];
        // foreach ($productsArray as $product) {
        //    $cachedProduct = new Product();

        //    $cachedProduct->id            = $product['id'];
        //    $cachedProduct->category_id   = $product['category_id'];
        //    $cachedProduct->unit_id       = $product['unit_id'];
        //    $cachedProduct->unit_number   = $product['unit_number'];
        //    $cachedProduct->price         = $product['price'];
        //    $cachedProduct->special_price = $product['special_price'];
        //    $cachedProduct->in_stock      = $product['in_stock'];
        //    $cachedProduct->is_active     = $product['is_active'];
        //    $cachedProduct->thumbnail     = $product['thumbnail'];

        //    $cached_products[] = $cachedProduct;
        // }
        // //From DB
        // $products = Product::where('is_active', 1)
        //     ->where('product_type','general')
        //     ->whereHas('category', function (Builder $query) use ($slug) {
        //         $query->where('slug',$slug);
        //     })
        //     ->orderBy('slug')
        //     ->paginate(15);

        // return ProductResource::collection($products);


    }


    private function filterProducts($productsArray, $categories, $slug)
    {
        return collect($productsArray)
            ->filter(function ($product) use ($slug, $categories) {  // Check if the product's category slug matches
                $category = collect($categories)->firstWhere('id', $product['category_id']);
                if (!$category || $category['slug'] != $slug) {
                    return false;
                }
                // Check if product is active
                if ($product['is_active'] != 1) {
                    return false;
                }
                // Check if product type is 'general'
                if ($product['product_type'] != 'general') {
                    return false;
                }
                return true;
            })
            ->sortBy('slug')
            ->values(); // Re-index the collection
    }
}
