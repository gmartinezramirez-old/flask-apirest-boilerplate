-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Oct 23, 2017 at 03:24 PM
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
-- Table structure for table `template_have_attribute`
--

CREATE TABLE `template_have_attribute` (
  `template_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template_have_attribute`
--

INSERT INTO `template_have_attribute` (`template_id`, `attribute_id`) VALUES
(1, 1),
(5, 2),
(4, 4),
(1, 5),
(2, 5),
(3, 6),
(3, 7),
(1, 8),
(2, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `template_have_attribute`
--
ALTER TABLE `template_have_attribute`
  ADD PRIMARY KEY (`template_id`,`attribute_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `template_have_attribute`
--
ALTER TABLE `template_have_attribute`
  ADD CONSTRAINT `template_have_attribute_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`),
  ADD CONSTRAINT `template_have_attribute_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
