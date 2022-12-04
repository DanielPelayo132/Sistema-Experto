-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2022 a las 06:08:11
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sedigestivo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedades`
--

CREATE TABLE `enfermedades` (
  `nodo` int(11) NOT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `pregunta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `enfermedades`
--

INSERT INTO `enfermedades` (`nodo`, `texto`, `pregunta`) VALUES
(1, 'Malestar estomacal', 1),
(2, 'Dolor abdominal', 1),
(4, 'Acidez gástrica', 1),
(5, 'Acidez gástrica', 1),
(8, 'Reflujo', 1),
(9, 'Reflujo', 1),
(10, 'Reflujo', 1),
(16, 'Diarrea', 1),
(17, 'Diarrea', 1),
(19, 'Diarrea', 1),
(20, 'Diarrea', 1),
(32, 'Perdida de peso', 1),
(34, 'Perdida de peso', 1),
(38, 'Perdida de peso', 1),
(40, 'Perdida de peso', 1),
(41, 'Perdida de peso', 1),
(64, 'Nauseas y vómito', 1),
(68, 'Nauseas y vómito', 1),
(76, 'Nauseas y vómito', 1),
(81, 'Nauseas y vómito', 1),
(83, 'Nauseas y vómito', 1),
(128, 'Estreñimiento', 1),
(136, 'Estreñimiento', 1),
(152, 'Estreñimiento', 1),
(153, 'Estreñimiento', 1),
(162, 'Estreñimiento', 1),
(167, 'Estreñimiento', 1),
(224, 'Fatiga', 1),
(256, 'Fatiga', 1),
(272, 'Fatiga', 1),
(305, 'Fatiga', 1),
(306, 'Fatiga', 1),
(324, 'Fatiga', 1),
(335, 'Fatiga', 1),
(449, 'Sangrado rectal', 1),
(512, 'Sangrado rectal', 1),
(545, 'Sangrado rectal', 1),
(611, 'Sangrado rectal', 1),
(612, 'Sangrado rectal', 1),
(649, 'Sangrado rectal', 1),
(671, 'Sangrado rectal', 1),
(899, 'Calambres abdominales', 1),
(1024, 'Calambres abdominales', 1),
(1091, 'Calambres abdominales', 1),
(1223, 'Calambres abdominales', 1),
(1224, 'Calambres abdominales', 1),
(1299, 'Calambres abdominales', 1),
(1343, 'Calambres abdominales', 1),
(1799, 'Sangre en heces', 1),
(2048, 'Sangre en heces', 1),
(2183, 'Sangre en heces', 1),
(2447, 'Sangre en heces', 1),
(2449, 'Sangre en heces', 1),
(2599, 'Sangre en heces', 1),
(2687, 'Sangre en heces', 1),
(3599, 'Almorranas', 1),
(4096, 'Almorranas', 1),
(4367, 'Almorranas', 1),
(4895, 'Almorranas', 1),
(4898, 'Almorranas', 1),
(5199, 'Almorranas', 1),
(5375, 'Almorranas', 1),
(7199, 'Dificultad para tragar', 1),
(8192, 'Dificultad para tragar', 1),
(8735, 'Problemas para tragar', 1),
(9791, 'Dificultad para tragar', 1),
(9797, 'Dificultad para tragar', 1),
(10399, 'Problemas al tragar', 1),
(10751, 'Dificultad para tragar', 1),
(14399, 'Dolor intenso en la boca del estómago', 1),
(16384, 'Dolor intenso en la boca del estómago', 1),
(17471, 'Dolor intenso en la boca del estomago', 1),
(19583, 'Dolor intenso en la boca del estómago', 1),
(19595, 'Dolor intenso en la boca del estómago', 1),
(20799, 'Dolor intenso en la boca del estómago', 1),
(21503, 'Dolor intenso en la boca del estómago', 1),
(28799, 'Indigestión por alimentos en mal estado', 0),
(32768, 'Cancer de colon etapa 4', 0),
(34943, 'Celiaquia', 0),
(39167, 'Colitis/colitis ulcerosa', 0),
(39191, 'Enfermedad de Crohn', 0),
(41599, 'Indigestión por alimentos en mal estado', 0),
(43007, 'Enfermedad de reflujo gastroesofágico', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `enfermedades`
--
ALTER TABLE `enfermedades`
  ADD PRIMARY KEY (`nodo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
