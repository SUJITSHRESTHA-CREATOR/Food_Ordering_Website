-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2021 at 07:11 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'saisav@gmail.com', '$2y$10$nmRcN2K1yHlWmKOuonTlOuJTm.TcvDjR3aF3Z1XYwBxKRAzBqkvrm', '2021-01-15 21:27:18', '2021-01-16 16:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `is_home` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `is_home`, `created_at`, `updated_at`) VALUES
(1, 'Pizza Hut', 'Pizza Hut.jpg', 1, 1, '2021-02-17 03:55:30', '2021-09-15 23:47:09'),
(2, 'Liwer House', 'DinnerL.jpg', 1, 1, '2021-02-17 03:55:41', '2021-06-16 20:57:05'),
(3, 'Coffee Shop', 'Coffee.jpg', 1, 1, '2021-02-17 04:11:33', '2021-06-16 20:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('Reg','Not-Reg') NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_attr_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `user_type`, `qty`, `product_id`, `product_attr_id`, `added_on`) VALUES
(7, 14, 'Reg', 1, 3, 4, '2021-04-23 08:37:41'),
(15, 8, 'Reg', 1, 2, 3, '2021-04-28 02:12:14'),
(16, 209244684, 'Not-Reg', 1, 1, 1, '2021-06-16 08:10:24'),
(44, 30, 'Reg', 1, 2, 3, '2021-06-17 09:05:53'),
(47, 971861961, 'Not-Reg', 1, 27, 31, '2021-06-18 12:03:17'),
(69, 45, 'Reg', 1, 11, 15, '2021-09-17 05:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_category_id` int(11) NOT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `parent_category_id`, `category_image`, `is_home`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dessert', 'dessert', 0, '1631770114.jpg', 1, 1, '2021-02-17 03:30:54', '2021-09-16 20:43:06'),
(2, 'Breakfast', 'breakfast', 0, 'Bread.jpeg', 1, 1, '2021-02-17 03:31:24', '2021-06-16 04:38:56'),
(3, 'Beverage', 'beverage', 0, 'Beverage.jpeg', 1, 1, '2021-02-17 03:31:52', '2021-09-16 02:19:47'),
(4, 'Dinner', 'dinner', 0, 'Dinner.jpeg', 1, 1, '2021-02-17 03:46:07', '2021-06-16 04:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Value','Per') COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_order_amt` int(11) NOT NULL,
  `is_one_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `value`, `type`, `min_order_amt`, `is_one_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Jan Coupon', 'Jan2021', '140', 'Value', 2000, 0, 1, '2021-01-20 04:43:32', '2021-09-16 07:57:11'),
(4, 'New Coupon', 'New', '15', 'Per', 1000, 0, 1, '2021-02-05 02:32:37', '2021-02-05 02:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gstin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `is_verify` int(11) NOT NULL,
  `is_forgot_password` int(11) DEFAULT NULL,
  `rand_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `password`, `address`, `city`, `state`, `zip`, `company`, `gstin`, `status`, `is_verify`, `is_forgot_password`, `rand_id`, `created_at`, `updated_at`) VALUES
