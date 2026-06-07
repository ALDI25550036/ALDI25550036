-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2026 at 05:55 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `punya aldi`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `kd_kat` varchar(6) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `kd_kat`, `category_name`) VALUES
(10, 'K001', 'TELEVISI'),
(11, 'K002', 'AC'),
(12, 'K003', 'KULKAS'),
(13, 'K004', 'HANDPHONE'),
(14, 'K005', 'LAPTOP');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `stock` int DEFAULT '0',
  `min_stock` int DEFAULT '5',
  `price` int DEFAULT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_code`, `product_name`, `stock`, `min_stock`, `price`, `gambar`, `created_at`, `update_at`) VALUES
(21, 10, 'P001', 'SAMSUNG', 6, 7, 4000000, '760eed1338234b53d6742826b5460d0b.jpg', '2026-05-21 13:42:22', NULL),
(22, 10, 'P002', 'LG', 10, 13, 3000000, '4242f7b1b448e751eeed52560a9cac0c.jpg', '2026-05-21 13:43:48', NULL),
(23, 10, 'P003', 'SONY', 12, 10, 3500000, '3d90a83cef6b060fbb533277f6c3d500.jpg', '2026-05-21 13:46:02', NULL),
(24, 10, 'P004', 'TCL', 8, 11, 2400000, '2944d484fc39ea45b243f2b5de0e918b.jpg', '2026-05-21 13:47:12', NULL),
(25, 11, 'P005', 'DAIKIN', 12, 10, 3000000, 'd063a315b9f317870f2aa5e93c1a82af.jpg', '2026-05-21 13:51:14', NULL),
(26, 11, 'P006', 'PANASONIC', 6, 20, 2700000, '50760e1e9718d34cc691ef0e08775f79.jpg', '2026-05-21 13:54:01', NULL),
(27, 11, 'P007', 'SAMSUNG', 15, 11, 3500000, 'b2fafc0ba8fceb5074f058e3cc0a894a.jpg', '2026-05-21 13:56:18', NULL),
(28, 11, 'P008', 'GREE', 6, 10, 3000000, '52fe5ded5504fb08fcc92fcca425c4f5.jpg', '2026-05-21 13:57:25', NULL),
(29, 12, 'P009', 'SHARP', 13, 11, 5000000, '913103eb83153b7639597453efeb5300.jpg', '2026-05-21 13:59:55', NULL),
(30, 12, 'P010', 'SAMSUNG', 16, 10, 7500000, 'edd04f669a861c9f9827a8c1fb5638ae.jpg', '2026-05-21 14:00:59', NULL),
(31, 12, 'P011', 'LG', 7, 11, 6500000, '0cee64744087ac4605fcdcd6fc86a2f7.jpg', '2026-05-21 14:02:58', NULL),
(32, 12, 'P012', 'POLYTRON', 11, 15, 5000000, '6d500c267149e16b107d812daefdaf3a.jpg', '2026-05-21 14:04:17', NULL),
(33, 13, 'P013', 'SAMSUNG', 15, 20, 7500000, '99cd73c9204c8ccc4611640f0ac5a98a.jpg', '2026-05-21 14:06:33', NULL),
(34, 13, 'P014', 'APPLE', 12, 17, 9000000, '3be4deb9f990c29ab66f62a348aaa288.jpg', '2026-05-21 14:10:27', NULL),
(35, 13, 'P015', 'XIAOMI', 17, 22, 7000000, 'b04afef76d038943b20c136de7e415e0.jpg', '2026-05-21 14:12:05', NULL),
(36, 13, 'P016', 'OPPO', 18, 22, 7700000, 'a613be6022197ad36b1d3f39fb7c8266.jpg', '2026-05-21 14:13:38', NULL),
(37, 14, 'P017', 'ASUS', 12, 14, 15000000, '735449f1379418c0eee5b0075156801e.jpg', '2026-05-21 14:16:17', NULL),
(38, 14, 'P018', 'LENOVO', 10, 10, 14000000, '9286d647b54cd777df1d78ef4fdb437c.jpg', '2026-05-21 14:18:05', NULL),
(39, 14, 'P019', 'HP', 9, 14, 12000000, '134b8cc256463597b8c7fdc5c8bdf353.jpg', '2026-05-21 14:19:25', NULL),
(40, 14, 'P020', 'ACER', 8, 11, 12000000, '77f514ac2960acd17354e975a9c575d8.jpg', '2026-05-21 14:21:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_logs`
--

CREATE TABLE `stock_logs` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `change_type` enum('ADD','EDIT','REDUCE') DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `stock_before` int DEFAULT NULL,
  `stock_after` int DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_logs`
--

INSERT INTO `stock_logs` (`id`, `product_id`, `change_type`, `qty`, `stock_before`, `stock_after`, `note`, `created_at`, `created_by`) VALUES
(1, 26, 'REDUCE', 2, 10, 8, '', '2026-05-21 15:19:49', 2),
(2, 26, 'REDUCE', 2, 8, 6, '', '2026-05-21 15:20:09', 2),
(3, 38, 'REDUCE', 3, 13, 10, '', '2026-05-21 15:20:24', 2),
(4, 30, 'ADD', 3, 13, 16, '', '2026-05-21 15:21:17', 2),
(5, 21, 'ADD', 5, 1, 6, '', '2026-05-21 15:22:47', 2),
(6, 28, 'REDUCE', 2, 8, 6, '', '2026-05-21 15:23:11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','staff') DEFAULT 'staff',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `is_active`, `created_at`) VALUES
(2, 'AldiTunjungS', 'alditunjungs1818@gmail.com', '$2y$10$YEaeslF0WUUSQbqcoNY2guKWpg4/r.Gy.Lf8VeoywU/hU1jLQVw8e', 'admin', 1, '2026-05-15 07:55:40'),
(3, 'dea', 'dea@gmail.com', '$2y$10$SPZ7cwseFIGqG7V0Wy9nhOFAW3W3ihPohrxX1bJ7ImgbLzI84jqiu', 'admin', 1, '2026-05-15 07:57:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kd_kat` (`kd_kat`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_logs`
--
ALTER TABLE `stock_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `stock_logs`
--
ALTER TABLE `stock_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
