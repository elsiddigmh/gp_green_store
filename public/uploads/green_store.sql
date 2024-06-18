-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2024 at 03:40 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `green_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `banner` varchar(191) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `slug`, `icon`, `image`, `banner`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(4, 'food', '<i class=\"icofont-food-basket\"></i>', '162211069760af71e9a0a6c.png', NULL, NULL, 1, '2021-05-24 06:50:15', '2021-07-15 09:25:06'),
(5, 'fruits-vegetables', '', 'default-cat.png', NULL, 4, 1, '2021-05-24 07:26:30', '2021-05-27 06:50:18'),
(6, 'beauty-health', '<i class=\"icofont-muscle-weight\"></i>', '162211077360af72357aa52.png', NULL, NULL, 1, '2021-05-25 11:38:12', '2021-07-15 09:24:21'),
(7, 'baby-care', '<i class=\"icofont-baby-food\"></i>', '162211081060af725a7788c.png', NULL, NULL, 1, '2021-05-25 11:57:59', '2021-07-15 09:23:28'),
(8, 'hygiene', '<i class=\"icofont-laboratory\"></i>', '162211084560af727d1fde5.png', NULL, NULL, 1, '2021-05-26 11:17:04', '2021-07-15 09:22:58'),
(9, 'home-cleaning', '<i class=\"icofont-water-bottle\"></i>', '162211088360af72a36252e.png', NULL, NULL, 1, '2021-05-26 11:29:41', '2021-07-15 09:21:23'),
(11, 'medicine', '<i class=\"icofont-medicine\"></i>', '162211092260af72cab9a9e.png', NULL, NULL, 1, '2021-05-26 13:04:29', '2021-07-15 09:13:52'),
(12, 'breakfast', '', 'default-cat.png', NULL, 4, 1, '2021-05-27 06:05:24', '2021-05-27 06:50:53'),
(13, 'health-care', '', 'default-cat.png', NULL, 6, 1, '2021-05-27 06:05:54', '2021-05-27 06:05:54'),
(14, 'office-products', '<i class=\"icofont-ui-office\"></i>', '162211111160af73870b8bd.png', NULL, NULL, 1, '2021-05-27 07:25:11', '2021-07-15 09:13:25'),
(15, 'kitchen-appliances', '<i class=\"icofont-spoon-and-fork\"></i>', '16279067076107e29307a93.png', NULL, NULL, 1, '2021-05-27 07:27:09', '2021-07-15 09:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `locale`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 4, 'English', 'Food', 'All Types Of Food', '2021-05-24 07:23:15', '2021-05-24 07:23:15'),
(2, 5, 'English', 'Fruits & Vegetables', 'Fruits & Vegetables Items', '2021-05-24 07:26:30', '2021-05-24 13:21:02'),
(3, 6, 'English', 'Beauty & Health', '', '2021-05-25 11:38:12', '2021-05-25 11:38:12'),
(4, 7, 'English', 'Baby Care', '', '2021-05-25 11:57:59', '2021-05-25 11:57:59'),
(5, 8, 'English', 'Hygiene', '', '2021-05-26 11:17:04', '2021-05-26 11:17:04'),
(6, 9, 'English', 'Home & Cleaning', '', '2021-05-26 11:29:41', '2021-05-26 11:29:41'),
(7, 11, 'English', 'Medicine', '', '2021-05-26 13:04:29', '2021-05-26 13:04:29'),
(8, 12, 'English', 'Breakfast', '', '2021-05-27 06:05:24', '2021-05-27 06:05:24'),
(9, 13, 'English', 'Health Care', '', '2021-05-27 06:05:54', '2021-05-27 06:05:54'),
(10, 14, 'English', 'Office Products', '', '2021-05-27 07:25:11', '2021-05-27 07:25:11'),
(11, 15, 'English', 'Kitchen Appliances', '', '2021-05-27 07:27:09', '2021-05-27 07:27:09');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `value` decimal(10,2) UNSIGNED DEFAULT NULL,
  `is_percent` tinyint(1) NOT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_categories`
--

CREATE TABLE `coupon_categories` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_products`
--

CREATE TABLE `coupon_products` (
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_translations`
--