(36, 'saisav', 'utiesat@gmail.com', '9999999999', 'eyJpdiI6ImJNSXNpQ3VVQTg4Y0cxM25Ec2dXVlE9PSIsInZhbHVlIjoiL0s0UndoVUZLZUoxY21uTVh0SkpIZz09IiwibWFjIjoiMzc0ZGM1NDY5OGZkNDNlODUxMzMyZjY0NmQ3NmQ0YjUzZWU4YTc0MWM3YTMwYmZjMTM5YjFiNDgxOGI2ZmExYiJ9', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '', '2021-09-14 21:18:37', '2021-09-14 21:18:37'),
(45, 'shaishav', 'shaishavpaudel@gmail.com', '9999999999', 'eyJpdiI6IkRBWmszZTkxM0tIVE0rcUtneDZFekE9PSIsInZhbHVlIjoiZ1ZBalBTT2dWL3NjbGFEYVA3Z0x5QT09IiwibWFjIjoiY2NiNTdiOGQ1YzBmYWM3ZmVmMWE4Mjg1M2YwZDI3ZjhkZjM0MjhiOTgxY2I5N2JiMDEyNjA1NDg2NGRmM2EwMSJ9', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, '', '2021-09-16 23:14:57', '2021-09-16 23:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `home_banners`
--

CREATE TABLE `home_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_banners`
--

INSERT INTO `home_banners` (`id`, `image`, `btn_txt`, `btn_link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kitchen.jpeg', NULL, NULL, 1, '2021-02-17 14:54:32', '2021-09-16 02:54:28'),
(2, 'Kitchen2.jpeg', NULL, NULL, 1, '2021-02-17 14:57:51', '2021-09-16 02:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_01_15_211334_create_admins_table', 1),
(4, '2021_01_15_215552_create_categories_table', 2),
(5, '2021_01_20_095632_create_coupons_table', 3),
(10, '2021_01_21_115714_create_ajaxes_table', 4),
(12, '2021_01_26_021550_create_sizes_table', 5),
(13, '2021_01_26_023140_create_colors_table', 6),
(14, '2021_01_28_104722_create_products_table', 7),
(15, '2021_02_03_114909_create_brands_table', 8),
(16, '2021_02_05_082218_create_taxes_table', 9),
(17, '2021_02_08_081113_create_customers_table', 10),
(18, '2021_02_17_200040_create_home_banners_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `pincode` varchar(25) NOT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `coupon_value` int(11) DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `payment_type` enum('COD','Gateway') NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `payment_id` varchar(50) DEFAULT NULL,
  `txn_id` varchar(100) DEFAULT NULL,
  `total_amt` int(11) NOT NULL,
  `track_details` text DEFAULT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customers_id`, `name`, `email`, `mobile`, `address`, `city`, `state`, `pincode`, `coupon_code`, `coupon_value`, `order_status`, `payment_type`, `payment_status`, `payment_id`, `txn_id`, `total_amt`, `track_details`, `added_on`) VALUES
(16, 36, 'saisav', 'utiesat@gmail.com', '9999999999', 'sdfsdf', 'sdfsdf', 'sdfsdf', 'sdfsd', NULL, 0, 2, 'COD', 'Success', NULL, NULL, 650, 'Take to the sky', '2021-09-17 03:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `orders_details`
--

CREATE TABLE `orders_details` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `products_attr_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_details`
--

INSERT INTO `orders_details` (`id`, `orders_id`, `product_id`, `products_attr_id`, `price`, `qty`) VALUES
(25, 16, 8, 12, 650, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

CREATE TABLE `orders_status` (
  `id` int(11) NOT NULL,
  `orders_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`id`, `orders_status`) VALUES
(1, 'Placed'),
(2, 'On the Way'),
(3, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `technical_specification` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uses` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warranty` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `is_promo` int(11) NOT NULL,
  `is_featured` int(11) NOT NULL,
  `is_discounted` int(11) NOT NULL,
  `is_tranding` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `image`, `slug`, `brand`, `model`, `short_desc`, `desc`, `keywords`, `technical_specification`, `uses`, `warranty`, `lead_time`, `tax_id`, `is_promo`, `is_featured`, `is_discounted`, `is_tranding`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 'Chicken Pizza', 'Pizza2.jpeg', 'chicken-pizza', '1', 'Chicken Pizza', '<p>Type : Flat Bread</p>\r\n\r\n<p>Serving Temperature: Hot or Warm</p>\r\n\r\n<p>Main Ingredients: Dough,Cheese,Sauce</p>', '<p><strong>Pizza</strong>, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly&mdash;usually, in a commercial setting, using a wood-fired oven heated to a very high temperature&mdash;and served ho</p>', 'Pizza', NULL, NULL, 'chicken,wheat', NULL, NULL, 0, 0, 1, 1, 1, '2021-02-17 04:00:59', '2021-09-16 21:24:40'),
(2, 1, 'Vannila Ice Cream', 'IceCream.jpeg', 'ice-cream', '3', 'ice-cream', '<p>Serving Temperature: Frozen</p>\r\n\r\n<p>Main Ingredients: Cream,Sweetner,Milk</p>\r\n\r\n<p>Variation: Frozen Custard, Gelato</p>', '<p><strong>Ice cream</strong>&nbsp;(derived from earlier&nbsp;<strong>cream ice</strong>)<a href=\"https://en.wikipedia.org/wiki/Ice_cream#cite_note-1\">[1]</a>&nbsp;is a sweetened&nbsp;<a href=\"https://en.wikipedia.org/wiki/Frozen_food\">frozen food</a>&nbsp;typically eaten as a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Snack\">snack</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dessert\">dessert</a>. It may be made from&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dairy_product\">dairy</a>&nbsp;<a href=\"https://en.wikipedia.org/wiki/Milk\">milk</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Cream\">cream</a>&nbsp;and is flavoured with a sweetener, either&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sugar\">sugar</a>&nbsp;or an&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sugar_substitute\">alternative</a>, and a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Spice\">spice</a>, such as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Chocolate\">cocoa</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Vanilla\">vanilla</a>, or with fruit such as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Strawberries\">strawberries</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Peaches\">peaches</a>. It can also be made by whisking a flavored cream base and liquid&nbsp;<a href=\"https://en.wikipedia.org/wiki/Nitrogen\">nitrogen</a>&nbsp;together.&nbsp;<a href=\"https://en.wikipedia.org/wiki/Food_coloring\">Colorings</a>&nbsp;are sometimes added, in addition to stabilizers. The mixture is cooled below the freezing point of water and stirred to incorporate air spaces and to prevent detectable&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ice_crystal\">ice crystals</a>&nbsp;from forming. The result is a smooth, semi-solid&nbsp;<a href=\"https://en.wikipedia.org/wiki/Foam\">foam</a>&nbsp;that is solid at very low temperatures (below 2&nbsp;&deg;C or 35&nbsp;&deg;F). It becomes more malleable as its temperature increases.</p>', 'Ice, cream, Icecream, Milk', NULL, NULL, 'N/A', NULL, NULL, 0, 1, 0, 1, 1, '2021-02-17 04:14:41', '2021-09-16 02:46:45'),
(3, 1, 'Babka', 'Babka1.jpeg', 'babka', '3', 'babka', '<p>Type: Bread or Cake</p>\r\n\r\n<p>Variations: Chocolate, Cinnmon, Cheese</p>', '<p>A&nbsp;<strong>babka</strong>&nbsp;is a sweet braided bread or cake which originated in the&nbsp;<a href=\"https://en.wikipedia.org/wiki/History_of_the_Jews_in_Poland\">Jewish communities</a>&nbsp;of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Poland\">Poland</a>&nbsp;and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ukraine\">Ukraine</a>. It is popular in&nbsp;<a href=\"https://en.wikipedia.org/wiki/Israel\">Israel</a>&nbsp;(often referred to as simply a yeast cake:&nbsp;עוגת שמרים) and in the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Jewish_diaspora\">Jewish diaspora</a>. It is prepared with a yeast-leavened dough that is rolled out and spread with a filling such as chocolate, cinnamon, fruit, or cheese, then rolled up and braided before baking.</p>', 'Babka, Chocolate', NULL, NULL, 'wheat, Chocolate', NULL, NULL, 0, 1, 0, 1, 1, '2021-02-17 04:18:54', '2021-09-16 07:59:48'),
(4, 3, 'Cappuccino', 'Cappuchino1.jpeg', 'cappuccino', '2', 'Cappuccino', '<p>Type: <strong>Hot</strong></p>\r\n\r\n<p>Country of Origin: Italy</p>\r\n\r\n<p>Color:Black,Light Brown, White, Brown</p>', '<p>A <strong>cappuccino</strong> is an espresso-based coffee drink that originated in Italy, and is traditionally prepared with steamed milk foam. Variations of the drink involve the use of cream instead of milk, using non-dairy milks, and flavoring with cinnamon or chocolate powder.</p>', 'Cappuccino, Cup Chocolate, Hot Coffee, Milk, Beverage', '<p>N/A</p>', NULL, 'Milk, Sugar', NULL, NULL, 0, 1, 0, 1, 1, '2021-02-17 04:29:08', '2021-09-16 07:59:55'),
(7, 1, 'Cheese Cake', 'Cheesecake1.jpeg', 'cheesecake', '2', 'cheesecake', '<p>Served: Frozen</p>\r\n\r\n<p>Ingredients: Cheese,Sugar,Pie-Crust</p>', '<p><strong>Cheesecake</strong>&nbsp;is a sweet&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dessert\">dessert</a>&nbsp;consisting of one or more layers. The main, and thickest, layer consists of a mixture of a soft,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Fresh_cheese\">fresh cheese</a>&nbsp;(typically&nbsp;<a href=\"https://en.wikipedia.org/wiki/Cottage_cheese\">cottage cheese</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Cream_cheese\">cream cheese</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ricotta\">ricotta</a>),&nbsp;<a href=\"https://en.wikipedia.org/wiki/Egg_as_food\">eggs</a>, and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sugar\">sugar</a>. If there is a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Crust_(baking)\">bottom layer</a>, it most often consists of a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Crust_(baking)\">crust</a>&nbsp;or&nbsp;<em>base</em>&nbsp;made from crushed&nbsp;<a href=\"https://en.wikipedia.org/wiki/Cookies\">cookies</a>&nbsp;(or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Digestive_biscuits\">digestive biscuits</a>),&nbsp;<a href=\"https://en.wikipedia.org/wiki/Graham_cracker_crust\">graham crackers</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pastry\">pastry</a>, or sometimes&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sponge_cake\">sponge cake</a>.<a href=\"https://en.wikipedia.org/wiki/Cheesecake#cite_note-1\">[1]</a>&nbsp;Cheesecake may be&nbsp;<a href=\"https://en.wikipedia.org/wiki/Baked\">baked</a>&nbsp;or unbaked (and is usually refrigerated).</p>', 'Cheese Cake, Cheese, Cake', '<p>n/a</p>', 'n/a', 'n/a', NULL, 1, 0, 0, 1, 0, 1, '2021-06-18 00:06:54', '2021-09-15 19:57:02'),
(8, 1, 'Barffi', 'Barffi1.jpg', 'barffi', '3', 'barfi', '<p>Serving Temperature:Cold</p>\r\n\r\n<p>Main Ingredients:Condensed Milk,Sugar</p>\r\n\r\n<p>Variation: Kaju Barffi, Keshar Barffi</p>', '<p><strong>Barfi</strong>,&nbsp;<strong>barfee</strong>,&nbsp;<strong>borfi</strong>&nbsp;or&nbsp;<strong>burfi</strong>&nbsp;is a dense milk-based&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sweet_from_the_Indian_subcontinent\">sweet from the Indian subcontinent</a>, and a type of&nbsp;<em>mithai.</em>&nbsp;The name is a derivative of the Urdu (originally Persian) word&nbsp;<em>barf</em>, which means snow. A few of the famous varieties of barfi include&nbsp;<em><a href=\"https://en.wikipedia.org/wiki/Besan_barfi\">besan barfi</a></em>&nbsp;(made with&nbsp;<a href=\"https://en.wikipedia.org/wiki/Gram_flour\">gram flour</a>),&nbsp;<em>kaaju barfi</em>&nbsp;(made with&nbsp;<a href=\"https://en.wikipedia.org/wiki/Cashew\">cashews</a>),&nbsp;<em>pista barfi</em>&nbsp;(made with ground&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pistachio\">pistachios</a>), and&nbsp;<em>sing barfi</em>&nbsp;(made with peanuts).<a href=\"https://en.wikipedia.org/wiki/Barfi#cite_note-1\">[1]</a>&nbsp;The main ingredients of plain barfis include&nbsp;<a href=\"https://en.wikipedia.org/wiki/Powdered_milk\">powdered milk</a>&nbsp;and sugar. The ingredients are cooked in a vessel until the mixture solidifies.</p>', 'Barffi, Indian, Sweets', NULL, 'n/a', 'n/a', NULL, 1, 0, 1, 0, 0, 1, '2021-06-18 00:38:20', '2021-06-18 00:38:20'),
(9, 1, 'Brownies', 'Brownies1.jpg', 'brownies', '2', 'Choco Brownies', '<p>Place Of Origin: United States</p>\r\n\r\n<p>Main Ingredients: Flour, Butter , Egg, Chocolate</p>', '<p>A&nbsp;<strong>chocolate brownie</strong>&nbsp;or simply a&nbsp;<strong>brownie</strong>&nbsp;is a square or rectangular chocolate&nbsp;<a href=\"https://en.wikipedia.org/wiki/Baking\">baked</a>&nbsp;<a href=\"https://en.wikipedia.org/wiki/Confectionery\">confection</a>. Brownies come in a variety of forms and may be either fudgy or cakey, depending on their density. They may include nuts, frosting, cream cheese, chocolate chips, or other ingredients. A variation made with&nbsp;<a href=\"https://en.wikipedia.org/wiki/Brown_sugar\">brown sugar</a>&nbsp;and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Vanilla\">vanilla</a>&nbsp;rather than chocolate in the batter is called a blond brownie or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Blondie_(confection)\">blondie</a>. The brownie was developed in the United States at the end of the 19th century and popularized in the U.S. and Canada during the first half of the 20th century.</p>\r\n\r\n<p>Brownies are bar cookies and not considered cake. They are typically eaten by hand, often accompanied by milk, served warm with ice cream , topped with whipped cream, or sprinkled with powdered sugar and fudge. In North America, they are common homemade treats and they are also popular in restaurants&nbsp;and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Coffeehouse\">coffeehouses</a>.</p>', 'Brownies, Cake, Chocolate', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 00:46:29', '2021-06-18 01:09:55'),
(10, 1, 'Hot Chocolate', 'Hot1.jpg', 'hchocolate', '3', 'hot chocolate', '<p>Color: Brown Or Chestnut</p>\r\n\r\n<p>Ingredients: Cocoa Powder, Sugar, Milk, Water</p>', '<p><strong>Hot chocolate</strong>, also known as&nbsp;<strong>hot cocoa</strong>&nbsp;or&nbsp;<strong>drinking chocolate</strong>, is a heated&nbsp;<a href=\"https://en.wikipedia.org/wiki/Drink\">drink</a>&nbsp;consisting of shaved&nbsp;<a href=\"https://en.wikipedia.org/wiki/Chocolate\">chocolate</a>, melted chocolate or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Cocoa_solids\">cocoa powder</a>, heated&nbsp;<a href=\"https://en.wikipedia.org/wiki/Milk\">milk</a>&nbsp;or water, and usually a sweetener. Hot chocolate may be topped with whipped cream or marshmallows. Hot chocolate made with melted chocolate is sometimes called drinking chocolate, characterized by less sweetness and a thicker consistency.</p>\r\n\r\n<p>The first chocolate drink is believed to have been created by the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Maya_civilization\">Maya</a>&nbsp;around 2,500&ndash;3,000 years ago, and a cocoa drink was an essential part of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Aztec\">Aztec</a>&nbsp;culture by 1400 AD, by which they referred to as xocōlātl.<a href=\"https://en.wikipedia.org/wiki/Hot_chocolate#cite_note-Trivedi-2\">[2]</a>&nbsp;The drink became popular in Europe after being introduced from Mexico in the&nbsp;<a href=\"https://en.wikipedia.org/wiki/New_World\">New World</a>&nbsp;and has undergone multiple changes since then. Until the 19th century, hot chocolate was even used medicinally to treat ailments such as liver and stomach diseases.</p>', 'hot, Chocolate, Hot chocolate, Drinks', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 1, 0, 1, '2021-06-18 00:57:00', '2021-09-15 19:57:04'),
(11, 1, 'Cannoli', 'Cannoli1.jpg', 'cannoli', '3', 'cannoli', '<p>Place Of Origin: Italy</p>\r\n\r\n<p>Main Ingredients: Fried Pastry Dough, Ricotta Fillings</p>', '<p><strong>Cannoli</strong>&nbsp;&nbsp;are Italian&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pastry\">pastries</a>&nbsp;consisting of tube-shaped shells of fried&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pastry\">pastry</a>&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dough\">dough</a>, filled with a sweet, creamy filling usually containing&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ricotta\">ricotta</a>&mdash;a staple of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sicilian_cuisine\">Sicilian cuisine</a>.&nbsp;They range in size from 9 centimetres (3.5&nbsp;in) to 20 centimetres (7.9&nbsp;in). In mainland Italy, they are commonly known as&nbsp;<em>cannoli siciliani.</em></p>', 'Cannoli', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 01:05:03', '2021-06-18 01:05:03'),
(12, 1, 'Gulab Jamun', 'GulabJamun1.jpg', 'gulabjamun', '3', 'gulab-jamun', '<p>Place Of Origin: Indian Sub-Continent</p>\r\n\r\n<p>Serving Temperature: Hot,Cold, Either at room temperature</p>\r\n\r\n<p>Main Ingredients: Khoa,Saffron</p>', '<p><strong>Gulab jamun</strong>&nbsp;(also spelled&nbsp;<strong>gulaab jamun</strong>) is a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Milk_solids\">milk-solid</a>-based&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sweet_from_the_Indian_subcontinent\">sweet from the Indian subcontinent</a>, and a type of&nbsp;<em>mithai,</em>&nbsp;popular in&nbsp;<a href=\"https://en.wikipedia.org/wiki/Indian_cuisine\">India</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Nepalese_cuisine\">Nepal</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pakistani_cuisine\">Pakistan</a>, the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Maldives\">Maldives</a>&nbsp;(where it is known as&nbsp;<strong>gulab ki janu</strong>), and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bangladeshi_cuisine\">Bangladesh</a>&nbsp;(where it is known as&nbsp;<strong>golap jam</strong>), as well as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Burmese_cuisine\">Myanmar</a>. It is also common in nations with substantial populations of people with South Asian heritage, such as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Mauritius\">Mauritius</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Fiji\">Fiji</a>, the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Malay_Peninsula\">Malay Peninsula</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Great_Britain\">Great Britain</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/South_Africa\">South Africa</a>, and the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Caribbean\">Caribbean</a>&nbsp;countries of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Jamaica\">Jamaica</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Trinidad_and_Tobago\">Trinidad and Tobago</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Guyana\">Guyana</a>, and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Suriname\">Suriname</a>. It is made mainly from milk solids, traditionally from&nbsp;<a href=\"https://en.wikipedia.org/wiki/Khoa\">khoya</a>, which is milk reduced to the consistency of a soft dough. Modern recipes call for dried or powdered milk instead of khoya. It is often garnished with dried nuts such as almonds and cashews to enhance flavour. 25th of may is celebrated as world Gulab jamun Day.</p>', 'GulabJamun, Gulab, Indian, Sweets', NULL, NULL, 'n/a', NULL, NULL, 0, 0, 0, 0, 1, '2021-06-18 01:19:44', '2021-09-16 05:20:17'),
(13, 2, 'Pita Bread', 'PitaBread1.jpg', 'pitabread', '1', 'pita-bread', '<p>Type: Flat Bread</p>\r\n\r\n<p>Main Ingredients: Flour,Water,Yeast,Salt</p>', '<p><strong>Pita</strong>&nbsp;or&nbsp;<strong>pitta</strong>&nbsp;(<a href=\"https://en.wikipedia.org/wiki/British_English\">British English</a>), is a family of yeast-<a href=\"https://en.wikipedia.org/wiki/Leavened\">leavened</a>&nbsp;round&nbsp;<a href=\"https://en.wikipedia.org/wiki/Flatbread\">flatbreads</a>&nbsp;baked from&nbsp;<a href=\"https://en.wikipedia.org/wiki/Wheat_flour\">wheat flour</a>, common in the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Mediterranean\">Mediterranean</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Middle_East\">Middle East</a>, and neighboring areas. It includes the widely known version with an interior pocket, also known as&nbsp;<strong>Arabic bread</strong>&nbsp;(Arabic:&nbsp;<em>khubz ʿarabī</em>),&nbsp;<strong>Syrian bread</strong>&nbsp;&amp;&nbsp;<strong>Greek Bread</strong>, and other names, as well as pocketless versions such as the Greek pita, used to wrap&nbsp;<a href=\"https://en.wikipedia.org/wiki/Souvlaki\">souvlaki</a>.&nbsp;The&nbsp;<a href=\"https://en.wikipedia.org/wiki/Western_world\">Western</a>&nbsp;name&nbsp;<em>pita</em>&nbsp;may sometimes be used to refer to various other types of flatbreads that have different names in their local languages, such as numerous styles of Arab&nbsp;<em>khubz</em>&nbsp;(bread).</p>', 'Pita bread, Pita, Bread', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 04:04:54', '2021-06-18 04:04:54'),
(14, 2, 'Baguette', 'Baguette1.jpg', 'baguette', '1', 'baguette', '<p>Place of Origin: France</p>\r\n\r\n<p>Ingredients: Flour,Water,Yeast,Salt</p>\r\n\r\n<p>Food Energy:256Kcal</p>', '<p>A&nbsp;<strong>baguette</strong>&nbsp;&nbsp;is a long, thin type of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bread\">bread</a>&nbsp;of French origin that is commonly made from basic lean&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dough\">dough</a>&nbsp;(the dough, though not the shape, is defined by French law).&nbsp;It is distinguishable by its length and crisp&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bread#Crust\">crust</a>.</p>\r\n\r\n<p>A baguette has a diameter of about&nbsp;5&nbsp;to 6 centimetres (2&ndash;2+1&frasl;2&nbsp;inches) and a usual length of about 65&nbsp;cm (26&nbsp;in), although a baguette can be up to 1&nbsp;m (39&nbsp;in) long.</p>\r\n\r\n<p>In May 2021, France submitted the baguette for&nbsp;<a href=\"https://en.wikipedia.org/wiki/UNESCO\">UNESCO</a>&nbsp;heritage status.</p>', 'bread, baguette', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 04:14:13', '2021-06-18 04:14:13'),
(15, 2, 'No Knead Bread', 'NkneadBread1.jpg', 'NKBread', '3', 'no knead bread', '<p>Flour:100%</p>\r\n\r\n<p>Salt:2%</p>\r\n\r\n<p>Instant Yeast:0.25%</p>\r\n\r\n<p>Water:75%</p>', '<p><strong>No-knead bread</strong>&nbsp;is a method of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bread\">bread</a>&nbsp;baking that uses a very long fermentation (rising) time instead of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Kneading\">kneading</a>&nbsp;to form the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Gluten\">gluten</a>&nbsp;strands that give the bread its texture. It is characterized by a low&nbsp;<a href=\"https://en.wikipedia.org/wiki/Yeast\">yeast</a>&nbsp;content and a very wet dough. Some recipes improve the quality of the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bread#crust\">crust</a>&nbsp;by baking the bread in a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dutch_oven\">Dutch oven</a>&nbsp;or other covered vessel.</p>', 'Bread, No knead bread', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 04:20:05', '2021-06-18 04:20:05'),
(16, 2, 'Pan Cake', 'PanCake1.jpg', 'pancake', '1', 'pan-cake', '<p>Served with Honey</p>\r\n\r\n<p>Type:Flan Non yeast bread</p>\r\n\r\n<p>Ingredients:Egg,Flour</p>', '<p>A&nbsp;<strong>pancake</strong>&nbsp;(or&nbsp;<strong>hotcake</strong>,&nbsp;<strong>griddlecake</strong>, or&nbsp;<strong>flapjack</strong>, not to be confused with oat bar&nbsp;<a href=\"https://en.wikipedia.org/wiki/Flapjack_(oat_bar)\">flapjacks</a>) is a flat cake, often thin and round, prepared from a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Starch\">starch-based</a>&nbsp;<a href=\"https://en.wikipedia.org/wiki/Batter_(cooking)\">batter</a>&nbsp;that may contain eggs, milk and butter and cooked on a hot surface such as a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Griddle\">griddle</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Frying_pan\">frying pan</a>, often frying with oil or butter. Archaeological evidence suggests that pancakes were probably the earliest and most widespread cereal food eaten in prehistoric societies.</p>', 'Pan cake, pan, cake', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 04:25:55', '2021-06-18 04:25:55'),
(17, 2, 'Simple Doughnut', 'Doughnut1.jpg', 'SDoughnut', '1', 'ssdoughnut', '<p>Type: Fried Dough</p>\r\n\r\n<p>Course:Breakfast,Snack Dessert</p>', '<p>A&nbsp;<strong>doughnut</strong>&nbsp;or&nbsp;<strong>donut</strong>&nbsp;&nbsp;is a type of leavened&nbsp;<a href=\"https://en.wikipedia.org/wiki/List_of_fried_dough_foods\">fried dough</a>.&nbsp;It is popular in many countries and is prepared in various forms as a sweet snack that can be homemade or purchased in&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bakery\">bakeries</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Supermarket\">supermarkets</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Food_booth\">food stalls</a>, and&nbsp;<a href=\"https://en.wikipedia.org/wiki/List_of_doughnut_shops\">franchised specialty vendors</a>. &#39;Doughnut&#39; is the traditional spelling, whilst &#39;donut&#39; is the simplified version. Both terms are often used interchangeably in the English-language.</p>', 'Doughnut, Simple Doughnut', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 04:32:38', '2021-06-18 04:32:38'),
(18, 2, 'Cream Doughnut', 'CDoughnut1.jpg', 'Cdoughnut', '1', 'doughnutc', '<p>Place Of Origin:United States</p>\r\n\r\n<p>Ingredients: Dough, Chocolate icing custard</p>', '<p>The cream doughnut was designated the official doughnut of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Massachusetts\">Massachusetts</a>&nbsp;in 2003 after the Boston cream pie itself was chosen as the state dessert in 1996.</p>\r\n\r\n<p>Although the doughnut&#39;s popularity made it natural choice, few (if any) other US states have state doughnuts.&nbsp;Massachusetts state representatives have claimed that the official doughnut legislation enacted in Massachusetts is frivolous and that having a designated doughnut associated with the state can have political pitfalls.</p>', 'Cream, Doughnut, Cream Doughnut', NULL, NULL, 'n/a', NULL, NULL, 0, 0, 0, 0, 1, '2021-06-18 04:39:19', '2021-09-16 05:19:49'),
(19, 2, 'Sour Dough Bread', 'SBread1.jpg', 'sourbread', '1', 'sour-bread', '<p>Type: Bread</p>\r\n\r\n<p>Use Of Lactobacilli when preparing</p>\r\n\r\n<p>Improved taste than usual bread</p>', '<p><strong>Sourdough</strong>&nbsp;bread is made by the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Fermentation\">fermentation</a>&nbsp;of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dough\">dough</a>&nbsp;using naturally occurring&nbsp;<a href=\"https://en.wikipedia.org/wiki/Lactobacilli\">lactobacilli</a>&nbsp;and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Yeast\">yeast</a>. The&nbsp;<a href=\"https://en.wikipedia.org/wiki/Lactic_acid\">lactic acid</a>&nbsp;produced by the lactobacilli gives it a more sour taste and improved keeping qualities.</p>', 'sour, bread, sour bread', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 04:45:22', '2021-06-18 04:45:22'),
(20, 2, 'Sandwich', 'Sandwich1.jpg', 'sandwich', '1', 'sand-wich', '<p>Main Ingredients:Bread,Meat,Salad,Vegetables,Sauce</p>', '<p>A&nbsp;<strong>sandwich</strong>&nbsp;is a food typically consisting of vegetables, sliced cheese or meat, placed on or between slices of bread, or more generally any dish wherein bread serves as a container or wrapper for another food type.&nbsp;The sandwich began as a portable, convenient&nbsp;<a href=\"https://en.wikipedia.org/wiki/Finger_food\">finger food</a>&nbsp;in the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Western_world\">Western world</a>, though over time it has become prevalent worldwide. In the 21st century there has been considerable debate over the precise definition of&nbsp;<em>sandwich</em>; and specifically whether a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Hot_dog\">hot dog</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Open_sandwich\">open sandwich</a>&nbsp;can be categorized as such. In the United States, the&nbsp;<a href=\"https://en.wikipedia.org/wiki/United_States_Department_of_Agriculture\">Department of Agriculture</a>&nbsp;and the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Food_and_Drug_Administration\">Food and Drug Administration</a>&nbsp;are the responsible agencies. The USDA uses the definition, &quot;at least 35% cooked meat and no more than 50% bread&quot; (specifically for open sandwiches).</p>', 'sandwich', NULL, NULL, 'n/a', NULL, NULL, 0, 0, 0, 0, 1, '2021-06-18 04:53:13', '2021-09-16 05:19:16'),
(21, 2, 'Focaccia', 'Focaccia1.jpg', 'focaccia', '1', 'focaccia', '<p>Type: Flat Bread</p>\r\n\r\n<p>Place Of Origin:Italy</p>\r\n\r\n<p>Ingredients: High gluten Flour, Oil, Salt, Yeast</p>', '<p><strong>Focaccia</strong>&nbsp;&nbsp;is a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Flatbread\">flat</a>&nbsp;oven-baked Italian&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bread\">bread</a>&nbsp;similar in style and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Food_texture\">texture</a>&nbsp;to&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pizza\">pizza</a>; in some places, it is called &quot;pizza bianca&quot;.&nbsp;Focaccia can be served as a side dish or as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sandwich_bread\">sandwich bread</a>.</p>\r\n\r\n<p>In&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ancient_Rome\">Ancient Rome</a>,&nbsp;<em>panis focacius</em>&nbsp;was a flat bread baked on the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Hearth\">hearth</a>.&nbsp;The word is derived from the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Latin\">Latin</a>&nbsp;<em>focus</em>&nbsp;&#39;hearth, place for baking&#39;.&nbsp;The basic recipe is thought by some to have originated with the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Etruscans\">Etruscans</a>, but today it is widely associated with&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ligurian_cuisine\">Ligurian cuisine</a>.</p>\r\n\r\n<p>Outside Liguria, the word usually refers to the Genoese variants.In&nbsp;<a href=\"https://en.wikipedia.org/wiki/Genoese_dialect\">Genoese</a>, it is called&nbsp;<em><a href=\"https://en.wikipedia.org/wiki/Fugassa\">f&uuml;gassa</a>.</em>&nbsp;In&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bari_dialect\">Barese</a>, it is called&nbsp;<em>fec&agrave;zze.</em></p>\r\n\r\n<p>The first attestation of the word&nbsp;<em>focaccia</em>&nbsp;appears in 1300.</p>\r\n\r\n<p>Focaccia is sometimes considered to be a kind of pizza,&nbsp;though focaccia is left to rise after being flattened, while pizza is baked immediately.</p>', 'Focaccia', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 05:01:34', '2021-06-18 05:01:34'),
(22, 2, 'Frushi', 'Frushi1.jpg', 'frushi', '1', 'frushii', '<p>This Epcot food combines the following into this frushi&nbsp;recipe:</p>\r\n\r\n<ul>\r\n	<li>sushi rice</li>\r\n	<li>cream of coconut</li>\r\n	<li>strawberries</li>\r\n	<li>cantaloupe</li>\r\n	<li>pineapple</li>\r\n</ul>\r\n\r\n<p>Then it is made into fruit sushi by wrapping all up in soy wrappers. The final touch on Epcot&rsquo;s frushi&nbsp;is a garnish of toasted coconut,&nbsp;raspberry puree, and whipped cream!</p>', '<h3>Ingredients</h3>\r\n\r\n<ul>\r\n	<li>2 cups sushi rice, cooked per package directions</li>\r\n	<li>1 tablespoon cream of coconut</li>\r\n	<li>16 soy wrappers</li>\r\n	<li>16 fresh strawberries, hulled and quartered</li>\r\n	<li>1/2 cantaloupe, cut into four-inch-long by 1/4-inch-wide rectangles</li>\r\n	<li>1/2 pineapple, peeled and cored cut into four-inch-long by 1/4-inch-wide rectangles</li>\r\n	<li>toasted coconut, for garnish</li>\r\n	<li>raspberry puree, for garnish</li>\r\n	<li>whipped cream, for garnish</li>\r\n</ul>', 'Frushi', NULL, NULL, 'n/a', NULL, NULL, 0, 0, 0, 0, 1, '2021-06-18 05:41:00', '2021-09-16 02:56:48'),
(23, 2, 'Oatmeal', 'Oatmeal1.jpg', 'oatmeal', '1', 'oat-meal', '<p>Type: Orridge</p>\r\n\r\n<p>Main Ingredients:Oat groats</p>', '<p><strong>Oatmeal</strong>&nbsp;refers to a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Rolled_oats\">preparation of oats</a>&nbsp;that have been&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dehusked\">dehusked</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Steaming\">steamed</a>&nbsp;and flattened, or else a coarse&nbsp;<a href=\"https://en.wikipedia.org/wiki/Flour\">flour</a>&nbsp;made of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Hulled\">hulled</a>&nbsp;<a href=\"https://en.wikipedia.org/wiki/Oat\">oat</a>&nbsp;grains (<a href=\"https://en.wikipedia.org/wiki/Groat_(grain)\">groats</a>) that have either been&nbsp;<a href=\"https://en.wikipedia.org/wiki/Mill_(grinding)\">milled (ground)</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Steel-cut_oats\">steel-cut</a>. Ground oats are also called &quot;white oats&quot;.&nbsp;<a href=\"https://en.wikipedia.org/wiki/Steel-cut_oats\">Steel-cut oats</a>&nbsp;are known as &quot;coarse oatmeal&quot;, &quot;Irish oatmeal&quot; or &quot;pinhead oats&quot;.&nbsp;<a href=\"https://en.wikipedia.org/wiki/Rolled_oats\">Rolled oats</a>&nbsp;were traditionally thick &quot;old-fashioned oats&quot;, but can be made thinner or smaller, and may be categorized as &quot;quick&quot; or &quot;instant&quot;, depending on the cooking time, which is shortened by the size of the oats and precooking.</p>\r\n\r\n<p>The term&nbsp;<em>oatmeal</em>&nbsp;is used to describe a common oat&nbsp;<a href=\"https://en.wikipedia.org/wiki/Porridge\">porridge</a>&nbsp;made from ground, steel-cut, or rolled oats. Some commercial packages display other ingredients, such as sugar, salt, flavorings,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Thickening_agent\">thickeners</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Vitamin\">vitamins</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Mineral_(nutrient)\">minerals</a>, while highlighting quick (&quot;instant&quot;) cooking and separately packaged individual portions for convenience.</p>', 'Oatmeal', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 05:44:58', '2021-06-18 05:44:58'),
(24, 2, 'Waffles', 'Waffles1.jpg', 'waffle', '3', 'waffle', '<p>Place of Origin: France,Belgium</p>\r\n\r\n<p>Ingredients: Batter Or Dough</p>', '<p>A&nbsp;<strong>waffle</strong>&nbsp;is a dish made from leavened&nbsp;<a href=\"https://en.wikipedia.org/wiki/Batter_(cooking)\">batter</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dough\">dough</a>&nbsp;that is cooked between two plates that are patterned to give a characteristic size, shape, and surface impression. There are many variations based on the type of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Waffle_iron\">waffle iron</a>&nbsp;and recipe used. Waffles are eaten throughout the world, particularly in&nbsp;<a href=\"https://en.wikipedia.org/wiki/Belgium\">Belgium</a>, which has over a dozen regional varieties.<a href=\"https://en.wikipedia.org/wiki/Waffle#cite_note-1\">[1]</a>&nbsp;Waffles may be made fresh or simply heated after having been commercially cooked and frozen.</p>', 'Waffle, Waffles', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 05:49:42', '2021-06-18 05:49:42'),
(25, 2, 'Shakshuka', 'Shakshuka1.jpg', 'shakshuka', '2', 'shakshuka', '<p>Today, you can find many variations of shakshuka, like my&nbsp;<a href=\"https://downshiftology.com/recipes/green-shakshuka/\" target=\"_blank\">Green Shakshuka with Brussels Sprouts and Spinach</a>&nbsp;and&nbsp;<a href=\"https://downshiftology.com/recipes/orange-shakshuka/\">Orange Shakshuka with Butternut Squash</a>. You can also add feta or goat cheese and adapt it to your taste. The options are endless &ndash; which is what makes this dish such a national favorite (of so many countries!).</p>', '<p><strong>Shakshuka</strong>&nbsp;is an easy, healthy breakfast (or any time of day) recipe in Israel and other parts of the Middle East and North Africa. It&rsquo;s a simple combination of simmering tomatoes, onions, garlic, spices and gently&nbsp;<a href=\"https://downshiftology.com/recipes/poached-eggs/\" target=\"_blank\">poached eggs</a>. It&rsquo;s nourishing, filling and one recipe I guarantee you&rsquo;ll make time and again.</p>', 'shakshuka', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 05:54:12', '2021-06-18 05:54:12'),
(26, 2, 'Guacamole', 'Guacamole1.jpg', 'Guacamole', '2', 'guacamole', '<p>Peel and mash avocados in a medium serving bowl. Stir in onion, garlic, tomato, lime juice, salt and pepper. Season with remaining lime juice and salt and pepper to taste. Chill for half an hour to blend flavors.</p>', '<p>Guacamole is an avocado-based dip, spread, or salad first developed in Mexico. In addition to its use in modern Mexican cuisine, it has become part of international and American cuisine as a dip, condiment and salad ingredient.</p>', 'Guacamole', NULL, NULL, 'n/a', NULL, NULL, 0, 0, 0, 0, 1, '2021-06-18 05:57:36', '2021-09-16 05:22:00'),
(27, 2, 'Naan', 'naan1.jpg', 'naan', '3', 'naan', '<p>Naan is a leavened, oven-baked flatbread found in the cuisines mainly of Western Asia, India, Indonesia, Myanmar and the Caribbean.</p>', '<p>The earliest appearance of &quot;naan&quot; in English is from 1803 in a travelogue of&nbsp;<a href=\"https://en.wikipedia.org/wiki/William_Tooke\">William Tooke</a>.<a href=\"https://en.wikipedia.org/wiki/Naan#cite_note-5\">[5]</a>&nbsp;The&nbsp;<a href=\"https://en.wikipedia.org/wiki/Persian_language\">Persian</a>&nbsp;word&nbsp;<em>nān</em>&nbsp;&#39;bread&#39; is attested in&nbsp;<a href=\"https://en.wikipedia.org/wiki/Middle_Persian\">Middle Persian</a>&nbsp;as&nbsp;<em>n&#39;n</em>&nbsp;&#39;bread, food&#39;, which is of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Iranian_languages\">Iranian</a>&nbsp;and Afghani origin, and is a cognate with&nbsp;<a href=\"https://en.wikipedia.org/wiki/Parthian_language\">Parthian</a>&nbsp;<em>ngn</em>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Kurdish_language\">Kurdish</a>&nbsp;<em>nan</em>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Balochi_language\">Balochi</a>&nbsp;<em>nagan</em>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sogdian_language\">Sogdian</a>&nbsp;<em>n&gamma;n-</em>, and&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pashto_language\">Pashto</a>&nbsp;<em>nə&gamma;an</em>&nbsp;&#39;bread&#39;.<a href=\"https://en.wikipedia.org/wiki/Naan#cite_note-6\">[6]</a>&nbsp;<em>Naan</em>&nbsp;may have derived from bread baked on hot pebbles in ancient Persia.<a href=\"https://en.wikipedia.org/wiki/Naan#cite_note-pasq-7\">[7]</a></p>\r\n\r\n<p>The form&nbsp;<em>naan</em>&nbsp;has a widespread distribution, having been borrowed in a range of languages spoken in&nbsp;<a href=\"https://en.wikipedia.org/wiki/Central_Asia\">Central Asia</a>&nbsp;and the Indian subcontinent, where it usually refers to a kind of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Flatbread\">flatbread</a>&nbsp;(<a href=\"https://en.wikipedia.org/wiki/Tandyr_nan\">tandyr nan</a>).<a href=\"https://en.wikipedia.org/wiki/Naan#cite_note-pasq-7\">[7]</a>&nbsp;The spelling&nbsp;<em>naan</em>&nbsp;has been recorded as being first attested in 1979,<a href=\"https://en.wikipedia.org/wiki/Naan#cite_note-8\">[8]</a>&nbsp;but dates back at least to 1975,<a href=\"https://en.wikipedia.org/wiki/Naan#cite_note-9\">[9]</a>&nbsp;and has since become the normal English spelling.</p>', 'naan', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 06:05:48', '2021-06-18 06:05:48'),
(29, 2, 'Egg Poach', 'EggP1.jpg', 'eggpoach', '2', 'egggpoach', '<p>A poached egg is an egg that has been cooked, outside the shell, by poaching, as opposed to simmering or boiling. This method of preparation can yield more delicately cooked eggs than cooking at higher temperatures such as with boiling water.</p>', '<p>The egg is cracked into a cup or bowl of any size, and then gently slid into a pan of water at approximately 75&deg; C (167 &deg;F) and cooked until the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Egg_white\">egg white</a>&nbsp;has mostly solidified, but the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Yolk\">yolk</a>&nbsp;remains soft. The &quot;perfect&quot; poached egg has a runny yolk, with a hardening crust and no raw white remaining. In countries that mandate universal salmonella vaccination for hens, eating eggs with a runny yolk is perfectly safe.<a href=\"https://en.wikipedia.org/wiki/Poached_egg#cite_note-1\">[1]</a></p>\r\n\r\n<p>Broken into water at the poaching temperature, the white will cling to the yolk, resulting in cooked&nbsp;<a href=\"https://en.wikipedia.org/wiki/Egg_white\">egg white</a>&nbsp;and runny yolk.</p>\r\n\r\n<p>Any given chicken egg contains some egg white that is prone to dispersing into the poaching liquid and cooking into an undesirable foam. To prevent this, the egg can be strained beforehand to remove the thinner component of the egg white.<a href=\"https://en.wikipedia.org/wiki/Poached_egg#cite_note-2\">[2]</a>&nbsp;A small amount of vinegar may also be added to the water, as its acidic qualities accelerate the poaching process.<a href=\"https://en.wikipedia.org/wiki/Poached_egg#cite_note-3\">[3]</a>&nbsp;Stirring the water vigorously to create a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Vortex\">vortex</a>&nbsp;may also reduce dispersion.<a href=\"https://en.wikipedia.org/wiki/Poached_egg#cite_note-4\">[4]</a></p>', 'eggpoach', NULL, 'n/a', 'n/a', NULL, 1, 0, 0, 0, 0, 1, '2021-06-18 06:18:49', '2021-06-18 06:30:59'),
(30, 3, 'Milkshake', '1631848590.jpg', 'milkshake', '2', 'choco_milkshake', '<p>Place Of Origin:United States</p>\r\n\r\n<p>Imgredients:Milk,Ice-cream,Sweetners</p>', '<p>A&nbsp;<strong>milkshake</strong>&nbsp;(sometimes simply called a&nbsp;<strong>shake</strong>) is a sweet drink made by blending&nbsp;<a href=\"https://en.wikipedia.org/wiki/Milk\">milk</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ice_cream\">ice cream</a>, and flavorings or sweeteners such as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Butterscotch\">butterscotch</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Caramel\">caramel</a>&nbsp;sauce,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Chocolate_syrup\">chocolate syrup</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Fruit_syrup\">fruit syrup</a>, or whole&nbsp;<a href=\"https://en.wikipedia.org/wiki/Fruit\">fruit</a>&nbsp;into a thick, sweet, cold mixture. It may also be made using a base made from non-dairy products, including&nbsp;<a href=\"https://en.wikipedia.org/wiki/Plant_milk\">plant milks</a>&nbsp;such as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Almond_milk\">almond milk</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Coconut_milk\">coconut milk</a>, or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Soy_milk\">soy milk</a>.</p>\r\n\r\n<p>Milkshakes originated in the United States around the turn of the 20th century, and grew in popularity following the introduction of electric blenders in the subsequent two decades. They became a common part of youth popular culture, as ice cream shops were a culturally acceptable meeting place for youth, and milkshakes became symbolic of the innocence of youth.</p>', 'Milkshake, Liwer', NULL, NULL, 'N/A', NULL, NULL, 0, 0, 0, 0, 1, '2021-09-16 21:31:30', '2021-09-16 21:41:20'),
(31, 3, 'Lemonade', '1631848939.jpg', 'lemonade', '2', 'lemonade', '<p>Ingredients:Sugar,Lemon,Water</p>', '<p><strong>Lemonade</strong>&nbsp;is a sweetened&nbsp;<a href=\"https://en.wikipedia.org/wiki/Lemon\">lemon</a>-flavored&nbsp;<a href=\"https://en.wikipedia.org/wiki/Drink\">beverage</a>.</p>\r\n\r\n<p>There are varieties of lemonade found throughout the world.<a href=\"https://en.wikipedia.org/wiki/Lemonade#cite_note-1\">[1]</a>&nbsp;In North America and South Asia, cloudy lemonade dominates. It is traditionally a homemade drink using lemon juice, water, and a sweetener such as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Sugar\">cane sugar</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Simple_syrup\">simple syrup</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Honey\">honey</a>.<a href=\"https://en.wikipedia.org/wiki/Lemonade#cite_note-2\">[2]</a>&nbsp;In the United Kingdom and Australia, clear lemonade and yellow lemonade, a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Soft_drink\">carbonated</a>&nbsp;drink, is more common.<a href=\"https://en.wikipedia.org/wiki/Lemonade#cite_note-AlanaMuir-3\">[3]</a>[<em><a href=\"https://en.wikipedia.org/wiki/Wikipedia:Verifiability#Self-published_sources\">self-published source?</a></em>]&nbsp;Despite the differences between the drinks, each is known simply as &quot;lemonade&quot; in countries where it is dominant.<a href=\"https://en.wikipedia.org/wiki/Lemonade#cite_note-AlanaMuir-3\">[3]</a></p>\r\n\r\n<p>The suffix&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ade_(drink_suffix)\">&quot;-ade&quot;</a>&nbsp;may also be applied to other similar drinks made with different fruits, such as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Limeade\">limeade</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Orange_soft_drink\">orangeade</a>, or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Cherryade\">cherryade</a>.</p>', 'lemonade, Liwer', NULL, NULL, 'N/A', NULL, NULL, 0, 0, 0, 0, 1, '2021-09-16 21:37:19', '2021-09-16 21:41:11'),
(32, 4, 'Salad', '1631849521.jpg', 'salad', '3', 'salad', '<p>Ingredients:Meat,Grain,Fruits,Vegetables</p>', '<p>A&nbsp;<strong>salad</strong>&nbsp;is a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dish_(food)\">dish</a>&nbsp;consisting of mixed pieces of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Food\">food</a>, typically with at least one raw ingredient. They are often dressed, and typically served at room temperature or chilled, though some can be served warm.</p>\r\n\r\n<p><strong>Garden salads</strong>&nbsp;use a base of&nbsp;<a href=\"https://en.wikipedia.org/wiki/Leaf_vegetable\">leafy greens</a>&nbsp;such as&nbsp;<a href=\"https://en.wikipedia.org/wiki/Lettuce\">lettuce</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Eruca_sativa\">arugula/rocket</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Kale\">kale</a>&nbsp;or&nbsp;<a href=\"https://en.wikipedia.org/wiki/Spinach\">spinach</a>; they are common enough that the word&nbsp;<em>salad</em>&nbsp;alone often refers specifically to garden salads. Other types include&nbsp;<a href=\"https://en.wikipedia.org/wiki/Bean_salad\">bean salad</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Tuna_salad\">tuna salad</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Fattoush\">fattoush</a>,&nbsp;<a href=\"https://en.wikipedia.org/wiki/Greek_salad\">Greek salad</a>&nbsp;(vegetable-based, but without leafy greens), and&nbsp;<a href=\"https://en.wikipedia.org/wiki/S%C5%8Dmen_salad\">sōmen salad</a>&nbsp;(a noodle-based salad).</p>', 'Salad, Liwer', NULL, NULL, 'N/A', NULL, NULL, 0, 0, 0, 0, 1, '2021-09-16 21:47:01', '2021-09-16 21:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `products_attr`
--

CREATE TABLE `products_attr` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `attr_image` varchar(255) DEFAULT NULL,
  `mrp` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_attr`
--

INSERT INTO `products_attr` (`id`, `products_id`, `sku`, `attr_image`, `mrp`, `price`, `qty`, `size_id`, `color_id`) VALUES
(1, 1, '111', 'Pizza1.jpeg', 800, 600, 5, 0, 0),
(3, 2, '124', 'IceCream.jpeg', 300, 200, 3, 0, 0),
(4, 3, '116', 'Babka2.jpeg', 900, 850, 18, 0, 0),
(5, 4, '121', 'Cappuchino2.jpeg', 1071, 899, 5, 0, 0),
(11, 7, '300', NULL, 1700, 1400, 10, 0, 0),
(12, 8, '301', NULL, 700, 650, 10, 0, 0),
(13, 9, '302', NULL, 350, 300, 10, 0, 0),
(14, 10, '303', NULL, 1300, 1200, 10, 0, 0),
(15, 11, '304', NULL, 1500, 1300, 10, 0, 0),
(16, 12, '305', NULL, 700, 500, 10, 0, 0),
(17, 13, '306', NULL, 1200, 1000, 5, 0, 0),
(18, 14, '307', NULL, 1500, 1400, 5, 0, 0),
(19, 15, '308', NULL, 1300, 900, 5, 0, 0),
(20, 16, '309', NULL, 1500, 1300, 10, 0, 0),
(21, 17, '310', NULL, 700, 500, 10, 0, 0),
(22, 18, '311', NULL, 900, 700, 10, 0, 0),
(23, 19, '312', NULL, 1300, 1100, 10, 0, 0),
(24, 20, '313', NULL, 700, 300, 12, 0, 0),
(25, 21, '314', NULL, 1700, 1600, 10, 0, 0),
(26, 22, '315', NULL, 600, 300, 10, 0, 0),
(27, 23, '316', NULL, 700, 550, 5, 0, 0),
(28, 24, '317', NULL, 1500, 1300, 5, 0, 0),
(29, 25, '318', NULL, 950, 900, 10, 0, 0),
(30, 26, '319', NULL, 1300, 1150, 5, 0, 0),
(31, 27, '320', NULL, 350, 300, 12, 0, 0),
(32, 28, '321', NULL, 900, 850, 5, 0, 0),
(33, 29, '322', NULL, 900, 850, 7, 0, 0),
(34, 30, '323', NULL, 1200, 1000, 10, 0, 0),
(35, 31, '324', NULL, 500, 300, 10, 0, 0),
(36, 32, '325', NULL, 2200, 2000, 10, 0, 0),
(37, 33, '326', NULL, 4500, 4000, 10, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `products_id`, `images`) VALUES
(1, 1, 'Pizza1.jpeg'),
(7, 4, 'Cappuchino2.jpeg'),
(8, 3, 'Babka2.jpeg'),
(11, 7, 'Cheesecake2.jpeg'),
(12, 9, 'Brownies2.jpg'),
(13, 10, 'Hot2.jpg'),
(14, 11, 'Cannoli2.jpg'),
(15, 12, 'GulabJamun2.jpg'),
(16, 13, 'PitaBread2.jpg'),
(17, 14, 'Baguette2.jpg'),
(18, 15, 'NkneadBread2.jpg'),
(19, 16, 'PanCake2.jpg'),
(20, 17, 'Doughnut2.jpg'),
(21, 18, 'CDoughnut2.jpg'),
(22, 19, 'SBread2.jpg'),
(24, 21, 'Focaccia2.jpg'),
(25, 22, 'Frushi2.jpg'),
(26, 23, 'Oatmeal2.jpg'),
(27, 24, 'Waffles2.jpg'),
(28, 25, 'Shakshuka2.jpg'),
(29, 26, 'Guacamole2.jpg'),
(30, 27, 'Naan2.jpg'),
(32, 29, 'EggP2.jpg'),
(38, 30, '296477922.jpg'),
(39, 31, '872742505.jpg'),
(40, 32, '529880325.jpg'),
(41, 33, '350642293.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `rating` varchar(20) NOT NULL,
  `review` text NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_review`
--

INSERT INTO `product_review` (`id`, `customer_id`, `products_id`, `rating`, `review`, `status`, `added_on`) VALUES
(4, 36, 3, 'Very Good', 'hello', 1, '2021-09-17 04:05:22');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Small', 0, '2021-01-25 20:56:46', '2021-09-16 02:20:39'),
(2, 'Medium', 0, '2021-02-24 00:58:04', '2021-09-16 02:20:38'),
(3, 'Large', 0, '2021-02-24 00:58:08', '2021-09-16 02:20:37'),
(4, 'M', 0, '2021-02-24 00:58:13', '2021-06-17 00:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `taxs`
--

CREATE TABLE `taxs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxs`
--

INSERT INTO `taxs` (`id`, `tax_desc`, `tax_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VAT 13%', '13', 0, '2021-02-05 03:05:43', '2021-09-16 02:25:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_banners`
--
ALTER TABLE `home_banners`
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
-- Indexes for table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_status`
--
ALTER TABLE `orders_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_attr`
--
ALTER TABLE `products_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxs`
--
ALTER TABLE `taxs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `home_banners`
--
ALTER TABLE `home_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders_status`
--
ALTER TABLE `orders_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products_attr`
--
ALTER TABLE `products_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taxs`
--
ALTER TABLE `taxs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
