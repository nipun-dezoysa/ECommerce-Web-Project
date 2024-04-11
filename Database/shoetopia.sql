-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2024 at 04:08 PM
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
-- Database: `shoetopia`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id` int(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id`, `Email`, `Password`) VALUES
(1, 'sanjeewa@gmail.com', '4321');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `cid` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `ccode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`cid`, `pid`, `ccode`) VALUES
(1, 11, 'red'),
(2, 11, 'eff'),
(3, 12, 'erf'),
(4, 12, 'dsds'),
(5, 12, 'dfef');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `discount` int(10) NOT NULL,
  `sizes` varchar(100) NOT NULL,
  `colors` varchar(100) NOT NULL,
  `img01` varchar(150) NOT NULL,
  `img02` varchar(150) NOT NULL,
  `img03` varchar(150) NOT NULL,
  `img04` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Id`, `name`, `description`, `brand`, `price`, `discount`, `sizes`, `colors`, `img01`, `img02`, `img03`, `img04`) VALUES
(4, 'BataX', 'abc def xyz', 'weaves', 2700, 10, '[red, black]', '[15, 16, 17]', 'WhatsApp Image 2024-04-07 at 10.33.49.jpeg', 'null', 'null', 'null'),
(5, 'sas', 'dsdsds', 'xdwsd', 314516, 10, '[red, black]', '[20, 26]', 'WhatsApp Image 2024-04-07 at 10.33.49.jpeg', 'null', 'null', 'null'),
(6, 'abb', 'sdsds', 'scsc', 314516, 2, '[ds, dse]', '[20, 23, 24]', 'fdf.png', 'null', 'null', 'null'),
(7, 'sas', 'deded', 'xdwsd', 314516, 2, '[de, edwf]', '[20, 30]', 'fdf.png', 'null', 'null', 'null'),
(8, 'ddd', 'ddd', 'ddd', 2700, 10, '[fdd, dfd]', '[20, 30, 40]', 'fdf.png', 'null', 'null', 'null'),
(9, 'ddd', 'ddd', 'ddd', 314516, 2, '[red,sda]', '[20]', 'fdf (1).png', 'null', 'null', 'null'),
(10, 'ddss', 'ddss', 'ddss', 314516, 2, '[esd]', '[20, 30, 40]', 'fdf (1).png', 'null', 'null', 'null'),
(11, 'ffee', 'ffee', 'ffee', 2700, 2, '[red, eff]', '[20, 30]', 'fdf.png', 'null', 'null', 'null'),
(12, 'rrff', 'efafaef', 'rrff', 314516, 2, '[erf, dsds, dfef]', '[12, 13, 75]', 'fdf (1).png', 'null', 'null', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `sid` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `size` int(100) NOT NULL,
  `availability` int(1) NOT NULL,
  `type` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`sid`, `pid`, `size`, `availability`, `type`) VALUES
(20, 5, 0, 1, 1),
(30, 10, 0, 1, 1),
(40, 10, 0, 1, 1),
(41, 12, 12, 1, 1),
(42, 12, 13, 1, 1),
(43, 12, 75, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `Email`, `Password`) VALUES
(1, 'abc.@gmail.com', '1234'),
(2, 'abc2.@gmail.com', '1234'),
(3, 'vpssanjeewa@gmail.com', '5566'),
(4, 'vpssanjeewa@gmail.com', '1122'),
(5, 'vpssanjeewa@gmail.com', '1234'),
(6, 'yo123@gmail.com', 'ss1122'),
(7, 'abc2.@gmail.com', '5656'),
(8, 'yo11123@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `cid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `sid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sizes`
--
ALTER TABLE `sizes`
  ADD CONSTRAINT `sizes_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `products` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
