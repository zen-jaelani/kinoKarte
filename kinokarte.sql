-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 04, 2022 at 10:32 AM
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
  `id` int NOT NULL,
  `userId` int NOT NULL,
  `scheduleId` int NOT NULL,
  `dateBooking` date NOT NULL,
  `timeBooking` time NOT NULL,
  `totalTicket` int NOT NULL,
  `totalPayment` int NOT NULL,
  `paymentMethod` varchar(100) NOT NULL,
  `statusPayment` varchar(100) NOT NULL,
  `statusUsed` enum('active','notActive') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'active',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `userId`, `scheduleId`, `dateBooking`, `timeBooking`, `totalTicket`, `totalPayment`, `paymentMethod`, `statusPayment`, `statusUsed`, `createdAt`, `updatedAt`) VALUES
(1, 1, 2, '2022-01-01', '09:00:00', 2, 50000, 'Paypal', 'Success!', 'active', '2022-03-28 05:54:12', NULL),
(2, 2, 3, '2022-01-01', '09:00:00', 3, 50000, 'Paypal', 'Success!', 'notActive', '2022-03-28 05:56:33', NULL),
(3, 1, 3, '2022-01-01', '13:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-03-28 05:58:08', NULL),
(4, 2, 1, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-03-28 06:03:34', NULL),
(5, 3, 2, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-02-28 06:23:34', NULL),
(6, 4, 1, '2022-01-01', '09:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-01-28 08:27:50', NULL),
(7, 3, 2, '2022-01-01', '13:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-04-28 08:28:53', NULL),
(8, 4, 4, '2022-01-01', '09:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-03-29 06:17:02', NULL),
(9, 1, 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-03-31 10:37:21', NULL),
(10, 1, 4, '2022-01-01', '11:00:00', 3, 50000, 'Paypal', 'Success!', 'active', '2022-04-04 02:45:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookingSeat`
--

CREATE TABLE `bookingSeat` (
  `id` int NOT NULL,
  `bookingId` int NOT NULL,
  `seat` varchar(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookingSeat`
--

INSERT INTO `bookingSeat` (`id`, `bookingId`, `seat`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'A1', '2022-03-28 05:54:12', NULL),
(2, 1, 'A2', '2022-03-28 05:54:12', NULL),
(3, 2, 'A1', '2022-03-28 05:56:33', NULL),
(4, 2, 'A2', '2022-03-28 05:56:33', NULL),
(5, 2, 'A3', '2022-03-28 05:56:33', NULL),
(6, 3, 'A1', '2022-03-28 05:58:08', NULL),
(7, 3, 'A2', '2022-03-28 05:58:08', NULL),
(8, 3, 'A3', '2022-03-28 05:58:08', NULL),
(9, 4, 'A1', '2022-03-28 06:03:34', NULL),
(10, 4, 'A2', '2022-03-28 06:03:34', NULL),
(11, 4, 'A3', '2022-03-28 06:03:34', NULL),
(12, 5, 'A1', '2022-03-28 06:23:34', NULL),
(13, 5, 'A2', '2022-03-28 06:23:34', NULL),
(14, 5, 'A3', '2022-03-28 06:23:34', NULL),
(15, 6, 'A1', '2022-03-28 08:27:50', NULL),
(16, 6, 'A2', '2022-03-28 08:27:50', NULL),
(17, 6, 'A3', '2022-03-28 08:27:50', NULL),
(18, 7, 'A1', '2022-03-28 08:28:53', NULL),
(19, 7, 'A2', '2022-03-28 08:28:53', NULL),
(20, 7, 'A3', '2022-03-28 08:28:53', NULL),
(21, 8, 'A1', '2022-03-29 06:17:02', NULL),
(22, 8, 'A2', '2022-03-29 06:17:03', NULL),
(23, 8, 'A3', '2022-03-29 06:17:03', NULL),
(24, 9, 'A1', '2022-03-31 10:37:21', NULL),
(25, 9, 'A2', '2022-03-31 10:37:21', NULL),
(26, 9, 'A3', '2022-03-31 10:37:21', NULL),
(27, 10, 'A1', '2022-04-04 02:45:50', NULL),
(28, 10, 'A2', '2022-04-04 02:45:50', NULL),
(29, 10, 'A3', '2022-04-04 02:45:50', NULL);

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
(6, 'Spiderman ( ͡° ͜ʖ ͡°) 1', 'Fantasy, Action', 'kinoKarte/movie/ajnhatg2dmajwtzsw2ca.png', '2022-05-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 4m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-24 07:26:34', '2022-04-01 08:44:45'),
(10, 'SpiderWoman', 'Fantasy, Action', NULL, '2022-06-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-30 06:34:25', NULL),
(11, 'SpiderWoman 2', 'Fantasy, Action', NULL, '2022-06-22', 'Tobey Maguire, Kirten Dunst', 'Sam Raimi', '2h 1m', 'After being bitten by a genetically altered spider at Oscorp, nerdy but endearing high school student Peter Parker is endowed with amazing powers to become the superhero known as Spider-Man.', '2022-03-30 07:34:20', NULL);

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
  `id` int NOT NULL,
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
(1, 'foo', 'Bar', NULL, '080808080808', 'foo@bar.com', 'fooBar', 'user', 'notActive', '2022-03-30 11:19:33', NULL),
(2, 'Bar', 'foo', NULL, '080808080808', 'bar@foo.com', '$2b$10$bYaOCbqOVw0YejRZiNIb.uikDo0snW3TTgvQ31JD675wEJhTMNIdG', 'user', 'notActive', '2022-03-30 12:12:09', NULL),
(3, 'fooBar', 'barFoo', NULL, '12345678', 'foobar@barfoo.com', '$2b$10$qpQ4IxcD7QGiXAftqGkjEeq0LsrtGDYki7kladLv/QQJB9gGouC/W', 'admin', 'notActive', '2022-03-30 12:46:32', '2022-03-31 05:21:13'),
(4, 'fooBar', 'barFoo', NULL, '12345678', 'user@user.user', '$2b$10$xE85KBnPQ2kWAQRO6DXaWeyF4h0V.iXWbYVzrCyYMhHBnX4pm.nDm', 'user', 'notActive', '2022-03-30 12:55:37', '2022-03-31 07:42:14'),
(5, 'user1', 'user1', NULL, '080808080808', 'user1@user.user', '$2b$10$RJ.lt3g0t1zDA.qEijGCeuiWwRL2mRVjVwBK8JwcbOshmE5mM.KJC', 'user', 'notActive', '2022-03-30 13:20:12', NULL),
(6, 'user2', 'user2', 'kinoKarte/user/fbeei1hazvib8554cna1', '080808080808', 'user2@user.user', '$2b$10$kp05CylOBrvmv1tda8ikN.wEjj0prKU7.XVCodnsJBJGjFR1WNhFO', 'user', 'notActive', '2022-03-30 14:27:48', NULL),
(7, 'user3', 'user', 'kinoKarte/user/op1zvkxpqmpqxs1vkufr', '080808080808', 'user3@user.user', '$2b$10$Z638XTB3pPhHZ1qk07aBSOZyQ2qSCJ7xtCF/VjNMtVT.wwV7j5h1u', 'user', 'notActive', '2022-03-31 13:08:50', NULL),
(8, 'user3', 'user1', 'kinoKarte/user/e5o7fswzbd1f1wubd0mu', '080808080808', 'user3@user1.user', '$2b$10$7dQTjTiP0UkrvuHGgJucb.wwfqcPn6JeONLUefTCyrtORJpQvWhP6', 'user', 'notActive', '2022-03-31 13:12:52', NULL),
(9, 'admin', 'admin', 'kinoKarte/user/l4bqfygqz4yeo3l9obbq.jpeg', '080808080808', 'admin@admin.com', '$2b$10$054M/Mw0HmebFlfBKFRgzOPzsd9cvh.pDQIpxl7vCa9lN4WZi77/m', 'admin', 'notActive', '2022-04-01 01:47:51', NULL),
(10, 'admin1', 'admin', NULL, '080808080808', 'admin1@admin.com', '$2b$10$bFvDlmeRthj9cGcHuWgoGeemwRe6cVHGyuEEreUU8TlFNH07bBrRa', 'user', 'notActive', '2022-04-01 09:16:38', NULL),
(31, 'yokano3596@yeafam.com', 'balomi4631@whwow.com', NULL, '080808080808', 'yokano3596@yeafam.com', '$2b$10$OS9AQbdlIzRUELOe6i3QVuxEOZz3yNuhWedvL.mVm9AX2QHLZ/Qty', 'user', 'active', '2022-04-03 01:46:03', NULL),
(34, 'kemida5262@xasems.com', 'balomi4631@whwow.com', NULL, '080808080808', 'kemida5262@xasems.com', '$2b$10$gq2cKknEO1sAcaHfrk0cCOxeNxmrisD.bPZlmWVFdBpXJgcHVTDUe', 'user', 'notActive', '2022-04-03 09:27:24', NULL),
(35, 'laxej43043@vsooc.com', 'balomi4631@whwow.com', NULL, '080808080808', 'laxej43043@vsooc.com', '$2b$10$Rc260U/puwfldOCAGPXmGeA/Hvh1ahsjUkJ7Dp7a.TMBhm6jT4PLu', 'user', 'notActive', '2022-04-03 09:32:12', NULL),
(36, 'ferod62691@xasems.com', 'balomi4631@whwow.com', NULL, '080808080808', 'ferod62691@xasems.com', '$2b$10$LAMi1/9B36OgSqbLn2/Pv.ZY1zTAla03ErlqwQsFR4ANgDnFCnp3S', 'user', 'active', '2022-04-03 09:38:48', '2022-04-04 01:17:55');

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
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bookingSeat`
--
ALTER TABLE `bookingSeat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
