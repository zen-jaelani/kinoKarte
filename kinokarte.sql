-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 11, 2022 at 11:21 AM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kinokarte`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` varchar(50) NOT NULL,
  `userId` varchar(50) NOT NULL,
  `scheduleId` int NOT NULL,
  `dateBooking` date NOT NULL,
  `timeBooking` time NOT NULL,
  `totalTicket` int NOT NULL,
  `totalPayment` int NOT NULL,
  `paymentMethod` varchar(100) NOT NULL,
  `statusPayment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `statusUsed` enum('active','notActive') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'active',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `userId`, `scheduleId`, `dateBooking`, `timeBooking`, `totalTicket`, `totalPayment`, `paymentMethod`, `statusPayment`, `statusUsed`, `createdAt`, `updatedAt`) VALUES
('1', '1', 2, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'Success!', 'notActive', '2022-03-28 05:54:12', NULL),
('10', '1', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'notActive', '2022-04-04 02:45:50', '2022-04-08 17:00:00'),
('2', '2', 3, '2022-01-01', '09:00:00', 3, 50000, 'Paypal', 'Success!', 'notActive', '2022-03-28 05:56:33', NULL),
('3', '1', 3, '2022-01-01', '13:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-03-28 05:58:08', NULL),
('3042651e-8dcc-47fb-898b-29de59e694ad', '7', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', NULL, 'active', '2022-04-07 13:26:08', NULL),
('4', '2', 1, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-03-28 06:03:34', NULL),
('4d8733ff-6a68-4d26-9f98-ef0afa37f611', '7', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-04-07 09:08:44', NULL),
('5', '3', 2, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-02-28 06:23:34', NULL),
('55a3073b-eea3-4957-b917-4b34f5da993a', '40', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', NULL, 'active', '2022-04-07 13:35:49', NULL),
('6', '4', 1, '2022-01-01', '09:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-01-28 08:27:50', NULL),
('608f8a83-3de6-4744-98cc-46dc88baa8b5', '10', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', NULL, 'active', '2022-04-07 13:40:19', NULL),
('7', '3', 2, '2022-01-01', '13:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-04-28 08:28:53', NULL),
('8', '4', 4, '2022-01-01', '09:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-03-29 06:17:02', NULL),
('84e5de3c-7e18-4c49-a7e8-661df4abeb07', '7', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', NULL, 'active', '2022-04-07 13:29:19', NULL),
('9', '1', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-03-31 10:37:21', NULL),
('93e32f38-2c9a-4d7a-89b2-494c5aff94d3', '9', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', NULL, 'active', '2022-04-07 13:58:30', NULL),
('99a783c3-e3dd-46ac-afb2-d40ba294a493', '3', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-04-07 09:01:59', NULL),
('a7b26c9a-1e8e-4c69-9f0d-23267edf1a9f', '7', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', NULL, 'active', '2022-04-07 13:24:49', NULL),
('ae5d37bb-5bfd-4b88-bcd8-502c61881e2b', '7', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', NULL, 'active', '2022-04-07 13:23:40', NULL),
('da1709f2-d73a-405a-8c40-ac23321764b7', '7', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', NULL, 'active', '2022-04-07 13:27:42', NULL),
('f6807e8d-a1cb-4a6f-aa60-2d44c2ff28d4', '7', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', NULL, 'active', '2022-04-07 13:25:18', NULL),
('fbd7f609-2b7d-4056-82a7-c20b930e4f51', '7', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', NULL, 'active', '2022-04-07 13:22:30', NULL),
('fbec1d4b-3fca-4817-9ea8-0730b62a3c55', '9', 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-04-07 09:03:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookingSeat`
--

