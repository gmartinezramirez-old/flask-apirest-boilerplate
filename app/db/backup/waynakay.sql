-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Oct 17, 2017 at 01:54 PM
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
  `description` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `title`, `required`, `selected`, `createdAt`, `description`) VALUES
(1, 'primera convocatoria', 300, 345, 1000, 'llamado a primera convocatoria'),
(2, 'segunda convocatoria', 660, 245, 1000000, 'llamado a segunda convocatoria'),
(3, 'tercera convocatoria', 6600, 5450, 2147483647, 'llamado a tercera convocatoria'),
(4, 'cuarta convocatoria', 3000, 2450, 5151000, 'llamado a segunda convocatoria'),
(5, 'quinta convocatoria', 6200, 4410, 100012412, 'llamado a tercera convocatoria');

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

-- --------------------------------------------------------

--
-- Table structure for table `criterion`
--

CREATE TABLE `criterion` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `criterion`
--

INSERT INTO `criterion` (`id`, `name`, `value`) VALUES
(1, 'D1', 35),
(2, 'D2', 10),
(3, 'D3', 20),
(4, 'D4', 40);

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

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `id` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `category` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `category`) VALUES
(1, 'planilla 1', '{\"category\": \"Habilidades fisicas\", \"columns\": {\"positive\":[{\"name\":\"Salud\"},{\"name\":\"Actividad fisica\"}], \"negative\": [{\"name\":\"Tiene alergias\"}]]}'),
(2, 'planilla 2', '{\"category\": \"Sin clasificar\", \"columns\": {\"Electricidad\"},{\"name\": Seguro médico\"}]}'),
(3, 'planilla 3', '{\"category\": \"Recursos materiales\", \"columns\": { \"columns\": { \"positive\": [{\"name\": \"Saco de dormir\"},{\"name\": \"Carpa\"}],\"negative\": []}}'),
(4, 'planilla 4', '{\"category\": \"Conocimiento\", \"columns\": {\"positive\": [{\"name\": \"Medicina\"},{\"name\": \"Construcción\"},{\"name\": \"Psicología\"}],\"negative\": []}}');

-- --------------------------------------------------------

--
-- Table structure for table `template_have_criterion`
--

