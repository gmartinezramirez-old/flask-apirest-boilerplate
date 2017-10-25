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
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `name`) VALUES
(15, 'Actividad fisica'),
(12, 'Alergico'),
(18, 'Bototos'),
(19, 'Capacitado'),
(21, 'Certificado medico'),
(22, 'Comunicaciones email'),
(20, 'Condiciones'),
(6, 'Fracturas'),
(11, 'Hepatitis'),
(13, 'Medicamento contradictorio'),
(5, 'Operacion'),
(10, 'Otra enfermedad'),
(16, 'Participaciones previas'),
(1, 'Prevision'),
(8, 'Problema altura'),
(7, 'Problema articular'),
(4, 'Problema cardiaco'),
(2, 'Problema respiratorio'),
(3, 'Problema sangineo'),
(17, 'Saco de dormir'),
(14, 'Toma medicamento'),
(9, 'Tratamiento psicologico');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
