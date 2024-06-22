-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2024 at 02:26 PM
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
-- Database: `mn_store_db`
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
(4, 'electronic', '<i class=\"icofont-screen\"></i>', '162211069760af71e9a0a6c.png', NULL, NULL, 1, '2021-05-24 06:50:15', '2021-07-15 09:25:06'),
(5, 'phones', '', '1718972667667570fbdd1ce.png', NULL, 4, 1, '2021-05-24 07:26:30', '2021-05-27 06:50:18'),
(6, 'beauty-health', '<i class=\"icofont-muscle-weight\"></i>', '162211077360af72357aa52.png', NULL, NULL, 1, '2021-05-25 11:38:12', '2021-07-15 09:24:21'),
(7, 'baby-care', '<i class=\"icofont-baby-food\"></i>', '162211081060af725a7788c.png', NULL, NULL, 1, '2021-05-25 11:57:59', '2021-07-15 09:23:28'),
(8, 'hygiene', '<i class=\"icofont-laboratory\"></i>', '162211084560af727d1fde5.png', NULL, NULL, 1, '2021-05-26 11:17:04', '2021-07-15 09:22:58'),
(9, 'home-cleaning', '<i class=\"icofont-water-bottle\"></i>', '162211088360af72a36252e.png', NULL, NULL, 1, '2021-05-26 11:29:41', '2021-07-15 09:21:23'),
(11, 'medicine', '<i class=\"icofont-medicine\"></i>', '162211092260af72cab9a9e.png', NULL, NULL, 1, '2021-05-26 13:04:29', '2021-07-15 09:13:52'),
(12, 'other-devices', '', '1718970528667568a07a3f7.png', NULL, 4, 1, '2021-05-27 06:05:24', '2021-05-27 06:50:53'),
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
(1, 4, 'English', 'Electronic', NULL, '2021-05-24 07:23:15', '2021-05-24 07:23:15'),
(2, 5, 'English', 'Phones', NULL, '2021-05-24 07:26:30', '2021-05-24 13:21:02'),
(3, 6, 'English', 'Beauty & Health', '', '2021-05-25 11:38:12', '2021-05-25 11:38:12'),
(4, 7, 'English', 'Baby Care', '', '2021-05-25 11:57:59', '2021-05-25 11:57:59'),
(5, 8, 'English', 'Hygiene', '', '2021-05-26 11:17:04', '2021-05-26 11:17:04'),
(6, 9, 'English', 'Home & Cleaning', '', '2021-05-26 11:29:41', '2021-05-26 11:29:41'),
(7, 11, 'English', 'Medicine', '', '2021-05-26 13:04:29', '2021-05-26 13:04:29'),
(8, 12, 'English', 'Other Devices', '', '2021-05-27 06:05:24', '2021-05-27 06:05:24'),
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

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `body`, `created_at`, `updated_at`) VALUES
(1, 'welcome_email', 'Welcome to Green Store', '<table role=\"presentation\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"padding: 20px 0 30px 0;\"><table style=\"border-collapse: collapse; border: 1px solid #cccccc;\" border=\"0\" width=\"600\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td style=\"padding: 40px 0 30px 0;\" align=\"center\" bgcolor=\"#1e1e2c\"><img style=\"display: block;\" src=\"https://ultrastore.trickycode.net/company-logo.png\" alt=\"Creating Email Magic.\" width=\"80\" height=\"80\"/></td></tr><tr><td style=\"padding: 40px 30px 40px 30px;\" bgcolor=\"#ffffff\"><table style=\"border-collapse: collapse; height: 95px; width: 100%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr style=\"height: 30px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; height: 30px;\"><h1 style=\"font-size: 24px; margin: 0;\">Welcome to Green Store</h1></td></tr><tr style=\"height: 47px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; font-size: 16px; line-height: 24px; padding: 20px 0px 30px; height: 47px;\"><p style=\"margin: 0;\">Hi {name},</p><p style=\"margin: 0;\">Your account is now ready to use. You can now login to your portal using your email and password.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank You</p><p style=\"margin: 0;\">Green Store</p></td></tr></tbody></table></td></tr><tr><td style=\"padding: 30px 30px;\" bgcolor=\"#1e1e2c\"><table style=\"border-collapse: collapse; width: 99.4769%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"color: #ffffff; font-family: Arial, sans-serif; font-size: 14px; width: 99.8141%;\"><p style=\"margin: 0px; text-align: center;\">&reg; Tricky Code 2021</p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>', NULL, NULL),
(2, 'order_placed', 'Your Order Placed Successfully', '<table role=\"presentation\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"padding: 20px 0 30px 0;\"><table style=\"border-collapse: collapse; border: 1px solid #cccccc;\" border=\"0\" width=\"600\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td style=\"padding: 40px 0 30px 0;\" align=\"center\" bgcolor=\"#1e1e2c\"><img style=\"display: block;\" src=\"https://ultrastore.trickycode.net/company-logo.png\" alt=\"Creating Email Magic.\" width=\"80\" height=\"80\"/></td></tr><tr><td style=\"padding: 40px 30px 40px 30px;\" bgcolor=\"#ffffff\"><table style=\"border-collapse: collapse; height: 95px; width: 100%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr style=\"height: 30px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; height: 30px;\"><h1 style=\"font-size: 24px; margin: 0;\">Your Order Placed Successfully</h1></td></tr><tr style=\"height: 47px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; font-size: 16px; line-height: 24px; padding: 20px 0px 30px; height: 47px;\"><p style=\"margin: 0;\">Hi {name},</p><p style=\"margin: 0;\">Your Order (Order ID:{order_id}) has been placed sucessfully. Your order will be shipped within next 3 business days.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Order ID:{order_id}</p><p style=\"margin: 0;\">Order Status:{delivery_status}</p><p style=\"margin: 0;\">Payment Status:{payment_status}</p><p style=\"margin: 0;\">Payment Method:{payment_method}</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank you for shopping with us.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank You</p><p style=\"margin: 0;\">Green Store</p></td></tr></tbody></table></td></tr><tr><td style=\"padding: 30px 30px;\" bgcolor=\"#1e1e2c\"><table style=\"border-collapse: collapse; width: 99.4769%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"color: #ffffff; font-family: Arial, sans-serif; font-size: 14px; width: 99.8141%;\"><p style=\"margin: 0px; text-align: center;\">&reg; Tricky Code 2021</p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>', NULL, NULL),
(3, 'order_processing', 'Your Order Marked as Processing', '<table role=\"presentation\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"padding: 20px 0 30px 0;\"><table style=\"border-collapse: collapse; border: 1px solid #cccccc;\" border=\"0\" width=\"600\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td style=\"padding: 40px 0 30px 0;\" align=\"center\" bgcolor=\"#1e1e2c\"><img style=\"display: block;\" src=\"https://ultrastore.trickycode.net/company-logo.png\" alt=\"Creating Email Magic.\" width=\"80\" height=\"80\"/></td></tr><tr><td style=\"padding: 40px 30px 40px 30px;\" bgcolor=\"#ffffff\"><table style=\"border-collapse: collapse; height: 95px; width: 100%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr style=\"height: 30px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; height: 30px;\"><h1 style=\"font-size: 24px; margin: 0;\">Your Order has been processed</h1></td></tr><tr style=\"height: 47px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; font-size: 16px; line-height: 24px; padding: 20px 0px 30px; height: 47px;\"><p style=\"margin: 0;\">Hi {name},</p><p style=\"margin: 0;\">Your Order (Order ID:{order_id}) has been processed.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Order ID:{order_id}</p><p style=\"margin: 0;\">Order Status:{delivery_status}</p><p style=\"margin: 0;\">Payment Status:{payment_status}</p><p style=\"margin: 0;\">Payment Method:{payment_method}</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank you for shopping with us.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank You</p><p style=\"margin: 0;\">Green Store</p></td></tr></tbody></table></td></tr><tr><td style=\"padding: 30px 30px;\" bgcolor=\"#1e1e2c\"><table style=\"border-collapse: collapse; width: 99.4769%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"color: #ffffff; font-family: Arial, sans-serif; font-size: 14px; width: 99.8141%;\"><p style=\"margin: 0px; text-align: center;\">&reg; Tricky Code 2021</p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>', NULL, NULL),
(4, 'order_completed', 'Your Order Marked as Completed', '<table role=\"presentation\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"padding: 20px 0 30px 0;\"><table style=\"border-collapse: collapse; border: 1px solid #cccccc;\" border=\"0\" width=\"600\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td style=\"padding: 40px 0 30px 0;\" align=\"center\" bgcolor=\"#1e1e2c\"><img style=\"display: block;\" src=\"https://ultrastore.trickycode.net/company-logo.png\" alt=\"Creating Email Magic.\" width=\"80\" height=\"80\"/></td></tr><tr><td style=\"padding: 40px 30px 40px 30px;\" bgcolor=\"#ffffff\"><table style=\"border-collapse: collapse; height: 95px; width: 100%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr style=\"height: 30px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; height: 30px;\"><h1 style=\"font-size: 24px; margin: 0;\">Your Order has Completed</h1></td></tr><tr style=\"height: 47px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; font-size: 16px; line-height: 24px; padding: 20px 0px 30px; height: 47px;\"><p style=\"margin: 0;\">Hi {name},</p><p style=\"margin: 0;\">Your Order (Order ID:{order_id}) has completed.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Order ID:{order_id}</p><p style=\"margin: 0;\">Order Status:{delivery_status}</p><p style=\"margin: 0;\">Payment Status:{payment_status}</p><p style=\"margin: 0;\">Payment Method:{payment_method}</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank you for shopping with us.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank You</p><p style=\"margin: 0;\">Green Store</p></td></tr></tbody></table></td></tr><tr><td style=\"padding: 30px 30px;\" bgcolor=\"#1e1e2c\"><table style=\"border-collapse: collapse; width: 99.4769%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"color: #ffffff; font-family: Arial, sans-serif; font-size: 14px; width: 99.8141%;\"><p style=\"margin: 0px; text-align: center;\">&reg; Tricky Code 2021</p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>', NULL, NULL),
(5, 'order_canceled', 'Your Order Marked as Canceled', '<table role=\"presentation\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"padding: 20px 0 30px 0;\"><table style=\"border-collapse: collapse; border: 1px solid #cccccc;\" border=\"0\" width=\"600\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td style=\"padding: 40px 0 30px 0;\" align=\"center\" bgcolor=\"#1e1e2c\"><img style=\"display: block;\" src=\"https://ultrastore.trickycode.net/company-logo.png\" alt=\"Creating Email Magic.\" width=\"80\" height=\"80\"/></td></tr><tr><td style=\"padding: 40px 30px 40px 30px;\" bgcolor=\"#ffffff\"><table style=\"border-collapse: collapse; height: 95px; width: 100%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr style=\"height: 30px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; height: 30px;\"><h1 style=\"font-size: 24px; margin: 0;\">Your Order has been canceled</h1></td></tr><tr style=\"height: 47px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; font-size: 16px; line-height: 24px; padding: 20px 0px 30px; height: 47px;\"><p style=\"margin: 0;\">Hi {name},</p><p style=\"margin: 0;\">Your Order (Order ID:{order_id}) has been canceled.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Order ID:{order_id}</p><p style=\"margin: 0;\">Order Status:{delivery_status}</p><p style=\"margin: 0;\">Payment Status:{payment_status}</p><p style=\"margin: 0;\">Payment Method:{payment_method}</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank you for shopping with us.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank You</p><p style=\"margin: 0;\">Green Store</p></td></tr></tbody></table></td></tr><tr><td style=\"padding: 30px 30px;\" bgcolor=\"#1e1e2c\"><table style=\"border-collapse: collapse; width: 99.4769%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"color: #ffffff; font-family: Arial, sans-serif; font-size: 14px; width: 99.8141%;\"><p style=\"margin: 0px; text-align: center;\">&reg; Tricky Code 2021</p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>', NULL, NULL),
(6, 'assign_delivery_boy', 'New order assign to you for delivery', '<table role=\"presentation\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"padding: 20px 0 30px 0;\"><table style=\"border-collapse: collapse; border: 1px solid #cccccc;\" border=\"0\" width=\"600\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr><td style=\"padding: 40px 0 30px 0;\" align=\"center\" bgcolor=\"#1e1e2c\"><img style=\"display: block;\" src=\"https://ultrastore.trickycode.net/company-logo.png\" alt=\"Creating Email Magic.\" width=\"80\" height=\"80\"/></td></tr><tr><td style=\"padding: 40px 30px 40px 30px;\" bgcolor=\"#ffffff\"><table style=\"border-collapse: collapse; height: 95px; width: 100%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr style=\"height: 30px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; height: 30px;\"><h1 style=\"font-size: 24px; margin: 0;\">New order assign to you for delivery</h1></td></tr><tr style=\"height: 47px;\"><td style=\"color: #153643; font-family: Arial, sans-serif; font-size: 16px; line-height: 24px; padding: 20px 0px 30px; height: 47px;\"><p style=\"margin: 0;\">Hi{name},</p><p style=\"margin: 0;\">New Order (Order ID:{order_id}) has been assigned to you for delivery.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Order ID:{order_id}</p><p style=\"margin: 0;\">Order Status:{delivery_status}</p><p style=\"margin: 0;\">Payment Status:{payment_status}</p><p style=\"margin: 0;\">Payment Method:{payment_method}</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank you for shopping with us.</p><p style=\"margin: 0;\">&nbsp;</p><p style=\"margin: 0;\">Thank You</p><p style=\"margin: 0;\">Green Store</p></td></tr></tbody></table></td></tr><tr><td style=\"padding: 30px 30px;\" bgcolor=\"#1e1e2c\"><table style=\"border-collapse: collapse; width: 99.4769%;\" border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td style=\"color: #ffffff; font-family: Arial, sans-serif; font-size: 14px; width: 99.8141%;\"><p style=\"margin: 0px; text-align: center;\">&reg; Tricky Code 2021</p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>', NULL, NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_12_152015_create_email_templates_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_09_01_080940_create_settings_table', 1),
(6, '2020_07_02_145857_create_database_backups_table', 1),
(7, '2020_07_06_142817_create_roles_table', 1),
(8, '2020_07_06_143240_create_permissions_table', 1),
(9, '2021_05_24_081012_create_categories_table', 1),
(10, '2021_05_24_082200_create_category_translations_table', 1),
(11, '2021_05_24_082301_create_units_table', 1),
(12, '2021_05_24_082302_create_unit_translations_table', 1),
(13, '2021_05_24_082501_create_products_table', 1),
(14, '2021_05_24_082502_create_product_translations_table', 1),
(15, '2021_05_24_152754_create_coupons_table', 1),
(16, '2021_05_24_152844_create_coupon_translations_table', 1),
(17, '2021_05_24_171317_create_coupon_products_table', 1),
(18, '2021_05_24_171318_create_coupon_categories_table', 1),
(19, '2021_06_01_172141_create_orders_table', 1),
(20, '2021_06_01_172303_create_order_products_table', 1),
(21, '2021_06_02_142034_create_transactions_table', 1),
(22, '2021_07_02_145504_create_pages_table', 1),
(23, '2021_07_02_145952_create_page_translations_table', 1),
(24, '2023_09_29_061603_add_banner_to_categories_table', 1);

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
(1, 12, 1, '1.00', 'sony-tv-55-inch', '199.99', '179.99', 1, 100, 1, 'electronic_category_product_1.jpg', 'https://example.com/images/banners/sony-tv-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(2, 12, 1, '1.00', 'samsung-smart-tv', '299.99', '269.99', 1, 150, 1, 'electronic_category_product_2.jpg', 'https://example.com/images/banners/samsung-tv-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(3, 12, 1, '1.00', 'lg-oled-tv', '399.99', '359.99', 1, 200, 1, 'electronic_category_product_3.jpg', 'https://example.com/images/banners/lg-tv-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(4, 12, 1, '1.00', 'bose-soundbar', '99.99', '89.99', 1, 250, 1, 'electronic_category_product_4.jpg', 'https://example.com/images/banners/bose-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(5, 12, 1, '1.00', 'jbl-speaker', '59.99', '49.99', 1, 300, 1, 'electronic_category_product_5.jpg', 'https://example.com/images/banners/jbl-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(6, 12, 1, '1.00', 'sony-headphones', '199.99', '179.99', 1, 100, 1, 'electronic_category_product_6.jpg', 'https://example.com/images/banners/sony-headphones-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(7, 12, 1, '1.00', 'apple-airpods', '299.99', '269.99', 1, 150, 1, 'electronic_category_product_7.jpg', 'https://example.com/images/banners/apple-airpods-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(8, 12, 1, '1.00', 'samsung-galaxy-watch', '399.99', '359.99', 1, 200, 1, 'electronic_category_product_8.webp', 'https://example.com/images/banners/samsung-watch-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(9, 12, 1, '1.00', 'fitbit-charge', '99.99', '89.99', 1, 250, 1, 'electronic_category_product_9.jpg', 'https://example.com/images/banners/fitbit-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(10, 12, 1, '1.00', 'garmin-gps', '59.99', '49.99', 1, 300, 1, 'electronic_category_product_10.webp', 'https://example.com/images/banners/garmin-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(11, 12, 1, '1.00', 'kindle-paperwhite', '199.99', '179.99', 1, 100, 1, 'electronic_category_product_11.jpg', 'https://example.com/images/banners/kindle-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(12, 12, 1, '1.00', 'amazon-echo', '299.99', '269.99', 1, 150, 1, 'electronic_category_product_12.jpg', 'https://example.com/images/banners/echo-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(13, 12, 1, '1.00', 'google-nest', '399.99', '359.99', 1, 200, 1, 'electronic_category_product_13.jpg', 'https://example.com/images/banners/nest-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(14, 12, 1, '1.00', 'roku-streaming-stick', '99.99', '89.99', 1, 250, 1, 'electronic_category_product_14.webp', 'https://example.com/images/banners/roku-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(15, 12, 1, '1.00', 'nvidia-shield', '59.99', '49.99', 1, 300, 1, 'electronic_category_product_15.jpg', 'https://example.com/images/banners/shield-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(16, 12, 1, '1.00', 'apple-tv', '199.99', '179.99', 1, 100, 1, 'electronic_category_product_16.jpg', 'https://example.com/images/banners/apple-tv-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(17, 12, 1, '1.00', 'chromecast', '299.99', '269.99', 1, 150, 1, 'electronic_category_product_17.webp', 'https://example.com/images/banners/chromecast-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(18, 12, 1, '1.00', 'ring-doorbell', '399.99', '359.99', 1, 200, 1, 'electronic_category_product_18.webp', 'https://example.com/images/banners/ring-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(19, 12, 1, '1.00', 'nest-thermostat', '99.99', '89.99', 1, 250, 1, 'electronic_category_product_19.jpg', 'https://example.com/images/banners/nest-thermostat-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(20, 12, 1, '1.00', 'hue-smart-lights', '59.99', '49.99', 1, 300, 1, 'electronic_category_product_20.jpg', 'https://example.com/images/banners/hue-lights-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(21, 5, 1, '1.00', 'iphone-13-pro', '999.99', '949.99', 1, 1000, 1, 'phones_category_product_21.jpg', 'https://example.com/images/banners/iphone-13-pro-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(22, 5, 1, '1.00', 'samsung-galaxy-s21', '799.99', '749.99', 1, 800, 1, 'phones_category_product_22.jpg', 'https://example.com/images/banners/samsung-galaxy-s21-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(23, 5, 1, '1.00', 'google-pixel-6', '699.99', '649.99', 1, 600, 1, 'phones_category_product_23.jpg', 'https://example.com/images/banners/google-pixel-6-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(24, 5, 1, '1.00', 'oneplus-9-pro', '899.99', '849.99', 1, 500, 1, 'phones_category_product_24.jpg', 'https://example.com/images/banners/oneplus-9-pro-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(25, 5, 1, '1.00', 'sony-xperia-1-iii', '1199.99', '1149.99', 1, 300, 1, 'phones_category_product_25.jpg', 'https://example.com/images/banners/sony-xperia-1-iii-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(26, 5, 1, '1.00', 'xiaomi-mi-11', '749.99', '699.99', 1, 700, 1, 'phones_category_product_26.jpg', 'https://example.com/images/banners/xiaomi-mi-11-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(27, 5, 1, '1.00', 'oppo-find-x3-pro', '1099.99', '1049.99', 1, 400, 1, 'phones_category_product_27.jpg', 'https://example.com/images/banners/oppo-find-x3-pro-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(28, 5, 1, '1.00', 'huawei-p40-pro', '999.99', '949.99', 1, 600, 1, 'phones_category_product_28.jpg', 'https://example.com/images/banners/huawei-p40-pro-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(29, 5, 1, '1.00', 'asus-rog-phone-5', '999.99', '949.99', 1, 700, 1, 'phones_category_product_29.jpg', 'https://example.com/images/banners/asus-rog-phone-5-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(30, 5, 1, '1.00', 'motorola-edge-plus', '899.99', '849.99', 1, 500, 1, 'phones_category_product_30.jpg', 'https://example.com/images/banners/motorola-edge-plus-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(31, 5, 1, '1.00', 'lg-wing', '999.99', '949.99', 1, 300, 1, 'phones_category_product_31.jpg', 'https://example.com/images/banners/lg-wing-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(32, 5, 1, '1.00', 'nokia-8.3-5g', '699.99', '649.99', 1, 600, 1, 'phones_category_product_32.jpg', 'https://example.com/images/banners/nokia-8.3-5g-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(33, 5, 1, '1.00', 'realme-gt', '599.99', '549.99', 1, 400, 1, 'phones_category_product_33.jpg', 'https://example.com/images/banners/realme-gt-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(34, 5, 1, '1.00', 'vivo-x60-pro', '799.99', '749.99', 1, 500, 1, 'phones_category_product_34.jpg', 'https://example.com/images/banners/vivo-x60-pro-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(35, 5, 1, '1.00', 'zte-axon-30-ultra', '899.99', '849.99', 1, 400, 1, 'phones_category_product_35.jpg', 'https://example.com/images/banners/zte-axon-30-ultra-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(36, 5, 1, '1.00', 'blackberry-key2', '649.99', '599.99', 1, 200, 1, 'phones_category_product_36.jpg', 'https://example.com/images/banners/blackberry-key2-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(37, 5, 1, '1.00', 'fairphone-3', '499.99', '449.99', 1, 100, 1, 'phones_category_product_37.jpg', 'https://example.com/images/banners/fairphone-3-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(38, 5, 1, '1.00', 'alcatel-3x', '299.99', '249.99', 1, 150, 1, 'phones_category_product_38.jpg', 'https://example.com/images/banners/alcatel-3x-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(39, 5, 1, '1.00', 'palm-phone', '349.99', '299.99', 1, 100, 1, 'phones_category_product_39.jpg', 'https://example.com/images/banners/palm-phone-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(40, 5, 1, '1.00', 'cat-s62-pro', '599.99', '549.99', 1, 200, 1, 'phones_category_product_40.jpg', 'https://example.com/images/banners/cat-s62-pro-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(41, 13, 1, '1.00', 'dove-soap', '4.99', '3.99', 1, 500, 1, 'health_care_category_product_41.jpg', 'https://example.com/images/banners/dove-soap-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(42, 13, 1, '1.00', 'neutrogena-shampoo', '7.99', '6.99', 1, 400, 1, 'health_care_category_product_42.jpg', 'https://example.com/images/banners/neutrogena-shampoo-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(43, 13, 1, '1.00', 'aveeno-body-lotion', '9.99', '8.99', 1, 300, 1, 'health_care_category_product_43.jpg', 'https://example.com/images/banners/aveeno-body-lotion-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(44, 13, 1, '1.00', 'cerave-moisturizing-cream', '14.99', '12.99', 1, 200, 1, 'health_care_category_product_44.jpg', 'https://example.com/images/banners/cerave-moisturizing-cream-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(45, 13, 1, '1.00', 'vaseline-lip-balm', '3.99', '2.99', 1, 150, 1, 'health_care_category_product_45.jpg', 'https://example.com/images/banners/vaseline-lip-balm-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(46, 13, 1, '1.00', 'head-and-shoulders-shampoo', '8.99', '7.99', 1, 300, 1, 'health_care_category_product_46.jpg', 'https://example.com/images/banners/head-and-shoulders-shampoo-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(47, 13, 1, '1.00', 'colgate-toothpaste', '2.99', '1.99', 1, 600, 1, 'health_care_category_product_47.jpg', 'https://example.com/images/banners/colgate-toothpaste-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(48, 13, 1, '1.00', 'olay-body-wash', '5.99', '4.99', 1, 250, 1, 'health_care_category_product_48.jpg', 'https://example.com/images/banners/olay-body-wash-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(49, 13, 1, '1.00', 'nivea-hand-cream', '6.99', '5.99', 1, 350, 1, 'health_care_category_product_49.jpg', 'https://example.com/images/banners/nivea-hand-cream-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(50, 13, 1, '1.00', 'gillette-shaving-cream', '4.99', '3.99', 1, 500, 1, 'health_care_category_product_50.jpg', 'https://example.com/images/banners/gillette-shaving-cream-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(51, 13, 1, '1.00', 'loreal-shampoo', '7.99', '6.99', 1, 300, 1, 'health_care_category_product_51.jpg', 'https://example.com/images/banners/loreal-shampoo-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(52, 13, 1, '1.00', 'dove-body-lotion', '8.99', '7.99', 1, 400, 1, 'health_care_category_product_52.jpg', 'https://example.com/images/banners/dove-body-lotion-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(53, 13, 1, '1.00', 'aveeno-face-moisturizer', '12.99', '10.99', 1, 250, 1, 'health_care_category_product_53.jpg', 'https://example.com/images/banners/aveeno-face-moisturizer-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(54, 13, 1, '1.00', 'old-spice-deodorant', '4.99', '3.99', 1, 300, 1, 'health_care_category_product_54.jpg', 'https://example.com/images/banners/old-spice-deodorant-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(55, 13, 1, '1.00', 'burt-bees-lip-balm', '3.99', '2.99', 1, 200, 1, 'health_care_category_product_55.jpg', 'https://example.com/images/banners/burt-bees-lip-balm-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(56, 13, 1, '1.00', 'cerave-facial-cleanser', '11.99', '9.99', 1, 400, 1, 'health_care_category_product_56.jpg', 'https://example.com/images/banners/cerave-facial-cleanser-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(57, 13, 1, '1.00', 'garnier-micellar-water', '8.99', '7.99', 1, 300, 1, 'health_care_category_product_57.jpg', 'https://example.com/images/banners/garnier-micellar-water-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(58, 13, 1, '1.00', 'neutrogena-body-wash', '7.99', '6.99', 1, 250, 1, 'health_care_category_product_58.jpg', 'https://example.com/images/banners/neutrogena-body-wash-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(59, 13, 1, '1.00', 'nivea-sunscreen', '9.99', '8.99', 1, 200, 1, 'health_care_category_product_59.jpg', 'https://example.com/images/banners/nivea-sunscreen-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(60, 13, 1, '1.00', 'johnson-baby-oil', '5.99', '4.99', 1, 150, 1, 'health_care_category_product_60.jpg', 'https://example.com/images/banners/johnson-baby-oil-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(61, 7, 1, '42.00', 'pampers-swaddlers-diapers', '24.99', '19.99', 1, 500, 1, 'baby_care_category_product_61.jpg', 'https://example.com/images/banners/pampers-swaddlers-diapers-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(62, 7, 1, '5.00', 'johnsons-baby-shampoo', '5.99', '4.99', 1, 400, 1, 'baby_care_category_product_62.jpg', 'https://example.com/images/banners/johnsons-baby-shampoo-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(63, 7, 1, '38.00', 'huggies-little-snugglers-diapers', '22.99', '18.99', 1, 300, 1, 'baby_care_category_product_63.jpg', 'https://example.com/images/banners/huggies-little-snugglers-diapers-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(64, 7, 1, '7.00', 'desitin-diaper-rash-cream', '8.99', '7.99', 1, 200, 1, 'baby_care_category_product_64.jpg', 'https://example.com/images/banners/desitin-diaper-rash-cream-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(65, 7, 1, '14.00', 'avent-baby-bottle', '9.99', '8.99', 1, 150, 1, 'baby_care_category_product_65.jpg', 'https://example.com/images/banners/avent-baby-bottle-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(66, 7, 1, '27.00', 'babyganics-foaming-hand-sanitizer', '6.99', '5.99', 1, 300, 1, 'baby_care_category_product_66.jpg', 'https://example.com/images/banners/babyganics-foaming-hand-sanitizer-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(67, 7, 1, '10.00', 'johnsons-baby-lotion', '4.99', '3.99', 1, 250, 1, 'baby_care_category_product_67.jpg', 'https://example.com/images/banners/johnsons-baby-lotion-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(68, 7, 1, '45.00', 'munchkin-diaper-pail', '49.99', '44.99', 1, 200, 1, 'baby_care_category_product_68.jpg', 'https://example.com/images/banners/munchkin-diaper-pail-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(69, 7, 1, '18.00', 'boudreauxs-butt-paste', '7.99', '6.99', 1, 150, 1, 'baby_care_category_product_69.jpg', 'https://example.com/images/banners/boudreauxs-butt-paste-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(70, 7, 1, '35.00', 'graco-pack-n-play', '89.99', '79.99', 1, 100, 1, 'baby_care_category_product_70.jpg', 'https://example.com/images/banners/graco-pack-n-play-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(71, 7, 1, '20.00', 'babybjorn-bouncer', '199.99', '179.99', 1, 200, 1, 'baby_care_category_product_71.jpg', 'https://example.com/images/banners/babybjorn-bouncer-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(72, 7, 1, '22.00', 'nuby-teething-toys', '14.99', '12.99', 1, 150, 1, 'baby_care_category_product_72.jpg', 'https://example.com/images/banners/nuby-teething-toys-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(73, 7, 1, '8.00', 'fisher-price-swing', '159.99', '139.99', 1, 100, 1, 'baby_care_category_product_73.jpg', 'https://example.com/images/banners/fisher-price-swing-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(74, 7, 1, '29.00', 'medela-breast-pump', '249.99', '229.99', 1, 80, 1, 'baby_care_category_product_74.jpg', 'https://example.com/images/banners/medela-breast-pump-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(75, 7, 1, '12.00', 'baby-carrier', '59.99', '49.99', 1, 200, 1, 'baby_care_category_product_75.jpg', 'https://example.com/images/banners/baby-carrier-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(76, 7, 1, '36.00', 'baby-wipes', '12.99', '10.99', 1, 400, 1, 'baby_care_category_product_76.jpg', 'https://example.com/images/banners/baby-wipes-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(77, 7, 1, '16.00', 'sophie-the-giraffe', '24.99', '19.99', 1, 300, 1, 'baby_care_category_product_77.jpg', 'https://example.com/images/banners/sophie-the-giraffe-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(78, 7, 1, '40.00', 'baby-blanket', '19.99', '16.99', 1, 200, 1, 'baby_care_category_product_78.jpg', 'https://example.com/images/banners/baby-blanket-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(79, 7, 1, '9.00', 'baby-monitor', '149.99', '129.99', 1, 150, 1, 'baby_care_category_product_79.jpg', 'https://example.com/images/banners/baby-monitor-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(80, 7, 1, '44.00', 'baby-food-maker', '79.99', '69.99', 1, 100, 1, 'baby_care_category_product_80.jpg', 'https://example.com/images/banners/baby-food-maker-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(81, 9, 1, '10.00', 'dyson-vacuum-cleaner', '399.99', '349.99', 1, 500, 1, 'home_cleaning_category_product_81.jpg', 'https://example.com/images/banners/dyson-vacuum-cleaner-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(82, 9, 1, '15.00', 'swiffer-wet-jet', '29.99', '24.99', 1, 400, 1, 'home_cleaning_category_product_82.jpg', 'https://example.com/images/banners/swiffer-wet-jet-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(83, 9, 1, '12.00', 'clorox-bleach', '5.99', '4.99', 1, 300, 1, 'home_cleaning_category_product_83.jpg', 'https://example.com/images/banners/clorox-bleach-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(84, 9, 1, '18.00', 'method-all-purpose-cleaner', '3.99', '2.99', 1, 200, 1, 'home_cleaning_category_product_84.jpg', 'https://example.com/images/banners/method-all-purpose-cleaner-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(85, 9, 1, '20.00', 'mrs-meyers-dish-soap', '4.99', '3.99', 1, 150, 1, 'home_cleaning_category_product_85.jpg', 'https://example.com/images/banners/mrs-meyers-dish-soap-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(86, 9, 1, '25.00', 'lysol-disinfecting-wipes', '8.99', '7.99', 1, 300, 1, 'home_cleaning_category_product_86.jpg', 'https://example.com/images/banners/lysol-disinfecting-wipes-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(87, 9, 1, '30.00', 'windex-glass-cleaner', '3.99', '2.99', 1, 250, 1, 'home_cleaning_category_product_87.jpg', 'https://example.com/images/banners/windex-glass-cleaner-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(88, 9, 1, '35.00', 'tide-laundry-detergent', '11.99', '10.99', 1, 400, 1, 'home_cleaning_category_product_88.jpg', 'https://example.com/images/banners/tide-laundry-detergent-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(89, 9, 1, '22.00', 'febreze-air-freshener', '5.99', '4.99', 1, 150, 1, 'home_cleaning_category_product_89.jpg', 'https://example.com/images/banners/febreze-air-freshener-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(90, 9, 1, '8.00', 'scotch-brite-scrub-sponge', '6.99', '5.99', 1, 500, 1, 'home_cleaning_category_product_90.jpg', 'https://example.com/images/banners/scotch-brite-scrub-sponge-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(91, 9, 1, '16.00', 'bissell-steam-mop', '79.99', '69.99', 1, 200, 1, 'home_cleaning_category_product_91.jpg', 'https://example.com/images/banners/bissell-steam-mop-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(92, 9, 1, '19.00', 'ajax-dish-soap', '2.99', '1.99', 1, 300, 1, 'home_cleaning_category_product_92.jpg', 'https://example.com/images/banners/ajax-dish-soap-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(93, 9, 1, '28.00', 'arm-and-hammer-baking-soda', '1.99', '1.49', 1, 400, 1, 'home_cleaning_category_product_93.jpg', 'https://example.com/images/banners/arm-and-hammer-baking-soda-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(94, 9, 1, '14.00', 'resolve-carpet-cleaner', '6.99', '5.99', 1, 250, 1, 'home_cleaning_category_product_94.jpg', 'https://example.com/images/banners/resolve-carpet-cleaner-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(95, 9, 1, '24.00', 'charmin-toilet-paper', '12.99', '11.99', 1, 500, 1, 'home_cleaning_category_product_95.jpg', 'https://example.com/images/banners/charmin-toilet-paper-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(96, 9, 1, '17.00', 'glade-candle', '4.99', '3.99', 1, 150, 1, 'home_cleaning_category_product_96.jpg', 'https://example.com/images/banners/glade-candle-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(97, 9, 1, '21.00', 'bounce-dryer-sheets', '9.99', '8.99', 1, 300, 1, 'home_cleaning_category_product_97.jpg', 'https://example.com/images/banners/bounce-dryer-sheets-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(98, 9, 1, '26.00', 'dawn-dish-soap', '2.99', '1.99', 1, 400, 1, 'home_cleaning_category_product_98.jpg', 'https://example.com/images/banners/dawn-dish-soap-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(99, 9, 1, '13.00', 'oxo-dustpan-and-brush', '12.99', '11.99', 1, 250, 1, 'home_cleaning_category_product_99.jpg', 'https://example.com/images/banners/oxo-dustpan-and-brush-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(100, 9, 1, '29.00', 'mop-and-bucket', '24.99', '22.99', 1, 300, 1, 'home_cleaning_category_product_100.jpg', 'https://example.com/images/banners/mop-and-bucket-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(101, 14, 1, '15.00', 'hp-laserjet-printer', '199.99', '179.99', 1, 400, 1, 'office_products_category_product_101.jpg', 'https://example.com/images/banners/hp-laserjet-printer-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(102, 14, 1, '10.00', 'dell-monitor', '149.99', '129.99', 1, 300, 1, 'office_products_category_product_102.jpg', 'https://example.com/images/banners/dell-monitor-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(103, 14, 1, '20.00', 'logitech-wireless-keyboard', '49.99', '39.99', 1, 500, 1, 'office_products_category_product_103.jpg', 'https://example.com/images/banners/logitech-wireless-keyboard-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(104, 14, 1, '25.00', 'brother-label-maker', '29.99', '24.99', 1, 200, 1, 'office_products_category_product_104.jpg', 'https://example.com/images/banners/brother-label-maker-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(105, 14, 1, '30.00', 'canon-ink-cartridges', '39.99', '34.99', 1, 400, 1, 'office_products_category_product_105.jpg', 'https://example.com/images/banners/canon-ink-cartridges-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(106, 14, 1, '18.00', 'staples-stapler', '9.99', '8.99', 1, 150, 1, 'office_products_category_product_106.jpg', 'https://example.com/images/banners/staples-stapler-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(107, 14, 1, '12.00', 'post-it-notes', '5.99', '4.99', 1, 300, 1, 'office_products_category_product_107.jpg', 'https://example.com/images/banners/post-it-notes-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(108, 14, 1, '15.00', 'paper-mate-pens', '7.99', '6.99', 1, 250, 1, 'office_products_category_product_108.jpg', 'https://example.com/images/banners/paper-mate-pens-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(109, 14, 1, '22.00', 'fellowes-paper-shredder', '79.99', '69.99', 1, 150, 1, 'office_products_category_product_109.jpg', 'https://example.com/images/banners/fellowes-paper-shredder-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(110, 14, 1, '28.00', '3m-scotch-tape', '3.99', '2.99', 1, 400, 1, 'office_products_category_product_110.jpg', 'https://example.com/images/banners/3m-scotch-tape-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(111, 14, 1, '35.00', 'swingline-hole-punch', '14.99', '12.99', 1, 100, 1, 'office_products_category_product_111.jpg', 'https://example.com/images/banners/swingline-hole-punch-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(112, 14, 1, '8.00', 'sharpie-markers', '9.99', '7.99', 1, 500, 1, 'office_products_category_product_112.jpg', 'https://example.com/images/banners/sharpie-markers-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(113, 14, 1, '10.00', 'legal-pad', '4.99', '3.99', 1, 200, 1, 'office_products_category_product_113.jpg', 'https://example.com/images/banners/legal-pad-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(114, 14, 1, '18.00', 'white-board', '24.99', '19.99', 1, 300, 1, 'office_products_category_product_114.jpg', 'https://example.com/images/banners/white-board-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(115, 14, 1, '22.00', 'desk-organizer', '19.99', '17.99', 1, 150, 1, 'office_products_category_product_115.jpg', 'https://example.com/images/banners/desk-organizer-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(116, 14, 1, '25.00', 'rolodex-business-card-holder', '12.99', '10.99', 1, 250, 1, 'office_products_category_product_116.jpg', 'https://example.com/images/banners/rolodex-business-card-holder-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(117, 14, 1, '30.00', 'hp-office-paper', '29.99', '24.99', 1, 400, 1, 'office_products_category_product_117.jpg', 'https://example.com/images/banners/hp-office-paper-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(118, 14, 1, '12.00', 'xerox-toner-cartridge', '89.99', '79.99', 1, 200, 1, 'office_products_category_product_118.jpg', 'https://example.com/images/banners/xerox-toner-cartridge-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(119, 14, 1, '18.00', 'binder-clips', '4.99', '3.99', 1, 300, 1, 'office_products_category_product_119.jpg', 'https://example.com/images/banners/binder-clips-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(120, 14, 1, '28.00', 'pencil-sharpener', '14.99', '12.99', 1, 400, 1, 'office_products_category_product_120.jpg', 'https://example.com/images/banners/pencil-sharpener-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(121, 15, 1, '1.00', 'kitchen-aid-mixer', '299.99', '279.99', 1, 500, 1, 'kitchen_appliances_category_product_121.jpg', 'https://example.com/images/banners/kitchen-aid-mixer-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(122, 15, 1, '1.00', 'ninja-blender', '99.99', '89.99', 1, 400, 1, 'kitchen_appliances_category_product_122.jpg', 'https://example.com/images/banners/ninja-blender-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(123, 15, 1, '1.00', 'instant-pot', '129.99', '119.99', 1, 300, 1, 'kitchen_appliances_category_product_123.jpg', 'https://example.com/images/banners/instant-pot-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(124, 15, 1, '1.00', 'keurig-coffee-maker', '89.99', '79.99', 1, 200, 1, 'kitchen_appliances_category_product_124.jpg', 'https://example.com/images/banners/keurig-coffee-maker-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(125, 15, 1, '1.00', 'breville-toaster-oven', '249.99', '229.99', 1, 150, 1, 'kitchen_appliances_category_product_125.jpg', 'https://example.com/images/banners/breville-toaster-oven-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(126, 15, 1, '1.00', 'cuisinart-food-processor', '159.99', '149.99', 1, 300, 1, 'kitchen_appliances_category_product_126.jpg', 'https://example.com/images/banners/cuisinart-food-processor-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(127, 15, 1, '1.00', 'philips-air-fryer', '179.99', '159.99', 1, 250, 1, 'kitchen_appliances_category_product_127.jpg', 'https://example.com/images/banners/philips-air-fryer-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(128, 15, 1, '1.00', 'vitamix-blender', '399.99', '379.99', 1, 200, 1, 'kitchen_appliances_category_product_128.jpg', 'https://example.com/images/banners/vitamix-blender-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(129, 15, 1, '1.00', 'hamilton-beach-slow-cooker', '49.99', '39.99', 1, 150, 1, 'kitchen_appliances_category_product_129.jpg', 'https://example.com/images/banners/hamilton-beach-slow-cooker-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(130, 15, 1, '1.00', 'black-and-decker-toaster', '29.99', '24.99', 1, 200, 1, 'kitchen_appliances_category_product_130.jpg', 'https://example.com/images/banners/black-and-decker-toaster-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(131, 15, 1, '1.00', 'george-foreman-grill', '39.99', '34.99', 1, 400, 1, 'kitchen_appliances_category_product_131.jpg', 'https://example.com/images/banners/george-foreman-grill-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(132, 15, 1, '1.00', 'oster-blender', '49.99', '44.99', 1, 250, 1, 'kitchen_appliances_category_product_132.jpg', 'https://example.com/images/banners/oster-blender-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(133, 15, 1, '1.00', 'smeg-kettle', '149.99', '139.99', 1, 150, 1, 'kitchen_appliances_category_product_133.jpg', 'https://example.com/images/banners/smeg-kettle-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(134, 15, 1, '1.00', 'nespresso-coffee-machine', '199.99', '189.99', 1, 300, 1, 'kitchen_appliances_category_product_134.jpg', 'https://example.com/images/banners/nespresso-coffee-machine-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(135, 15, 1, '1.00', 'keurig-mini', '79.99', '69.99', 1, 200, 1, 'kitchen_appliances_category_product_135.jpg', 'https://example.com/images/banners/keurig-mini-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(136, 15, 1, '1.00', 'panasonic-microwave', '119.99', '109.99', 1, 150, 1, 'kitchen_appliances_category_product_136.jpg', 'https://example.com/images/banners/panasonic-microwave-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(137, 15, 1, '1.00', 'crock-pot', '59.99', '49.99', 1, 300, 1, 'kitchen_appliances_category_product_137.jpg', 'https://example.com/images/banners/crock-pot-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(138, 15, 1, '1.00', 'whirlpool-refrigerator', '799.99', '749.99', 1, 100, 1, 'kitchen_appliances_category_product_138.jpg', 'https://example.com/images/banners/whirlpool-refrigerator-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(139, 15, 1, '1.00', 'lg-dishwasher', '699.99', '649.99', 1, 100, 1, 'kitchen_appliances_category_product_139.jpg', 'https://example.com/images/banners/lg-dishwasher-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(140, 15, 1, '1.00', 'samsung-oven', '1199.99', '1099.99', 1, 100, 1, 'kitchen_appliances_category_product_140.jpg', 'https://example.com/images/banners/samsung-oven-banner.jpg', 'general', '2024-06-21 05:00:00', '2024-06-21 05:00:00');

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
(1, 1, 'English', 'Sony TV 55 Inch', 'A 55-inch Sony television with 4K resolution.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(2, 2, 'English', 'Samsung Smart TV', 'A high-definition Samsung smart TV.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(3, 3, 'English', 'LG OLED TV', 'A stunning LG OLED TV with vibrant colors.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(4, 4, 'English', 'Bose Soundbar', 'Bose soundbar for immersive audio experience.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(5, 5, 'English', 'JBL Speaker', 'Portable JBL speaker with excellent sound quality.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(6, 6, 'English', 'Sony Headphones', 'Noise-cancelling Sony headphones.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(7, 7, 'English', 'Apple AirPods', 'Apple AirPods for a wireless audio experience.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(8, 8, 'English', 'Samsung Galaxy Watch', 'Samsung Galaxy Watch with fitness tracking.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(9, 9, 'English', 'Fitbit Charge', 'Fitbit Charge fitness tracker for active lifestyle.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(10, 10, 'English', 'Garmin GPS', 'Garmin GPS for accurate navigation.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(11, 11, 'English', 'Kindle Paperwhite', 'Kindle Paperwhite for easy reading.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(12, 12, 'English', 'Amazon Echo', 'Amazon Echo smart speaker with Alexa.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(13, 13, 'English', 'Google Nest', 'Google Nest smart home hub.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(14, 14, 'English', 'Roku Streaming Stick', 'Roku streaming stick for watching TV shows and movies.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(15, 15, 'English', 'Nvidia Shield', 'Nvidia Shield for gaming and streaming.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(16, 16, 'English', 'Apple TV', 'Apple TV for streaming content.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(17, 17, 'English', 'Chromecast', 'Google Chromecast for streaming media.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(18, 18, 'English', 'Ring Doorbell', 'Ring doorbell for home security.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(19, 19, 'English', 'Nest Thermostat', 'Nest thermostat for smart temperature control.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(20, 20, 'English', 'Hue Smart Lights', 'Hue smart lights for customizable lighting.', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(21, 21, 'English', 'iPhone 13 Pro', '<p>The <strong>iPhone 13 Pro</strong> features a stunning 6.1-inch Super Retina XDR display with ProMotion technology for smoother, more responsive performance. It is powered by the <em>A15 Bionic chip</em>, which delivers blazing-fast performance and efficient power consumption. The Pro camera system includes an ultra-wide, wide, and telephoto lens for capturing incredible photos and videos in any lighting condition.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(22, 22, 'English', 'Samsung Galaxy S21', '<p>The <strong>Samsung Galaxy S21</strong> features a 6.2-inch Dynamic AMOLED 2X display with a 120Hz refresh rate for smooth scrolling and gaming. It is powered by the <em>Exynos 2100 processor</em>, offering exceptional performance and power efficiency. The versatile camera setup includes a 12MP ultra-wide, 12MP wide, and 64MP telephoto lens for capturing stunning photos and 8K videos.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(23, 23, 'English', 'Google Pixel 6', '<p>The <strong>Google Pixel 6</strong> boasts a 6.4-inch AMOLED display with a 90Hz refresh rate, providing a smooth and immersive visual experience. It is powered by Google\'s custom <em>Tensor processor</em>, designed for optimal performance and machine learning capabilities. The advanced camera system includes a 50MP wide and 12MP ultra-wide lens, delivering exceptional photo and video quality.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(24, 24, 'English', 'OnePlus 9 Pro', '<p>The <strong>OnePlus 9 Pro</strong> features a 6.7-inch Fluid AMOLED display with a 120Hz refresh rate for ultra-smooth performance. It is equipped with the <em>Snapdragon 888 processor</em>, delivering top-tier performance and efficiency. The Hasselblad partnership camera system includes a 48MP wide, 50MP ultra-wide, and 8MP telephoto lens for professional-grade photography.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(25, 25, 'English', 'Sony Xperia 1 III', '<p>The <strong>Sony Xperia 1 III</strong> features a 6.5-inch 4K HDR OLED display, providing an unparalleled viewing experience. It is powered by the <em>Snapdragon 888 processor</em>, ensuring exceptional performance and speed. The triple camera system includes a 12MP wide, 12MP ultra-wide, and 12MP telephoto lens with ZEISS optics for stunning photos and videos.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(26, 26, 'English', 'Xiaomi Mi 11', '<p>The <strong>Xiaomi Mi 11</strong> features a 6.81-inch AMOLED display with a 120Hz refresh rate and HDR10+ support for vibrant visuals. It is powered by the <em>Snapdragon 888 processor</em>, offering top-of-the-line performance. The camera system includes a 108MP wide, 13MP ultra-wide, and 5MP macro lens, delivering impressive photo and video quality.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(27, 27, 'English', 'Oppo Find X3 Pro', '<p>The <strong>Oppo Find X3 Pro</strong> features a 6.7-inch AMOLED display with a 120Hz refresh rate for smooth and immersive visuals. It is equipped with the <em>Snapdragon 888 processor</em>, ensuring powerful performance and efficiency. The quad camera system includes a 50MP wide, 50MP ultra-wide, 13MP telephoto, and 3MP microlens for exceptional photography and videography.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(28, 28, 'English', 'Huawei P40 Pro', '<p>The <strong>Huawei P40 Pro</strong> features a 6.58-inch OLED display with a 90Hz refresh rate for smooth visuals. It is powered by the <em>Kirin 990 5G processor</em>, offering excellent performance and connectivity. The Leica quad camera system includes a 50MP wide, 12MP telephoto, 40MP ultra-wide, and TOF 3D lens for stunning photos and videos.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(29, 29, 'English', 'ASUS ROG Phone 5', '<p>The <strong>ASUS ROG Phone 5</strong> features a 6.78-inch AMOLED display with a 144Hz refresh rate, designed for gamers. It is powered by the <em>Snapdragon 888 processor</em>, delivering outstanding performance. The triple camera system includes a 64MP wide, 13MP ultra-wide, and 5MP macro lens, providing excellent photo and video quality.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(30, 30, 'English', 'Motorola Edge Plus', '<p>The <strong>Motorola Edge Plus</strong> features a 6.7-inch OLED display with a 90Hz refresh rate for smooth and vibrant visuals. It is powered by the <em>Snapdragon 865 processor</em>, offering excellent performance. The triple camera system includes a 108MP wide, 8MP telephoto, and 16MP ultra-wide lens, delivering high-quality photos and videos.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(31, 31, 'English', 'LG Wing', '<p>The <strong>LG Wing</strong> features a unique swivel design with a 6.8-inch P-OLED main display and a 3.9-inch G-OLED secondary display. It is powered by the <em>Snapdragon 765G processor</em>, providing good performance and efficiency. The triple camera system includes a 64MP wide, 13MP ultra-wide, and 12MP ultra-wide lens, offering versatile photography options.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(32, 32, 'English', 'Nokia 8.3 5G', '<p>The <strong>Nokia 8.3 5G</strong> features a 6.81-inch IPS LCD display with HDR10 support for vivid visuals. It is powered by the <em>Snapdragon 765G processor</em>, offering good performance and 5G connectivity. The quad camera system includes a 64MP wide, 12MP ultra-wide, 2MP macro, and 2MP depth lens for versatile photography.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(33, 33, 'English', 'Realme GT', '<p>The <strong>Realme GT</strong> features a 6.43-inch Super AMOLED display with a 120Hz refresh rate for smooth visuals. It is powered by the <em>Snapdragon 888 processor</em>, offering top-tier performance. The triple camera system includes a 64MP wide, 8MP ultra-wide, and 2MP macro lens, providing excellent photo and video quality.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(34, 34, 'English', 'Vivo X60 Pro', '<p>The <strong>Vivo X60 Pro</strong> features a 6.56-inch AMOLED display with a 120Hz refresh rate for smooth performance. It is powered by the <em>Snapdragon 870 processor</em>, offering excellent performance and efficiency. The triple camera system includes a 48MP wide, 13MP portrait, and 13MP ultra-wide lens, delivering high-quality photos and videos.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(35, 35, 'English', 'ZTE Axon 30 Ultra', '<p>The <strong>ZTE Axon 30 Ultra</strong> features a 6.67-inch AMOLED display with a 144Hz refresh rate for ultra-smooth visuals. It is powered by the <em>Snapdragon 888 processor</em>, delivering top-tier performance. The quad camera system includes a 64MP wide, 64MP standard, 64MP ultra-wide, and 8MP telephoto lens, providing exceptional photo and video quality.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(36, 36, 'English', 'BlackBerry KEY2', '<p>The <strong>BlackBerry KEY2</strong> features a 4.5-inch IPS LCD display and a physical QWERTY keyboard for tactile typing. It is powered by the <em>Snapdragon 660 processor</em>, offering solid performance and efficiency. The dual camera system includes a 12MP wide and 12MP telephoto lens, providing good photo and video quality.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(37, 37, 'English', 'Fairphone 3', '<p>The <strong>Fairphone 3</strong> features a 5.65-inch IPS LCD display with good resolution. It is powered by the <em>Snapdragon 632 processor</em>, offering decent performance and efficiency. The single camera system includes a 12MP wide lens, providing satisfactory photo and video quality. The phone is designed for sustainability and ease of repair.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(38, 38, 'English', 'Alcatel 3X', '<p>The <strong>Alcatel 3X</strong> features a 6.52-inch IPS LCD display with decent resolution. It is powered by the <em>Mediatek MT6762 processor</em>, offering acceptable performance. The triple camera system includes a 16MP wide, 8MP ultra-wide, and 5MP depth lens, providing good photo and video quality for its price range.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(39, 39, 'English', 'Palm Phone', '<p>The <strong>Palm Phone</strong> features a compact 3.3-inch IPS LCD display and is designed as a companion device to your main smartphone. It is powered by the <em>Snapdragon 435 processor</em>, offering basic performance. The single camera system includes a 12MP wide lens, providing decent photo and video quality in a small form factor.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(40, 40, 'English', 'CAT S62 Pro', '<p>The <strong>CAT S62 Pro</strong> features a 5.7-inch IPS LCD display with good resolution and rugged construction. It is powered by the <em>Snapdragon 660 processor</em>, offering solid performance and efficiency. The single camera system includes a 12MP wide lens with FLIR thermal imaging, providing unique capabilities for professionals in demanding environments.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(41, 41, 'English', 'Dove Soap', '<p>The <strong>Dove Soap</strong> is gentle on skin and helps retain moisture. Perfect for everyday use, it leaves your skin feeling clean and soft.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(42, 42, 'English', 'Neutrogena Shampoo', '<p>The <strong>Neutrogena Shampoo</strong> helps control dandruff and scalp conditions. Formulated with active ingredients, it provides a deep clean and leaves hair feeling refreshed.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(43, 43, 'English', 'Aveeno Body Lotion', '<p>The <strong>Aveeno Body Lotion</strong> provides intense hydration and helps soothe dry skin. Enriched with natural oatmeal, it leaves skin feeling soft and smooth.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(44, 44, 'English', 'CeraVe Moisturizing Cream', '<p>The <strong>CeraVe Moisturizing Cream</strong> provides 24-hour hydration and helps restore the protective skin barrier. Suitable for dry to very dry skin, it is formulated with ceramides and hyaluronic acid.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(45, 45, 'English', 'Vaseline Lip Balm', '<p>The <strong>Vaseline Lip Balm</strong> provides long-lasting moisture and helps heal dry, chapped lips. Formulated with petroleum jelly, it creates a protective barrier to lock in moisture.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(46, 46, 'English', 'Head & Shoulders Shampoo', '<p>The <strong>Head & Shoulders Shampoo</strong> helps fight dandruff and provides a deep clean. It is formulated with pyrithione zinc to help reduce flakes and leave hair feeling fresh.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(47, 47, 'English', 'Colgate Toothpaste', '<p>The <strong>Colgate Toothpaste</strong> provides cavity protection and helps strengthen enamel. Its minty flavor leaves your mouth feeling clean and fresh.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(48, 48, 'English', 'Olay Body Wash', '<p>The <strong>Olay Body Wash</strong> hydrates and nourishes skin, leaving it feeling soft and smooth. Its rich lather gently cleanses and refreshes.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(49, 49, 'English', 'Nivea Hand Cream', '<p>The <strong>Nivea Hand Cream</strong> provides intense moisture and helps repair dry, cracked hands. Its fast-absorbing formula leaves hands feeling soft and smooth.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(50, 50, 'English', 'Gillette Shaving Cream', '<p>The <strong>Gillette Shaving Cream</strong> provides a smooth shave and helps protect against irritation. Its rich lather softens hair and helps reduce friction for a comfortable shave.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(51, 51, 'English', 'L\'Oréal Shampoo', '<p>The <strong>L\'Oréal Shampoo</strong> helps repair and strengthen damaged hair. Its nourishing formula leaves hair feeling soft, shiny, and healthy.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(52, 52, 'English', 'Dove Body Lotion', '<p>The <strong>Dove Body Lotion</strong> provides deep moisture and helps soothe dry skin. Its lightweight formula absorbs quickly, leaving skin feeling soft and smooth.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(53, 53, 'English', 'Aveeno Face Moisturizer', '<p>The <strong>Aveeno Face Moisturizer</strong> provides hydration and helps even skin tone. Enriched with soy, it leaves skin looking radiant and healthy.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(54, 54, 'English', 'Old Spice Deodorant', '<p>The <strong>Old Spice Deodorant</strong> provides long-lasting odor protection and keeps you feeling fresh. Its refreshing scent helps combat sweat and body odor.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(55, 55, 'English', 'Burt\'s Bees Lip Balm', '<p>The <strong>Burt\'s Bees Lip Balm</strong> provides moisturizing relief for dry lips. Made with natural ingredients, it leaves lips feeling soft and hydrated.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(56, 56, 'English', 'CeraVe Facial Cleanser', '<p>The <strong>CeraVe Facial Cleanser</strong> gently cleanses and helps remove excess oil without disrupting the skin\'s protective barrier. Suitable for normal to oily skin, it leaves skin feeling clean and refreshed.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(57, 57, 'English', 'Garnier Micellar Water', '<p>The <strong>Garnier Micellar Water</strong> effectively removes makeup and cleanses skin without rinsing. Its gentle formula is suitable for all skin types, including sensitive skin.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(58, 58, 'English', 'Neutrogena Body Wash', '<p>The <strong>Neutrogena Body Wash</strong> helps cleanse and nourish skin. Formulated with rich lather and refreshing scent, it leaves skin feeling clean and rejuvenated.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(59, 59, 'English', 'Nivea Sunscreen', '<p>The <strong>Nivea Sunscreen</strong> provides broad-spectrum SPF 50 protection against harmful UV rays. Its lightweight, non-greasy formula absorbs quickly, leaving skin protected and moisturized.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(60, 60, 'English', 'Johnson\'s Baby Oil', '<p>The <strong>Johnson\'s Baby Oil</strong> locks in moisture and leaves skin feeling soft and smooth. It is ideal for baby massage and helps maintain healthy-looking skin.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(61, 61, 'English', 'Pampers Swaddlers Diapers', '<p>The <strong>Pampers Swaddlers Diapers</strong> provide comfort and protection for your baby. They feature a soft, stretchy waistband and a wetness indicator to let you know when it\'s time for a change.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(62, 62, 'English', 'Johnson\'s Baby Shampoo', '<p>The <strong>Johnson\'s Baby Shampoo</strong> is gentle on your baby\'s eyes and cleanses hair without drying. Its No More Tears® formula is as gentle to the eyes as pure water.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(63, 63, 'English', 'Huggies Little Snugglers Diapers', '<p>The <strong>Huggies Little Snugglers Diapers</strong> offer gentle skin protection with a soft, breathable outer cover and a snug fit waistband. Perfect for keeping your baby clean and comfortable.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(64, 64, 'English', 'Desitin Diaper Rash Cream', '<p>The <strong>Desitin Diaper Rash Cream</strong> helps treat and prevent diaper rash with a soothing formula. It provides overnight relief and protection for your baby\'s delicate skin.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(65, 65, 'English', 'Avent Baby Bottle', '<p>The <strong>Avent Baby Bottle</strong> features an anti-colic valve designed to reduce colic and discomfort by venting air away from your baby\'s tummy. Easy to clean and assemble.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(66, 66, 'English', 'Babyganics Foaming Hand Sanitizer', '<p>The <strong>Babyganics Foaming Hand Sanitizer</strong> is alcohol-free and kills 99.9% of germs. It is gentle enough for frequent use and leaves hands feeling soft and clean.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(67, 67, 'English', 'Johnson\'s Baby Lotion', '<p>The <strong>Johnson\'s Baby Lotion</strong> provides long-lasting moisture and helps protect your baby\'s delicate skin. It is clinically proven mild and gentle for daily use.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(68, 68, 'English', 'Munchkin Diaper Pail', '<p>The <strong>Munchkin Diaper Pail</strong> helps keep your nursery odor-free. It features a self-sealing system to lock in odors and a step pedal for easy, hands-free use.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(69, 69, 'English', 'Boudreaux\'s Butt Paste', '<p>The <strong>Boudreaux\'s Butt Paste</strong> provides fast relief for diaper rash with a thick, protective barrier. It is free from harsh ingredients and safe for daily use.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(70, 70, 'English', 'Graco Pack \'n Play', '<p>The <strong>Graco Pack \'n Play</strong> offers a convenient place for your baby to sleep and play. It features a removable bassinet and toy bar to keep your baby entertained.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(71, 71, 'English', 'BabyBjörn Bouncer', '<p>The <strong>BabyBjörn Bouncer</strong> provides ergonomic support for your baby\'s back, neck, and head. It features natural rocking motions to help soothe and entertain your baby.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(72, 72, 'English', 'Nuby Teething Toys', '<p>The <strong>Nuby Teething Toys</strong> are designed to soothe and stimulate sore gums. They are made from soft, BPA-free materials and are easy for little hands to hold.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(73, 73, 'English', 'Fisher-Price Swing', '<p>The <strong>Fisher-Price Swing</strong> features multiple swing speeds, soothing vibrations, and nature sounds to help calm and comfort your baby. It is designed with a plush seat and secure harness for safety.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(74, 74, 'English', 'Medela Breast Pump', '<p>The <strong>Medela Breast Pump</strong> offers a comfortable and efficient way to pump breast milk. It features adjustable settings and a portable design for easy use at home or on the go.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(75, 75, 'English', 'Baby Carrier', '<p>The <strong>Baby Carrier</strong> provides hands-free convenience while keeping your baby close. It features adjustable straps and ergonomic support for both parent and baby.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(76, 76, 'English', 'Baby Wipes', '<p>The <strong>Baby Wipes</strong> are gentle on your baby\'s skin and help keep them clean and fresh. They are hypoallergenic and free from harsh chemicals, making them safe for daily use.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(77, 77, 'English', 'Sophie the Giraffe', '<p>The <strong>Sophie the Giraffe</strong> is a classic teething toy made from natural rubber. It is designed to soothe your baby\'s sore gums and stimulate their senses with its soft texture and gentle squeak.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(78, 78, 'English', 'Baby Blanket', '<p>The <strong>Baby Blanket</strong> is soft, warm, and perfect for keeping your baby cozy. It is made from hypoallergenic materials and is machine washable for easy care.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(79, 79, 'English', 'Baby Monitor', '<p>The <strong>Baby Monitor</strong> provides peace of mind by allowing you to keep an eye on your baby from anywhere in the house. It features a high-definition camera and two-way audio for clear communication.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(80, 80, 'English', 'Baby Food Maker', '<p>The <strong>Baby Food Maker</strong> makes it easy to prepare healthy, homemade baby food. It features a steam and blend function, allowing you to cook and puree fruits, vegetables, and more.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(81, 81, 'English', 'Dyson Vacuum Cleaner', '<p>The <strong>Dyson Vacuum Cleaner</strong> offers powerful suction and advanced filtration to keep your home clean. Its lightweight design and versatile attachments make it easy to use on all floor types.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(82, 82, 'English', 'Swiffer Wet Jet', '<p>The <strong>Swiffer Wet Jet</strong> provides an all-in-one mopping system for quick and effective cleaning. It includes a dual-nozzle sprayer and pre-mixed cleaning solution to dissolve and lock away dirt.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(83, 83, 'English', 'Clorox Bleach', '<p>The <strong>Clorox Bleach</strong> disinfects and deodorizes surfaces throughout your home. It kills 99.9% of germs and bacteria, leaving your home clean and fresh.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(84, 84, 'English', 'Method All-Purpose Cleaner', '<p>The <strong>Method All-Purpose Cleaner</strong> is made with plant-based ingredients and cleans with the power of nature. It leaves surfaces sparkling clean and has a pleasant, fresh scent.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(85, 85, 'English', 'Mrs. Meyer\'s Dish Soap', '<p>The <strong>Mrs. Meyer\'s Dish Soap</strong> is tough on grease but gentle on your hands. Made with natural ingredients, it leaves dishes sparkling clean and has a lovely aroma.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(86, 86, 'English', 'Lysol Disinfecting Wipes', '<p>The <strong>Lysol Disinfecting Wipes</strong> kill 99.9% of viruses and bacteria on contact. Perfect for quick clean-ups, they leave a fresh, clean scent and ensure a hygienic home.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(87, 87, 'English', 'Windex Glass Cleaner', '<p>The <strong>Windex Glass Cleaner</strong> provides a streak-free shine on windows and mirrors. Its ammonia-free formula cuts through grease and grime, leaving surfaces spotless.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(88, 88, 'English', 'Tide Laundry Detergent', '<p>The <strong>Tide Laundry Detergent</strong> delivers a powerful clean that fights tough stains and leaves clothes smelling fresh. Its formula is safe for all washing machines and water temperatures.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(89, 89, 'English', 'Febreze Air Freshener', '<p>The <strong>Febreze Air Freshener</strong> eliminates odors and freshens the air with a light, pleasant scent. It is perfect for any room in your home.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(90, 90, 'English', 'Scotch-Brite Scrub Sponge', '<p>The <strong>Scotch-Brite Scrub Sponge</strong> is perfect for tackling tough, stuck-on messes. Its durable construction makes it ideal for cleaning pots, pans, and kitchen surfaces.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(91, 91, 'English', 'Bissell Steam Mop', '<p>The <strong>Bissell Steam Mop</strong> uses the power of steam to sanitize and clean hard floors. It eliminates 99.9% of germs and bacteria without harsh chemicals.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(92, 92, 'English', 'Ajax Dish Soap', '<p>The <strong>Ajax Dish Soap</strong> cuts through grease and leaves dishes sparkling clean. Its fresh lemon scent makes dishwashing a more pleasant task.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(93, 93, 'English', 'Arm & Hammer Baking Soda', '<p>The <strong>Arm & Hammer Baking Soda</strong> is a versatile household staple. It can be used for cleaning, deodorizing, and baking, providing great value for your home.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(94, 94, 'English', 'Resolve Carpet Cleaner', '<p>The <strong>Resolve Carpet Cleaner</strong> effectively removes stains and odors from carpets and upholstery. Its deep-cleaning formula penetrates fibers to lift dirt and grime.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(95, 95, 'English', 'Charmin Toilet Paper', '<p>The <strong>Charmin Toilet Paper</strong> offers superior softness and strength for a comfortable clean. It is septic-safe and gentle on plumbing.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(96, 96, 'English', 'Glade Candle', '<p>The <strong>Glade Candle</strong> provides a warm, inviting fragrance that enhances any room. Its long-lasting scent creates a relaxing atmosphere in your home.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(97, 97, 'English', 'Bounce Dryer Sheets', '<p>The <strong>Bounce Dryer Sheets</strong> help reduce static cling and leave your clothes feeling soft and smelling fresh. They also help repel lint and hair.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(98, 98, 'English', 'Dawn Dish Soap', '<p>The <strong>Dawn Dish Soap</strong> is tough on grease but gentle on your hands. It provides a powerful clean that leaves dishes sparkling.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(99, 99, 'English', 'OXO Dustpan and Brush', '<p>The <strong>OXO Dustpan and Brush</strong> set is designed for easy, efficient cleaning. The brush snaps into the dustpan for convenient storage, and the soft, flexible lip conforms to surfaces for better dirt pickup.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(100, 100, 'English', 'Mop and Bucket', '<p>The <strong>Mop and Bucket</strong> set includes a durable mop and a bucket with a wringer for easy cleaning. It is perfect for mopping floors and keeping your home spotless.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(101, 101, 'English', 'HP LaserJet Printer', '<p>The <strong>HP LaserJet Printer</strong> delivers high-quality prints at fast speeds. It is perfect for both home and office use, offering wireless connectivity and easy setup.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(102, 102, 'English', 'Dell Monitor', '<p>The <strong>Dell Monitor</strong> features a sleek design and vibrant display. It is perfect for both work and entertainment, providing sharp, clear images and a wide viewing angle.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(103, 103, 'English', 'Logitech Wireless Keyboard', '<p>The <strong>Logitech Wireless Keyboard</strong> offers comfortable typing and reliable wireless connectivity. Its compact design and long battery life make it ideal for any workspace.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(104, 104, 'English', 'Brother Label Maker', '<p>The <strong>Brother Label Maker</strong> is easy to use and perfect for organizing your office. It features a wide variety of fonts and symbols to create professional labels for any purpose.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(105, 105, 'English', 'Canon Ink Cartridges', '<p>The <strong>Canon Ink Cartridges</strong> provide high-quality prints with vibrant colors. Compatible with a variety of Canon printers, they ensure reliable performance and long-lasting results.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(106, 106, 'English', 'Staples Stapler', '<p>The <strong>Staples Stapler</strong> is durable and easy to use, making it perfect for any office. It can staple up to 20 sheets of paper at once and features a comfortable grip for effortless stapling.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(107, 107, 'English', 'Post-it Notes', '<p>The <strong>Post-it Notes</strong> are perfect for jotting down quick reminders and messages. They stick securely and remove cleanly, making them ideal for use at home or in the office.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(108, 108, 'English', 'Paper Mate Pens', '<p>The <strong>Paper Mate Pens</strong> provide smooth, consistent writing. They feature a comfortable grip and are perfect for everyday writing tasks in the office or at home.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(109, 109, 'English', 'Fellowes Paper Shredder', '<p>The <strong>Fellowes Paper Shredder</strong> offers secure document destruction with cross-cut technology. It can shred up to 10 sheets at a time and includes a safety lock for added protection.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(110, 110, 'English', '3M Scotch Tape', '<p>The <strong>3M Scotch Tape</strong> is perfect for sealing envelopes and wrapping packages. It provides a strong, secure hold and is easy to use with any standard tape dispenser.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(111, 111, 'English', 'Swingline Hole Punch', '<p>The <strong>Swingline Hole Punch</strong> makes it easy to punch clean, precise holes in paper. It features a durable metal construction and a comfortable grip for effortless use.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(112, 112, 'English', 'Sharpie Markers', '<p>The <strong>Sharpie Markers</strong> provide bold, permanent ink that dries quickly and resists fading. They are perfect for labeling, drawing, and other creative projects.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(113, 113, 'English', 'Legal Pad', '<p>The <strong>Legal Pad</strong> is perfect for taking notes and making lists. It features wide-ruled lines and a sturdy backing, making it ideal for use in the office or at home.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(114, 114, 'English', 'White Board', '<p>The <strong>White Board</strong> is perfect for brainstorming sessions and presentations. It features a smooth, durable surface that is easy to write on and erase.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(115, 115, 'English', 'Desk Organizer', '<p>The <strong>Desk Organizer</strong> helps keep your workspace tidy and clutter-free. It features multiple compartments for storing pens, paper, and other office supplies.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(116, 116, 'English', 'Rolodex Business Card Holder', '<p>The <strong>Rolodex Business Card Holder</strong> keeps your contacts organized and easily accessible. It features a durable design and can hold up to 400 business cards.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(117, 117, 'English', 'HP Office Paper', '<p>The <strong>HP Office Paper</strong> provides high-quality prints with a bright, professional finish. It is compatible with all printers and perfect for any office environment.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(118, 118, 'English', 'Xerox Toner Cartridge', '<p>The <strong>Xerox Toner Cartridge</strong> delivers reliable, high-quality prints. It is designed for use with Xerox printers and ensures long-lasting performance and vibrant colors.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(119, 119, 'English', 'Binder Clips', '<p>The <strong>Binder Clips</strong> provide a secure hold for documents and papers. They are perfect for organizing reports, presentations, and other office materials.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(120, 120, 'English', 'Pencil Sharpener', '<p>The <strong>Pencil Sharpener</strong> provides quick, precise sharpening for pencils. It features a durable design and is perfect for use in the office or at home.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(121, 121, 'English', 'Kitchen Aid Mixer', '<p>The <strong>Kitchen Aid Mixer</strong> offers versatile functionality with multiple attachments for mixing, kneading, and whipping. Its powerful motor and durable construction ensure reliable performance for all your baking needs.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(122, 122, 'English', 'Ninja Blender', '<p>The <strong>Ninja Blender</strong> features a high-powered motor and durable blades for blending, crushing, and pureeing. Perfect for smoothies, soups, and frozen drinks, it delivers professional results every time.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(123, 123, 'English', 'Instant Pot', '<p>The <strong>Instant Pot</strong> is a versatile multi-cooker that combines a pressure cooker, slow cooker, rice cooker, steamer, sauté pan, and more. Its programmable settings make it easy to prepare a variety of meals quickly and conveniently.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(124, 124, 'English', 'Keurig Coffee Maker', '<p>The <strong>Keurig Coffee Maker</strong> brews a perfect cup of coffee, tea, or hot chocolate in minutes. Its single-serve design is compatible with K-Cup pods, offering a wide variety of beverage options.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(125, 125, 'English', 'Breville Toaster Oven', '<p>The <strong>Breville Toaster Oven</strong> features advanced heating technology and multiple cooking functions, including baking, broiling, toasting, and more. Its spacious interior and easy-to-use controls make it a versatile addition to any kitchen.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(126, 126, 'English', 'Cuisinart Food Processor', '<p>The <strong>Cuisinart Food Processor</strong> makes food prep easy with its powerful motor and sharp blades. It is perfect for chopping, slicing, and shredding a variety of ingredients quickly and efficiently.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(127, 127, 'English', 'Philips Air Fryer', '<p>The <strong>Philips Air Fryer</strong> uses hot air to fry foods with little to no oil, offering a healthier alternative to traditional frying. It features a spacious basket and adjustable temperature control for perfect results every time.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(128, 128, 'English', 'Vitamix Blender', '<p>The <strong>Vitamix Blender</strong> delivers exceptional blending performance with its powerful motor and durable blades. It is perfect for making smoothies, soups, sauces, and more, ensuring smooth and consistent results.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(129, 129, 'English', 'Hamilton Beach Slow Cooker', '<p>The <strong>Hamilton Beach Slow Cooker</strong> offers convenient meal preparation with its large capacity and programmable settings. It is perfect for cooking stews, soups, roasts, and more, allowing you to come home to a delicious, ready-to-eat meal.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(130, 130, 'English', 'Black & Decker Toaster', '<p>The <strong>Black & Decker Toaster</strong> features extra-wide slots and multiple browning settings for perfect toasting every time. Its sleek design and compact size make it a great addition to any kitchen.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(131, 131, 'English', 'George Foreman Grill', '<p>The <strong>George Foreman Grill</strong> offers quick and easy grilling with its non-stick surface and adjustable temperature control. Perfect for cooking meats, vegetables, and more, it delivers delicious, healthy meals with minimal effort.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(132, 132, 'English', 'Oster Blender', '<p>The <strong>Oster Blender</strong> features a powerful motor and durable blades for efficient blending and crushing. Ideal for making smoothies, shakes, and other blended drinks, it ensures consistent, high-quality results.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(133, 133, 'English', 'Smeg Kettle', '<p>The <strong>Smeg Kettle</strong> combines retro style with modern functionality. It features a fast-boiling design and a large capacity, making it perfect for preparing tea, coffee, and other hot beverages.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(134, 134, 'English', 'Nespresso Coffee Machine', '<p>The <strong>Nespresso Coffee Machine</strong> offers barista-quality coffee at home with its advanced brewing technology. Compatible with Nespresso capsules, it delivers rich, flavorful coffee with ease.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(135, 135, 'English', 'Keurig Mini', '<p>The <strong>Keurig Mini</strong> is a compact, single-serve coffee maker that brews a perfect cup of coffee in minutes. Its small size makes it ideal for small spaces, and it is compatible with K-Cup pods for a variety of beverage options.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(136, 136, 'English', 'Panasonic Microwave', '<p>The <strong>Panasonic Microwave</strong> offers powerful cooking with its inverter technology and multiple pre-set functions. It is perfect for reheating, cooking, and defrosting a variety of foods quickly and evenly.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(137, 137, 'English', 'Crock-Pot', '<p>The <strong>Crock-Pot</strong> provides easy, convenient slow cooking with its large capacity and programmable settings. It is perfect for preparing a variety of meals, from soups and stews to roasts and desserts.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(138, 138, 'English', 'Whirlpool Refrigerator', '<p>The <strong>Whirlpool Refrigerator</strong> offers ample storage space and advanced cooling technology to keep your food fresh and organized. Its energy-efficient design and modern features make it a great addition to any kitchen.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(139, 139, 'English', 'LG Dishwasher', '<p>The <strong>LG Dishwasher</strong> features advanced cleaning technology and a spacious interior to accommodate large loads. Its quiet operation and energy-efficient design make it perfect for any household.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00'),
(140, 140, 'English', 'Samsung Oven', '<p>The <strong>Samsung Oven</strong> offers precise cooking control with its advanced features and large capacity. It is perfect for baking, roasting, and broiling, providing consistent, delicious results every time.</p>', '2024-06-21 05:00:00', '2024-06-21 05:00:00');

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

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'mail_type', 'smtp', NULL, NULL),
(2, 'backend_direction', 'ltr', NULL, NULL),
(3, 'language', 'English', NULL, NULL),
(4, 'email_verification', 'disabled', NULL, NULL),
(5, 'delivery_charge', '5', NULL, NULL),
(6, 'free_delivery_amount', '100', NULL, NULL),
(7, 'currency', 'USD', NULL, NULL),
(8, 'main_heading', 'Groceries delivered in 1 hour', NULL, NULL);

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

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL);

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

--
-- Dumping data for table `unit_translations`
--

INSERT INTO `unit_translations` (`id`, `unit_id`, `locale`, `name`, `short_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'English', 'item', 'item', NULL, NULL);

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
(1, 'Jhon Doe', 'admin@demo.com', NULL, 'admin', NULL, 1, 'default.png', '2024-06-22 02:34:45', '$2y$10$tWIQlr.x9JngdA3UFv7QNOVZsy53fK5fHk6rHI7.pcWJk4XsPTU72', NULL, NULL, NULL, NULL, '2024-06-22 02:34:45', '2024-06-22 02:34:45');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `unit_translations`
--
ALTER TABLE `unit_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
