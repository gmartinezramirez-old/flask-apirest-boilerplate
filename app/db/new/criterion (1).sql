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
-- Table structure for table `criterion`
--

CREATE TABLE `criterion` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `template_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `criterion`
--

INSERT INTO `criterion` (`id`, `name`, `value`, `template_id`) VALUES
(1, 'Criterio 1', 10, 1),
(2, 'Criterio 2', 10, 1),
(3, 'Criterio 3', 100, 2),
(4, 'Criterio 4', 20, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `criterion`
--
ALTER TABLE `criterion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `criterion`
--
ALTER TABLE `criterion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `criterion`
--
ALTER TABLE `criterion`
  ADD CONSTRAINT `criterion_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
