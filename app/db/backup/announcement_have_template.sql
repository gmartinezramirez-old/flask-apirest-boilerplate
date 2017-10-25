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
-- Table structure for table `announcement_have_template`
--

CREATE TABLE `announcement_have_template` (
  `id` int(11) NOT NULL,
  `announcement_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `announcement_have_template`
--

INSERT INTO `announcement_have_template` (`id`, `announcement_id`, `template_id`, `value`) VALUES
(1, 1, 1, 12),
(2, 2, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement_have_template`
--
ALTER TABLE `announcement_have_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_id` (`announcement_id`),
  ADD KEY `template_id` (`template_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement_have_template`
--
ALTER TABLE `announcement_have_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement_have_template`
--
ALTER TABLE `announcement_have_template`
  ADD CONSTRAINT `announcement_have_template_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcement` (`id`),
  ADD CONSTRAINT `announcement_have_template_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
