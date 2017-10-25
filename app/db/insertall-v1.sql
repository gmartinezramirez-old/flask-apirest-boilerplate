
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
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `name`, `originalattribute_id`) VALUES
(1, 'a1', 1),
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
-- Dumping data for table `criterion`
--

INSERT INTO `criterion` (`id`, `name`, `value`, `template_id`) VALUES
(1, 'c1', 1, 1),
(2, 'Criterio 2', 10, 1),
(3, 'Criterio 3', 100, 2),
(4, 'Criterio 4', 20, 3);

-- --------------------------------------------------------

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
-- Dumping data for table `originalattribute`
--

INSERT INTO `originalattribute` (`id`, `name`) VALUES
(1, 'o1'),
(2, 'o2'),
(3, 'o3'),
(4, 'o4');

-- --------------------------------------------------------

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