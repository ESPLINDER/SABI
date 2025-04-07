-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-04-2025 a las 13:27:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sabi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `idCalificacion` int(11) NOT NULL,
  `fkIdCliente` int(11) NOT NULL,
  `fkIdRutina` int(11) NOT NULL,
  `calificacion` int(11) DEFAULT NULL,
  `fecCalificacion` date NOT NULL,
  `comCalificacion` text DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`idCalificacion`, `fkIdCliente`, `fkIdRutina`, `calificacion`, `fecCalificacion`, `comCalificacion`) VALUES
(1, 9, 1, 3, '2024-02-15', ''),
(2, 11, 4, 1, '2024-03-10', ''),
(3, 14, 5, 1, '2024-05-01', 'Muy basica. Senti que no avanzaba hacia mis objetivos.\r'),
(4, 15, 8, 2, '2024-03-20', ''),
(5, 17, 9, 3, '2024-04-15', 'La rutina estuvo bien. Aunque podria ser mas variada.\r'),
(6, 20, 10, 3, '2024-05-12', ''),
(7, 22, 12, 3, '2024-03-25', ''),
(8, 24, 14, 1, '2024-04-05', ''),
(9, 27, 15, 1, '0000-00-00', 'No cumplio con mis expectativas. Senti que no se adaptaba a mi nivel.\r'),
(10, 28, 17, 1, '2024-04-20', ''),
(11, 30, 18, 2, '2024-03-18', ''),
(12, 32, 20, 5, '2024-03-02', 'Excelente rutina. Me ayudo a mejorar mi rendimiento rapidamente.\r'),
(13, 34, 7, 0, '2024-03-22', ''),
(14, 37, 10, 5, '2024-04-10', ''),
(15, 38, 12, 0, '2024-03-28', 'La rutina no fue util para mi. Esperaba algo mas estructurado.\r'),
(16, 40, 14, 2, '2024-07-15', ''),
(17, 14, 7, 2, '2024-03-05', 'Fue algo repetitiva y los ejercicios no eran muy dinamicos.\r'),
(18, 30, 19, 0, '2024-04-12', ''),
(19, 22, 13, 0, '2024-03-10', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificado`
--

CREATE TABLE `certificado` (
  `idCertificado` int(11) NOT NULL,
  `fkIdEntrenador` int(11) NOT NULL,
  `nomCertificado` varchar(40) NOT NULL,
  `instCertificado` varchar(40) NOT NULL,
  `emiCertificado` date NOT NULL,
  `venCertificado` date NOT NULL,
  `ubiCertificado` text NOT NULL,
  `verCertificado` varchar(20) NOT NULL,
  `recCertificado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `certificado`
--

INSERT INTO `certificado` (`idCertificado`, `fkIdEntrenador`, `nomCertificado`, `instCertificado`, `emiCertificado`, `venCertificado`, `ubiCertificado`, `verCertificado`, `recCertificado`) VALUES
(1, 1, 'Certificado Fitness', 'Instituto de Fitness Colombia', '2023-01-15', '2025-01-15', '/certificados/cert1.pdf', 'aprobado', '\r'),
(2, 1, 'Certificado de Nutricion', 'Universidad de Nutricion', '2023-03-10', '2025-03-10', '/certificados/cert2.pdf', 'aprobado', '\r'),
(3, 2, 'Certificado Entrenador', 'Academia de Entrenadores', '2023-02-20', '2025-02-20', '/certificados/cert3.pdf', 'aprobado', '\r'),
(4, 3, 'Certificado de Yoga', 'Escuela de Yoga', '2023-04-05', '2025-04-05', '/certificados/cert4.pdf', 'aprobado', '\r'),
(5, 3, 'Certificado de Pilates', 'Centro de Pilates', '2023-05-15', '2025-05-15', '/certificados/cert5.pdf', 'aprobado', '\r'),
(6, 4, 'Certificado de CrossFit', 'Box de CrossFit', '2023-06-10', '2025-06-10', '/certificados/cert6.pdf', 'aprobado', '\r'),
(7, 5, 'Certificado de Entrenamiento', 'Instituto de Entrenamiento', '2023-07-01', '2025-07-01', '/certificados/cert7.pdf', 'aprobado', '\r'),
(8, 5, 'Certificado de Boxeo', 'Escuela de Boxeo', '2023-08-12', '2025-08-12', '/certificados/cert8.pdf', 'aprobado', '\r'),
(9, 6, 'Certificado de Culturismo', 'Instituto de Culturismo', '2023-09-15', '2025-09-15', '/certificados/cert9.pdf', 'aprobado', '\r'),
(10, 7, 'Certificado de Atletismo', 'Federacion de Atletismo', '2023-10-10', '2025-10-10', '/certificados/cert10.pdf', 'aprobado', '\r'),
(11, 7, 'Certificado de Danza', 'Escuela de Danza', '2023-11-20', '2025-11-20', '/certificados/cert11.pdf', 'aprobado', '\r'),
(12, 8, 'Certificado de Salud Mental', 'Universidad de Psicologia', '2023-12-01', '2025-12-01', '/certificados/cert12.pdf', 'aprobado', '\r'),
(13, 9, 'Certificado de Kinesiologia', 'Universidad de Kinesiologia', '2023-01-10', '2025-01-10', '/certificados/cert13.pdf', 'aprobado', '\r'),
(14, 10, 'Certificado de Rehabilitacion', 'Centro de Rehabilitacion', '2023-02-15', '2025-02-15', '/certificados/cert14.pdf', 'aprobado', '\r'),
(15, 10, 'Certificado de Entrenador Avanzado', 'Academia de Entrenadores', '2023-03-25', '2025-03-25', '/certificados/cert15.pdf', 'aprobado', '\r'),
(16, 11, 'Certificado de Tecnicas de Respiracion', 'Escuela de Bienestar', '2023-04-30', '2025-04-30', '/certificados/cert16.pdf', 'aprobado', '\r'),
(17, 12, 'Certificado de Entrenador Funcional', 'Instituto Funcional', '2023-05-15', '2025-05-15', '/certificados/cert17.pdf', 'aprobado', '\r'),
(18, 12, 'Certificado de Hidroterapia', 'Universidad de Hidroterapia', '2023-06-20', '2025-06-20', '/certificados/cert18.pdf', 'aprobado', '\r'),
(19, 13, 'Certificado de Atencion al Cliente', 'Instituto de Servicio', '2023-07-25', '2025-07-25', '/certificados/cert19.pdf', 'aprobado', '\r'),
(20, 14, 'Certificado de Coaching Deportivo', 'Academia de Coaching', '2023-08-30', '2025-08-30', '/certificados/cert20.pdf', 'aprobado', '\r'),
(21, 15, 'Certificado de Entrenamiento en Altura', 'Escuela de Altura', '2023-09-05', '2025-09-05', '/certificados/cert21.pdf', 'rechazado', 'Falta de documentacion\r'),
(22, 16, 'Certificado de Entrenamiento en Equipo', 'Instituto de Equipos', '2023-10-12', '2025-10-12', '/certificados/cert22.pdf', 'aprobado', '\r'),
(23, 17, 'Certificado de Resistencia', 'Centro de Resistencia', '2023-11-15', '2025-11-15', '/certificados/cert23.pdf', 'rechazado', 'Falta de firma\r'),
(24, 18, 'Certificado de Entrenamiento Personal', 'Instituto Personal', '2023-12-01', '2025-12-01', '/certificados/cert24.pdf', 'aprobado', '\r'),
(25, 19, 'Certificado de Entrenamiento Deportivo', 'Universidad de Deportes', '2023-01-05', '2025-01-05', '/certificados/cert25.pdf', 'aprobado', '\r'),
(26, 20, 'Certificado de Supervision', 'Escuela de Supervision', '2023-02-10', '2025-02-10', '/certificados/cert26.pdf', 'rechazado', 'Error en los datos\r'),
(27, 20, 'Certificado de Metodologia de Entrenamie', 'Instituto Metodologico', '2023-03-15', '2025-03-15', '/certificados/cert27.pdf', 'aprobado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `tipCliente` varchar(10) DEFAULT NULL,
  `planCliente` varchar(10) NOT NULL,
  `fkIdUsuario` int(11) NOT NULL,
  `nomCliente` varchar(20) NOT NULL,
  `apeCliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `tipCliente`, `planCliente`, `fkIdUsuario`, `nomCliente`, `apeCliente`) VALUES
(1, 'natural', 'premium', 3, 'Carlos', 'Lopez\r'),
(2, 'juridica', 'gratuito', 6, 'Mariana', 'Torres\r'),
(3, 'natural', 'premium', 8, 'Camila', 'Mendoza\r'),
(4, '', 'gratuito', 12, 'Laura', 'Gutierrez\r'),
(5, 'natural', 'premium', 13, 'Andres', 'Silva\r'),
(6, 'juridica', 'gratuito', 17, 'Jose', 'Pena\r'),
(7, 'natural', 'premium', 19, 'Miguel', 'angulo\r'),
(8, '', 'gratuito', 21, 'Mateo', 'Castro\r'),
(9, 'juridica', 'premium', 22, 'Adriana', 'Delgado\r'),
(10, 'natural', 'gratuito', 24, 'Diana', 'Flores\r'),
(11, 'natural', 'premium', 25, 'Francisco', 'Arias\r'),
(12, 'juridica', 'gratuito', 27, 'Cristian', 'Campos\r'),
(13, '', 'gratuito', 30, 'Natalia', 'Cardenas\r'),
(14, 'natural', 'premium', 31, 'Esteban', 'Vallejo\r'),
(15, 'juridica', 'premium', 33, 'Tomas', 'Ramirez\r'),
(16, '', 'gratuito', 35, 'Daniel', 'Villa\r'),
(17, 'natural', 'premium', 37, 'Felipe', 'Correa\r'),
(18, 'juridica', 'gratuito', 38, 'Ana', 'Diaz\r'),
(19, '', 'gratuito', 40, 'Luis', 'Murillo\r'),
(20, 'natural', 'premium', 42, 'Diego', 'Sierra\r'),
(21, 'natural', 'gratuito', 43, 'Camila', 'Mora\r'),
(22, 'juridica', 'premium', 45, 'Susana', 'Arenas\r'),
(23, '', 'gratuito', 46, 'Mateo', 'Gomez\r'),
(24, 'natural', 'premium', 47, 'Adriana', 'Patino\r'),
(25, 'juridica', 'gratuito', 48, 'Jose', 'alvarez\r'),
(26, '', 'gratuito', 50, 'Miguel', 'Vargas\r'),
(27, 'natural', 'premium', 51, 'Laura', 'Hernandez\r'),
(28, 'juridica', 'premium', 53, 'Diana', 'Sanchez\r'),
(29, '', 'gratuito', 55, 'angela', 'Rojas\r'),
(30, 'natural', 'premium', 56, 'Esteban', 'Castro\r'),
(31, 'natural', 'gratuito', 57, 'Isabella', 'Giraldo\r'),
(32, 'juridica', 'premium', 58, 'Daniel', 'Mejia\r'),
(33, '', 'gratuito', 59, 'Sara', 'Cortes\r'),
(34, 'natural', 'premium', 60, 'Pedro', 'Ramirez\r'),
(35, 'juridica', 'gratuito', 2, 'Ana', 'Gomez\r'),
(36, '', 'gratuito', 4, 'Sara', 'Martinez\r'),
(37, 'natural', 'premium', 9, 'Fernando', 'Santos\r'),
(38, 'juridica', 'premium', 10, 'Lucia', 'Rodriguez\r'),
(39, '', 'gratuito', 14, 'Paula', 'Romero\r'),
(40, 'natural', 'premium', 18, 'Karla', 'Rios'),
(44, 'Natural', 'gratuito', 68, 'William', 'Espinel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `idDiag` int(11) NOT NULL,
  `fkIdCliente` int(11) NOT NULL,
  `estCliente` float NOT NULL,
  `pesCliente` float NOT NULL,
  `fecDiag` date NOT NULL,
  `imcCliente` float NOT NULL,
  `objCliente` varchar(15) NOT NULL,
  `conMedCliente` varchar(90) DEFAULT NULL,
  `actCliente` varchar(15) NOT NULL,
  `fisCliente` varchar(15) NOT NULL,
  `medCliente` varchar(90) DEFAULT NULL,
  `carCliente` int(11) DEFAULT NULL,
  `resCliente` float DEFAULT NULL,
  `cinCliente` float NOT NULL,
  `braCliente` float NOT NULL,
  `pieCliente` float NOT NULL,
  `hidCliente` float DEFAULT NULL,
  `supCliente` varchar(60) DEFAULT NULL,
  `freDiag` varchar(15) NOT NULL,
  `proDiag` date NOT NULL,
  `disCliente` varchar(40) NOT NULL,
  `ubiCliente` varchar(15) NOT NULL,
  `fkIdRutina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diagnostico`
--

INSERT INTO `diagnostico` (`idDiag`, `fkIdCliente`, `estCliente`, `pesCliente`, `fecDiag`, `imcCliente`, `objCliente`, `conMedCliente`, `actCliente`, `fisCliente`, `medCliente`, `carCliente`, `resCliente`, `cinCliente`, `braCliente`, `pieCliente`, `hidCliente`, `supCliente`, `freDiag`, `proDiag`, `disCliente`, `ubiCliente`, `fkIdRutina`) VALUES
(1, 1, 1.75, 70.5, '2024-10-01', 23, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 75, 50, 80, 30, 28, 1, 'Ninguno', 'Mensual', '2024-11-01', 'Lunes-Miercoles', 'Gimnasio', 5),
(2, 2, 1.8, 85, '2024-10-02', 26.2, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 70, 55, 85, 32, 30, 2.5, 'Proteina', 'Quincenal', '2024-10-16', 'Martes-Jueves', 'Casa', 3),
(3, 3, 1.6, 65, '2024-10-03', 25.4, 'Aumentar masa m', 'Diabetes', 'Bajo', 'Regular', 'Metformina', 80, 48, 75, 28, 25, 2, 'Proteina', 'Mensual', '2024-11-03', 'Lunes-Viernes', 'Gimnasio', 1),
(4, 4, 1.7, 75, '2024-10-04', 25.9, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 78, 52, 82, 29, 26, 2, 'Creatina', 'Mensual', '2024-11-04', 'Lunes-Miercoles', 'Gimnasio', 11),
(5, 5, 1.78, 88, '2024-10-05', 27.8, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 76, 56, 89, 34, 32, 3, 'Ninguno', 'Quincenal', '2024-10-20', 'Martes-Jueves', 'Casa', 5),
(6, 6, 1.65, 72, '2024-10-06', 26.4, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 72, 50, 78, 27, 24, 2, 'Creatina', 'Mensual', '2024-11-06', 'Lunes-Viernes', 'Gimnasio', 6),
(7, 7, 1.75, 68, '2024-10-07', 22.2, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Regular', 'Ninguno', 76, 51, 81, 29, 27, 2.5, 'Ninguno', 'Mensual', '2024-11-07', 'Lunes-Miercoles', 'Casa', 13),
(8, 8, 1.82, 90, '2024-10-08', 27.1, 'Mantener peso', 'Ninguna', 'Activo', 'Bueno', 'Ninguno', 73, 54, 87, 33, 31, 2, 'Proteina', 'Quincenal', '2024-10-23', 'Martes-Jueves', 'Gimnasio', 6),
(9, 9, 1.7, 80, '2024-10-09', 27.7, 'Bajar de peso', 'Hipertension', 'Moderado', 'Regular', 'Enalapril', 74, 49, 84, 31, 29, 1.5, 'Creatina', 'Mensual', '2024-11-09', 'Lunes-Viernes', 'Casa', 1),
(10, 10, 1.65, 55, '2024-10-10', 20.2, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Bueno', 'Ninguno', 77, 47, 70, 26, 23, 2, 'Ninguno', 'Quincenal', '2024-10-24', 'Martes-Jueves', 'Gimnasio', 3),
(11, 11, 1.78, 84, '2024-10-11', 26.6, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 72, 53, 85, 30, 28, 3.5, 'Proteina', 'Mensual', '2024-11-11', 'Lunes-Miercoles', 'Casa', 17),
(12, 12, 1.75, 76, '2024-10-12', 24.8, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 70, 50, 79, 28, 25, 2, 'Creatina', 'Mensual', '2024-11-12', 'Lunes-Viernes', 'Gimnasio', 11),
(13, 13, 1.6, 61, '2024-10-13', 23.9, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Regular', 'Ninguno', 75, 48, 76, 27, 24, 1.8, 'Ninguno', 'Quincenal', '2024-10-27', 'Martes-Jueves', 'Casa', 16),
(14, 14, 1.73, 79, '2024-10-14', 26.3, 'Mantener peso', 'Ninguna', 'Activo', 'Bueno', 'Ninguno', 72, 52, 81, 29, 27, 2.5, 'Proteina', 'Mensual', '2024-11-14', 'Lunes-Miercoles', 'Gimnasio', 7),
(15, 15, 1.82, 95, '2024-10-15', 28.7, 'Bajar de peso', 'Ninguna', 'Moderado', 'Regular', 'Ninguno', 74, 55, 90, 35, 33, 2.2, 'Creatina', 'Mensual', '2024-11-15', 'Lunes-Viernes', 'Casa', 9),
(16, 16, 1.65, 67, '2024-10-16', 24.6, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Bueno', 'Ninguno', 70, 50, 78, 26, 24, 2, 'Ninguno', 'Quincenal', '2024-10-31', 'Martes-Jueves', 'Gimnasio', 16),
(17, 17, 1.75, 70, '2024-10-17', 22.9, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 73, 54, 84, 30, 29, 3, 'Proteina', 'Mensual', '2024-11-17', 'Lunes-Miercoles', 'Casa', 7),
(18, 18, 1.78, 88, '2024-10-18', 27.8, 'Bajar de peso', 'Hipertension', 'Moderado', 'Regular', 'Enalapril', 76, 56, 86, 34, 32, 2, 'Creatina', 'Mensual', '2024-11-18', 'Lunes-Viernes', 'Gimnasio', 11),
(19, 19, 1.6, 62, '2024-10-19', 24.3, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Bueno', 'Ninguno', 75, 47, 75, 27, 25, 1.5, 'Ninguno', 'Quincenal', '2024-10-20', 'Martes-Jueves', 'Casa', 16),
(20, 20, 1.73, 80, '2024-10-20', 26.7, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 72, 52, 82, 28, 26, 3.5, 'Proteina', 'Mensual', '2024-11-20', 'Lunes-Miercoles', 'Gimnasio', 12),
(21, 21, 1.75, 75, '2024-10-21', 24.5, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 71, 50, 79, 30, 27, 2, 'Ninguno', 'Mensual', '2024-11-21', 'Lunes-Viernes', 'Casa', 6),
(22, 22, 1.82, 86, '2024-10-22', 25.9, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Regular', 'Ninguno', 78, 55, 87, 34, 31, 2.8, 'Creatina', 'Mensual', '2024-11-22', 'Martes-Jueves', 'Gimnasio', 9),
(23, 23, 1.67, 74, '2024-10-23', 26.6, 'Mantener peso', 'Ninguna', 'Activo', 'Bueno', 'Ninguno', 72, 52, 80, 29, 27, 2.5, 'Ninguno', 'Quincenal', '2024-10-29', 'Lunes-Miercoles', 'Casa', 16),
(24, 24, 1.72, 82, '2024-10-24', 27.7, 'Bajar de peso', 'Ninguna', 'Moderado', 'Regular', 'Ninguno', 75, 50, 83, 30, 28, 2, 'Ninguno', 'Mensual', '2024-11-24', 'Lunes-Viernes', 'Gimnasio', 20),
(25, 25, 1.79, 89, '2024-10-25', 27.8, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Bueno', 'Ninguno', 76, 55, 88, 32, 30, 2.5, 'Creatina', 'Mensual', '2024-11-25', 'Martes-Jueves', 'Casa', 6),
(26, 26, 1.68, 64, '2024-10-26', 22.8, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 74, 51, 78, 28, 26, 2, 'Ninguno', 'Quincenal', '2024-10-26', 'Lunes-Miercoles', 'Gimnasio', 11),
(27, 27, 1.75, 70, '2024-10-27', 22.9, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 77, 50, 80, 30, 28, 1.8, 'Ninguno', 'Mensual', '2024-11-27', 'Lunes-Viernes', 'Casa', 10),
(28, 28, 1.8, 78, '2024-10-28', 24.1, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Regular', 'Ninguno', 72, 53, 84, 31, 29, 2, 'Creatina', 'Quincenal', '2024-10-30', 'Martes-Jueves', 'Gimnasio', 15),
(29, 29, 1.74, 77, '2024-10-29', 25.5, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 70, 52, 81, 29, 27, 3, 'Ninguno', 'Mensual', '2024-11-29', 'Lunes-Miercoles', 'Casa', 16),
(30, 30, 1.69, 72, '2024-10-30', 26.6, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 75, 50, 78, 27, 25, 2.5, 'Ninguno', 'Mensual', '2024-11-30', 'Lunes-Viernes', 'Gimnasio', 19),
(31, 31, 1.75, 71, '2024-10-31', 23.2, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Regular', 'Ninguno', 74, 49, 76, 28, 24, 2, 'Creatina', 'Quincenal', '2024-11-01', 'Martes-Jueves', 'Casa', 6),
(32, 1, 1.75, 68.5, '2024-11-01', 23, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 75, 50, 75, 29, 27, 2, 'Ninguno', 'Mensual', '2024-12-01', 'Lunes-Miercoles', 'Gimnasio', 5),
(33, 32, 1.8, 84, '2024-11-01', 25.9, 'Mantener peso', 'Ninguna', 'Activo', 'Bueno', 'Ninguno', 73, 54, 83, 30, 27, 3, 'Ninguno', 'Mensual', '2024-12-01', 'Lunes-Miercoles', 'Gimnasio', 7),
(34, 33, 1.67, 66, '2024-11-02', 23.4, 'Bajar de peso', 'Ninguna', 'Moderado', 'Regular', 'Ninguno', 76, 50, 79, 29, 25, 2.5, 'Ninguno', 'Mensual', '2024-11-02', 'Lunes-Viernes', 'Casa', 3),
(35, 34, 1.75, 70, '2024-11-03', 22.9, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Bueno', 'Ninguno', 72, 52, 82, 30, 28, 2, 'Creatina', 'Quincenal', '2024-11-04', 'Martes-Jueves', 'Gimnasio', 9),
(36, 4, 1.7, 75, '2024-11-04', 25.9, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 78, 52, 82, 29, 26, 2, 'Creatina', 'Mensual', '2024-12-04', 'Lunes-Miercoles', 'Gimnasio', 16),
(37, 35, 1.8, 90, '2024-11-04', 27.8, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 75, 55, 88, 35, 31, 2.5, 'Ninguno', 'Mensual', '2024-12-04', 'Lunes-Miercoles', 'Casa', 11),
(38, 36, 1.65, 70, '2024-11-05', 25.7, 'Bajar de peso', 'Ninguna', 'Moderado', 'Regular', 'Ninguno', 76, 50, 79, 29, 27, 2.2, 'Ninguno', 'Mensual', '2024-11-05', 'Lunes-Viernes', 'Gimnasio', 16),
(39, 6, 1.65, 72, '2024-11-06', 26.4, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 72, 50, 78, 27, 24, 2, 'Creatina', 'Mensual', '2024-12-06', 'Lunes-Viernes', 'Gimnasio', 11),
(40, 37, 1.7, 75, '2024-11-06', 25.9, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Bueno', 'Ninguno', 71, 50, 80, 30, 28, 2, 'Creatina', 'Quincenal', '2024-11-07', 'Martes-Jueves', 'Casa', 20),
(41, 38, 1.8, 80, '2024-11-07', 24.7, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 72, 52, 82, 30, 27, 3, 'Ninguno', 'Mensual', '2024-12-07', 'Lunes-Miercoles', 'Gimnasio', 10),
(42, 39, 1.72, 82, '2024-11-08', 27.7, 'Bajar de peso', 'Ninguna', 'Moderado', 'Regular', 'Ninguno', 74, 50, 83, 29, 26, 2, 'Ninguno', 'Mensual', '2024-11-08', 'Lunes-Viernes', 'Casa', 16),
(43, 9, 1.7, 80, '2024-11-09', 27.7, 'Bajar de peso', 'Hipertension', 'Moderado', 'Regular', 'Enalapril', 74, 49, 84, 31, 29, 1.5, 'Creatina', 'Mensual', '2024-12-09', 'Lunes-Viernes', 'Casa', 1),
(44, 40, 1.65, 63, '2024-11-09', 23.2, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Bueno', 'Ninguno', 70, 50, 76, 28, 24, 1.5, 'Ninguno', 'Quincenal', '2024-11-23', 'Martes-Jueves', 'Gimnasio', 15),
(45, 14, 1.73, 79, '2024-11-14', 26.3, 'Mantener peso', 'Ninguna', 'Activo', 'Bueno', 'Ninguno', 72, 52, 81, 29, 27, 2.5, 'Proteina', 'Mensual', '2024-12-14', 'Lunes-Miercoles', 'Gimnasio', 12),
(46, 17, 1.75, 70, '2024-11-17', 22.9, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 73, 54, 84, 30, 29, 3, 'Proteina', 'Mensual', '2024-12-17', 'Lunes-Miercoles', 'Casa', 7),
(47, 40, 1.65, 63, '2024-11-23', 23.2, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Bueno', 'Ninguno', 70, 50, 76, 28, 24, 1.5, 'Ninguno', 'Quincenal', '2024-12-07', 'Martes-Jueves', 'Gimnasio', 15),
(48, 27, 1.75, 70, '2024-11-27', 22.9, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 77, 50, 80, 30, 28, 1.8, 'Ninguno', 'Mensual', '2024-12-27', 'Lunes-Viernes', 'Casa', 18),
(49, 1, 1.75, 65.5, '2024-12-01', 23, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 75, 50, 72, 27, 25, 2, 'Ninguno', 'Mensual', '2025-01-01', 'Lunes-Miercoles', 'Gimnasio', 1),
(50, 32, 1.8, 84, '2024-12-01', 25.9, 'Mantener peso', 'Ninguna', 'Activo', 'Bueno', 'Ninguno', 73, 54, 83, 30, 27, 3, 'Ninguno', 'Mensual', '2025-01-01', 'Lunes-Miercoles', 'Gimnasio', 12),
(51, 6, 1.65, 72, '2024-12-06', 26.4, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 72, 50, 78, 27, 24, 2, 'Creatina', 'Mensual', '2025-01-06', 'Lunes-Viernes', 'Gimnasio', 16),
(52, 38, 1.8, 80, '2024-12-07', 24.7, 'Mantener peso', 'Ninguna', 'Activo', 'Excelente', 'Ninguno', 72, 52, 82, 30, 27, 3, 'Ninguno', 'Mensual', '2025-01-07', 'Lunes-Miercoles', 'Gimnasio', 10),
(53, 40, 1.65, 63, '2024-12-07', 23.2, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Bueno', 'Ninguno', 70, 50, 76, 28, 24, 1.5, 'Ninguno', 'Quincenal', '2024-12-21', 'Martes-Jueves', 'Gimnasio', 12),
(54, 40, 1.65, 63, '2024-12-21', 23.2, 'Aumentar masa m', 'Ninguna', 'Bajo', 'Bueno', 'Ninguno', 70, 50, 76, 28, 24, 1.5, 'Ninguno', 'Quincenal', '2025-01-04', 'Martes-Jueves', 'Gimnasio', 12),
(55, 27, 1.75, 70, '2024-12-27', 22.9, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 77, 50, 80, 30, 28, 1.8, 'Ninguno', 'Mensual', '2025-01-27', 'Lunes-Viernes', 'Casa', 14),
(56, 1, 1.75, 62.5, '2025-01-01', 23, 'Bajar de peso', 'Ninguna', 'Moderado', 'Bueno', 'Ninguno', 75, 50, 70, 26, 25, 2, 'Ninguno', 'Mensual', '2025-02-01', 'Lunes-Miercoles', 'Gimnasio', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `idEjercicio` int(11) NOT NULL,
  `nomEjercicio` varchar(20) NOT NULL,
  `descEjercicio` varchar(90) NOT NULL,
  `tipEjercicio` varchar(20) NOT NULL,
  `urlVideo` varchar(260) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`idEjercicio`, `nomEjercicio`, `descEjercicio`, `tipEjercicio`, `urlVideo`) VALUES
(1, 'Press de Banca', 'Ejercicio para el pecho que se realiza acostado empujando una barra con peso hacia arriba', 'Con Maquina\r', ''),
(2, 'Sentadilla', 'Ejercicio de fuerza para piernas donde se flexionan las rodillas y las caderas', 'No Requiere Maquina\r', ''),
(3, 'Remo con Mancuernas', 'Ejercicio para espalda que implica jalar una mancuerna hacia el cuerpo', 'No Requiere Maquina\r', ''),
(4, 'Pull-Ups', 'Ejercicio de peso corporal donde te elevas en una barra usando la fuerza de la espalda y l', 'No Requiere Maquina\r', ''),
(5, 'Extension de Piernas', 'Ejercicio enfocado en cuadriceps realizado en una maquina con peso', 'Con Maquina\r', ''),
(6, 'Curl de Biceps', 'Ejercicio para trabajar los musculos del biceps utilizando pesas', 'No Requiere Maquina\r', ''),
(7, 'Press Militar', 'Ejercicio de hombros con una barra o mancuernas empujadas por encima de la cabeza', 'No Requiere Maquina\r', ''),
(8, 'Abdominales', 'Ejercicio de fortalecimiento del core que consiste en elevar el torso desde el suelo', 'No Requiere Maquina\r', ''),
(9, 'Remo en Maquina', 'Ejercicio cardiovascular donde se simula el movimiento de remar', 'Con Maquina\r', ''),
(10, 'Press de Pierna', 'Ejercicio para piernas donde se empuja una plataforma con los pies', 'Con Maquina\r', ''),
(11, 'Plancha', 'Ejercicio isometrico para trabajar el core permaneciendo en posicion de flexion sin movers', 'No Requiere Maquina\r', ''),
(12, 'Cinta de Correr', 'Ejercicio cardiovascular que consiste en correr o caminar en una cinta motorizada', 'Con Maquina\r', ''),
(13, 'Bicicleta Estatica', 'Ejercicio cardiovascular realizado pedaleando en una bicicleta fija', 'Con Maquina\r', ''),
(14, 'Zancadas', 'Ejercicio para piernas donde se da un paso adelante y se flexionan ambas rodillas', 'No Requiere Maquina\r', ''),
(15, 'Fondos en Paralelas', 'Ejercicio de peso corporal que trabaja triceps y pecho realizado en barras paralelas', 'No Requiere Maquina\r', ''),
(16, 'Elevacion de Talones', 'Ejercicio para fortalecer las pantorrillas realizado con o sin peso', 'No Requiere Maquina\r', ''),
(17, 'Press de Hombros en ', 'Ejercicio para hombros donde se empuja peso hacia arriba en una maquina', 'Con Maquina\r', ''),
(18, 'Hip Thrust', 'Ejercicio para gluteos que consiste en elevar las caderas mientras apoyas la espalda en un', 'No Requiere Maquina\r', ''),
(19, 'Cruce de Poleas', 'Ejercicio para pectorales donde se cruzan cables hacia adelante', 'Con Maquina\r', ''),
(20, 'Sprint en Cinta', 'Ejercicio de alta intensidad corriendo a maxima velocidad en cinta', 'Con Maquina', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio_rutina`
--

CREATE TABLE `ejercicio_rutina` (
  `idEje_Rut` int(11) NOT NULL,
  `fkIdEjercicio` int(11) NOT NULL,
  `fkIdRutina` int(11) NOT NULL,
  `repeticiones` int(11) DEFAULT NULL,
  `series` int(11) DEFAULT NULL,
  `dia` int(11) NOT NULL,
  `semana` int(11) NOT NULL,
  `descanso` int(11) DEFAULT NULL,
  `intensidad` varchar(15) NOT NULL,
  `peso` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicio_rutina`
--

INSERT INTO `ejercicio_rutina` (`idEje_Rut`, `fkIdEjercicio`, `fkIdRutina`, `repeticiones`, `series`, `dia`, `semana`, `descanso`, `intensidad`, `peso`) VALUES
(1, 1, 1, 15, 3, 1, 1, 60, 'Moderada\r', NULL),
(2, 2, 1, 20, 4, 1, 1, 90, 'Alta\r', NULL),
(3, 3, 2, 12, 3, 2, 1, 45, 'Moderada\r', NULL),
(4, 4, 2, 8, 5, 2, 1, 60, 'Alta\r', NULL),
(5, 5, 3, 10, 3, 3, 2, 75, 'Moderada\r', NULL),
(6, 6, 3, 10, 4, 3, 2, 90, 'Alta\r', NULL),
(7, 7, 4, 15, 3, 1, 3, 60, 'Baja\r', NULL),
(8, 8, 4, 20, 4, 1, 3, 60, 'Moderada\r', NULL),
(9, 9, 5, 12, 3, 2, 4, 75, 'Moderada\r', NULL),
(10, 10, 5, 10, 4, 2, 4, 90, 'Alta\r', NULL),
(11, 11, 6, 15, 3, 3, 5, 60, 'Baja\r', NULL),
(12, 12, 6, 12, 4, 3, 5, 60, 'Moderada\r', NULL),
(13, 13, 7, 8, 5, 1, 6, 90, 'Alta\r', NULL),
(14, 14, 7, 10, 4, 1, 6, 75, 'Alta\r', NULL),
(15, 15, 8, 12, 3, 2, 1, 60, 'Moderada\r', NULL),
(16, 16, 8, 10, 5, 2, 1, 75, 'Alta\r', NULL),
(17, 17, 9, 15, 3, 3, 2, 60, 'Baja\r', NULL),
(18, 18, 9, 20, 4, 3, 2, 45, 'Moderada\r', NULL),
(19, 19, 10, 10, 3, 1, 3, 60, 'Alta\r', NULL),
(20, 20, 10, 12, 5, 1, 3, 75, 'Alta\r', NULL),
(21, 2, 11, 15, 4, 2, 4, 60, 'Moderada\r', NULL),
(22, 4, 11, 8, 4, 2, 4, 75, 'Alta\r', NULL),
(23, 6, 12, 20, 3, 3, 5, 90, 'Moderada\r', NULL),
(24, 8, 12, 12, 4, 3, 5, 60, 'Alta\r', NULL),
(25, 10, 13, 10, 5, 1, 6, 75, 'Baja\r', NULL),
(26, 12, 13, 15, 3, 1, 6, 60, 'Moderada\r', NULL),
(27, 14, 14, 8, 4, 2, 1, 45, 'Alta\r', NULL),
(28, 16, 14, 12, 4, 2, 1, 75, 'Alta\r', NULL),
(29, 18, 15, 10, 3, 3, 2, 60, 'Moderada\r', NULL),
(30, 20, 15, 15, 5, 3, 2, 90, 'Moderada\r', NULL),
(31, 1, 16, 15, 3, 1, 1, 60, 'Moderada\r', NULL),
(32, 3, 16, 10, 4, 1, 1, 90, 'Alta\r', NULL),
(33, 5, 17, 20, 3, 2, 1, 75, 'Moderada\r', NULL),
(34, 7, 17, 12, 5, 2, 1, 60, 'Alta\r', NULL),
(35, 9, 18, 8, 4, 3, 2, 60, 'Moderada\r', NULL),
(36, 11, 18, 10, 3, 3, 2, 75, 'Alta\r', NULL),
(37, 13, 19, 15, 4, 1, 3, 90, 'Baja\r', NULL),
(38, 15, 19, 20, 5, 1, 3, 45, 'Moderada\r', NULL),
(39, 17, 20, 10, 4, 2, 4, 60, 'Alta\r', NULL),
(40, 19, 20, 15, 3, 2, 4, 75, 'Alta\r', NULL),
(41, 2, 1, 12, 3, 1, 5, 60, 'Moderada\r', NULL),
(42, 4, 1, 10, 4, 1, 5, 75, 'Alta\r', NULL),
(43, 6, 2, 15, 3, 2, 6, 90, 'Moderada\r', NULL),
(44, 8, 2, 20, 4, 2, 6, 60, 'Alta\r', NULL),
(45, 10, 3, 8, 5, 1, 1, 75, 'Baja\r', NULL),
(46, 12, 3, 10, 3, 1, 1, 60, 'Moderada\r', NULL),
(47, 14, 4, 15, 4, 2, 2, 60, 'Alta\r', NULL),
(48, 16, 4, 12, 5, 2, 2, 75, 'Alta\r', NULL),
(49, 18, 5, 10, 3, 3, 3, 60, 'Moderada\r', NULL),
(50, 20, 5, 15, 4, 3, 3, 90, 'Moderada\r', NULL),
(51, 1, 6, 12, 3, 1, 4, 60, 'Moderada\r', NULL),
(52, 3, 6, 15, 4, 1, 4, 90, 'Alta\r', NULL),
(53, 5, 7, 20, 3, 2, 5, 75, 'Moderada\r', NULL),
(54, 7, 7, 10, 5, 2, 5, 60, 'Alta\r', NULL),
(55, 9, 8, 8, 4, 3, 1, 60, 'Moderada\r', NULL),
(56, 11, 8, 12, 3, 3, 1, 75, 'Alta\r', NULL),
(57, 13, 9, 15, 4, 1, 2, 90, 'Baja\r', NULL),
(58, 15, 9, 20, 5, 1, 2, 45, 'Moderada\r', NULL),
(59, 17, 10, 10, 4, 2, 3, 60, 'Alta\r', NULL),
(60, 19, 10, 15, 3, 2, 3, 75, 'Alta\r', NULL),
(61, 2, 11, 12, 3, 1, 4, 60, 'Moderada\r', NULL),
(62, 4, 11, 10, 4, 1, 4, 75, 'Alta\r', NULL),
(63, 6, 12, 15, 3, 2, 5, 90, 'Moderada\r', NULL),
(64, 8, 12, 20, 4, 2, 5, 60, 'Alta\r', NULL),
(65, 10, 13, 8, 5, 1, 6, 75, 'Baja\r', NULL),
(66, 12, 13, 10, 3, 1, 6, 60, 'Moderada\r', NULL),
(67, 14, 14, 15, 4, 2, 1, 60, 'Alta\r', NULL),
(68, 16, 14, 12, 5, 2, 1, 75, 'Alta\r', NULL),
(69, 18, 15, 10, 3, 3, 2, 60, 'Moderada\r', NULL),
(70, 20, 15, 15, 4, 3, 2, 90, 'Moderada\r', NULL),
(71, 1, 16, 12, 3, 1, 3, 60, 'Moderada\r', NULL),
(72, 3, 16, 15, 4, 1, 3, 90, 'Alta\r', NULL),
(73, 5, 17, 20, 3, 2, 4, 75, 'Moderada\r', NULL),
(74, 7, 17, 10, 5, 2, 4, 60, 'Alta\r', NULL),
(75, 9, 18, 8, 4, 3, 5, 60, 'Moderada\r', NULL),
(76, 11, 18, 12, 3, 3, 5, 75, 'Alta\r', NULL),
(77, 13, 19, 15, 4, 1, 6, 90, 'Baja\r', NULL),
(78, 15, 19, 20, 5, 1, 6, 45, 'Moderada\r', NULL),
(79, 17, 20, 10, 4, 2, 1, 60, 'Alta\r', NULL),
(80, 19, 20, 15, 3, 2, 1, 75, 'Alta\r', NULL),
(81, 2, 12, 12, 3, 1, 2, 60, 'Moderada\r', NULL),
(82, 4, 13, 10, 4, 1, 2, 75, 'Alta\r', NULL),
(83, 6, 13, 15, 3, 2, 3, 90, 'Moderada', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenador`
--

CREATE TABLE `entrenador` (
  `idEntrenador` int(11) NOT NULL,
  `espEntrenador` varchar(40) NOT NULL,
  `expEntrenador` float DEFAULT NULL,
  `bioEntrenador` varchar(200) DEFAULT NULL,
  `pagEntrenador` varchar(20) NOT NULL,
  `calEntrenador` float DEFAULT 0,
  `fkIdUsuario` int(11) NOT NULL,
  `nomEntrenador` varchar(20) NOT NULL,
  `apeEntrenador` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrenador`
--

INSERT INTO `entrenador` (`idEntrenador`, `espEntrenador`, `expEntrenador`, `bioEntrenador`, `pagEntrenador`, `calEntrenador`, `fkIdUsuario`, `nomEntrenador`, `apeEntrenador`) VALUES
(1, 'Entrenamiento Funcional', 12.5, '', 'Nequi', 4.5, 1, 'Juan', 'Perez\r'),
(2, 'Personal Trainer', 24, 'Ex-futbolista profesional.', 'Davivienda', 5, 5, 'Pedro', 'Garcia\r'),
(3, 'Preparacion Fisica', 36, 'Especialista en deportes de alto rendimiento.', 'Bancolombia', 4, 7, 'Diego', 'Fernandez\r'),
(4, 'Yoga', 8.5, '', 'Nequi', 3.5, 11, 'Daniel', 'Morales\r'),
(5, 'Crossfit', 18, 'Apasionado del deporte y la salud integral.', 'Bancolombia', 4, 15, 'Felipe', 'Navarro\r'),
(6, 'Calistenia', 5, '', 'Davivienda', 4.5, 20, 'Susana', 'Blanco\r'),
(7, 'Entrenamiento en Casa', 15, 'Experto en rutinas para espacios reducidos.', 'Nequi', 4, 23, 'Sebastian', 'Munoz\r'),
(8, 'Pesas y Fuerza', 48, 'Mas de 10 anos trabajando con atletas.', 'Bancolombia', 4.5, 29, 'Javier', 'Suarez\r'),
(9, 'Boxeo', 20.5, '', 'Davivienda', 5, 34, 'Paula', 'Ospina\r'),
(10, 'HIIT', 6, 'Rutinas rapidas y efectivas.', 'Bancolombia', 4, 39, 'Josefina', 'Tamayo\r'),
(11, 'Running Coach', 30, 'Entrenador de maratones.', 'Nequi', 4.5, 41, 'Maria', 'Beltran\r'),
(12, 'Natacion', 22.5, 'Entrenador certificado en aguas abiertas.', 'Bancolombia', 5, 44, 'Andres', 'Vera\r'),
(13, 'Ciclismo', 10, '', 'Nequi', 4, 49, 'Karla', 'Zapata\r'),
(14, 'Pilates', 15.5, '', 'Nequi', 4, 52, 'Javier', 'Lozano\r'),
(15, 'Fuerza y Condicionamiento', 12, 'Entrenador especializado en fuerza.', 'Davivienda', 4, 54, 'Francisco', 'Martin\r'),
(16, 'Terapia de Ejercicio', 6.5, 'Entrenador de rehabilitacion.', 'Bancolombia', 5, 32, 'Alejandra', 'Cano\r'),
(17, 'Deportes de Equipo', 8, 'Entrenador de baloncesto.', 'Davivienda', 4.5, 16, 'Valentina', 'Vega\r'),
(18, 'Entrenamiento Personalizado', 14.5, '', 'Nequi', 4, 26, 'Isabella', 'Ortiz\r'),
(19, 'Defensa Personal', 9, '', 'Nequi', 4, 28, 'angela', 'Vargas\r'),
(20, 'Danza', 7, 'Instructor de diferentes estilos de baile.', 'Bancolombia', 4.5, 36, 'Sara', 'Barragan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPago` int(11) NOT NULL,
  `valPago` int(8) NOT NULL,
  `fecPago` date NOT NULL,
  `estPago` varchar(15) NOT NULL,
  `metPago` varchar(20) NOT NULL,
  `facPago` int(11) DEFAULT NULL,
  `fkIdSuscrip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idPago`, `valPago`, `fecPago`, `estPago`, `metPago`, `facPago`, `fkIdSuscrip`) VALUES
(1, 480000, '2024-01-15', 'aprobado', 'credito', 1001, 1),
(2, 1440000, '2024-01-10', 'rechazado', 'debito', 0, 2),
(3, 100000, '2024-02-01', 'aprobado', 'PSE', 1002, 3),
(4, 320000, '2024-01-20', 'rechazado', 'credito', 0, 4),
(5, 150000, '2024-02-15', 'aprobado', 'debito', 1003, 5),
(6, 180000, '2024-01-12', 'aprobado', 'PSE', 1004, 6),
(7, 300000, '2024-01-25', 'rechazado', 'credito', 0, 7),
(8, 120000, '2024-02-05', 'aprobado', 'debito', 1005, 8),
(9, 200000, '2024-01-30', 'rechazado', 'PSE', 0, 9),
(10, 1600000, '2024-02-20', 'aprobado', 'credito', 1006, 10),
(11, 2000000, '2024-01-18', 'rechazado', 'debito', 0, 11),
(12, 500000, '2024-02-02', 'aprobado', 'PSE', 1007, 12),
(13, 360000, '2024-01-22', 'rechazado', 'credito', 0, 13),
(14, 250000, '2024-02-10', 'aprobado', 'debito', 1008, 14),
(15, 1200000, '2024-01-28', 'rechazado', 'PSE', 0, 15),
(16, 450000, '2024-02-15', 'aprobado', 'credito', 1009, 16),
(17, 1000000, '2024-01-05', 'rechazado', 'debito', 0, 17),
(18, 150000, '2024-02-12', 'aprobado', 'PSE', 1010, 18),
(19, 480000, '2024-01-10', 'rechazado', 'credito', 0, 19),
(20, 100000, '2024-02-14', 'aprobado', 'debito', 1011, 20),
(21, 450000, '2024-01-15', 'aprobado', 'PSE', 1012, 21),
(22, 1440000, '2024-01-10', 'aprobado', 'credito', 1013, 2),
(23, 320000, '2024-01-20', 'aprobado', 'debito', 1014, 4),
(24, 300000, '2024-01-25', 'aprobado', 'PSE', 1015, 7),
(25, 200000, '2024-01-30', 'aprobado', 'credito', 1016, 9),
(26, 2000000, '2024-01-18', 'aprobado', 'debito', 1017, 11),
(27, 360000, '2024-01-22', 'aprobado', 'PSE', 1018, 13),
(28, 1200000, '2024-01-28', 'aprobado', 'credito', 1019, 15),
(29, 1000000, '2024-01-05', 'aprobado', 'debito', 1020, 17),
(30, 480000, '2024-01-10', 'aprobado', 'PSE', 1021, 19),
(31, 1440000, '2024-02-09', 'aprobado', 'credito', 1022, 2),
(32, 100000, '2024-01-31', 'aprobado', 'debito', 1023, 3),
(33, 100000, '0000-00-00', 'aprobado', 'PSE', 1024, 3),
(34, 320000, '2024-02-19', 'aprobado', 'credito', 1025, 4),
(35, 150000, '2024-03-14', 'aprobado', 'debito', 1026, 5),
(36, 180000, '2024-02-11', 'aprobado', 'PSE', 1027, 6),
(37, 180000, '2024-03-11', 'aprobado', 'credito', 1028, 6),
(38, 180000, '2024-04-11', 'aprobado', 'debito', 1029, 6),
(39, 300000, '2024-02-24', 'aprobado', 'PSE', 1030, 7),
(40, 120000, '2024-03-04', 'aprobado', 'credito', 1031, 8),
(41, 1600000, '2024-03-19', 'aprobado', 'debito', 1032, 10),
(42, 2000000, '2024-02-17', 'aprobado', 'PSE', 1033, 11),
(43, 360000, '2024-02-21', 'aprobado', 'credito', 1034, 13),
(44, 250000, '2024-03-09', 'aprobado', 'debito', 1035, 14),
(45, 1200000, '2024-02-27', 'aprobado', 'PSE', 1036, 15),
(46, 450000, '2024-03-14', 'aprobado', 'credito', 1037, 16),
(47, 450000, '2024-04-14', 'aprobado', 'credito', 1038, 16),
(48, 450000, '2024-05-14', 'aprobado', 'debito', 1039, 16),
(49, 450000, '2024-06-14', 'aprobado', 'PSE', 1040, 16),
(50, 1000000, '2024-02-04', 'aprobado', 'credito', 1041, 17),
(51, 150000, '2024-03-11', 'aprobado', 'debito', 1042, 18),
(52, 480000, '2024-02-09', 'aprobado', 'PSE', 1043, 19),
(53, 100000, '2024-03-13', 'aprobado', 'credito', 1044, 20),
(54, 450000, '2024-02-14', 'aprobado', 'debito', 1045, 21),
(55, 450000, '2024-02-14', 'aprobado', 'PSE', 1046, 21),
(56, 450000, '2024-02-14', 'aprobado', 'credito', 1047, 21),
(57, 450000, '2024-02-14', 'aprobado', 'debito', 1048, 21),
(58, 450000, '2024-02-14', 'aprobado', 'PSE', 1049, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina`
--

CREATE TABLE `rutina` (
  `idRutina` int(11) NOT NULL,
  `semRutina` int(11) NOT NULL,
  `descRutina` varchar(40) NOT NULL,
  `creaRutina` date NOT NULL,
  `autRutina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutina`
--

INSERT INTO `rutina` (`idRutina`, `semRutina`, `descRutina`, `creaRutina`, `autRutina`) VALUES
(1, 4, 'Entrenamiento fuerza tren superior', '2024-08-01', 1),
(2, 6, 'Resistencia cardiovascular avanzada', '2024-08-15', 2),
(3, 3, 'Rutina basica de pesas', '2024-09-10', 0),
(4, 5, 'Entrenamiento funcional sin pesas', '2024-09-22', 3),
(5, 8, 'Ganancia muscular progresiva', '2024-10-05', 1),
(6, 2, 'Yoga y flexibilidad', '2024-09-29', 0),
(7, 4, 'HIIT para quema de grasa', '2024-10-01', 4),
(8, 3, 'Fortalecimiento de core', '2024-10-08', 2),
(9, 6, 'Rutina para hipertrofia', '2024-10-12', 5),
(10, 7, 'Plan maraton', '2024-09-18', 6),
(11, 1, 'Estiramientos para movilidad', '2024-10-04', 0),
(12, 5, 'Entrenamiento funcional con pesas', '2024-09-30', 4),
(13, 8, 'Entrenamiento personalizado completo', '2024-10-06', 1),
(14, 4, 'Entrenamiento para aumento de resistenci', '2024-10-07', 7),
(15, 3, 'Trabajo en tren inferior', '2024-10-09', 8),
(16, 2, 'Plan de recuperacion activa', '2024-09-25', 0),
(17, 10, 'Plan intensivo para atletas', '2024-10-10', 3),
(18, 6, 'Programa equilibrio y estabilidad', '2024-09-27', 6),
(19, 12, 'Entrenamiento personalizado anual', '2024-10-13', 9),
(20, 9, 'Desarrollo fisico integral', '2024-10-11', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripcion`
--

CREATE TABLE `suscripcion` (
  `idSuscrip` int(11) NOT NULL,
  `fkIdCliente` int(11) NOT NULL,
  `fkIdEntrenador` int(11) NOT NULL,
  `iniSuscrip` date NOT NULL,
  `finSuscrip` date NOT NULL,
  `estSuscrip` varchar(15) NOT NULL,
  `renSuscrip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suscripcion`
--

INSERT INTO `suscripcion` (`idSuscrip`, `fkIdCliente`, `fkIdEntrenador`, `iniSuscrip`, `finSuscrip`, `estSuscrip`, `renSuscrip`) VALUES
(1, 1, 3, '2024-01-15', '2024-02-15', 'activa', 0),
(2, 3, 4, '2024-01-10', '2024-03-10', 'activa', 1),
(3, 5, 5, '2024-02-01', '2024-05-01', 'vencida', 2),
(4, 7, 6, '2024-01-20', '2024-03-20', 'cancelada', 1),
(5, 9, 7, '2024-02-15', '2024-04-15', 'activa', 1),
(6, 11, 8, '2024-01-12', '2024-05-12', 'vencida', 3),
(7, 14, 9, '2024-01-25', '2024-03-25', 'activa', 1),
(8, 15, 10, '2024-02-05', '2024-04-05', 'cancelada', 1),
(9, 17, 11, '2024-01-30', '0000-00-00', 'activa', 0),
(10, 20, 12, '2024-02-20', '2024-04-20', 'activa', 1),
(11, 22, 13, '2024-01-18', '2024-03-18', 'vencida', 1),
(12, 24, 14, '2024-02-02', '2024-03-02', 'activa', 0),
(13, 27, 15, '2024-01-22', '2024-03-22', 'cancelada', 1),
(14, 28, 16, '2024-02-10', '2024-04-10', 'activa', 1),
(15, 30, 17, '2024-01-28', '2024-03-28', 'vencida', 1),
(16, 32, 18, '2024-02-15', '2024-07-15', 'activa', 4),
(17, 34, 19, '2024-01-05', '2024-03-05', 'cancelada', 1),
(18, 37, 20, '2024-02-12', '2024-04-12', 'activa', 1),
(19, 38, 3, '2024-01-10', '2024-03-10', 'vencida', 1),
(20, 40, 5, '2024-02-14', '2024-04-14', 'activa', 1),
(21, 7, 18, '2024-03-21', '2024-09-21', 'activa', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `emaUsuario` varchar(40) NOT NULL,
  `nacUsuario` date NOT NULL,
  `edadUsuario` int(3) NOT NULL,
  `pasUsuario` varchar(20) NOT NULL,
  `genUsuario` varchar(10) NOT NULL,
  `tipDocumento` varchar(25) NOT NULL,
  `docUsuario` int(11) NOT NULL,
  `ciuUsuario` varchar(20) DEFAULT NULL,
  `municipioUsuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `emaUsuario`, `nacUsuario`, `edadUsuario`, `pasUsuario`, `genUsuario`, `tipDocumento`, `docUsuario`, `ciuUsuario`, `municipioUsuario`) VALUES
(1, 'juan.perez1@example.com', '1990-05-10', 34, 'pass1234', 'M', 'Cedula de ciudadania', 2147483647, 'Riohacha', ''),
(2, 'ana.gomez2@example.com', '1995-08-21', 29, 'pass2345', 'F', 'Cedula de ciudadania', 2147483647, 'Dosquebradas', ''),
(3, 'carlos.lopez3@example.com', '1987-12-02', 36, 'pass3456', 'M', 'Cedula de extranjeria', 2147483647, 'Pasto', ''),
(4, 'sara.marTarjeta de identidadnez4@example', '2007-07-15', 17, 'pass4567', 'F', 'Tarjeta de identidad', 2147483647, 'Puerto Boyaca', ''),
(5, 'pedro.garcia5@example.com', '1993-03-30', 31, 'pass5678', 'M', 'Cedula de ciudadania', 2147483647, 'Medellin', ''),
(6, 'mariana.torres6@example.com', '1999-11-05', 24, 'pass6789', 'F', 'Cedula de ciudadania', 2147483647, 'Zipaquira', ''),
(7, 'diego.fernandez7@example.com', '1988-04-20', 36, 'pass7890', 'M', 'Cedula de ciudadania', 2147483647, 'Armenia', ''),
(8, 'camila.mendoza8@example.com', '2010-10-28', 14, 'pass8901', 'F', 'Tarjeta de identidad', 2147483647, 'Chia', ''),
(9, 'fernando.santos9@example.com', '1985-02-08', 39, 'pass9012', 'M', 'Cedula de ciudadania', 1590123467, 'Bucaramanga', ''),
(10, 'lucia.rodriguez10@example.com', '1996-09-12', 28, 'pass0123', 'F', 'Cedula de ciudadania', 2147483647, 'Tulua', ''),
(11, 'daniel.morales11@example.com', '1992-12-22', 31, 'pass1230', 'M', 'Cedula de ciudadania', 2147483647, 'San Andres', ''),
(12, 'laura.guTarjeta de identidaderrez12@exam', '1994-08-02', 30, 'pass2341', 'F', 'Cedula de ciudadania', 2147483647, 'Chia', ''),
(13, 'andres.silva13@example.com', '1998-10-15', 26, 'pass3452', 'M', 'Cedula de ciudadania', 2147483647, 'Cajica', ''),
(14, 'paula.romero14@example.com', '1997-05-25', 27, 'pass4563', 'F', 'Cedula de ciudadania', 2147483647, 'Zipaquira', ''),
(15, 'felipe.navarro15@example.com', '1989-03-14', 35, 'pass5674', 'M', 'Cedula de ciudadania', 2147483647, 'Tunja', ''),
(16, 'valenTarjeta de identidadna.vega16@examp', '2003-01-30', 21, 'pass6785', 'F', 'Cedula de ciudadania', 2147483647, 'Chia', ''),
(17, 'jose.pena17@example.com', '1986-11-11', 37, 'pass7896', 'M', 'Cedula de ciudadania', 1934567801, 'Ibague', ''),
(18, 'karla.rios18@example.com', '1991-07-07', 33, 'pass8907', 'F', 'Cedula de ciudadania', 2147483647, 'Bogota', ''),
(19, 'miguel.angulo19@example.com', '1983-06-25', 41, 'pass9018', 'M', 'Cedula de extranjeria', 1045678901, 'Bogota', ''),
(20, 'susana.blanco20@example.com', '1999-08-09', 25, 'pass0129', 'F', 'Cedula de ciudadania', 2147483647, 'Fusagasuga', ''),
(21, 'mateo.castro21@example.com', '2004-05-17', 20, 'pass1240', 'M', 'Cedula de ciudadania', 2147483647, 'Zipaquira', ''),
(22, 'adriana.delgado22@example.com', '1990-12-29', 33, 'pass2351', 'F', 'Cedula de ciudadania', 2147483647, 'Bogota', ''),
(23, 'sebasTarjeta de identidadan.munoz23@exam', '1992-02-14', 32, 'pass3462', 'M', 'Cedula de extranjeria', 2147483647, 'Yopal', ''),
(24, 'diana.flores24@example.com', '1997-09-01', 27, 'pass4573', 'F', 'Cedula de ciudadania', 2147483647, 'Chia', ''),
(25, 'francisco.arias25@example.com', '1984-03-06', 40, 'pass5684', 'M', 'Cedula de ciudadania', 1378901245, 'Barranquilla', ''),
(26, 'isabella.orTarjeta de identidadz26@examp', '2001-11-21', 22, 'pass6795', 'F', 'Cedula de ciudadania', 2147483647, 'Turbo', ''),
(27, 'crisTarjeta de identidadan.campos27@exam', '1995-04-09', 29, 'pass7806', 'M', 'Cedula de ciudadania', 2147483647, 'Envigado', ''),
(28, 'angela.vargas28@example.com', '1993-08-18', 31, 'pass8917', 'F', 'Cedula de ciudadania', 2147483647, 'Medellin', ''),
(29, 'javier.suarez29@example.com', '1989-01-12', 35, 'pass9028', 'M', 'Cedula de ciudadania', 2147483647, 'Bogota', ''),
(30, 'natalia.cardenas30@example.com', '2002-02-27', 22, 'pass0139', 'F', 'Cedula de ciudadania', 2147483647, 'Chiquinquira', ''),
(31, 'esteban.vallejo31@example.com', '1998-07-14', 26, 'pass1240', 'M', 'Cedula de ciudadania', 2147483647, 'Rionegro', ''),
(32, 'alejandra.cano32@example.com', '1991-10-03', 33, 'pass2351', 'F', 'Cedula de ciudadania', 2147483647, 'Medellin', ''),
(33, 'tomas.ramirez33@example.com', '1997-05-19', 27, 'pass3462', 'M', 'Cedula de extranjeria', 2147483647, 'Maicao', ''),
(34, 'paula.ospina34@example.com', '1985-12-01', 38, 'pass4573', 'F', 'Cedula de extranjeria', 1712345689, 'Pereira', ''),
(35, 'daniel.villa35@example.com', '1993-09-15', 31, 'pass5684', 'M', 'Cedula de ciudadania', 2147483647, 'Chia', ''),
(36, 'sara.barragan36@example.com', '1994-06-30', 30, 'pass6795', 'F', 'Cedula de ciudadania', 2147483647, 'Chia', ''),
(37, 'felipe.correa37@example.com', '1999-03-22', 25, 'pass7806', 'M', 'Cedula de extranjeria', 2147483647, 'Zipaquira', ''),
(38, 'ana.diaz38@example.com', '2000-08-16', 24, 'pass8917', 'F', 'Cedula de ciudadania', 2147483647, 'Zipaquira', ''),
(39, 'josefina.tamayo39@example.com', '1988-01-07', 36, 'pass9028', 'F', 'Cedula de ciudadania', 2147483647, 'Bogota', ''),
(40, 'luis.murillo40@example.com', '1992-12-10', 31, 'pass0139', 'M', 'Cedula de ciudadania', 2147483647, 'Medellin', ''),
(41, 'maria.beltran41@example.com', '1987-04-25', 37, 'pass1240', 'F', 'Cedula de ciudadania', 2045678912, 'Bogota', ''),
(42, 'diego.sierra42@example.com', '2001-07-22', 23, 'pass2351', 'M', 'Cedula de ciudadania', 2147483647, 'Buga', ''),
(43, 'camila.mora43@example.com', '1995-01-05', 29, 'pass3462', 'F', 'Cedula de extranjeria', 2147483647, 'Chia', ''),
(44, 'andres.vera44@example.com', '1983-09-11', 41, 'pass4573', 'M', 'Cedula de ciudadania', 1156789023, 'Medellin', ''),
(45, 'susana.arenas45@example.com', '1994-05-06', 30, 'pass5684', 'F', 'Cedula de extranjeria', 2147483647, 'Puerto Carreno', ''),
(46, 'mateo.gomez46@example.com', '1996-02-19', 28, 'pass6795', 'M', 'Cedula de ciudadania', 2147483647, 'Sabanalarga', ''),
(47, 'adriana.paTarjeta de identidadno47@examp', '2009-07-10', 15, 'pass7806', 'F', 'Tarjeta de identidad', 2147483647, 'Zipaquira', ''),
(48, 'jose.alvarez48@example.com', '2000-09-23', 24, 'pass8917', 'M', 'Cedula de ciudadania', 2147483647, 'Guaduas', ''),
(49, 'karla.zapata49@example.com', '1997-03-08', 27, 'pass9028', 'F', 'Cedula de ciudadania', 2147483647, 'Zipaquira', ''),
(50, 'miguel.vargas50@example.com', '1989-11-20', 34, 'pass0139', 'M', 'Cedula de extranjeria', 2147483647, 'Bogota', ''),
(51, 'laura.hernandez51@example.com', '1986-10-31', 37, 'pass1240', 'F', 'Cedula de ciudadania', 1823456790, 'Santa Marta', ''),
(52, 'javier.lozano52@example.com', '2003-06-01', 21, 'pass2351', 'M', 'Cedula de ciudadania', 2147483647, 'Zipaquira', ''),
(53, 'diana.sanchez53@example.com', '1991-01-19', 33, 'pass3462', 'F', 'Cedula de ciudadania', 2147483647, 'Popayan', ''),
(54, 'francisco.marTarjeta de identidadn54@exa', '1984-08-03', 40, 'pass4573', 'M', 'Cedula de ciudadania', 1489012356, 'Cartagena', ''),
(55, 'angela.rojas55@example.com', '1995-12-14', 29, 'pass5684', 'F', 'Cedula de ciudadania', 2147483647, 'Giron', ''),
(56, 'esteban.castro56@example.com', '1988-03-17', 36, 'pass6795', 'M', 'Cedula de ciudadania', 2147483647, 'Villavicencio', ''),
(57, 'isabella.giraldo57@example.com', '2001-10-11', 23, 'pass7806', 'F', 'Cedula de extranjeria', 2147483647, 'Apartado', ''),
(58, 'daniel.mejia58@example.com', '2011-04-28', 13, 'pass8917', 'M', 'Tarjeta de identidad', 2147483647, 'Chia', ''),
(59, 'sara.cortes59@example.com', '1985-06-13', 39, 'pass9028', 'F', 'Cedula de ciudadania', 1601234578, 'Cucuta', ''),
(60, 'pedro.ramirez60@example.com', '1983-12-05', 40, 'pass0139', 'M', 'Cedula de ciudadania', 1267890134, 'Cali', ''),
(62, 'andresmena12@gmail.com', '2005-12-22', 19, 'andres123', 'Masculino', 'CC', 1123530658, 'Bogota', 'Bogota DC'),
(63, 'luismedina@gmail.com', '2007-01-10', 18, 'medina123', 'Masculino', 'TI', 1987654321, 'Chia', 'Cundinamarca'),
(64, 'marthasanchez1@gmail.com', '2007-12-12', 17, 'martha123', 'Femenino', 'TI', 123456789, 'Bogota', 'Bogota DC'),
(68, 'williamespinel1@gmail.com', '2005-01-01', 20, 'espinel123', 'Masculino', 'CC', 987654321, 'Bogota', 'Bogota DC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`idCalificacion`),
  ADD KEY `fkIdRutina` (`fkIdRutina`),
  ADD KEY `fkIdCliente` (`fkIdCliente`);

--
-- Indices de la tabla `certificado`
--
ALTER TABLE `certificado`
  ADD PRIMARY KEY (`idCertificado`),
  ADD KEY `fkIdEntrenador` (`fkIdEntrenador`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `fkIdUsuario` (`fkIdUsuario`);

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`idDiag`),
  ADD KEY `fkIdCliente` (`fkIdCliente`),
  ADD KEY `fkIdRutina` (`fkIdRutina`);

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`idEjercicio`);

--
-- Indices de la tabla `ejercicio_rutina`
--
ALTER TABLE `ejercicio_rutina`
  ADD PRIMARY KEY (`idEje_Rut`),
  ADD KEY `fkIdRutina` (`fkIdRutina`),
  ADD KEY `fkIdEjercicio` (`fkIdEjercicio`);

--
-- Indices de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD PRIMARY KEY (`idEntrenador`),
  ADD KEY `fkIdUsuario` (`fkIdUsuario`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPago`),
  ADD KEY `fkIdSuscrip` (`fkIdSuscrip`);

--
-- Indices de la tabla `rutina`
--
ALTER TABLE `rutina`
  ADD PRIMARY KEY (`idRutina`),
  ADD KEY `autRutina` (`autRutina`);

--
-- Indices de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD PRIMARY KEY (`idSuscrip`),
  ADD KEY `fkIdCliente` (`fkIdCliente`),
  ADD KEY `fkIdEntrenador` (`fkIdEntrenador`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `idCalificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `certificado`
--
ALTER TABLE `certificado`
  MODIFY `idCertificado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `idDiag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `idEjercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ejercicio_rutina`
--
ALTER TABLE `ejercicio_rutina`
  MODIFY `idEje_Rut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  MODIFY `idEntrenador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `rutina`
--
ALTER TABLE `rutina`
  MODIFY `idRutina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  MODIFY `idSuscrip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`fkIdRutina`) REFERENCES `rutina` (`idRutina`),
  ADD CONSTRAINT `calificacion_ibfk_3` FOREIGN KEY (`fkIdCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `certificado`
--
ALTER TABLE `certificado`
  ADD CONSTRAINT `certificado_ibfk_1` FOREIGN KEY (`fkIdEntrenador`) REFERENCES `entrenador` (`idEntrenador`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`fkIdUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `diagnostico_ibfk_1` FOREIGN KEY (`fkIdCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `diagnostico_ibfk_2` FOREIGN KEY (`fkIdRutina`) REFERENCES `rutina` (`idRutina`);

--
-- Filtros para la tabla `ejercicio_rutina`
--
ALTER TABLE `ejercicio_rutina`
  ADD CONSTRAINT `ejercicio_rutina_ibfk_1` FOREIGN KEY (`fkIdRutina`) REFERENCES `rutina` (`idRutina`),
  ADD CONSTRAINT `ejercicio_rutina_ibfk_2` FOREIGN KEY (`fkIdEjercicio`) REFERENCES `ejercicio` (`idEjercicio`);

--
-- Filtros para la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD CONSTRAINT `entrenador_ibfk_1` FOREIGN KEY (`fkIdUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`fkIdSuscrip`) REFERENCES `suscripcion` (`idSuscrip`);

--
-- Filtros para la tabla `rutina`
--
ALTER TABLE `rutina`
  ADD CONSTRAINT `rutina_ibfk_1` FOREIGN KEY (`autRutina`) REFERENCES `entrenador` (`idEntrenador`);

--
-- Filtros para la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD CONSTRAINT `suscripcion_ibfk_1` FOREIGN KEY (`fkIdCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `suscripcion_ibfk_2` FOREIGN KEY (`fkIdEntrenador`) REFERENCES `entrenador` (`idEntrenador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
