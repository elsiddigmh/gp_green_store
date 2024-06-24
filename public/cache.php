<?php
//apcu_clear_cache();
global $pdo;
include 'db_connect.php';
// Check if APCu is enabled
if (!function_exists('apcu_store')) {
    die("APCu is not enabled.");
}

// Store a products in the APCu cache
if (!apcu_exists('products')) {
    // fetch from db
    $stmt = $pdo->prepare("SELECT * FROM products p JOIN product_translations t ON p.id = t.product_id");
    $stmt->execute();
    $products = $stmt->fetchAll();
    apcu_store('products', json_encode($products));
}

// Store a products in the APCu cache
if (!apcu_exists('categories')) {
    // fetch from db
    $stmt = $pdo->prepare("SELECT * FROM categories c JOIN category_translations t ON c.id = t.category_id");
    $stmt->execute();
    $categories = $stmt->fetchAll();
    apcu_store('categories', json_encode($categories));
}

//echo "categories = " . apcu_fetch('categories');
//echo " </br> products = ". apcu_fetch( 'products');

?>