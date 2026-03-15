-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2026 at 10:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `comment`, `created_at`) VALUES
(3, 10, 'a', 'a', '2026-02-25 16:52:12'),
(5, 11, '1', 'as', '2026-02-25 17:15:11'),
(6, 11, 'admin', 'Admin comment.', '2026-02-25 17:15:46'),
(7, 10, 'admin', 'Admin comment without redirection.', '2026-02-25 17:17:28'),
(8, 10, 'Random', 'Logged out user without redirection.', '2026-02-25 17:17:49'),
(9, 20, 'admin', 'More comments in the last entries in page 2.', '2026-02-25 19:05:24'),
(10, 20, 'Α', 'Περισσότερα σχόλια στις τελευταίες δύο εισόδους στη δεύτερη σελίδα.', '2026-02-25 19:05:56'),
(11, 20, '1', 'こんにちは', '2026-02-25 19:07:02'),
(12, 20, 'admin', 'Η σελιδοποίηση έχει άπειρο περιθώριο. Απλά, έκανα 10 posts.', '2026-02-25 21:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `created_at`, `user_id`) VALUES
(10, 'aa', 'aa', '2026-02-25 16:50:54', 2),
(11, 'Another Post', 'blah blahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblahblah', '2026-02-25 17:06:29', 2),
(13, '3', '3', '2026-02-25 18:56:39', 2),
(14, '4', '4', '2026-02-25 18:56:45', 2),
(15, '5', '5', '2026-02-25 18:56:49', 2),
(16, '6', '6', '2026-02-25 18:56:53', 2),
(17, '7', '7', '2026-02-25 18:56:58', 2),
(18, '8', '8', '2026-02-25 18:57:06', 2),
(19, '9', '9', '2026-02-25 18:57:12', 2),
(20, '10', '10', '2026-02-25 18:57:22', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(2, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin'),
(8, '1', '$2y$10$sbWfwG8uWYYDOjX9SpR15.9CoMWLBFJyvEXHE6.em/1AIdd3wfzNe', 'user'),
(9, '2', '$2y$10$Z9cT7MPm5q8HDPZojoTcaObeK/tyf3.SpXcIu96z//YktgLd/Via.', 'user'),
(10, '3', '$2y$10$GhgC2hfPcAvKJD7tQDaOnuZ//Zfjm0ZrwWrQ2QlxSD0MUVTOrCMRy', 'user'),
(11, 'admin2', '$2y$10$ENkWgLsA37qsLDqziAkz0u6D9SCpNKFcjDPj4xUCfFTtsiRcTu3XW', 'admin'),
(12, 'admin3', '$2y$10$RQxGY9kqlks5gzjUH7bTt.DTd9QjEKIzYa7TDw1DSMBdtA/EfmpQq', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comments_posts` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_posts_users` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_posts` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `database2`
--
CREATE DATABASE IF NOT EXISTS `database2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `database2`;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `first_name` varchar(254) DEFAULT NULL,
  `last_name` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `first_name`, `last_name`, `email`, `department`) VALUES
(1, 'nikos', 'papas', 'nikosp@gmail.com', 'Nomiki'),
(2, 'nikos', 'georgiou', 'nikosg@gmail.com', 'IT'),
(3, 'giorgos', 'kottakis', 'giorgosk@hotmail.com', 'Oikonimiko'),
(4, 'dimitris', 'pappas', 'dimitrisp@datamail.com', 'Nomiki'),
(5, 'dimitris', 'konstantinou', 'jim_kon@hotmail.com', 'Oikonomiko'),
(6, 'giorgos', 'dedos', 'dedos_george.com', 'Nomiki');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `database_user`
--
CREATE DATABASE IF NOT EXISTS `database_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `database_user`;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(254) DEFAULT NULL,
  `last_name` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `user_password` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `email`, `user_password`) VALUES
(1, 'nikos', 'papas', 'nikpap', 'nikosp@gmail.com', 'nikos1234'),
(2, 'nikos', 'georgiou', 'nikgeo', 'nikosg@gmail.com', 'nik1234'),
(3, 'giorgos', 'kottakis', 'giokot', 'giorgosk@hotmail.com', 'giorgos1234'),
(4, 'dimitris', 'pappas', 'dimpap', 'dimitrisp@datamail.com', 'dimitris1234'),
(5, 'dimitris', 'konstantinou', 'dimkon', 'jim_kon@hotmail.com', 'dimitris1234'),
(6, 'giorgos', 'dedos', 'gioded', 'dedos_george.com', 'giorgos1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `erpsystem`
--
CREATE DATABASE IF NOT EXISTS `erpsystem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `erpsystem`;

-- --------------------------------------------------------

--
-- Table structure for table `category_rel_product`
--

CREATE TABLE `category_rel_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_rel_product`
--

INSERT INTO `category_rel_product` (`product_id`, `category_id`) VALUES
(1, 3),
(2, 4),
(3, 1),
(4, 5),
(5, 5),
(6, 4),
(7, 2),
(8, 5),
(9, 7),
(10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `afm` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`, `afm`, `address`, `country`) VALUES
(1, 'Tech Innovations Ltd.', 'contact@techinnovations.com', '123-456-7890', 123456789, '123 Tech Park, Silicon Valley', 'USA'),
(2, 'Green Solutions Inc.', 'info@greensolutions.com', '987-654-3210', 987654321, '789 Green St, New York', 'USA'),
(3, 'Aegean Goods Ltd.', 'sales@aegeangoods.com', '210-123-4567', 210123456, '45 Athens St, Athens', 'Greece'),
(4, 'Creative Designs GmbH', 'kontakt@creativedesigns.de', '030-123456', 301234561, '88 Berliner Str., Berlin', 'Germany'),
(5, 'Prime Construction Ltd.', 'office@primeconstruction.com', '456-789-0123', 456789012, '303 Build St, Los Angeles', 'USA'),
(6, 'Eco Energy GmbH', 'info@ecoenergy.de', '040-876543', 408765432, '100 Wind Ave, Hamburg', 'Germany'),
(7, 'Global IT Services S.A.', 'support@globalit.gr', '2310-765432', 231076543, '150 Tech Blvd, Thessaloniki', 'Greece'),
(8, 'Healthy Foods Inc.', 'info@healthyfoods.com', '789-012-3456', 789012345, '606 Fresh Ave, Miami', 'USA'),
(9, 'Dynamic Motors AG', 'verkauf@dynamicmotors.de', '069-987654', 699876514, '500 Auto Str., Frankfurt', 'Germany'),
(10, 'Quantum Investments S.A.', 'office@quantuminvestments.gr', '210-654321', 210654321, '101 Finance St, Piraeus', 'Greece'),
(11, 'New Tech Ventures', 'contact@newtechventures.com', '555-123-4567', 123457890, '123 Athens Drive, Athens, Ohio', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(1, 'Human Resources'),
(2, 'Sales'),
(3, 'Customer Support'),
(4, 'Marketing'),
(5, 'Finance'),
(6, 'Logistics');

-- --------------------------------------------------------

--
-- Table structure for table `department_rel_employee`
--

CREATE TABLE `department_rel_employee` (
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department_rel_employee`
--

INSERT INTO `department_rel_employee` (`employee_id`, `department_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 4),
(8, 1),
(9, 2),
(10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `hire_date`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2022-12-01'),
(3, 'Michael', 'Brown', 'michael.brown@example.com', '2023-02-20'),
(4, 'Lisa', 'White', 'lisa.white@example.com', '2023-03-05'),
(5, 'Mark', 'Jones', 'mark.jones@example.com', '2023-01-10'),
(6, 'Emily', 'Davis', 'emily.davis@example.com', '2023-04-15'),
(7, 'Anna', 'Miller', 'anna.miller@example.com', '2023-05-21'),
(8, 'James', 'Wilson', 'james.wilson@example.com', '2022-11-30'),
(9, 'Laura', 'Moore', 'laura.moore@example.com', '2023-01-20'),
(10, 'Robert', 'Taylor', 'robert.taylor@example.com', '2022-12-15');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `status` enum('Pending','Shipped','Delivered','Cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `status`) VALUES
(1, 1, '2023-10-01', 'Pending'),
(2, 2, '2023-10-02', 'Shipped'),
(3, 3, '2023-10-03', 'Delivered'),
(4, 4, '2023-10-04', 'Cancelled'),
(5, 5, '2023-10-05', 'Pending'),
(6, 6, '2023-10-06', 'Shipped'),
(7, 7, '2023-10-07', 'Delivered'),
(8, 8, '2023-10-08', 'Cancelled'),
(9, 9, '2023-10-09', 'Pending'),
(10, 10, '2023-10-10', 'Shipped');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT 0.00,
  `discount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_details_id`, `order_id`, `product_id`, `quantity`, `price`, `total_cost`, `discount`) VALUES
(1, 1, 1, 1, 1200.00, 0.00, 0.00),
(2, 2, 2, 1, 800.00, 0.00, 0.00),
(3, 3, 3, 1, 300.00, 0.00, 0.00),
(4, 4, 4, 1, 100.00, 0.00, 0.00),
(5, 5, 5, 1, 50.00, 0.00, 0.00),
(6, 6, 6, 1, 600.00, 0.00, 0.00),
(7, 7, 7, 1, 200.00, 0.00, 0.00),
(8, 8, 8, 1, 80.00, 0.00, 0.00),
(9, 9, 9, 1, 150.00, 0.00, 0.00),
(10, 10, 10, 1, 90.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Monitor', 300.00),
(4, 'Keyboard', 100.00),
(5, 'Mouse', 50.00),
(6, 'Tablet', 600.00),
(7, 'Printer', 200.00),
(8, 'Webcam', 80.00),
(9, 'Headphones', 150.00),
(10, 'External Hard Drive', 90.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`category_id`, `category_name`) VALUES
(1, 'Electronics'),
(2, 'Office Supplies'),
(3, 'Computers'),
(4, 'Mobile Devices'),
(5, 'Accessories'),
(6, 'Storage Solutions'),
(7, 'Audio Equipment'),
(8, 'Networking'),
(9, 'Software'),
(10, 'Furniture');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_rel_product`
--
ALTER TABLE `category_rel_product`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `afm` (`afm`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `department_rel_employee`
--
ALTER TABLE `department_rel_employee`
  ADD PRIMARY KEY (`employee_id`,`department_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_rel_product`
--
ALTER TABLE `category_rel_product`
  ADD CONSTRAINT `category_rel_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `category_rel_product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`category_id`);

--
-- Constraints for table `department_rel_employee`
--
ALTER TABLE `department_rel_employee`
  ADD CONSTRAINT `department_rel_employee_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `department_rel_employee_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
--
-- Database: `erpsystem_exercise`
--
CREATE DATABASE IF NOT EXISTS `erpsystem_exercise` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `erpsystem_exercise`;

-- --------------------------------------------------------

--
-- Table structure for table `category_rel_product`
--

CREATE TABLE `category_rel_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_rel_product`
--

INSERT INTO `category_rel_product` (`product_id`, `category_id`) VALUES
(1, 3),
(2, 4),
(3, 1),
(4, 5),
(5, 5),
(6, 4),
(7, 2),
(8, 5),
(9, 7),
(10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `afm` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `country_abbreviation` varchar(255) DEFAULT NULL,
  `customer_status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `phone`, `afm`, `address`, `country`, `country_abbreviation`, `customer_status`) VALUES
(1, 'Tech Innovations Ltd.', 'contact@techinnovations.com.usa', '123-456-7890', 123456789, '123 Tech Park, Silicon Valley', 'USA', 'USA', 'Inactive'),
(2, 'Green Solutions Inc.', 'info@greensolutions.com.usa', '987-654-3210', 987654321, '789 Green St, New York', 'USA', 'USA', 'Inactive'),
(3, 'Aegean Goods Ltd.', 'sales@aegeangoods.com.gre', '210-123-4567', 210123456, '45 Athens St, Athens', 'Greece', 'GRE', 'Inactive'),
(4, 'Creative Designs GmbH', 'kontakt@creativedesigns.de.ger', '030-123456', 301234561, '88 Berliner Str., Berlin', 'Germany', 'GER', 'Inactive'),
(5, 'Prime Construction Ltd.', 'office@primeconstruction.com.usa', '456-789-0123', 456789012, '303 Build St, Los Angeles', 'USA', 'USA', 'Inactive'),
(6, 'Eco Energy GmbH', 'info@ecoenergy.de.ger', '040-876543', 408765432, '100 Wind Ave, Hamburg', 'Germany', 'GER', 'Active'),
(7, 'Global IT Services S.A.', 'support@globalit.gr.gre', '2310-765432', 231076543, '150 Tech Blvd, Thessaloniki', 'Greece', 'GRE', 'Active'),
(8, 'Healthy Foods Inc.', 'info@healthyfoods.com.usa', '789-012-3456', 789012345, '606 Fresh Ave, Miami', 'USA', 'USA', 'Inactive'),
(9, 'Dynamic Motors AG', 'verkauf@dynamicmotors.de.ger', '069-987654', 699876514, '500 Auto Str., Frankfurt', 'Germany', 'GER', 'Active'),
(10, 'Quantum Investments S.A.', 'office@quantuminvestments.gr.gre', '210-654321', 210654321, '101 Finance St, Piraeus', 'Greece', 'GRE', 'Active'),
(11, 'New Tech Ventures', 'contact@newtechventures.com.usa', '555-123-4567', 123457890, '123 Athens Drive, Athens, Ohio', 'USA', 'USA', 'Inactive'),
(12, 'Lockheed Martin', 'lmd@lockheed.com.usa', '458943279', 408765431, 'Bethesda, Maryland, United States', 'USA', 'USA', 'Inactive'),
(13, 'AMD', 'amd@gmail.com.usa', '548975012', 210654322, 'Santa Clara, California, United States', 'USA', 'USA', 'Inactive'),
(14, 'Airbus', 'airbus@gmail.com.net', '897452468', 699876518, 'Leiden, Netherlands', 'Netherlands', 'NET', 'Active'),
(15, 'LVMH', 'lvmh@gmail.com.fra', '789452148', 122310765, 'Paris, France', 'France', 'FRA', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(1, 'Human Resources'),
(2, 'Sales'),
(3, 'Customer Support'),
(4, 'Marketing'),
(5, 'Finance'),
(6, 'Logistics');

-- --------------------------------------------------------

--
-- Table structure for table `department_rel_employee`
--

CREATE TABLE `department_rel_employee` (
  `employee_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department_rel_employee`
--

INSERT INTO `department_rel_employee` (`employee_id`, `department_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 4),
(8, 1),
(9, 2),
(10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `hire_date`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '2023-01-15'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '2022-12-01'),
(3, 'Michael', 'Brown', 'michael.brown@example.com', '2023-02-20'),
(4, 'Lisa', 'White', 'lisa.white@example.com', '2023-03-05'),
(5, 'Mark', 'Jones', 'mark.jones@example.com', '2023-01-10'),
(6, 'Emily', 'Davis', 'emily.davis@example.com', '2023-04-15'),
(7, 'Anna', 'Miller', 'anna.miller@example.com', '2023-05-21'),
(8, 'James', 'Wilson', 'james.wilson@example.com', '2022-11-30'),
(9, 'Laura', 'Moore', 'laura.moore@example.com', '2023-01-20'),
(10, 'Robert', 'Taylor', 'robert.taylor@example.com', '2022-12-15');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `status` enum('Pending','Shipped','Delivered','Cancelled') DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `status`, `total_cost`) VALUES
(1, 1, '2023-10-01', 'Pending', 0.00),
(2, 2, '2023-10-02', 'Shipped', 0.00),
(3, 2, '2023-10-02', 'Pending', 0.00),
(4, 2, '2023-10-02', 'Delivered', 0.00),
(5, 3, '2023-10-03', 'Delivered', 0.00),
(6, 4, '2023-10-04', 'Cancelled', 0.00),
(7, 4, '2023-10-04', 'Delivered', 0.00),
(8, 5, '2023-10-05', 'Pending', 0.00),
(9, 6, '2023-10-06', 'Shipped', 0.00),
(10, 7, '2023-10-07', 'Delivered', 0.00),
(11, 7, '2023-10-08', 'Delivered', 0.00),
(12, 8, '2023-10-08', 'Cancelled', 0.00),
(13, 9, '2023-10-09', 'Pending', 0.00),
(14, 9, '2023-10-09', 'Pending', 0.00),
(15, 10, '2023-10-10', 'Shipped', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_details_id`, `order_id`, `product_id`, `quantity`, `price`, `total_cost`, `discount`) VALUES
(1, 1, 1, 1, 1200.00, NULL, 0.30),
(2, 2, 2, 1, 800.00, NULL, 0.20),
(3, 3, 3, 1, 300.00, NULL, 0.00),
(4, 4, 4, 1, 100.00, NULL, 0.00),
(5, 5, 5, 1, 50.00, NULL, 0.00),
(6, 6, 6, 1, 602.00, NULL, 0.10),
(7, 7, 7, 1, 200.00, NULL, 0.00),
(8, 8, 8, 1, 80.00, NULL, 0.00),
(9, 9, 9, 1, 150.00, NULL, 0.00),
(10, 10, 10, 1, 90.00, NULL, 0.00),
(11, 11, 3, 2, 150.00, NULL, 0.00),
(12, 12, 6, 1, 301.00, NULL, 0.10);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Monitor', 300.00),
(4, 'Keyboard', 100.00),
(5, 'Mouse', 50.00),
(6, 'Tablet', 600.00),
(7, 'Printer', 200.00),
(8, 'Webcam', 80.00),
(9, 'Headphones', 150.00),
(10, 'External Hard Drive', 90.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`category_id`, `category_name`) VALUES
(1, 'Electronics'),
(2, 'Office Supplies'),
(3, 'Computers'),
(4, 'Mobile Devices'),
(5, 'Accessories'),
(6, 'Storage Solutions'),
(7, 'Audio Equipment'),
(8, 'Networking'),
(9, 'Software'),
(10, 'Furniture');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_rel_product`
--
ALTER TABLE `category_rel_product`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `afm` (`afm`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `department_rel_employee`
--
ALTER TABLE `department_rel_employee`
  ADD PRIMARY KEY (`employee_id`,`department_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_rel_product`
--
ALTER TABLE `category_rel_product`
  ADD CONSTRAINT `category_rel_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `category_rel_product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`category_id`);

--
-- Constraints for table `department_rel_employee`
--
ALTER TABLE `department_rel_employee`
  ADD CONSTRAINT `department_rel_employee_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `department_rel_employee_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"database_user\",\"table\":\"user\"},{\"db\":\"erpsystem\",\"table\":\"products\"},{\"db\":\"erpsystem_exercise\",\"table\":\"customers\"},{\"db\":\"erpsystem_exercise\",\"table\":\"order_details\"},{\"db\":\"erpsystem_exercise\",\"table\":\"orders\"},{\"db\":\"erpsystem\",\"table\":\"order_details\"},{\"db\":\"erpsystem_exercise\",\"table\":\"products\"},{\"db\":\"erpsystem\",\"table\":\"orders\"},{\"db\":\"erpsystem\",\"table\":\"customers\"},{\"db\":\"erpsystem\",\"table\":\"employees\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-02-02 19:42:24', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