CREATE TABLE `template_have_criterion` (
  `id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `criterion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `template_have_criterion`
--

INSERT INTO `template_have_criterion` (`id`, `template_id`, `criterion_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `id` int(11) NOT NULL,
  `volunteer_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `volunteer`
--

INSERT INTO `volunteer` (`id`, `volunteer_id`, `attribute_id`, `value`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 0),
(3, 1, 3, 0),
(4, 1, 4, 0),
(5, 1, 5, 0),
(6, 1, 6, 0),
(7, 1, 7, 0),
(8, 1, 8, 1),
(9, 1, 9, 0),
(10, 1, 10, 0),
(11, 1, 11, 1),
(12, 1, 12, 0),
(13, 1, 13, 0),
(14, 1, 14, 0),
(15, 1, 15, 1),
(16, 1, 16, 0),
(17, 1, 17, 1),
(18, 1, 18, 0),
(19, 1, 19, 1),
(20, 1, 20, 1),
(21, 1, 21, 1),
(22, 1, 22, 1),
(23, 2, 1, 0),
(24, 2, 2, 0),
(25, 2, 3, 0),
(26, 2, 4, 0),
(27, 2, 5, 0),
(28, 2, 6, 0),
(29, 2, 7, 1),
(30, 2, 8, 0),
(31, 2, 9, 0),
(32, 2, 10, 0),
(33, 2, 11, 0),
(34, 2, 12, 0),
(35, 2, 13, 0),
(36, 2, 14, 3),
(37, 2, 15, 2),
(38, 2, 16, 1),
(39, 2, 17, 1),
(40, 2, 18, 1),
(41, 2, 19, 1),
(42, 2, 20, 1),
(43, 2, 21, 1),
(44, 2, 22, 1),
(45, 3, 1, 0),
(46, 3, 2, 0),
(47, 3, 3, 0),
(48, 3, 4, 0),
(49, 3, 5, 0),
(50, 3, 6, 0),
(51, 3, 7, 1),
(52, 3, 8, 0),
(53, 3, 9, 0),
(54, 3, 10, 0),
(55, 3, 11, 0),
(56, 3, 12, 0),
(57, 3, 13, 0),
(58, 3, 14, 1),
(59, 3, 15, 3),
(60, 3, 16, 1),
(61, 3, 17, 1),
(62, 3, 18, 1),
(63, 3, 19, 1),
(64, 3, 20, 1),
(65, 3, 21, 1),
(66, 3, 22, 1),
(67, 4, 1, 2),
(68, 4, 2, 0),
(69, 4, 3, 0),
(70, 4, 4, 0),
(71, 4, 5, 0),
(72, 4, 6, 0),
(73, 4, 7, 0),
(74, 4, 8, 1),
(75, 4, 9, 0),
(76, 4, 10, 0),
(77, 4, 11, 0),
(78, 4, 12, 0),
(79, 4, 13, 0),
(80, 4, 14, 0),
(81, 4, 15, 3),
(82, 4, 16, 1),
(83, 4, 17, 1),
(84, 4, 18, 1),
(85, 4, 19, 1),
(86, 4, 20, 1),
(87, 4, 21, 1),
(88, 4, 22, 1),
(89, 5, 1, 2),
(90, 5, 2, 0),
(91, 5, 3, 0),
(92, 5, 4, 0),
(93, 5, 5, 0),
(94, 5, 6, 0),
(95, 5, 7, 0),
(96, 5, 8, 1),
(97, 5, 9, 0),
(98, 5, 10, 0),
(99, 5, 11, 0),
(100, 5, 12, 0),
(101, 5, 13, 0),
(102, 5, 14, 1),
(103, 5, 15, 0),
(104, 5, 16, 0),
(105, 5, 17, 1),
(106, 5, 18, 1),
(107, 5, 19, 1),
(108, 5, 20, 1),
(109, 5, 21, 1),
(110, 5, 22, 1),
(111, 6, 1, 1),
(112, 6, 2, 0),
(113, 6, 3, 0),
(114, 6, 4, 0),
(115, 6, 5, 0),
(116, 6, 6, 0),
(117, 6, 7, 0),
(118, 6, 8, 1),
(119, 6, 9, 0),
(120, 6, 10, 0),
(121, 6, 11, 0),
(122, 6, 12, 0),
(123, 6, 13, 0),
(124, 6, 14, 0),
(125, 6, 15, 3),
(126, 6, 16, 1),
(127, 6, 17, 1),
(128, 6, 18, 1),
(129, 6, 19, 1),
(130, 6, 20, 1),
(131, 6, 21, 1),
(132, 6, 22, 1),
(133, 7, 1, 1),
(134, 7, 2, 0),
(135, 7, 3, 0),
(136, 7, 4, 0),
(137, 7, 5, 0),
(138, 7, 6, 0),
(139, 7, 7, 0),
(140, 7, 8, 1),
(141, 7, 9, 0),
(142, 7, 10, 0),
(143, 7, 11, 0),
(144, 7, 12, 0),
(145, 7, 13, 0),
(146, 7, 14, 0),
(147, 7, 15, 0),
(148, 7, 16, 0),
(149, 7, 17, 1),
(150, 7, 18, 1),
(151, 7, 19, 1),
(152, 7, 20, 1),
(153, 7, 21, 1),
(154, 7, 22, 1),
(155, 8, 1, 1),
(156, 8, 2, 0),
(157, 8, 3, 0),
(158, 8, 4, 0),
(159, 8, 5, 0),
(160, 8, 6, 0),
(161, 8, 7, 0),
(162, 8, 8, 1),
(163, 8, 9, 0),
(164, 8, 10, 0),
(165, 8, 11, 0),
(166, 8, 12, 0),
(167, 8, 13, 0),
(168, 8, 14, 0),
(169, 8, 15, 3),
(170, 8, 16, 1),
(171, 8, 17, 1),
(172, 8, 18, 1),
(173, 8, 19, 1),
(174, 8, 20, 1),
(175, 8, 21, 1),
(176, 8, 22, 1),
(177, 9, 1, 1),
(178, 9, 2, 0),
(179, 9, 3, 0),
(180, 9, 4, 0),
(181, 9, 5, 0),
(182, 9, 6, 0),
(183, 9, 7, 0),
(184, 9, 8, 1),
(185, 9, 9, 0),
(186, 9, 10, 0),
(187, 9, 11, 1),
(188, 9, 12, 0),
(189, 9, 13, 0),
(190, 9, 14, 0),
(191, 9, 15, 1),
(192, 9, 16, 0),
(193, 9, 17, 0),
(194, 9, 18, 0),
(195, 9, 19, 1),
(196, 9, 20, 1),
(197, 9, 21, 1),
(198, 9, 22, 1),
(199, 10, 1, 1),
(200, 10, 2, 0),
(201, 10, 3, 0),
(202, 10, 4, 0),
(203, 10, 5, 0),
(204, 10, 6, 0),
(205, 10, 7, 0),
(206, 10, 8, 1),
(207, 10, 9, 0),
(208, 10, 10, 0),
(209, 10, 11, 1),
(210, 10, 12, 0),
(211, 10, 13, 0),
(212, 10, 14, 0),
(213, 10, 15, 3),
(214, 10, 16, 2),
(215, 10, 17, 1),
(216, 10, 18, 1),
(217, 10, 19, 1),
(218, 10, 20, 1),
(219, 10, 21, 1),
(220, 10, 22, 1),
(221, 11, 1, 1),
(222, 11, 2, 0),
(223, 11, 3, 0),
(224, 11, 4, 0),
(225, 11, 5, 0),
(226, 11, 6, 0),
(227, 11, 7, 0),
(228, 11, 8, 1),
(229, 11, 9, 0),
(230, 11, 10, 0),
(231, 11, 11, 1),
(232, 11, 12, 0),
(233, 11, 13, 0),
(234, 11, 14, 0),
(235, 11, 15, 1),
(236, 11, 16, 1),
(237, 11, 17, 1),
(238, 11, 18, 1),
(239, 11, 19, 1),
(240, 11, 20, 1),
(241, 11, 21, 1),
(242, 11, 22, 1),
(243, 12, 1, 1),
(244, 12, 2, 0),
(245, 12, 3, 0),
(246, 12, 4, 0),
(247, 12, 5, 0),
(248, 12, 6, 0),
(249, 12, 7, 0),
(250, 12, 8, 1),
(251, 12, 9, 0),
(252, 12, 10, 0),
(253, 12, 11, 1),
(254, 12, 12, 0),
(255, 12, 13, 0),
(256, 12, 14, 0),
(257, 12, 15, 3),
(258, 12, 16, 2),
(259, 12, 17, 1),
(260, 12, 18, 1),
(261, 12, 19, 1),
(262, 12, 20, 1),
(263, 12, 21, 1),
(264, 12, 22, 1),
(265, 13, 1, 2),
(266, 13, 2, 0),
(267, 13, 3, 0),
(268, 13, 4, 0),
(269, 13, 5, 0),
(270, 13, 6, 0),
(271, 13, 7, 1),
(272, 13, 8, 1),
(273, 13, 9, 0),
(274, 13, 10, 0),
(275, 13, 11, 0),
(276, 13, 12, 0),
(277, 13, 13, 0),
(278, 13, 14, 0),
(279, 13, 15, 0),
(280, 13, 16, 0),
(281, 13, 17, 0),
(282, 13, 18, 0),
(283, 13, 19, 1),
(284, 13, 20, 1),
(285, 13, 21, 1),
(286, 13, 22, 1),
(287, 14, 1, 3),
(288, 14, 2, 0),
(289, 14, 3, 0),
(290, 14, 4, 0),
(291, 14, 5, 0),
(292, 14, 6, 0),
(293, 14, 7, 0),
(294, 14, 8, 1),
(295, 14, 9, 0),
(296, 14, 10, 0),
(297, 14, 11, 1),
(298, 14, 12, 0),
(299, 14, 13, 0),
(300, 14, 14, 0),
(301, 14, 15, 3),
(302, 14, 16, 0),
(303, 14, 17, 1),
(304, 14, 18, 0),
(305, 14, 19, 1),
(306, 14, 20, 1),
(307, 14, 21, 1),
(308, 14, 22, 1),
(309, 15, 1, 1),
(310, 15, 2, 0),
(311, 15, 3, 0),
(312, 15, 4, 0),
(313, 15, 5, 0),
(314, 15, 6, 0),
(315, 15, 7, 0),
(316, 15, 8, 1),
(317, 15, 9, 0),
(318, 15, 10, 0),
(319, 15, 11, 0),
(320, 15, 12, 0),
(321, 15, 13, 0),
(322, 15, 14, 0),
(323, 15, 15, 1),
(324, 15, 16, 0),
(325, 15, 17, 1),
(326, 15, 18, 1),
(327, 15, 19, 1),
(328, 15, 20, 1),
(329, 15, 21, 1),
(330, 15, 22, 1),
(331, 16, 1, 1),
(332, 16, 2, 0),
(333, 16, 3, 0),
(334, 16, 4, 0),
(335, 16, 5, 0),
(336, 16, 6, 0),
(337, 16, 7, 0),
(338, 16, 8, 1),
(339, 16, 9, 0),
(340, 16, 10, 0),
(341, 16, 11, 1),
(342, 16, 12, 0),
(343, 16, 13, 0),
(344, 16, 14, 0),
(345, 16, 15, 2),
(346, 16, 16, 0),
(347, 16, 17, 1),
(348, 16, 18, 1),
(349, 16, 19, 1),
(350, 16, 20, 1),
(351, 16, 21, 1),
(352, 16, 22, 1),
(353, 17, 1, 1),
(354, 17, 2, 0),
(355, 17, 3, 0),
(356, 17, 4, 0),
(357, 17, 5, 0),
(358, 17, 6, 0),
(359, 17, 7, 0),
(360, 17, 8, 1),
(361, 17, 9, 0),
(362, 17, 10, 0),
(363, 17, 11, 0),
(364, 17, 12, 0),
(365, 17, 13, 0),
(366, 17, 14, 0),
(367, 17, 15, 1),
(368, 17, 16, 0),
(369, 17, 17, 1),
(370, 17, 18, 0),
(371, 17, 19, 1),
(372, 17, 20, 1),
(373, 17, 21, 1),
(374, 17, 22, 1),
(375, 18, 1, 1),
(376, 18, 2, 0),
(377, 18, 3, 0),
(378, 18, 4, 0),
(379, 18, 5, 0),
(380, 18, 6, 0),
(381, 18, 7, 0),
(382, 18, 8, 1),
(383, 18, 9, 0),
(384, 18, 10, 0),
(385, 18, 11, 0),
(386, 18, 12, 0),
(387, 18, 13, 0),
(388, 18, 14, 0),
(389, 18, 15, 1),
(390, 18, 16, 0),
(391, 18, 17, 1),
(392, 18, 18, 1),
(393, 18, 19, 1),
(394, 18, 20, 1),
(395, 18, 21, 1),
(396, 18, 22, 1),
(397, 19, 1, 3),
(398, 19, 2, 0),
(399, 19, 3, 0),
(400, 19, 4, 0),
(401, 19, 5, 0),
(402, 19, 6, 0),
(403, 19, 7, 0),
(404, 19, 8, 1),
(405, 19, 9, 0),
(406, 19, 10, 0),
(407, 19, 11, 1),
(408, 19, 12, 0),
(409, 19, 13, 0),
(410, 19, 14, 0),
(411, 19, 15, 3),
(412, 19, 16, 1),
(413, 19, 17, 1),
(414, 19, 18, 0),
(415, 19, 19, 1),
(416, 19, 20, 1),
(417, 19, 21, 1),
(418, 19, 22, 1),
(419, 20, 1, 2),
(420, 20, 2, 0),
(421, 20, 3, 0),
(422, 20, 4, 0),
(423, 20, 5, 0),
(424, 20, 6, 0),
(425, 20, 7, 0),
(426, 20, 8, 1),
(427, 20, 9, 0),
(428, 20, 10, 0),
(429, 20, 11, 1),
(430, 20, 12, 0),
(431, 20, 13, 0),
(432, 20, 14, 0),
(433, 20, 15, 0),
(434, 20, 16, 0),
(435, 20, 17, 1),
(436, 20, 18, 1),
(437, 20, 19, 1),
(438, 20, 20, 1),
(439, 20, 21, 1),
(440, 20, 22, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement_have_template`
--
ALTER TABLE `announcement_have_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_id` (`announcement_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `criterion`
--
ALTER TABLE `criterion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `criterion_have_attribute`
--
ALTER TABLE `criterion_have_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criterion_id` (`criterion_id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_have_criterion`
--
ALTER TABLE `template_have_criterion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`),
  ADD KEY `criterion_id` (`criterion_id`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`id`),
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
-- AUTO_INCREMENT for table `announcement_have_template`
--
ALTER TABLE `announcement_have_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `criterion`
--
ALTER TABLE `criterion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `criterion_have_attribute`
--
ALTER TABLE `criterion_have_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `template_have_criterion`
--
ALTER TABLE `template_have_criterion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement_have_template`
--
ALTER TABLE `announcement_have_template`
  ADD CONSTRAINT `announcement_have_template_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcement` (`id`),
  ADD CONSTRAINT `announcement_have_template_ibfk_2` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`);

--
-- Constraints for table `criterion_have_attribute`
--
ALTER TABLE `criterion_have_attribute`
  ADD CONSTRAINT `criterion_have_attribute_ibfk_1` FOREIGN KEY (`criterion_id`) REFERENCES `criterion` (`id`),
  ADD CONSTRAINT `criterion_have_attribute_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);

--
-- Constraints for table `template_have_criterion`
--
ALTER TABLE `template_have_criterion`
  ADD CONSTRAINT `template_have_criterion_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`),
  ADD CONSTRAINT `template_have_criterion_ibfk_2` FOREIGN KEY (`criterion_id`) REFERENCES `criterion` (`id`);

--
-- Constraints for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD CONSTRAINT `volunteer_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
