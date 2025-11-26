-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2025 at 06:42 PM
-- Server version: 8.0.44-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abdulla_newdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `id` int NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` tinytext NOT NULL,
  `phone` varchar(11) NOT NULL,
  `blocked` int NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `username`, `password`, `email`, `phone`, `blocked`, `active`) VALUES
(19, 'vozezace', 'Pa$$w0rd!', 'pozeky@mailinator.com', 'jezogyna', 0, 0),
(24, 'zitut', '', 'vamulih@mailinator.com', 'daxyracyd', 0, 0),
(28, 'hatun', 'Pa$$w0rd!', 'gurozaqo@mailinator.com', 'nusehexar', 0, 0),
(31, 'abdtest_1', '1234', 'abd@gmail.com', '9876543210', 0, 0),
(65, 'mubane', 'Pa$$w0rd!', 'xuketygos@mailinator.com', 'pitugus', 0, 0),
(69, 'jujigus', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', 'diqicokyxu@mailinator.com', 'cywinyx', 0, 0),
(70, 'dyxygumosa', 'f0c9b1321717c87ebaec785eb64ae5d1', 'medibanada@mailinator.com', 'horezymasi', 0, 0),
(71, 'test', '1b3a7d4aa5e13fb4526268b9cc7e5c49', 'admin@gmail.com', '94771843745', 0, 0),
(73, 'admin', '1b3a7d4aa5e13fb4526268b9cc7e5c49', 'admin@gmail.com', '0123456789', 0, 0),
(74, 'admin', '7ef21b95d423159012fe74662c8b5a6a', 'admin@gmail.com', '0123456789', 0, 0),
(75, 'wavodyde', 'af357afc4c99a696e10148af0879d723', 'sojitekif@mailinator.com', 'jybijekyk', 0, 0),
(77, 'admin123', '7ef21b95d423159012fe74662c8b5a6a', 'admin@gmail.com', '4771843745', 0, 0),
(79, 'admin321', 'af357afc4c99a696e10148af0879d723', 'admin@gmail.com', '0123456789', 0, 0),
(80, 'admin12', 'af357afc4c99a696e10148af0879d723', 'admin@gmail.com', '0788531384', 0, 0),
(81, 'admin41', 'af357afc4c99a696e10148af0879d723', 'admin@gmail.com', '4771843745', 0, 0),
(82, 'gyqitiqim', '$2y$09$vwgcuu1cuU/8rABipP9GQOJEhmkqsCDCuXwaWQjnAjighU/eHAf5u', 'pobyxi@mailinator.com', 'mabadoc', 0, 0),
(84, 'abdullah', '$2y$09$xiUz5mvLXvgPeOU5xmNNReZpU7THmZdKX.ZAMGipizWVVj4vUcfb6', 'admin@gmail.com', '0788531384', 0, 0),
(85, 'heruw', '$2y$09$t8xkIsUN4ntSm02JPaZWy.v0wBzOgJBlYJjr5RsQOS0iJvzIfmlHm', 'qevibu@mailinator.com', 'jysazab', 0, 0),
(87, 'test01', '$2y$09$w6sJ.5H24i5dcdRMC46fiu5XH/CIytfKjrYSK4/MoZb/CPpmFTW5O', 'test@gmail.com', '0788531384', 0, 0),
(88, 'kymovuxak', '$2y$09$fpW7yHLEKNgdvTcxJ4XDRu0CQTN..9XDeVmH2uW3rdqjSapFBd8lu', 'capyza@mailinator.com', 'genyka', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `bio` longtext NOT NULL,
  `avatar` varchar(1024) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `dob` date DEFAULT NULL,
  `instagram` varchar(1024) DEFAULT NULL,
  `twitter` varchar(1024) DEFAULT NULL,
  `facebook` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `bio`, `avatar`, `firstname`, `lastname`, `dob`, `instagram`, `twitter`, `facebook`) VALUES
(84, 'This is my new bio set at, Hi ', 'admin avatar', 'first admin', 'last asd', NULL, NULL, NULL, 'https://facebook.com/abdullah'),
(84, 'This is my new bio set at, Hi ', 'admin avatar', 'first admin', 'last asd', NULL, NULL, NULL, 'https://facebook.com/abdullah'),
(84, 'This is my new bio set at, Hi ', 'avatar', 'abdullah', 'new', NULL, NULL, NULL, 'https://facebook.com/abdullah'),
(87, 'This is my new bio set at/test01', 'avatar', 'firstnameasd', 'lastnameasd', NULL, NULL, NULL, 'https://facebook.com/test01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`password`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD KEY `auth_users` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `auth_users` FOREIGN KEY (`id`) REFERENCES `auth` (`id`) ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