CREATE TABLE `coupon_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `database_backups`
--

CREATE TABLE `database_backups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `body` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(25, '2014_10_12_000000_create_users_table', 1),
(26, '2014_10_12_100000_create_password_resets_table', 1),
(27, '2018_11_12_152015_create_email_templates_table', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2019_09_01_080940_create_settings_table', 1),
(30, '2020_07_02_145857_create_database_backups_table', 1),
(31, '2020_07_06_142817_create_roles_table', 1),
(32, '2020_07_06_143240_create_permissions_table', 1),
(33, '2021_05_24_081012_create_categories_table', 1),
(34, '2021_05_24_082200_create_category_translations_table', 1),
(35, '2021_05_24_082301_create_units_table', 1),
(36, '2021_05_24_082302_create_unit_translations_table', 1),
(37, '2021_05_24_082501_create_products_table', 1),
(38, '2021_05_24_082502_create_product_translations_table', 1),
(39, '2021_05_24_152754_create_coupons_table', 1),
(40, '2021_05_24_152844_create_coupon_translations_table', 1),
(41, '2021_05_24_171317_create_coupon_products_table', 1),
(42, '2021_05_24_171318_create_coupon_categories_table', 1),
(43, '2021_06_01_172141_create_orders_table', 1),
(44, '2021_06_01_172303_create_order_products_table', 1),
(45, '2021_06_02_142034_create_transactions_table', 1),
(46, '2021_07_02_145504_create_pages_table', 1),
(47, '2021_07_02_145952_create_page_translations_table', 1),
(48, '2023_09_29_061603_add_banner_to_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `customer_name` varchar(191) NOT NULL,
  `customer_email` varchar(191) NOT NULL,
  `customer_phone` varchar(191) NOT NULL,
  `shipping_address` text NOT NULL,
  `sub_total` decimal(10,2) UNSIGNED NOT NULL,
  `shipping_method` varchar(191) NOT NULL,
  `shipping_cost` decimal(10,2) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `discount` decimal(10,2) UNSIGNED NOT NULL,
  `total` decimal(10,2) UNSIGNED NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(20) NOT NULL,
  `delivery_status` varchar(20) NOT NULL,
  `delivery_boy_id` bigint(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `delivery_type` varchar(10) NOT NULL DEFAULT 'express',
  `delivery_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_price` decimal(10,2) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `line_total` decimal(10,2) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text NOT NULL,
  `body` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `permission` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `unit_number` decimal(10,2) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `special_price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `viewed` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `banner` varchar(191) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'general',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `unit_id`, `unit_number`, `slug`, `price`, `special_price`, `in_stock`, `viewed`, `is_active`, `thumbnail`, `banner`, `product_type`, `created_at`, `updated_at`) VALUES
(1, 11, 2, '1.00', 'minus-dolor-dolores-id-sequi-repellat-non-aut', '216.00', NULL, 37, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(2, 11, 5, '46.00', 'iure-eum-fugiat-impedit-temporibus-fugit', '47.00', NULL, 10, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(3, 11, 2, '17.00', 'dolorem-non-voluptatibus-quasi-odio-neque-dolores-dolores-velit', '61.00', NULL, 35, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(4, 11, 4, '5.00', 'dicta-magnam-aut-tenetur-voluptatem-et-fugit', '85.00', NULL, 55, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(5, 11, 4, '11.00', 'consequatur-adipisci-ut-incidunt-velit', '58.00', NULL, 81, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(6, 11, 3, '8.00', 'sit-eaque-dolorem-in', '74.00', NULL, 10, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(7, 11, 1, '14.00', 'error-est-dolores-eum', '78.00', NULL, 30, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(8, 11, 5, '26.00', 'ut-est-ut-ut-consequatur-numquam-sequi', '21.00', NULL, 42, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(9, 11, 1, '35.00', 'omnis-sint-iusto-soluta-corporis-et', '170.00', NULL, 86, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(10, 11, 3, '24.00', 'rerum-eos-est-ratione-et-tenetur', '229.00', NULL, 18, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(11, 11, 1, '28.00', 'ad-quo-facilis-tempora-cum-optio', '95.00', NULL, 45, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(12, 11, 2, '30.00', 'optio-autem-ut-possimus-maiores-nihil-error-quaerat-incidunt', '79.00', NULL, 15, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(13, 11, 1, '38.00', 'qui-sed-quas-excepturi-mollitia-magni-et', '140.00', NULL, 63, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(14, 11, 5, '48.00', 'reiciendis-repellendus-animi-ea-aut-sunt-doloremque', '156.00', NULL, 71, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(15, 11, 2, '46.00', 'voluptas-asperiores-ad-dolore-iste-harum', '90.00', NULL, 1, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(16, 11, 2, '4.00', 'possimus-ab-nesciunt-quis-a', '65.00', NULL, 38, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(17, 11, 1, '28.00', 'minus-cupiditate-excepturi-deserunt-sequi-quo', '146.00', NULL, 42, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(18, 11, 1, '27.00', 'autem-et-expedita-debitis-nostrum', '176.00', NULL, 68, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(19, 11, 5, '9.00', 'et-aut-dolorem-natus-odit-aspernatur-consequatur', '139.00', NULL, 20, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(20, 11, 2, '14.00', 'quam-possimus-officia-earum-consequuntur-laboriosam', '158.00', NULL, 20, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(21, 11, 4, '12.00', 'aspernatur-id-dolores-velit-ipsum-provident', '102.00', NULL, 18, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(22, 11, 2, '23.00', 'est-aperiam-quasi-cumque-qui', '81.00', NULL, 84, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(23, 11, 1, '34.00', 'et-qui-quis-libero-labore-id-ut-aliquam', '206.00', NULL, 85, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(24, 11, 5, '7.00', 'consequatur-non-alias-deleniti-atque-dolor-esse', '93.00', NULL, 40, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(25, 11, 3, '22.00', 'sed-aliquid-maiores-at-unde', '181.00', NULL, 68, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(26, 11, 5, '12.00', 'molestias-repellendus-accusamus-quisquam-animi-cum-mollitia-autem-libero', '221.00', NULL, 76, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(27, 11, 3, '38.00', 'et-doloremque-officia-omnis-esse-sed-distinctio-possimus', '218.00', NULL, 48, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(28, 11, 5, '37.00', 'molestiae-quis-maxime-debitis-et', '106.00', NULL, 12, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(29, 11, 3, '32.00', 'libero-qui-illo-nihil-quisquam-harum-et', '228.00', NULL, 18, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(30, 11, 4, '6.00', 'in-aut-voluptas-vitae-dolor-inventore', '67.00', NULL, 68, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:03', NULL),
(31, 11, 5, '24.00', 'quidem-animi-dolorem-optio-blanditiis-rerum-mollitia-cum', '57.00', NULL, 99, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(32, 11, 2, '43.00', 'tenetur-dolor-dolor-ullam-vero-aut-ut-quisquam', '80.00', NULL, 71, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(33, 11, 4, '26.00', 'temporibus-animi-et-est-illo-rerum-natus', '108.00', NULL, 56, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(34, 11, 2, '13.00', 'autem-aut-adipisci-animi-provident', '96.00', NULL, 72, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(35, 11, 4, '21.00', 'sint-ut-voluptates-mollitia-aspernatur-qui-voluptatem', '99.00', NULL, 89, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(36, 11, 5, '17.00', 'ipsum-aperiam-delectus-consectetur-magnam-et-molestias', '112.00', NULL, 32, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(37, 11, 4, '41.00', 'incidunt-quaerat-qui-voluptates-adipisci-qui-est', '81.00', NULL, 76, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(38, 11, 1, '35.00', 'quam-ut-expedita-impedit-culpa-molestias-eos-id', '95.00', NULL, 60, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(39, 11, 1, '44.00', 'dolorem-nam-tempore-dicta-officiis', '207.00', NULL, 49, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(40, 11, 3, '45.00', 'voluptatibus-qui-sed-suscipit-aut-magnam-aliquid', '112.00', NULL, 38, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(41, 11, 4, '42.00', 'exercitationem-voluptatibus-non-mollitia-repudiandae', '57.00', NULL, 43, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(42, 11, 4, '24.00', 'autem-eum-voluptas-rerum-dolorem-eveniet', '175.00', NULL, 8, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(43, 11, 5, '19.00', 'est-ex-accusamus-optio', '137.00', NULL, 46, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(44, 11, 3, '22.00', 'ab-laborum-et-corporis-voluptas-harum', '189.00', NULL, 43, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(45, 11, 1, '31.00', 'aspernatur-praesentium-nihil-ea-omnis', '13.00', NULL, 91, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(46, 11, 3, '48.00', 'qui-pariatur-beatae-asperiores-nesciunt-accusantium-porro', '168.00', NULL, 60, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(47, 11, 4, '14.00', 'veniam-eos-ut-sit-dolor-voluptas', '225.00', NULL, 33, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(48, 11, 3, '9.00', 'magnam-consequuntur-corrupti-ex-aut-fuga-dolorem-nisi-eveniet', '139.00', NULL, 16, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(49, 11, 1, '34.00', 'quia-illum-repellendus-sed-temporibus', '30.00', NULL, 82, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(50, 11, 1, '22.00', 'id-laudantium-aut-illo-sed-in-quam', '210.00', NULL, 16, 0, 1, NULL, NULL, 'general', '2024-06-18 10:12:04', NULL),
(51, 11, 1, '17.00', 'rerum-aut-ut-qui-temporibus-alias-id-delectus-sit', '69.00', NULL, 44, 0, 1, NULL, NULL, 'general', '2024-06-18 10:19:32', NULL),
(52, 11, 2, '35.00', 'aliquid-consequatur-iste-officiis', '73.00', NULL, 67, 0, 1, NULL, NULL, 'general', '2024-06-18 10:19:33', NULL),
(53, 11, 5, '42.00', 'et-minima-ipsum-quas-enim-voluptatem-aut-provident-veniam', '67.00', NULL, 70, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(54, 11, 2, '35.00', 'pariatur-quod-eligendi-soluta-totam-rerum-voluptas-et', '118.00', NULL, 48, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(55, 11, 1, '21.00', 'magni-maxime-blanditiis-est-asperiores-repellendus-omnis-ipsa', '106.00', NULL, 62, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(56, 11, 2, '33.00', 'consequuntur-ullam-ipsam-rerum-voluptatem-velit-optio-velit', '37.00', NULL, 75, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(57, 11, 3, '26.00', 'sed-adipisci-illum-temporibus-quia-fugiat-dolor-aut', '211.00', NULL, 17, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(58, 11, 1, '13.00', 'aut-harum-soluta-natus-aut-ducimus-alias-corrupti', '116.00', NULL, 62, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(59, 11, 5, '42.00', 'qui-ut-amet-non-molestiae-aut', '185.00', NULL, 74, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(60, 11, 2, '12.00', 'velit-accusantium-quasi-et-laborum-porro-totam', '134.00', NULL, 2, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(61, 11, 1, '38.00', 'facilis-id-libero-at-tempora', '28.00', NULL, 9, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(62, 11, 2, '38.00', 'iste-corporis-vero-est-tempore', '85.00', NULL, 60, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(63, 11, 2, '20.00', 'rem-in-aperiam-hic-molestias-ab-repellat', '216.00', NULL, 27, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(64, 11, 1, '45.00', 'at-corporis-provident-earum-aut-et-non-ipsam-officiis', '165.00', NULL, 60, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(65, 11, 3, '5.00', 'quisquam-voluptates-et-iure-fugit-provident-repudiandae-quidem', '206.00', NULL, 27, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(66, 11, 5, '2.00', 'aut-mollitia-veniam-eos-cum-eligendi-perferendis', '128.00', NULL, 80, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(67, 11, 2, '47.00', 'est-delectus-id-vero-impedit', '220.00', NULL, 26, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(68, 11, 1, '3.00', 'consequatur-sed-quo-quos', '90.00', NULL, 94, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(69, 11, 1, '31.00', 'aperiam-amet-exercitationem-vero-molestiae-occaecati-rerum-maiores', '10.00', NULL, 2, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(70, 11, 5, '37.00', 'laboriosam-eum-et-nihil', '166.00', NULL, 85, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(71, 11, 4, '32.00', 'fugit-repellendus-corporis-iure', '228.00', NULL, 57, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(72, 11, 2, '19.00', 'hic-ea-voluptate-fugiat-voluptatibus-dolores-et-iure', '68.00', NULL, 68, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(73, 11, 4, '6.00', 'iusto-aperiam-inventore-sapiente-ab-neque', '184.00', NULL, 78, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(74, 11, 3, '29.00', 'neque-pariatur-et-asperiores-aperiam', '65.00', NULL, 61, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(75, 11, 3, '34.00', 'excepturi-maxime-tempore-ut-esse', '36.00', NULL, 68, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(76, 11, 1, '28.00', 'provident-molestiae-dolorem-et', '48.00', NULL, 11, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(77, 11, 2, '21.00', 'deserunt-iste-totam-non-qui-aut', '202.00', NULL, 12, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(78, 11, 3, '15.00', 'autem-facere-cupiditate-porro-autem-eum-aliquam-ut-ducimus', '175.00', NULL, 24, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(79, 11, 5, '13.00', 'et-minus-veniam-dignissimos-et', '204.00', NULL, 32, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(80, 11, 4, '26.00', 'mollitia-quae-sed-atque-repudiandae-exercitationem-est', '94.00', NULL, 25, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(81, 11, 4, '8.00', 'necessitatibus-reiciendis-impedit-magnam', '66.00', NULL, 4, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(82, 11, 4, '7.00', 'enim-eaque-aut-modi-quidem', '91.00', NULL, 63, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(83, 11, 3, '48.00', 'quo-pariatur-suscipit-velit-saepe-vero', '110.00', NULL, 76, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(84, 11, 2, '45.00', 'eum-consequatur-quia-repellat-sapiente-laborum-sint', '150.00', NULL, 66, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(85, 11, 1, '39.00', 'voluptate-velit-molestiae-qui-architecto-blanditiis-impedit-fuga-id', '99.00', NULL, 35, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(86, 11, 5, '46.00', 'repellendus-dolorum-tempore-consequatur-iste-eos-sit-commodi-quo', '185.00', NULL, 21, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(87, 11, 3, '43.00', 'exercitationem-explicabo-molestiae-repudiandae-est-sed-ut-qui', '119.00', NULL, 21, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(88, 11, 4, '34.00', 'omnis-delectus-in-eaque-amet-ea-nesciunt', '131.00', NULL, 29, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(89, 11, 1, '21.00', 'blanditiis-tenetur-dolore-tempore-blanditiis', '47.00', NULL, 5, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(90, 11, 4, '2.00', 'minus-praesentium-culpa-reiciendis-odio-nihil', '98.00', NULL, 90, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(91, 11, 4, '14.00', 'exercitationem-et-doloribus-placeat-et-nisi-quam-unde', '80.00', NULL, 18, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(92, 11, 5, '7.00', 'et-incidunt-consequatur-magnam-nihil-perferendis-tenetur', '90.00', NULL, 19, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(93, 11, 5, '14.00', 'veniam-ea-in-dicta-vero-similique-officiis-ratione', '169.00', NULL, 89, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(94, 11, 5, '45.00', 'perspiciatis-velit-ipsam-rerum-sit-amet', '187.00', NULL, 22, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(95, 11, 2, '14.00', 'voluptatum-voluptatem-aut-ut-dolor', '117.00', NULL, 64, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(96, 11, 2, '3.00', 'similique-vel-dolorem-repudiandae-autem-modi-explicabo-est-ut', '195.00', NULL, 54, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(97, 11, 4, '40.00', 'est-voluptatem-incidunt-sed-et-eligendi-error-in', '22.00', NULL, 95, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(98, 11, 3, '5.00', 'aspernatur-numquam-a-aliquid-laudantium-et-minima-nostrum', '103.00', NULL, 8, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(99, 11, 4, '48.00', 'error-soluta-et-enim-atque-illum', '52.00', NULL, 47, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(100, 11, 5, '36.00', 'dolor-eveniet-expedita-labore-qui', '228.00', NULL, 63, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(101, 11, 2, '13.00', 'qui-ea-ea-rerum-beatae-at', '91.00', NULL, 29, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL),
(102, 11, 5, '3.00', 'amet-ea-reprehenderit-eveniet', '210.00', NULL, 77, 0, 1, NULL, NULL, 'general', '2024-06-18 10:25:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `locale`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '', 'Et omnis eos aut cum repellat consequatur. Nihil blanditiis at error velit et. Eius officiis et est adipisci ut debitis quaerat.', 'A autem ex doloribus reprehenderit. Dolor nobis atque quibusdam ut temporibus expedita voluptates dolores.', NULL, NULL),
(2, 2, '', 'Rerum id autem molestias dolorem. Repellat illo temporibus nihil fugit incidunt vel ut.', 'Voluptates ad rerum qui optio rerum illo odit. Ut non iusto modi labore sint. Ipsum eum distinctio possimus magnam quisquam.', NULL, NULL),
(3, 3, '', 'Ad est qui accusamus quasi. Excepturi dolores ab aperiam placeat facilis odio. Deleniti eius et quis et maxime qui.', 'Recusandae dolores quos hic molestiae. Numquam enim odit et vel. Vero non explicabo nostrum accusantium. Neque maxime tempore aut nulla aut sint.', NULL, NULL),
(4, 4, '', 'Velit soluta aut quia voluptatem quia a. Veniam voluptatem id beatae eveniet officiis. Inventore ea sed sit aut ea veritatis totam et. Sunt sed maxime natus et.', 'Consequatur perspiciatis atque aut maxime et sunt dolores. Voluptas eius cum doloribus aut non. Quidem qui esse dolores suscipit et dolor. Nam mollitia iure placeat magnam.', NULL, NULL),
(5, 5, '', 'Aperiam magnam sint eos fugiat iste. Et aperiam magni impedit qui tempore rem nihil repudiandae. Qui nobis ut in qui. Doloremque quis eum autem et doloremque similique dolorum.', 'Omnis fuga harum eligendi neque aperiam error non sit. Similique veniam in vel amet. Vel est officiis illum ut praesentium aut.', NULL, NULL),
(6, 6, '', 'Aperiam est laborum perferendis aut aut. Culpa ratione reprehenderit nihil qui laudantium expedita. Ipsam praesentium molestiae ea repellat.', 'Atque eum quod unde quasi repudiandae est. Modi voluptate et ut doloribus. Et laborum esse dolorum molestias. Est ullam libero aut qui ad excepturi.', NULL, NULL),
(7, 7, '', 'Nihil corrupti omnis ipsa velit nostrum. Explicabo qui temporibus ea. Praesentium id sunt illo repellat iste eius. Totam vel ea et autem ut iste velit.', 'Voluptatem non quo voluptatibus voluptates voluptas similique est aut. Dolorum ut reiciendis et voluptatem. Voluptatem quas quibusdam ab quos ipsa debitis exercitationem.', NULL, NULL),
(8, 8, '', 'Dolore aut temporibus qui temporibus. Porro sed deserunt ut voluptas velit occaecati. Nihil autem eaque dolorem ea.', 'Quia voluptatem a accusantium quaerat. A quibusdam nihil error. Porro dolores natus ut nisi odit ipsa. Veniam animi dolores voluptas odit nam necessitatibus consectetur.', NULL, NULL),
(9, 9, '', 'Quasi sunt et amet consequatur repudiandae assumenda vero. Odit nobis harum alias voluptates porro temporibus. Alias quae laboriosam tenetur autem veniam necessitatibus unde.', 'Aut culpa corrupti saepe omnis at. Dicta nulla adipisci doloribus provident. A ea ipsum labore mollitia et.', NULL, NULL),
(10, 10, '', 'Ullam voluptas et minus animi. Et officiis nobis quam labore iste a rem. Debitis dolore magni odio distinctio. Saepe consectetur eius fuga enim eveniet.', 'Provident dolorem nam aut illo atque illo. Tenetur ducimus corporis ratione neque. Itaque pariatur assumenda repellendus et reprehenderit ipsa quae. Beatae rerum neque quia debitis eligendi corporis omnis.', NULL, NULL),
(11, 11, '', 'Vel ea culpa recusandae a. Veniam quo debitis in ut saepe quis. Accusamus ut distinctio enim aut sapiente eum. Exercitationem magni atque dolor et.', 'Dolor voluptas laboriosam sunt saepe omnis nostrum aperiam fugiat. Saepe porro aperiam minima numquam molestias iusto nihil. Non minima optio amet exercitationem voluptatibus. Autem iste eaque reprehenderit et voluptatem porro.', NULL, NULL),
(12, 12, '', 'Et enim ipsam velit sapiente qui consequatur nihil. Porro repellat qui et et molestiae impedit. Est ex iure officia provident autem. Asperiores sapiente magni et.', 'Occaecati dicta et et et minima quod ab. Incidunt praesentium aliquam sit impedit natus autem. Nisi quasi porro consequuntur quasi in esse. Earum voluptatum aliquid iusto esse est quidem.', NULL, NULL),
(13, 13, '', 'Ipsa rerum provident architecto laboriosam et et quaerat. Quo voluptatibus dignissimos eum ducimus amet perferendis hic fugit. Ea facilis beatae aliquid debitis id excepturi.', 'Consequatur qui ullam optio fugit magni dicta est. Adipisci eveniet quis aliquam ipsam quia vel debitis. Qui sed hic nulla quo asperiores rerum quia.', NULL, NULL),
(14, 14, '', 'At est quia est consectetur sed. Est sed ducimus natus. Dolorem deleniti enim tempore commodi.', 'Delectus vel voluptatem nam delectus ullam eum. Temporibus consequuntur soluta nesciunt est laboriosam. Et dolor aspernatur facere repellat consectetur qui.', NULL, NULL),
(15, 15, '', 'Ut odit dolorem minima mollitia voluptatibus. Qui repudiandae et consectetur quia. Aut totam animi laudantium et ut maiores ab. Et vero quaerat cumque sunt. Excepturi in ad dolore in.', 'Est dolores nihil ut tempora qui nemo voluptas distinctio. Tenetur numquam aut nihil aperiam qui deserunt non quia.', NULL, NULL),
(16, 16, '', 'Provident et aut explicabo quod. Ab rerum ut non quis. Aut magni et quo ut consequuntur odio.', 'Consectetur expedita est perferendis omnis velit. Quis qui consectetur pariatur eligendi. Itaque sit quo soluta doloribus. Nihil sit iusto sequi occaecati.', NULL, NULL),
(17, 17, '', 'Fugit incidunt laboriosam reiciendis. A perferendis nihil harum. Sint reiciendis animi earum facere. Est qui hic ipsum libero.', 'Nulla occaecati eligendi dolor dolorem aspernatur non rerum necessitatibus. Et quia sed laboriosam neque dolorum voluptas et voluptas. Delectus dolores exercitationem modi. Iste facilis quis voluptas doloremque.', NULL, NULL),
(18, 18, '', 'Voluptatem exercitationem perspiciatis quia voluptatem voluptates quo. Ipsam necessitatibus molestias esse consequatur. Necessitatibus quia ea ratione quasi quia ab inventore maxime.', 'Sit placeat qui facere vero quis amet alias. Rem sunt eveniet ipsa ut maxime iure doloribus. Sit itaque tempore voluptates et culpa natus.', NULL, NULL),
(19, 19, '', 'Est fuga ipsa praesentium nostrum. Quae magni dolores sint quo. Ut facere omnis aut dicta quis vel quidem placeat. Nihil aliquid quis deserunt.', 'In nulla vel id et aut ut molestias. Excepturi incidunt provident aut et fuga ipsum suscipit et.', NULL, NULL),
(20, 20, '', 'Est tenetur sed id eos aut qui. Laboriosam molestias consequatur quia ut cupiditate dolores ut. Ipsa modi quisquam impedit beatae non dolores. Ut iste dolorem id labore placeat omnis.', 'Est sint et nesciunt qui. Quas et architecto enim sequi nesciunt expedita sit assumenda. Qui sint ratione aut mollitia quia adipisci vero nulla. Laudantium molestiae iusto sit et rerum.', NULL, NULL),
(21, 21, '', 'Sapiente occaecati corporis distinctio et magnam cupiditate. Aut non dolorem ratione aut eligendi. Dolor nesciunt quaerat odio provident exercitationem sed.', 'Earum voluptas eius amet. Alias aut et voluptatum ut distinctio. Assumenda unde quos tempore et ad blanditiis. Adipisci ab natus quia et omnis aut.', NULL, NULL),
(22, 22, '', 'Et id distinctio nobis. Magnam dolorem provident iure illum nesciunt et nesciunt reprehenderit. Quis ut dicta suscipit voluptatem officia. Voluptatem quasi alias dolore deserunt.', 'Praesentium sit exercitationem inventore dolorum necessitatibus. Itaque consectetur laudantium et. Quia sit voluptatem enim dolorem quo vitae. Magni ut officia tempore praesentium id.', NULL, NULL),
(23, 23, '', 'Voluptatibus quaerat placeat excepturi ipsa sint. Quasi et occaecati est maxime qui. Voluptates ipsa perferendis voluptatem debitis.', 'Sed ullam autem eligendi qui tempore iusto natus. Ratione voluptatibus qui vel. Id perspiciatis delectus in ea numquam.', NULL, NULL),
(24, 24, '', 'Illum et atque ad. Nulla quia voluptatem saepe voluptatem repudiandae et molestiae sed. Vitae natus perspiciatis quisquam a voluptatibus animi.', 'Laborum eius eos consequatur ut. Ea qui ullam consectetur accusantium ex laboriosam. Animi nihil aut qui quidem et. Voluptatem fugit sunt voluptas maiores in quasi.', NULL, NULL),
(25, 25, '', 'Nihil eum qui quam aspernatur. Deserunt ipsa qui sapiente qui fuga laborum sapiente laboriosam. Aliquid ea aut nihil quaerat.', 'Commodi quaerat odit optio nobis eos et quia. Sit aut nisi itaque eveniet enim eveniet molestiae. Quos in eum nihil tenetur doloremque nam. Et incidunt est maiores eius sit a impedit harum.', NULL, NULL),
(26, 26, '', 'Ullam unde dignissimos soluta itaque dolor. Ipsa ut possimus quidem. Possimus quisquam deleniti architecto aliquid nihil accusantium voluptatem. Dolorem in rerum maxime at porro.', 'Quia autem ipsam rerum ipsa quia asperiores consequatur. Vitae eveniet ex sit itaque amet. Laborum inventore ut explicabo sequi dolores.', NULL, NULL),
(27, 27, '', 'Incidunt suscipit et autem exercitationem ullam. Excepturi totam voluptatem eum molestias sunt esse et. Accusantium quis nemo eos veritatis ipsa quia.', 'Distinctio ipsam aut minima neque impedit deserunt rem. Et perspiciatis rerum odit ad. Quibusdam itaque porro distinctio dolores autem perspiciatis illum. Sed deserunt nihil distinctio blanditiis ut autem. Sed dolorum quidem reiciendis nesciunt sed nulla aut quia.', NULL, NULL),
(28, 28, '', 'Similique est aliquam quis magni atque rerum. Eius sit repellat et consequatur hic voluptatem tempore. Quia illum ea sit aliquam.', 'Doloremque aperiam dignissimos dolorem facilis. Deleniti omnis ullam repellendus corporis voluptatibus. Ut sit sint est eveniet cum nam. Aut ea voluptatem aut earum cupiditate atque. Qui temporibus sed deleniti deserunt eum.', NULL, NULL),
(29, 29, '', 'Optio quos assumenda nisi saepe totam. Excepturi excepturi nemo molestiae. Totam est deleniti quia consectetur quas ullam.', 'Et eius vero ut nihil nisi voluptatem amet est. Molestias qui aspernatur inventore officiis cum voluptatem.', NULL, NULL),
(30, 30, '', 'Et ipsa itaque inventore cupiditate aut illo magnam. Sunt deleniti ab illo occaecati qui. Dignissimos rem ab adipisci ipsum animi. Qui soluta ut autem harum et. Voluptatem est saepe dicta eum', 'Earum ut non officia et sapiente minus. Sed debitis praesentium laudantium sit. Non quod perferendis dolores. Eligendi assumenda inventore sequi cumque vel.', NULL, NULL),
(31, 31, '', 'Modi alias commodi aut perspiciatis. Et deserunt dolores qui adipisci. Sit voluptas sunt consequatur ea iusto eligendi omnis dolores.', 'Voluptate vel asperiores culpa quod impedit quia molestiae sunt. Sint qui vero reiciendis. Et illum recusandae officia accusamus.', NULL, NULL),
(32, 32, '', 'Iure consectetur dolorem officiis eveniet et repudiandae. Voluptas quasi autem inventore necessitatibus. Ratione voluptatem est quam provident et.', 'Occaecati aliquid dolorem aperiam architecto. A dolor officiis omnis aliquid dignissimos qui. Autem ipsam quia architecto repellendus ratione soluta quo.', NULL, NULL),
(33, 33, '', 'Fugiat delectus voluptatibus earum officiis. Itaque quasi et adipisci maxime earum omnis ipsam. Quos recusandae voluptate molestiae deserunt voluptatibus.', 'Quis quo eum inventore nihil molestiae. Voluptates ipsa veniam corrupti veritatis eos exercitationem. Dolor quos autem ab iusto illum.', NULL, NULL),
(34, 34, '', 'Asperiores quod laboriosam corporis laudantium. Amet dolorem iusto voluptas. Quisquam aliquam fugiat ut aut atque.', 'Quia eum totam dolorem necessitatibus. Quia dolor eligendi est qui architecto. Sit non eos at debitis.', NULL, NULL),
(35, 35, '', 'Provident et beatae fugiat sapiente dolorem. Vel aspernatur doloribus ab quis accusantium eum enim sequi. Minima corporis enim accusamus.', 'Enim expedita minima asperiores id dolore. Officia aperiam quis ut esse quos reiciendis. Nemo et asperiores ex omnis repudiandae repudiandae rerum saepe.', NULL, NULL),
(36, 36, '', 'Necessitatibus odit culpa dignissimos rerum. Quisquam enim ducimus aspernatur voluptate dolores earum animi. Facilis est ut laborum odio. Et et magnam magni ipsa qui atque ut qui.', 'Fugit assumenda et et voluptate qui consectetur et. Alias quaerat quod provident voluptate est explicabo. Voluptate eum qui aperiam molestiae et magni. Aut rerum doloribus rerum omnis qui.', NULL, NULL),
(37, 37, '', 'Molestiae voluptates deserunt ullam consequatur. Officiis blanditiis molestiae et quo. Dolore aperiam facere perferendis quos doloremque quo quia. Nisi consectetur dolores quas itaque.', 'Eligendi voluptatem accusamus et magni laudantium ad. Ut inventore dolor recusandae architecto. Illo iste illum at quam et harum voluptatem. Non ea fuga et ratione vitae.', NULL, NULL),
(38, 38, '', 'Cupiditate non ratione mollitia excepturi natus. Officia et placeat sint. Sunt maxime est laudantium officiis. Illum eum et incidunt sed natus porro mollitia.', 'Ut nihil repudiandae dolores tempora. Occaecati eveniet itaque libero. Minus eos praesentium nulla itaque. Cupiditate et similique voluptates voluptatem in excepturi officiis.', NULL, NULL),
(39, 39, '', 'Officiis harum asperiores sunt reprehenderit. Vel nam ut dolores animi dicta consectetur dicta. Autem rerum dicta eveniet atque maiores dolores.', 'Sed facilis quibusdam quia itaque. Vel voluptate maiores ut aperiam omnis eaque. Cupiditate facere sit natus tenetur occaecati.', NULL, NULL),
(40, 40, '', 'Voluptatibus praesentium consequuntur nostrum voluptas. Velit sunt deleniti nam aut in ut. Et ducimus iste facilis quo et quaerat. Velit qui quia quis quasi.', 'Quia dolorem quia quam repudiandae dolorum. Hic impedit soluta necessitatibus provident deserunt. Earum laudantium quia aut omnis dolorem cum quaerat voluptatem. Rerum alias earum itaque nemo. Eos et necessitatibus impedit voluptas possimus et.', NULL, NULL),
(41, 41, '', 'Qui veniam eius fugiat nisi perferendis voluptatum reprehenderit. Fugiat omnis enim in deserunt eos aut dolorum. Voluptatibus ut sit in saepe. Molestias sint magnam quasi iusto libero dolorib', 'Laudantium vero quisquam enim molestiae in ex laborum. Blanditiis id ullam consectetur eius voluptas. Atque quod molestias labore qui omnis. Consequatur veniam voluptas vero molestias.', NULL, NULL),
(42, 42, '', 'Odit et qui a nihil. Et commodi velit et hic est enim omnis dicta. Quae velit et totam facilis molestiae id fugit. Doloribus quae voluptates qui repellat est voluptas veniam.', 'Quia aut quo et dolor debitis et est. Explicabo quia non enim ut aut est esse. Possimus ea omnis rerum sit quia ad quisquam quos. Enim eius itaque recusandae delectus harum.', NULL, NULL),
(43, 43, '', 'Quia non non vitae minus odit saepe. Et eos aut repellendus beatae velit non. Incidunt minus labore corporis at omnis a aut. A commodi recusandae molestiae fugiat.', 'Officia ut eos est numquam consequatur quos quia consequatur. Ipsa delectus soluta exercitationem eveniet reprehenderit ab rerum. Nobis aut unde voluptatem.', NULL, NULL),
(44, 44, '', 'A odit voluptate ullam magni. Dicta illum a quam dolore rem molestias. Qui odio quasi laborum laborum deleniti. Quod et aut nulla consequuntur.', 'Nam iste repellat est ipsa qui cumque. Et quidem non ut incidunt eum. Sint illo laboriosam deserunt animi placeat repellat.', NULL, NULL),
(45, 45, '', 'Quis cum itaque quasi ut esse. Vitae excepturi ducimus et sed eum cupiditate sed dolorem. Iste laboriosam alias atque aliquid possimus.', 'Laborum autem aut praesentium consequuntur. Voluptatem veritatis rerum delectus et. Repudiandae numquam ut blanditiis sunt sed.', NULL, NULL),
(46, 46, '', 'Tempore nisi quisquam velit minus reiciendis. Et accusamus dolorem cumque officia dolor nostrum sint aspernatur. Reprehenderit ipsa nulla perferendis est veritatis et sed.', 'Error numquam sit consequatur eaque distinctio quam nobis. Optio ad reprehenderit voluptatem quia. Voluptas sequi velit odio error architecto eveniet et. Aspernatur autem aliquam repudiandae consequatur.', NULL, NULL),
(47, 47, '', 'Unde ut maiores laborum et error aut. Aliquid aut quo unde quia repudiandae est porro eveniet. Officiis quas sint exercitationem placeat nihil omnis cupiditate.', 'Qui tempora minus aut doloremque nostrum. Earum vero cupiditate sit ab. Quos nisi dolores error quasi alias at.', NULL, NULL),
(48, 48, '', 'Pariatur nostrum velit et repellat eligendi dolorem enim. Eligendi aut mollitia hic consequatur laborum.', 'Fuga veniam odio similique magnam. Culpa voluptatem minus vel omnis. Assumenda voluptatum aut sunt est perspiciatis commodi et vero. Est et voluptatem qui exercitationem ea placeat vero neque.', NULL, NULL),
(49, 49, '', 'Cum est dicta eligendi ut. A blanditiis consequuntur maxime ut et ipsam. Facere dolor quasi ducimus qui ratione.', 'Veniam aliquam dolores sint qui aperiam. Doloribus veniam quidem aut et dolor et. Tempore expedita sit quibusdam sequi suscipit sit. Ab et sit est alias voluptates sapiente.', NULL, NULL),
(50, 50, '', 'Quae dolorum quaerat vel non voluptatem autem. Molestias voluptatum sit molestiae fugit nostrum blanditiis distinctio. Ab consectetur exercitationem delectus autem.', 'Nisi officia aut dolorem corrupti molestiae quis voluptatibus. Quasi ad magni autem. Et accusamus suscipit est deserunt ea fuga ipsam.', NULL, NULL),
(53, 53, '', 'Quia sit in amet. Et consequatur occaecati rem similique. Temporibus eum suscipit est consequuntur velit sint sunt omnis.', 'Recusandae sunt quidem consequuntur occaecati debitis sed. Ut minima sit est enim accusantium itaque. Reprehenderit dolore debitis ipsa at magnam qui hic. Qui dolores quia aperiam modi eius tempore. Quaerat consectetur corporis nemo.', NULL, NULL),
(54, 54, '', 'Consequuntur libero occaecati nostrum perferendis velit. Neque reprehenderit quis omnis sunt iste. Recusandae sint ipsum et fugiat maxime minus qui. Ut iure eius doloribus vitae.', 'Fuga dicta voluptas possimus eum ullam. Nam similique in accusantium velit qui.', NULL, NULL),
(55, 55, '', 'Quis eum sapiente in et ipsam molestias. Culpa et ut ipsam. Vitae quam id cum quis ut fugit.', 'Voluptate iusto voluptas molestiae nostrum reprehenderit sunt cum. Maxime ipsam aut libero excepturi nihil harum repudiandae. Deleniti alias ipsam soluta. Facilis non accusamus ut quod distinctio assumenda ullam.', NULL, NULL),
(56, 56, '', 'Ratione in suscipit omnis rerum maxime id. Provident reprehenderit dicta tenetur voluptate vel sit ratione. Enim velit non repellat perferendis ut officiis consequatur.', 'Placeat sunt enim molestiae voluptas odio. Voluptatem itaque ipsum iusto deleniti. Impedit quis qui quasi facilis. Blanditiis rerum veniam quo qui vel alias.', NULL, NULL),
(57, 57, '', 'Perferendis consequuntur doloremque numquam ut. Error similique deleniti accusamus saepe iusto soluta. Ea amet ut facilis suscipit voluptatum deserunt quia.', 'Magnam corporis sed repellendus laboriosam sint. Dolore nam alias aut laudantium debitis. Aut magnam amet nihil omnis voluptate atque. Accusamus recusandae ut id sapiente.', NULL, NULL),
(58, 58, '', 'Nobis sapiente eius nobis voluptas sed qui. Voluptatibus nihil sit voluptatem odio ut. Vitae dolor unde rerum.', 'Repellendus quis provident asperiores. Quos molestiae sapiente ullam unde.', NULL, NULL),
(59, 59, '', 'Eum hic ex quis aut nihil. Est corporis consequatur et nemo voluptates corporis ullam. Voluptatem expedita ea aut laboriosam. Sunt iure hic deserunt.', 'Dolores qui ea enim consequuntur quos aut. Officiis consequuntur nulla neque nam rerum quo. Qui eaque consequuntur fuga quasi et. Odio laboriosam aliquid sit aut in iste vel.', NULL, NULL),
(60, 60, '', 'Ad laboriosam ipsa ex culpa voluptates commodi ad. Quam sit eos provident rerum est non. Illum voluptatem itaque sed et distinctio praesentium voluptas ullam.', 'Autem porro cupiditate deleniti nobis aut. Corrupti quia nihil aperiam optio officiis maiores. Nihil sint quisquam ex. Omnis magnam optio numquam quisquam labore voluptatem.', NULL, NULL),
(61, 61, '', 'Optio aut explicabo soluta et est. Optio doloremque enim rem id. Et numquam quod velit porro illo voluptatem veritatis. Consequuntur ea fuga explicabo odit molestiae.', 'Accusantium pariatur pariatur officia possimus qui voluptatem non. Mollitia est qui voluptatem et deleniti.', NULL, NULL),
(62, 62, '', 'Et odio atque ut sunt in possimus. Quia est voluptatem ratione asperiores delectus. Laboriosam reprehenderit molestias consequuntur qui et necessitatibus.', 'Quos molestiae rerum dolores. Aliquid ad suscipit voluptatibus. Officiis dolorum facilis eum fugit sint. Cumque neque ad ut.', NULL, NULL),
(63, 63, '', 'Molestiae et exercitationem labore laborum. Quo et magni nobis voluptate dolores nulla autem. Molestiae dicta aliquam rerum quia rerum qui unde.', 'Dolor consequuntur assumenda dolor amet. Itaque et ut mollitia qui. Ut quae culpa exercitationem consequatur.', NULL, NULL),
(64, 64, '', 'Accusamus ut facere nostrum accusantium. Ea omnis quos veritatis qui voluptatem sit occaecati minus.', 'Quo dolorum cum voluptates culpa fuga et quibusdam. Enim rerum explicabo doloribus. Minima saepe officia earum et reiciendis.', NULL, NULL),
(65, 65, '', 'Qui facere aperiam totam eos id. Quod sequi vero necessitatibus voluptatibus reprehenderit provident. Impedit vel hic iusto ut est tempore. Consequatur maxime enim aut aut itaque ut.', 'Fugiat sit ut voluptatem ex qui autem modi quisquam. Est ut rerum et inventore ea. Et incidunt quis culpa ab consequatur sit ab.', NULL, NULL),
(66, 66, '', 'Exercitationem consequatur sit ipsam vitae tenetur molestias nesciunt. Et aperiam qui quos et. Suscipit autem et necessitatibus harum. Rem iure earum et sint.', 'Magnam voluptas molestiae laudantium id et autem dignissimos soluta. Qui ut sit non optio quisquam expedita. Iste dolor labore et excepturi.', NULL, NULL),
(67, 67, '', 'Et hic sit exercitationem. Corporis et recusandae et quis. Vel iusto praesentium quasi neque maiores atque fugit.', 'Ipsum vel id ut quia consequuntur sunt rerum quo. Reprehenderit doloremque repellendus possimus porro consequatur.', NULL, NULL),
(68, 68, '', 'Delectus id dignissimos vel porro illum enim maxime nobis. Id sunt est veniam. Ducimus aliquid praesentium quo dolor sed molestias voluptas.', 'Est exercitationem atque ea harum aliquam facere voluptatem. Facere in suscipit sunt. Reprehenderit voluptatem ut eum soluta velit. Et deleniti quo vel fugiat non.', NULL, NULL),
(69, 69, '', 'Repellendus inventore ut ad nesciunt sapiente fugiat. Et in porro temporibus velit expedita dolorem. Qui nobis dolores ex repellendus. Accusantium illo omnis eveniet suscipit.', 'Est quasi earum quisquam excepturi ut aspernatur. Aut molestiae nostrum sed aspernatur dolor saepe minima sequi.', NULL, NULL),
(70, 70, '', 'Et quia voluptate et sed impedit et qui. Ut molestiae doloremque vitae fugit. Distinctio sunt et magnam illum ut in magni.', 'Distinctio dolores illo tempore corrupti esse fugiat tempore libero. Quae nihil excepturi harum reiciendis vero. Ad illum magnam voluptatem vel repudiandae aliquid.', NULL, NULL),
(71, 71, '', 'Et quis qui expedita saepe. Impedit eos assumenda ut voluptatem dignissimos dolor vero. Eos deserunt sit alias hic sunt dolor adipisci. Maxime et aliquam facilis.', 'Nam voluptas a quis qui molestias. Voluptatibus ea doloremque est accusantium omnis accusantium. Ex molestiae minus velit quam rem ducimus soluta qui. Deleniti natus sit sapiente sed soluta atque iusto.', NULL, NULL),
(72, 72, '', 'Ut error laborum voluptatum modi harum et. Repellendus qui molestiae in laboriosam sit aut alias doloremque. Et non numquam ullam doloribus.', 'Quas eum ut aspernatur et et eligendi. Dignissimos tempora autem accusamus facilis non fugit. Dolores dicta vitae ipsum minima beatae dolorem. Rerum deserunt ad dolor deleniti dignissimos inventore est.', NULL, NULL),
(73, 73, '', 'Et ut quia saepe asperiores. Placeat dolores quae itaque odio quo aut quae. Voluptatem optio eum est modi recusandae nesciunt. Aut voluptates maxime dolorum voluptatem sit.', 'Enim aut laudantium alias. Culpa inventore eaque corrupti fuga. Eveniet velit porro voluptate et. Ducimus ut ducimus omnis dolor tempora alias sed molestiae. Eligendi illum magni sit quisquam optio aut hic quo.', NULL, NULL),
(74, 74, '', 'Qui possimus rem eos nulla non quia. Nihil totam eius accusamus adipisci porro occaecati excepturi. Atque rerum aut odio inventore. Adipisci veniam minima accusamus adipisci sed corporis.', 'Dolores nostrum ut autem nihil vitae necessitatibus qui ullam. Eveniet dolorem eius debitis in at incidunt nihil illum. Dolorum facilis voluptas ipsum qui.', NULL, NULL),
(75, 75, '', 'Cum esse id maiores harum ut libero. Qui magni error eos quisquam dignissimos porro ipsam est. Provident nihil ex iure delectus.', 'Laboriosam sunt dolores sequi vitae similique unde alias. Quae voluptas eos quia enim iste sint sunt asperiores. Labore quas reiciendis officiis aliquid vel quis quia.', NULL, NULL),
(76, 76, '', 'Ratione necessitatibus qui dolorum aliquid rerum sunt doloremque. Quasi hic quo id. Voluptas tempora nesciunt deserunt illo cupiditate cum.', 'Soluta sit et dolore voluptas hic tempore. Sunt quaerat rem illum libero vel occaecati velit. Minus recusandae maiores quia numquam qui recusandae. Ipsam magnam similique doloremque minima.', NULL, NULL),
(77, 77, '', 'Qui nulla veniam modi eos voluptatem neque. Sed quis doloribus distinctio sunt libero aut. Molestiae sit molestias dolor id totam voluptatibus et.', 'Voluptatem quasi quidem maxime hic. Iusto dolore odio ut non non eum harum. Ut deserunt et unde quo non et reprehenderit est. Excepturi eum ad voluptas nulla.', NULL, NULL),
(78, 78, '', 'Sapiente dolor laborum consequatur ad. Eius reprehenderit vel debitis non quia cumque occaecati.', 'Corrupti amet voluptatem incidunt magnam incidunt velit. Eum explicabo accusantium aut. Enim consectetur incidunt consequatur quia.', NULL, NULL),
(79, 79, '', 'Animi quod possimus quia reiciendis a. In explicabo aut perspiciatis sunt est. Corporis sunt aperiam voluptas nesciunt quos. Est sed temporibus placeat voluptatem.', 'Dolor quas voluptatibus aspernatur nisi eos eaque. Dignissimos perferendis quam sunt exercitationem rerum et. Inventore totam animi dolorem. Explicabo consequatur natus illum enim.', NULL, NULL),
(80, 80, '', 'Vel magnam voluptas dolore nobis. Doloremque et et quos quod. Magnam repudiandae maxime rerum consectetur.', 'Quaerat ullam eius nam et sed. Dolore laudantium voluptate quasi eaque delectus corrupti asperiores.', NULL, NULL),
(81, 81, '', 'Assumenda mollitia illum iusto fuga cupiditate eos. Ullam corrupti ut facilis sit ab. Repudiandae porro itaque qui.', 'Eum sed nisi excepturi deleniti. Vero facere fugit fugiat. Fuga consequatur ut rem rerum voluptas impedit.', NULL, NULL),
(82, 82, '', 'Pariatur necessitatibus voluptatem rerum repudiandae earum fugit. Odio quo enim necessitatibus rerum hic.', 'Quo praesentium consectetur dolor ut ipsam optio. Non non et nostrum autem consequatur quae. Sint voluptatum modi dolore in aspernatur et voluptatum nostrum. Laboriosam sit aliquam dicta veniam.', NULL, NULL),
(83, 83, '', 'In nostrum dolorum laudantium sunt enim debitis maxime. Voluptates laborum et eum eum. Error quibusdam odio consequatur reiciendis quia.', 'Quis dolor quisquam sequi repudiandae maxime ad. Quis ullam necessitatibus modi ratione. Esse adipisci consequatur sed similique quos dolore at. Id sint exercitationem optio optio incidunt eos quo facere.', NULL, NULL),
(84, 84, '', 'Eligendi veniam hic est. Necessitatibus tempore eveniet rerum occaecati corrupti perspiciatis. Id quia iusto ducimus nostrum enim ratione.', 'Est cumque doloribus deserunt repellat cupiditate. Nobis aut molestiae quo reprehenderit fuga dolores. Temporibus dolor quis ut hic tempore quia. Sequi sit eum quas fuga. Aut doloribus dolore et iure sit unde voluptatem.', NULL, NULL),
(85, 85, '', 'Qui eos sint omnis vel commodi ducimus vel. Iste aut quae non quos omnis praesentium. Commodi quia sapiente quos quidem magnam.', 'Enim earum autem libero dolorem eligendi quos amet cumque. Iste et fuga explicabo saepe blanditiis fugiat. Atque rem qui et animi necessitatibus illum possimus. Eius est dolorem dolores.', NULL, NULL),
(86, 86, '', 'Nobis cum dolores officiis. Mollitia dolorem sed voluptas recusandae. Autem sed sapiente eos est ipsum. Voluptates nisi quam soluta dolorem accusantium vel enim.', 'Ratione sit aliquid at eius commodi voluptates odit. Officia vitae excepturi quam debitis saepe sit quae.', NULL, NULL),
(87, 87, '', 'Et alias ea repellendus quaerat asperiores. Cupiditate velit et blanditiis ad eum. Rerum vel et rerum nulla non eaque.', 'Eligendi corrupti non aut culpa soluta voluptatem. Et quis tempora reiciendis sunt quasi consequatur qui.', NULL, NULL),
(88, 88, '', 'Sint impedit ut recusandae nobis cupiditate. A quaerat suscipit ipsum cum doloribus. Id maiores molestiae natus accusantium qui recusandae dignissimos. Molestiae qui magnam sunt rerum aut.', 'Magni dolores unde et aliquid quo reprehenderit. Fugit corporis quibusdam facere non ut. Aspernatur fuga illo dolores non nulla molestiae rerum. Nihil dolorem illum repellendus non vel adipisci voluptatem.', NULL, NULL),
(89, 89, '', 'Qui necessitatibus occaecati cupiditate totam earum debitis veritatis et. Id totam modi earum nesciunt temporibus ea ab qui. Qui laborum recusandae nesciunt perspiciatis.', 'Sit esse odit excepturi sint qui. Praesentium nihil dolor corrupti non est quo. Ullam impedit rerum porro et. Aut consequatur consequatur dolores veniam nam aut.', NULL, NULL),
(90, 90, '', 'Blanditiis necessitatibus veritatis pariatur veniam dicta similique. Beatae sunt quae numquam. Est eum aut quo.', 'Iure laudantium et atque. Neque quo ullam ut pariatur molestiae corrupti.', NULL, NULL),
(91, 91, '', 'Exercitationem nostrum ad itaque et ipsam magnam. Rem ut aspernatur ad adipisci. Cupiditate sit vero rerum ut soluta. Et voluptas quaerat officia nihil tenetur modi voluptatem possimus.', 'Eos quo voluptate velit sequi commodi dolor aut est. Quae dolor maxime et quibusdam debitis omnis est molestiae. Cumque voluptas minus temporibus perferendis sit numquam.', NULL, NULL),
(92, 92, '', 'Sunt facilis aut et aut ducimus inventore consequatur et. Quidem ea reprehenderit distinctio vitae sapiente. Aliquid eos unde sunt adipisci provident.', 'Quasi error voluptatem sunt ad aliquid voluptas. Unde vitae inventore eum esse sit sit voluptatem magni. Mollitia voluptatibus sapiente est minima dicta. Ratione facilis aut ipsa sit vero delectus.', NULL, NULL),
(93, 93, '', 'Accusantium aspernatur temporibus consequatur ut. Voluptatem ut ipsa ducimus reprehenderit ea quisquam dignissimos. Non cupiditate sint magnam veritatis.', 'Quisquam nostrum ea natus eos qui maxime temporibus. Voluptatibus nihil et vitae molestias voluptates explicabo minus reiciendis. Mollitia voluptas molestiae consequuntur sunt aut exercitationem repellendus blanditiis. Molestiae earum provident nesciunt soluta inventore mollitia quo. Voluptatem hic quaerat excepturi nesciunt eius.', NULL, NULL),
(94, 94, '', 'Eligendi culpa cumque eaque asperiores alias veritatis. Qui eveniet reprehenderit et voluptatem vitae odit.', 'Blanditiis iure inventore laborum quia aut officia. Nam dolorum ut doloremque labore et commodi. Aperiam eos rem voluptatem quaerat deserunt et.', NULL, NULL),
(95, 95, '', 'Tempora et illum est et labore possimus. Voluptas architecto sed vitae id sed. Aut suscipit non vitae et assumenda nostrum nihil. Quis occaecati rerum quia quia ipsam rerum quod quam.', 'Iusto rerum quo voluptatum porro atque debitis itaque. Dolores est repellendus non explicabo enim voluptas. Cum cupiditate voluptates ut quos sed quam rerum.', NULL, NULL),
(96, 96, '', 'Quis facere at blanditiis consequuntur non tempora rerum. Aliquid aut non sed rerum quia aut.', 'Dolor voluptatem saepe quia dolorem. Ut veritatis temporibus voluptas voluptatem sunt. Autem illum non voluptatem atque.', NULL, NULL),
(97, 97, '', 'Qui minus eum dolores quis non et. Maiores repudiandae excepturi ea voluptatum.', 'Qui rerum tempora id eligendi repellendus. Sequi aut odio et libero dignissimos est doloribus. Et non dicta animi porro. Quis qui dolor voluptatem beatae ex sit.', NULL, NULL),
(98, 98, '', 'Labore aut est nisi voluptas. Facilis error praesentium a sit. Accusantium aut eos rerum quis explicabo.', 'Et nesciunt vitae nostrum dolores et maiores est. Ipsa fugit earum nobis molestias sit.', NULL, NULL),
(99, 99, '', 'Repellat dicta dolore exercitationem inventore incidunt vero velit. Distinctio et facilis ea eum. Tempora autem ipsam possimus molestias natus ipsa magni.', 'Aliquid molestias voluptates facilis harum ut temporibus dicta. Suscipit eius eius voluptatem voluptatum voluptates. Et commodi officia accusamus velit laborum. Enim at sit dolore magni. Asperiores omnis aut velit ut distinctio quis.', NULL, NULL),
(100, 100, '', 'Enim enim et numquam ullam ipsum harum sit. Quia tenetur tempora voluptatem praesentium et cumque. Amet qui dolor voluptate autem. Molestias iste odit illum commodi repudiandae vero consequat', 'Est autem enim et ut delectus ut et. Ratione ipsa ratione ipsum est.', NULL, NULL),
(101, 101, '', 'Quis et unde aut eos placeat. Accusamus qui saepe in qui. Alias in amet voluptatem quis impedit veritatis. Commodi vero quia alias non veniam dolore commodi.', 'Expedita quia non incidunt ullam minima expedita. Minus dolorem ab ut deserunt odio. Iste illo qui aut voluptatem nihil.', NULL, NULL),
(102, 102, '', 'Aspernatur est minus quod dicta officia qui hic. Officia esse est consequuntur rerum vero assumenda qui. Quae distinctio reprehenderit et omnis quia saepe deserunt.', 'Sint maiores aperiam nihil. Sit aut at inventore a odit. Vero corporis alias hic id qui.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit_translations`
--

CREATE TABLE `unit_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `short_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `user_type` varchar(20) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `profile_picture` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `user_type`, `role_id`, `status`, `profile_picture`, `email_verified_at`, `password`, `provider`, `provider_id`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jhon Doe', 'admin@demo.com', NULL, 'admin', NULL, 1, 'default.png', '2024-06-18 07:03:41', '$2y$10$5StiF1PVVlJIAk681lH9luGVTkJu1DH18VdHmSi/msAaWcMXrtYNC', NULL, NULL, NULL, NULL, '2024-06-18 07:03:41', '2024-06-18 07:03:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_code_index` (`code`);

--
-- Indexes for table `coupon_categories`
--
ALTER TABLE `coupon_categories`
  ADD PRIMARY KEY (`coupon_id`,`category_id`),
  ADD KEY `coupon_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `coupon_products`
--
ALTER TABLE `coupon_products`
  ADD PRIMARY KEY (`coupon_id`,`product_id`),
  ADD KEY `coupon_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `coupon_translations`
--
ALTER TABLE `coupon_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_translations_coupon_id_locale_unique` (`coupon_id`,`locale`);

--
-- Indexes for table `database_backups`
--
ALTER TABLE `database_backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_products_order_id_foreign` (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_translations_product_id_locale_unique` (`product_id`,`locale`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_translations`
--
ALTER TABLE `unit_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unit_translations_unit_id_locale_unique` (`unit_id`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_translations`
--
ALTER TABLE `coupon_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `database_backups`
--
ALTER TABLE `database_backups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit_translations`
--
ALTER TABLE `unit_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_categories`
--
ALTER TABLE `coupon_categories`
  ADD CONSTRAINT `coupon_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_categories_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_products`
--
ALTER TABLE `coupon_products`
  ADD CONSTRAINT `coupon_products_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_translations`
--
ALTER TABLE `coupon_translations`
  ADD CONSTRAINT `coupon_translations_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `unit_translations`
--
ALTER TABLE `unit_translations`
  ADD CONSTRAINT `unit_translations_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
