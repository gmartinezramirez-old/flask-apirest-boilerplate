-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Oct 17, 2017 at 12:05 PM
-- Server version: 5.5.38-0ubuntu0.12.04.1-log
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waynakay`
--

-- --------------------------------------------------------

--
-- Table structure for table `criterion_have_attribute`
--

CREATE TABLE `criterion_have_attribute` (
  `id` int(11) NOT NULL,
  `criterion_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `criterion_have_attribute`
--

INSERT INTO `criterion_have_attribute` (`id`, `criterion_id`, `attribute_id`, `weight`) VALUES
(1, 1, 1, 1),
(2, 1, 2, -1),
(3, 1, 3, 0),
(4, 1, 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `criterion_have_attribute`
--
ALTER TABLE `criterion_have_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criterion_id` (`criterion_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `criterion_have_attribute`
--
ALTER TABLE `criterion_have_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `criterion_have_attribute`
--
ALTER TABLE `criterion_have_attribute`
  ADD CONSTRAINT `criterion_have_attribute_ibfk_1` FOREIGN KEY (`criterion_id`) REFERENCES `criterion` (`id`),
  ADD CONSTRAINT `criterion_have_attribute_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
