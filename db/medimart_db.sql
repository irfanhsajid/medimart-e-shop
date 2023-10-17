-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2023 at 10:15 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medimart_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(3, 'IrfanHSajid', '7c4a8d09ca3762af61e59520943dc26494f8941b');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(44, 2, 1, 'burger-1', 12, 1, 'burger-1.png'),
(48, 3, 1, 'MBBS First Year Book', 119, 1, 'medimart_e-shop_flowchart.png'),
(64, 4, 6, 'Gynocology MBBS 3rd Year', 130, 1, 'attachment_33527091.jfif'),
(65, 4, 9, 'Blue Approne', 300, 1, 'ot blue.jpg'),
(80, 8, 6, 'Pediatrics MBBS 2nd Year', 130, 1, 'book3.jpg'),
(84, 15, 6, 'Pediatrics MBBS 2nd Year', 130, 1, 'book3.jpg'),
(85, 16, 6, 'Pediatrics MBBS 2nd Year', 130, 1, 'book3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(1, 4, 'Irfan', 'irfanhsajid@gmail.com', '01324555', 'Please improve your delivery system');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(19, 4, 'Irfan', '0183786376', 'irfanhsajid2@gmail.com', 'cash on delivery', ', , shibpur, Dhaka, Dhaka, , Bangladesh - 1229', 'Approne Green (200 x 4) - ', 800, '2023-09-28', 'pending'),
(20, 4, 'Irfan', '0183786376', 'irfanhsajid2@gmail.com', 'online Payment', '2, 2, shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'MBBS First Year Book (119 x 3) - MBBS 2nd Year Book (300 x 1) - Blue Approne (300 x 1) - ', 957, '2023-09-28', 'completed'),
(21, 4, 'Irfan', '0183786376', 'irfanhsajid2@gmail.com', 'cash on delivery', '2, 2, shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'MBBS 3rd Year Book (129 x 1) - Blue Approne (300 x 1) - ', 429, '2023-09-28', 'pending'),
(22, 4, 'Irfan', '0183786376', 'irfanhsajid2@gmail.com', 'online Payment', '2, 2, shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'MBBS  BioTechnology (130 x 3) - Approne Green (200 x 6) - MBBS 3rd Year Book (129 x 3) - ', 1977, '2023-09-28', 'completed'),
(23, 4, 'Irfan', '0183786376', 'irfanhsajid2@gmail.com', 'cash on delivery', '2, 2, shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'MBBS 3rd Year Book (129 x 1) - Gynocology MBBS 3rd Year (130 x 3) - ', 519, '2023-09-29', 'pending'),
(24, 5, 'Irfan', '12735654', 'irfanul.sajid@northsouth.edu', 'cash on delivery', '2B, 185, shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'Gynocology MBBS 3rd Year (130 x 3) - Approne Green (200 x 2) - MBBS 2nd Year Book (300 x 1) - ', 1090, '2023-10-03', 'pending'),
(25, 5, 'Irfan', '12735654', 'irfanul.sajid@northsouth.edu', 'online Payment', '2B, 185, shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'MBBS First Year Book (119 x 4) - ', 476, '2023-10-03', 'completed'),
(26, 5, 'Irfan', '12735654', 'irfanul.sajid@northsouth.edu', 'online Payment', '2B, 185, shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'Gynocology MBBS 3rd Year (130 x 3) - ', 390, '2023-10-03', 'pending'),
(27, 5, 'Irfan', '12735654', 'irfanul.sajid@northsouth.edu', 'online Payment', '2B, 185, shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'Pediatrics MBBS 2nd Year (130 x 1) - Approne Green (200 x 6) - ', 1330, '2023-10-04', 'pending'),
(28, 5, 'Irfan', '12735654', 'irfanul.sajid@northsouth.edu', 'online Payment', '2B, 185, shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'Pediatrics MBBS 2nd Year (130 x 3) - ', 390, '2023-10-08', 'pending'),
(31, 12, 'Irfan', '0132439263', 'irfanhsajid@gmail.com', 'online Payment', ', , shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'Pediatrics MBBS 2nd Year (130 x 3) - MBBS First Year Book (119 x 4) - ', 866, '2023-10-17', 'completed'),
(32, 12, 'Irfan', '0132439263', 'irfanhsajid@gmail.com', 'online Payment', ', , shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229', 'Pediatrics MBBS 2nd Year (130 x 1) - ', 130, '2023-10-17', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`) VALUES
(1, 'MBBS First Year Book', 'used', 119, 'book2.jpeg'),
(6, 'Pediatrics MBBS 2nd Year', 'new', 130, 'book3.jpg'),
(7, 'Approne Green', 'new', 200, 'ot dress.jpg'),
(8, 'MBBS 2nd Year Book', 'used', 300, 'book3.jpg'),
(9, 'Blue Approne', 'new', 300, 'ot blue.jpg'),
(10, 'MBBS 3rd Year Book', 'used', 129, 'book2.jpeg'),
(11, 'Stethoscope', 'new', 200, 'img1.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`) VALUES
(5, 'Irfan', 'irfanul.sajid@northsouth.edu', '12735654', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2B, 185, shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229'),
(6, 'testuser', 'testuser@gmail.com', '937373211', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2b, AB, Dhaka, Narsingdi, shibpur, , Bangladesh - 123'),
(7, 'Habib', 'habib@gmail.com', '1234568', '8cb2237d0679ca88db6464eac60da96345513964', ''),
(8, 'test7', 'sjd4@gmail.com', '345543', '8cb2237d0679ca88db6464eac60da96345513964', ''),
(9, 'Habib5', 'cofee@gmail.com', '123457953', '8cb2237d0679ca88db6464eac60da96345513964', ''),
(10, 'xavi', 'xavi@gmail.com', '24363456', '8cb2237d0679ca88db6464eac60da96345513964', ''),
(14, 'Jamila', 'jamil@gmail.com', '1243282563', 'e039bddcccd034f3f88d1cef3823bc0a6f4fb2ac', ''),
(16, 'Irfan', 'irfanhsajid@gmail.com', '0122345383', 'd12f14157c21b39cc8cc257dc5662f34217524f9', ', , shibpur, Dhaka, Dhaka, Dhaka, Bangladesh - 1229');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
