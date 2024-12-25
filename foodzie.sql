-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2024 at 09:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodzie`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(2, 'AdminPao', '$2y$10$QmOwUeUIqErnKjxj3S2Z/ep061OlFPnyM64vP7hAKhmCR6XlpZywm'),
(3, 'Malo', '$2y$10$kBqtWmiKjVt5Y7sLIOJ9c.OUbWSR/xABAmC8FEJv3pvvYY2gU3knS');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(12, 8, 2, 1),
(45, 11, 13, 1),
(46, 11, 3, 1),
(47, 11, 2, 1),
(48, 12, 5, 1),
(50, 12, 14, 4),
(56, 13, 15, 2),
(61, 10, 2, 4),
(62, 10, 3, 1),
(63, 9, 3, 1),
(64, 9, 2, 3),
(65, 9, 1, 2),
(66, 14, 5, 1),
(67, 14, 11, 3),
(68, 14, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_ids` text NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_ids`, `total_price`, `created_at`, `status`) VALUES
(18, 10, '2', 240.00, '2024-12-15 19:16:25', 'Completed'),
(19, 11, '1,11', 250.00, '2024-12-15 21:05:03', 'Completed'),
(20, 11, '2,11', 220.00, '2024-12-15 21:38:26', 'Completed'),
(21, 11, '2,3', 420.00, '2024-12-16 05:51:46', 'Completed'),
(22, 11, '1,5', 250.00, '2024-12-16 05:53:13', 'pending'),
(23, 11, '4,5,11', 280.00, '2024-12-16 05:56:54', 'pending'),
(24, 11, '3,2,1', 570.00, '2024-12-16 06:06:35', 'pending'),
(25, 11, '5,11', 200.00, '2024-12-16 06:14:21', 'pending'),
(26, 11, '13,3,2', 520.00, '2024-12-16 07:59:49', 'pending'),
(27, 12, '5,14', 500.00, '2024-12-16 09:02:21', 'pending'),
(28, 13, '2,3', 540.00, '2024-12-16 09:23:44', 'pending'),
(29, 13, '3,5,11', 1100.00, '2024-12-16 09:26:29', 'pending'),
(30, 13, '3,5,11', 1100.00, '2024-12-16 09:27:33', 'pending'),
(31, 13, '15', 99999999.99, '2024-12-16 09:33:01', 'pending'),
(32, 10, '1,2,3,5', 820.00, '2024-12-21 10:42:43', 'pending'),
(33, 10, '2,3', 420.00, '2024-12-21 10:49:21', 'Completed'),
(34, 10, '2,3', 420.00, '2024-12-21 11:12:03', 'Completed'),
(35, 10, '2,3', 420.00, '2024-12-21 11:25:18', 'pending'),
(36, 9, '3,2,1', 570.00, '2024-12-21 11:35:45', 'pending'),
(37, 9, '3,2,1', 840.00, '2024-12-21 11:52:26', 'pending'),
(38, 8, '2', 120.00, '2024-12-25 08:35:55', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `created_at`) VALUES
(1, 'Adobo', 'A popular Filipino dish made with chicken or pork in a tangy soy sauce and vinegar marinade.', 150.00, 'product_675f24ce16d812.80829722.jpg', '2024-12-08 12:02:40'),
(2, 'Sinigang na balls', 'A sour soup made with tamarind and filled with vegetables and meat.', 120.00, 'product_675f2bbb8f5761.39448851.jpg', '2024-12-08 12:02:40'),
(3, 'Lechon', 'Crispy roasted pork with tender meat inside.', 300.00, 'product_675f2be897a7c5.07203048.jpg', '2024-12-08 12:02:40'),
(4, 'Halo-Halo', 'A refreshing dessert made with shaved ice, milk, and various toppings.', 80.00, 'product_675f2c0432d981.39325124.jpg', '2024-12-08 12:02:40'),
(5, 'Pancit', 'Stir-fried noodles mixed with vegetables and meat.', 100.00, 'product_675f2c33aa8a14.32770934.jpg', '2024-12-08 12:02:40'),
(11, 'Chicken Pastil', 'Chicken Pastil is a Filipino Muslim dish that is made with white steamed rice and topped with seasoned shredded chicken.', 100.00, 'product_675f233e81a684.89882000.jpg', '2024-12-15 18:43:10'),
(13, 'Tinolang Knorr Cubes', 'ah basta tanga si padre damaso', 100.00, 'product_675fc60ba33ca4.63500435.jpg', '2024-12-16 06:17:47'),
(14, 'Tinolang Knorr Cubes', 'ah basta tanga si padre damaso', 100.00, 'product_675fdad9088833.78536170.jpg', '2024-12-16 07:46:33'),
(15, 'ube halaya', 'bagong pilipinas bagong mukha', 99999999.99, 'product_675ff3a9338c54.51154784.jpg', '2024-12-16 09:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `name`, `profile_picture`) VALUES
(8, '', 'beefy9009@gmail.com', '$2y$10$2QwLgpGjAODwzYqJmHl06e.IIe7TulNKbwtwirkFtGuVkLrfIwIZG', '2024-12-10 04:02:30', 'beefman', NULL),
(9, '', 'seronnium@gmail.com', '$2y$10$hOGOzQCZ9Wqa0z2jY4COQuQsrYuyIwG4Gp8ReRR89WMJYD.BvmoHq', '2024-12-15 12:32:45', 'Jhon Seron', NULL),
(10, 'bornik', 'seronescueta@gmail.com', '$2y$10$P./3UX16qZizvZPpYZ5b7OodkFVS8KOXiUzg3/Pg9ZP9uE162QsQ.', '2024-12-15 19:14:36', 'jhon seron', NULL),
(11, 'downsinroom', 'paorichardPOGI@gmail.com', '$2y$10$fq7joEY0mG3OIaEC4pB.TuX/ENjRuQfZBB3fzcIGcqno7/j7KGvqu', '2024-12-15 19:32:40', 'Paolo Richard', 'uploads/Corazon_Aquino_1986.jpg'),
(12, 'ringgo', 'hehe@gmail.com', '$2y$10$UNWeoVAxGCPIC0vFnDuHReSz4.AmUYlYOBtCTktsw1JPYiCnqwRvq', '2024-12-16 09:01:00', 'apple pie', 'uploads/000_Hkg7952529_2016_11_24_14_59_06.jpg'),
(13, 'yey', 'sereon@gmail.com', '$2y$10$FRCNl3ibp.ZLEfgZpdpETuEih89Qe4.2LJ0w0B9p3uzt1CNhls4Ra', '2024-12-16 09:21:12', 'jahdahsg', 'uploads/000_Hkg7952529_2016_11_24_14_59_06.jpg'),
(14, 'bazooka', 'mrbazooka2025@gmail.com', '$2y$10$HtV9q9TmhWIXl.SIiWbXkOaudawf8yrni2pV5A70bWRAsqWKyGE0q', '2024-12-25 08:18:01', 'bazookaman', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