CREATE TABLE `bookingSeat` (
  `id` int NOT NULL,
  `bookingId` varchar(50) NOT NULL,
  `seat` varchar(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookingSeat`
--

INSERT INTO `bookingSeat` (`id`, `bookingId`, `seat`, `createdAt`, `updatedAt`) VALUES
(1, '1', 'A1', '2022-03-28 05:54:12', NULL),
(2, '1', 'A2', '2022-03-28 05:54:12', NULL),
(3, '2', 'A1', '2022-03-28 05:56:33', NULL),
(4, '2', 'A2', '2022-03-28 05:56:33', NULL),
(5, '2', 'A3', '2022-03-28 05:56:33', NULL),
(6, '3', 'A1', '2022-03-28 05:58:08', NULL),
(7, '3', 'A2', '2022-03-28 05:58:08', NULL),
(8, '3', 'A3', '2022-03-28 05:58:08', NULL),
(9, '4', 'A1', '2022-03-28 06:03:34', NULL),
(10, '4', 'A2', '2022-03-28 06:03:34', NULL),
(11, '4', 'A3', '2022-03-28 06:03:34', NULL),
(12, '5', 'A1', '2022-03-28 06:23:34', NULL),
(13, '5', 'A2', '2022-03-28 06:23:34', NULL),
(14, '5', 'A3', '2022-03-28 06:23:34', NULL),
(15, '6', 'A1', '2022-03-28 08:27:50', NULL),
(16, '6', 'A2', '2022-03-28 08:27:50', NULL),
(17, '6', 'A3', '2022-03-28 08:27:50', NULL),
(18, '7', 'A1', '2022-03-28 08:28:53', NULL),
(19, '7', 'A2', '2022-03-28 08:28:53', NULL),
(20, '7', 'A3', '2022-03-28 08:28:53', NULL),
(21, '8', 'A1', '2022-03-29 06:17:02', NULL),
(22, '8', 'A2', '2022-03-29 06:17:03', NULL),
(23, '8', 'A3', '2022-03-29 06:17:03', NULL),
(24, '9', 'A1', '2022-03-31 10:37:21', NULL),
(25, '9', 'A2', '2022-03-31 10:37:21', NULL),
(26, '9', 'A3', '2022-03-31 10:37:21', NULL),
(27, '10', 'A1', '2022-04-04 02:45:50', NULL),
(28, '10', 'A2', '2022-04-04 02:45:50', NULL),
(29, '10', 'A3', '2022-04-04 02:45:50', NULL),
(30, '4d8733ff-6a68-4d26-9f98-ef0afa37f611', 'A1', '2022-04-07 09:08:44', NULL),
(31, '4d8733ff-6a68-4d26-9f98-ef0afa37f611', 'A2', '2022-04-07 09:08:44', NULL),
(32, '4d8733ff-6a68-4d26-9f98-ef0afa37f611', 'A3', '2022-04-07 09:08:44', NULL),
(33, 'fbd7f609-2b7d-4056-82a7-c20b930e4f51', 'A1', '2022-04-07 13:22:30', NULL),
(34, 'fbd7f609-2b7d-4056-82a7-c20b930e4f51', 'A2', '2022-04-07 13:22:30', NULL),
(35, 'fbd7f609-2b7d-4056-82a7-c20b930e4f51', 'A3', '2022-04-07 13:22:30', NULL),
(36, 'ae5d37bb-5bfd-4b88-bcd8-502c61881e2b', 'A1', '2022-04-07 13:23:40', NULL),
(37, 'ae5d37bb-5bfd-4b88-bcd8-502c61881e2b', 'A2', '2022-04-07 13:23:40', NULL),
(38, 'ae5d37bb-5bfd-4b88-bcd8-502c61881e2b', 'A3', '2022-04-07 13:23:40', NULL),
(39, 'a7b26c9a-1e8e-4c69-9f0d-23267edf1a9f', 'A1', '2022-04-07 13:24:49', NULL),
(40, 'a7b26c9a-1e8e-4c69-9f0d-23267edf1a9f', 'A2', '2022-04-07 13:24:49', NULL),
(41, 'a7b26c9a-1e8e-4c69-9f0d-23267edf1a9f', 'A3', '2022-04-07 13:24:49', NULL),
(42, 'f6807e8d-a1cb-4a6f-aa60-2d44c2ff28d4', 'A1', '2022-04-07 13:25:18', NULL),
(43, 'f6807e8d-a1cb-4a6f-aa60-2d44c2ff28d4', 'A2', '2022-04-07 13:25:18', NULL),
(44, 'f6807e8d-a1cb-4a6f-aa60-2d44c2ff28d4', 'A3', '2022-04-07 13:25:18', NULL),
(45, '3042651e-8dcc-47fb-898b-29de59e694ad', 'A1', '2022-04-07 13:26:08', NULL),
(46, '3042651e-8dcc-47fb-898b-29de59e694ad', 'A2', '2022-04-07 13:26:08', NULL),
(47, '3042651e-8dcc-47fb-898b-29de59e694ad', 'A3', '2022-04-07 13:26:08', NULL),
(48, 'da1709f2-d73a-405a-8c40-ac23321764b7', 'A1', '2022-04-07 13:27:42', NULL),
(49, 'da1709f2-d73a-405a-8c40-ac23321764b7', 'A2', '2022-04-07 13:27:42', NULL),
(50, 'da1709f2-d73a-405a-8c40-ac23321764b7', 'A3', '2022-04-07 13:27:42', NULL),
(51, '84e5de3c-7e18-4c49-a7e8-661df4abeb07', 'A1', '2022-04-07 13:29:19', NULL),
(52, '84e5de3c-7e18-4c49-a7e8-661df4abeb07', 'A2', '2022-04-07 13:29:19', NULL),
(53, '84e5de3c-7e18-4c49-a7e8-661df4abeb07', 'A3', '2022-04-07 13:29:19', NULL),
(54, '55a3073b-eea3-4957-b917-4b34f5da993a', 'A1', '2022-04-07 13:35:49', NULL),
(55, '55a3073b-eea3-4957-b917-4b34f5da993a', 'A2', '2022-04-07 13:35:49', NULL),
(56, '55a3073b-eea3-4957-b917-4b34f5da993a', 'A3', '2022-04-07 13:35:49', NULL),
(57, '608f8a83-3de6-4744-98cc-46dc88baa8b5', 'A1', '2022-04-07 13:40:19', NULL),
(58, '608f8a83-3de6-4744-98cc-46dc88baa8b5', 'A2', '2022-04-07 13:40:19', NULL),
(59, '608f8a83-3de6-4744-98cc-46dc88baa8b5', 'A3', '2022-04-07 13:40:19', NULL),
(60, '93e32f38-2c9a-4d7a-89b2-494c5aff94d3', 'A1', '2022-04-07 13:58:30', NULL),
(61, '93e32f38-2c9a-4d7a-89b2-494c5aff94d3', 'A2', '2022-04-07 13:58:30', NULL),
(62, '93e32f38-2c9a-4d7a-89b2-494c5aff94d3', 'A3', '2022-04-07 13:58:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `releaseDate` date NOT NULL,
  `casts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `director` varchar(100) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `synopsis` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id`, `name`, `category`, `image`, `releaseDate`, `casts`, `director`, `duration`, `synopsis`, `createdAt`, `updatedAt`) VALUES
(1, 'Spiderman 1', 'Fantasy, Action', NULL, '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-26 01:37:26', NULL),
(2, 'Spiderman 2', 'Fantasy, Action', NULL, '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-24 07:26:00', NULL),
(3, 'Spiderman 3', 'Fantasy, Action', NULL, '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-24 07:26:05', NULL),
(4, 'Amazing Spiderman 1', 'Fantasy, Action', NULL, '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-24 07:26:25', NULL),
(5, 'Amazing Spiderman 2', 'Fantasy, Action', NULL, '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-24 07:26:31', NULL),
(11, 'Spiderman ( ͡° ͜ʖ ͡°) 1', 'Fantasy, Action', 'kinoKarte/movie/vutrrhefsqbrgofgln8l.jpeg', '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 4m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-30 07:34:20', '2022-04-04 08:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int NOT NULL,
  `movieId` int NOT NULL,
  `premiere` varchar(150) NOT NULL,
  `price` int NOT NULL,
  `location` varchar(100) NOT NULL,
  `dateStart` datetime NOT NULL,
  `dateEnd` datetime NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdAt` timestamp NOT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `movieId`, `premiere`, `price`, `location`, `dateStart`, `dateEnd`, `time`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Ebu.Id', 50000, 'Bogor', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2022-03-28 05:39:27', NULL),
(2, 2, 'Ebu.Id', 60000, 'Bali', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2022-03-28 05:40:08', NULL),
(3, 3, 'Ebu.Id', 70000, 'Jakarta', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2022-03-28 05:40:29', NULL),
(5, 3, 'Ebu.Id', 60000, 'Bali', '2022-01-01 00:00:00', '2022-02-01 00:00:00', '09:00,11:00,13:00', '2022-03-29 04:01:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `firstName` varchar(250) NOT NULL,
  `lastName` varchar(150) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `noTelp` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `status` enum('active','notActive') NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `image`, `noTelp`, `email`, `password`, `role`, `status`, `createdAt`, `updatedAt`) VALUES
('1', 'foo', 'Bar', NULL, '080808080808', 'foo@bar.com', 'fooBar', 'user', 'active', '2022-03-30 11:19:33', NULL),
('10', 'admin1', 'admin', NULL, '080808080808', 'admin1@admin.com', '$2b$10$bFvDlmeRthj9cGcHuWgoGeemwRe6cVHGyuEEreUU8TlFNH07bBrRa', 'user', 'notActive', '2022-04-01 09:16:38', NULL),
('2', 'Bar', 'foo', NULL, '080808080808', 'bar@foo.com', '$2b$10$bYaOCbqOVw0YejRZiNIb.uikDo0snW3TTgvQ31JD675wEJhTMNIdG', 'user', 'notActive', '2022-03-30 12:12:09', NULL),
('3', 'fooBar', 'barFoo', NULL, '12345678', 'foobar@barfoo.com', '$2b$10$qpQ4IxcD7QGiXAftqGkjEeq0LsrtGDYki7kladLv/QQJB9gGouC/W', 'admin', 'notActive', '2022-03-30 12:46:32', '2022-03-31 05:21:13'),
('31', 'yokano3596@yeafam.com', 'balomi4631@whwow.com', NULL, '080808080808', 'yokano3596@yeafam.com', '$2b$10$OS9AQbdlIzRUELOe6i3QVuxEOZz3yNuhWedvL.mVm9AX2QHLZ/Qty', 'user', 'active', '2022-04-03 01:46:03', NULL),
('34', 'kemida5262@xasems.com', 'balomi4631@whwow.com', NULL, '080808080808', 'kemida5262@xasems.com', '$2b$10$gq2cKknEO1sAcaHfrk0cCOxeNxmrisD.bPZlmWVFdBpXJgcHVTDUe', 'user', 'notActive', '2022-04-03 09:27:24', NULL),
('35', 'laxej43043@vsooc.com', 'balomi4631@whwow.com', NULL, '080808080808', 'laxej43043@vsooc.com', '$2b$10$Rc260U/puwfldOCAGPXmGeA/Hvh1ahsjUkJ7Dp7a.TMBhm6jT4PLu', 'user', 'notActive', '2022-04-03 09:32:12', NULL),
('36', 'ferod62691@xasems.com', 'balomi4631@whwow.com', NULL, '080808080808', 'ferod62691@xasems.com', '$2b$10$LAMi1/9B36OgSqbLn2/Pv.ZY1zTAla03ErlqwQsFR4ANgDnFCnp3S', 'user', 'active', '2022-04-03 09:38:48', '2022-04-04 01:17:55'),
('37', 'fooBar', 'barFoo', 'kinoKarte/user/pkuyeoozcapjljuihcft.jpeg', '12345678', 'podeken905@yeafam.com', '$2b$10$nETeRJuZYSQxvbFPA1z1lepJ.K8kKaIkvBacJ4DB2nIMipV9V/2uS', 'admin', 'active', '2022-04-04 08:32:12', '2022-04-04 08:43:56'),
('38', 'favexo9630@whwow.com', 'balomi4631@whwow.com', NULL, '080808080808', 'favexo9630@whwow.com', '$2b$10$eTN8ASkBwX6NzavVG3gbrub/jBAg5BATwV/4.7fJnb4edP/vezZNK', 'user', 'active', '2022-04-05 03:29:44', NULL),
('39', 'favexo9630@whwow.com', 'balomi4631@whwow.com', NULL, '080808080808', 'vegeni7485@xasems.com', '$2b$10$eVkNfj2gYzEb5wcC.3ysOuVMTakWScMyHdOukV4yamVXILqR6qToO', 'user', 'active', '2022-04-05 03:39:02', NULL),
('4', 'fooBar', 'barFoo', NULL, '12345678', 'user@user.user', '$2b$10$xE85KBnPQ2kWAQRO6DXaWeyF4h0V.iXWbYVzrCyYMhHBnX4pm.nDm', 'user', 'notActive', '2022-03-30 12:55:37', '2022-03-31 07:42:14'),
('40', 'favexo9630@whwow.com', 'balomi4631@whwow.com', NULL, '080808080808', 'hovegac656@yeafam.com', '$2b$10$ohUvOb/69esms2hIBxq8t.P2ug64kowCwO7xWU5Yn0ZLZOs9tYvvq', 'user', 'notActive', '2022-04-06 06:48:58', NULL),
('41', 'woyoce1704@yeafam.com', 'balomi4631@whwow.com', NULL, '080808080808', 'woyoce1704@yeafam.com', '$2b$10$q1hKay8D/ujjrXLO4FUXKOme8EAKCjAB19zO3jg2zpwtA/9ftRkAa', 'user', 'active', '2022-04-06 07:51:13', NULL),
('42', 'woyoce1704@yeafam.com', 'balomi4631@whwow.com', NULL, '080808080808', 'rofala5031@xasems.com', '$2b$10$mx9yb/jB6WE5gH66h/up.O2XDcm9liwfM7hTOyr7iqv2/Vskuoozm', 'user', 'active', '2022-04-06 12:56:25', NULL),
('43', 'woyoce1704@yeafam.com', 'balomi4631@whwow.com', NULL, '080808080808', 'loniv40945@vsooc.com', '$2b$10$mm8sBsmgZJNZMUqJ7vA6R.PZhV.L0OLH9klfrbXVumhogLMWyivsy', 'user', 'active', '2022-04-07 00:32:08', NULL),
('5', 'user1', 'user1', NULL, '080808080808', 'user1@user.user', '$2b$10$RJ.lt3g0t1zDA.qEijGCeuiWwRL2mRVjVwBK8JwcbOshmE5mM.KJC', 'user', 'notActive', '2022-03-30 13:20:12', NULL),
('6', 'user2', 'user2', 'kinoKarte/user/fbeei1hazvib8554cna1', '080808080808', 'user2@user.user', '$2b$10$kp05CylOBrvmv1tda8ikN.wEjj0prKU7.XVCodnsJBJGjFR1WNhFO', 'user', 'notActive', '2022-03-30 14:27:48', NULL),
('7', 'user3', 'user', 'kinoKarte/user/op1zvkxpqmpqxs1vkufr', '080808080808', 'user3@user.user', '$2b$10$Z638XTB3pPhHZ1qk07aBSOZyQ2qSCJ7xtCF/VjNMtVT.wwV7j5h1u', 'user', 'notActive', '2022-03-31 13:08:50', NULL),
('8', 'user3', 'user1', 'kinoKarte/user/e5o7fswzbd1f1wubd0mu', '080808080808', 'user3@user1.user', '$2b$10$7dQTjTiP0UkrvuHGgJucb.wwfqcPn6JeONLUefTCyrtORJpQvWhP6', 'user', 'notActive', '2022-03-31 13:12:52', NULL),
('9', 'fooBar', 'barFoo', 'kinoKarte/user/f1fcoxe49su6l9hkkfgk.jpeg', '12345678', 'admin@admin.com', '$2b$10$nIQbNd1Y94L9jGaRQWugQeVf0zEF328WzO7jchf1TD3dqs/Oj6Ndi', 'admin', 'notActive', '2022-04-01 01:47:51', '2022-04-05 03:36:48'),
('ff4f3589-1fcc-48e8-8f5a-447d9eb4bd61', 'woyoce1704@yeafam.com', 'balomi4631@whwow.com', NULL, '080808080808', 'losisa7934@vsooc.com', '$2b$10$zmh/YNeLRpdIbJNUJYusv.dfdD9Wtkzy6rDX.5CYsbL8qObqgU5P6', 'user', 'active', '2022-04-07 08:54:52', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookingSeat`
--
ALTER TABLE `bookingSeat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookingSeat`
--
ALTER TABLE `bookingSeat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
