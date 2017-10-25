-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Oct 23, 2017 at 06:46 PM
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
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `title` varchar(80) DEFAULT NULL,
  `required` int(11) DEFAULT NULL,
  `selected` int(11) DEFAULT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `template_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `title`, `required`, `selected`, `createdAt`, `description`, `template_id`) VALUES
(1, 'primera convocatoria', 300, 345, 1000, 'llamado a primera convocatoria', 1),
(2, 'segunda convocatoria', 660, 245, 1000000, 'llamado a segunda convocatoria', 1),
(3, 'tercera convocatoria', 6600, 5450, 2147483647, 'llamado a tercera convocatoria', 2),
(4, 'cuarta convocatoria', 3000, 2450, 5151000, 'llamado a segunda convocatoria', 2),
(5, 'quinta convocatoria', 6200, 4410, 100012412, 'llamado a tercera convocatoria', 3);

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `originalattribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `name`, `originalattribute_id`) VALUES
(1, 'atributo 1', 1),
(2, 'Problema respiratorio', 1),
(3, 'Problema sangineo', 2),
(4, 'Problema cardiaco', 2),
(5, 'Operacion', 2),
(6, 'Otra enfermedad', 3),
(7, 'Participaciones previas', 3),
(8, 'Medicamento contradictorio', 4),
(9, 'Tratamiento psicologico', 4);

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

-- --------------------------------------------------------

--
-- Table structure for table `criterion_have_attribute`
--

CREATE TABLE `criterion_have_attribute` (
  `criterion_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `criterion_have_attribute`
--

INSERT INTO `criterion_have_attribute` (`criterion_id`, `attribute_id`) VALUES
(1, 1),
(1, 5),
(3, 5),
(2, 6),
(2, 7),
(1, 8),
(2, 8),
(3, 9),
(4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `originalattribute`
--

CREATE TABLE `originalattribute` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `originalattribute`
--

INSERT INTO `originalattribute` (`id`, `name`) VALUES
(1, 'o1'),
(2, 'o2'),
(3, 'o3'),
(4, 'o4');

-- --------------------------------------------------------

--
-- Table structure for table `participation`
--

CREATE TABLE `participation` (
  `announcement_id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`) VALUES
(1, 't1'),
(2, 't2'),
(3, 't3'),
(4, 't4'),
(5, 't5');

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

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `id` int(11) NOT NULL,
  `volunteer_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) NOT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `originalattribute_id` (`originalattribute_id`);

--
-- Indexes for table `criterion`
--
ALTER TABLE `criterion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `criterion_have_attribute`
--
ALTER TABLE `criterion_have_attribute`
  ADD PRIMARY KEY (`criterion_id`,`attribute_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `originalattribute`
--
ALTER TABLE `originalattribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participation`
--
ALTER TABLE `participation`
  ADD PRIMARY KEY (`announcement_id`,`volunteer_id`),
  ADD KEY `volunteer_id` (`volunteer_id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_have_attribute`
--
ALTER TABLE `template_have_attribute`
  ADD PRIMARY KEY (`template_id`,`attribute_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`id`,`attribute_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `criterion`
--
ALTER TABLE `criterion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `originalattribute`
--
ALTER TABLE `originalattribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`);

--
-- Constraints for table `attribute`
--
ALTER TABLE `attribute`
  ADD CONSTRAINT `attribute_ibfk_1` FOREIGN KEY (`originalattribute_id`) REFERENCES `originalattribute` (`id`);

--
-- Constraints for table `criterion`
--
ALTER TABLE `criterion`
  ADD CONSTRAINT `criterion_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`);

--
-- Constraints for table `criterion_have_attribute`
--
ALTER TABLE `criterion_have_attribute`
  ADD CONSTRAINT `criterion_have_attribute_ibfk_1` FOREIGN KEY (`criterion_id`) REFERENCES `criterion` (`id`),
  ADD CONSTRAINT `criterion_have_attribute_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Constraints for table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcement` (`id`),
  ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`id`);

--
-- Constraints for table `template_have_attribute`
--
ALTER TABLE `template_have_attribute`
  ADD CONSTRAINT `template_have_attribute_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`),
  ADD CONSTRAINT `template_have_attribute_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Constraints for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD CONSTRAINT `volunteer_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
