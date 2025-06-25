-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2025 a las 01:15:15
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `PA_describirRutinaPorId` (IN `p_idRutina` INT)   BEGIN
    SELECT rutina.idRutina as ID_RUTINA, rutina.descRutina AS DESCRIPCION, ejercicio_rutina.semana as SEMANA, ejercicio_rutina.dia as DIA, ejercicio_rutina.repeticiones as REPETICIONES, ejercicio.nomEjercicio AS EJERCICIO, ejercicio_rutina.intensidad as INTENCIDAD, ejercicio_rutina.descanso as SEGUNDOS_DESCANSO, ejercicio.descEjercicio as DESCRIPCION, video.urlVideo as TUTORIAL FROM rutina INNER JOIN ejercicio_rutina on rutina.idRutina = ejercicio_rutina.fkIdRutina INNER JOIN ejercicio on ejercicio_rutina.fkIdEjercicio = ejercicio.idEjercicio INNER JOIN video on ejercicio.idEjercicio = video.fkIdEjercicio where rutina.idRutina = p_idrutina order by ejercicio_rutina.semana, ejercicio_rutina.dia;
END$$

DELIMITER ;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `idEjercicio` int(11) NOT NULL,
  `nomEjercicio` varchar(20) NOT NULL,
  `descEjercicio` varchar(90) NOT NULL,
  `tipEjercicio` varchar(20) NOT NULL,
  `autEjercicio` int(11) DEFAULT NULL,
  `urlVideo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`idEjercicio`, `nomEjercicio`, `descEjercicio`, `tipEjercicio`, `autEjercicio`, `urlVideo`) VALUES
(1, 'Descanso', 'Descanso', 'no requiere maquina', NULL, ''),
(2, 'Sentadillas', 'Ejercicio que fortalece piernas y glúteos sin necesidad de equipos.', 'no requiere maquina', NULL, ''),
(3, 'Curl de bíceps', 'Ejercicio enfocado en los bíceps, se realiza con una máquina de poleas.', 'con maquina', NULL, ''),
(4, 'Plancha abdominal', 'Ejercicio de resistencia para el core que no requiere maquinaria.', 'no requiere maquina', NULL, ''),
(5, 'Press de banca', 'Ejercicio para trabajar el pecho utilizando una máquina de pesas.', 'con maquina', NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio_rutina`
--

CREATE TABLE `ejercicio_rutina` (
  `idEje_Rut` int(11) NOT NULL,
  `fkIdEjercicio` int(11) NOT NULL,
  `fkIdRutina` int(11) NOT NULL,
  `peso` int(11) DEFAULT NULL,
  `repeticiones` int(11) DEFAULT NULL,
  `series` int(11) DEFAULT NULL,
  `dia` int(11) NOT NULL,
  `semana` int(11) NOT NULL,
  `descanso` int(11) DEFAULT NULL,
  `intensidad` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicio_rutina`
--

INSERT INTO `ejercicio_rutina` (`idEje_Rut`, `fkIdEjercicio`, `fkIdRutina`, `peso`, `repeticiones`, `series`, `dia`, `semana`, `descanso`, `intensidad`) VALUES
(3, 2, 1, NULL, NULL, NULL, 1, 2, NULL, 'avanzado'),
(4, 3, 2, NULL, NULL, NULL, 1, 2, NULL, 'avanzado'),
(5, 3, 2, NULL, NULL, NULL, 1, 2, NULL, 'avanzado'),
(6, 1, 2, NULL, NULL, NULL, 2, 2, NULL, 'avanzado'),
(7, 2, 2, NULL, NULL, NULL, 3, 2, NULL, 'avanzado'),
(8, 2, 2, NULL, NULL, NULL, 3, 2, NULL, 'avanzado'),
(9, 5, 2, NULL, NULL, NULL, 1, 3, NULL, 'avanzado'),
(10, 5, 2, NULL, NULL, NULL, 1, 3, NULL, 'avanzado'),
(11, 1, 2, NULL, NULL, NULL, 2, 3, NULL, 'avanzado'),
(12, 4, 2, NULL, NULL, NULL, 3, 3, NULL, 'avanzado'),
(13, 3, 3, NULL, NULL, NULL, 1, 1, NULL, 'principiante'),
(14, 1, 3, NULL, NULL, NULL, 2, 1, NULL, 'principiante'),
(15, 1, 3, NULL, NULL, NULL, 2, 1, NULL, 'principiante'),
(16, 4, 3, NULL, NULL, NULL, 3, 1, NULL, 'principiante'),
(17, 4, 3, NULL, NULL, NULL, 3, 1, NULL, 'principiante'),
(18, 5, 3, NULL, NULL, NULL, 1, 2, NULL, 'principiante'),
(19, 5, 3, NULL, NULL, NULL, 1, 2, NULL, 'principiante'),
(20, 2, 3, NULL, NULL, NULL, 2, 2, NULL, 'principiante'),
(21, 1, 3, NULL, NULL, NULL, 2, 2, NULL, 'principiante'),
(22, 5, 6, NULL, NULL, NULL, 1, 1, NULL, 'avanzado'),
(23, 1, 7, NULL, NULL, NULL, 1, 1, NULL, 'principiante'),
(24, 5, 8, NULL, NULL, NULL, 1, 1, NULL, 'principiante'),
(25, 5, 8, NULL, NULL, NULL, 1, 1, NULL, 'principiante'),
(26, 3, 8, NULL, NULL, NULL, 2, 1, NULL, 'principiante'),
(27, 1, 8, NULL, NULL, NULL, 2, 1, NULL, 'principiante'),
(28, 1, 8, NULL, NULL, NULL, 1, 2, NULL, 'principiante'),
(29, 1, 8, NULL, NULL, NULL, 1, 2, NULL, 'principiante'),
(30, 1, 8, NULL, NULL, NULL, 2, 2, NULL, 'principiante'),
(31, 1, 8, NULL, NULL, NULL, 2, 2, NULL, 'principiante'),
(32, 3, 11, NULL, NULL, NULL, 1, 2, NULL, 'principiante'),
(33, 5, 12, NULL, NULL, NULL, 1, 2, NULL, 'intermedio'),
(34, 2, 13, NULL, NULL, NULL, 1, 2, NULL, 'principiante'),
(35, 1, 15, NULL, NULL, NULL, 1, 2, NULL, 'principiante'),
(36, 1, 15, NULL, NULL, NULL, 1, 2, NULL, 'principiante'),
(37, 1, 15, NULL, NULL, NULL, 2, 2, NULL, 'principiante'),
(38, 3, 15, NULL, NULL, NULL, 2, 2, NULL, 'principiante'),
(39, 4, 15, NULL, NULL, NULL, 1, 3, NULL, 'principiante'),
(40, 4, 15, NULL, NULL, NULL, 1, 3, NULL, 'principiante'),
(41, 4, 15, NULL, NULL, NULL, 2, 3, NULL, 'principiante'),
(42, 2, 15, NULL, NULL, NULL, 2, 3, NULL, 'principiante'),
(57, 1, 16, NULL, NULL, NULL, 1, 2, NULL, 'principiante'),
(60, 1, 16, NULL, NULL, NULL, 1, 3, NULL, 'principiante'),
(62, 1, 16, NULL, NULL, NULL, 2, 3, NULL, 'principiante');

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
  `fkIdUsuario` int(11) DEFAULT NULL,
  `nomEntrenador` varchar(20) NOT NULL,
  `apeEntrenador` varchar(20) NOT NULL,
  `estadoEntrenador` enum('activo','inactivo') NOT NULL,
  `calificacion` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrenador`
--

INSERT INTO `entrenador` (`idEntrenador`, `espEntrenador`, `expEntrenador`, `bioEntrenador`, `pagEntrenador`, `fkIdUsuario`, `nomEntrenador`, `apeEntrenador`, `estadoEntrenador`, `calificacion`) VALUES
(1, 'atletismo', 5, 'corredor de largas distancias desde hace 5 anios', 'davivienda', 1, 'Jersson', 'Contreras', 'activo', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina`
--

CREATE TABLE `rutina` (
  `idRutina` int(11) NOT NULL,
  `semRutina` int(11) NOT NULL,
  `descRutina` varchar(40) NOT NULL,
  `creaRutina` date NOT NULL,
  `autRutina` int(11) DEFAULT NULL,
  `autorCachorro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutina`
--

INSERT INTO `rutina` (`idRutina`, `semRutina`, `descRutina`, `creaRutina`, `autRutina`, `autorCachorro`) VALUES
(1, 2, 'pierna', '2025-04-07', 1, NULL),
(2, 3, 'prueba 2', '2025-04-07', 1, NULL),
(3, 3, 'prueba 3', '2025-04-07', 1, NULL),
(4, 0, '', '2025-04-07', 1, NULL),
(5, 0, '', '2025-04-07', 1, NULL),
(6, 2, 'esta es una desceripcion de la rutina', '2025-04-07', 1, NULL),
(7, 2, 'fdg', '2025-04-07', 1, NULL),
(8, 3, 'descanso', '2025-04-07', 1, NULL),
(9, 0, '', '2025-04-07', 1, NULL),
(10, 0, '', '2025-04-07', 1, NULL),
(11, 2, 'curl', '2025-04-07', 1, NULL),
(12, 2, 'press', '2025-04-07', 1, NULL),
(13, 2, 'z', '2025-04-07', 1, NULL),
(14, 0, 'z', '2025-04-07', 1, NULL),
(15, 3, 'sfdsghsghhg', '2025-04-07', 1, NULL),
(16, 3, 'jdcrftm ', '2025-04-07', 1, NULL);

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
  `renSuscrip` int(11) DEFAULT NULL,
  `valorSuscripcion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `tipUsuario` varchar(10) NOT NULL,
  `emaUsuario` varchar(40) NOT NULL,
  `nacUsuario` date NOT NULL,
  `edadUsuario` int(3) NOT NULL,
  `pasUsuario` varchar(20) NOT NULL,
  `genUsuario` varchar(10) NOT NULL,
  `tipDocumento` varchar(25) NOT NULL,
  `docUsuario` int(11) NOT NULL,
  `ciuUsuario` varchar(20) DEFAULT NULL,
  `domicilio` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `tipUsuario`, `emaUsuario`, `nacUsuario`, `edadUsuario`, `pasUsuario`, `genUsuario`, `tipDocumento`, `docUsuario`, `ciuUsuario`, `domicilio`) VALUES
(1, 'natural', 'entrenador@gmail.com', '2015-04-02', 12, '12345678', 'masculino', 'cedula', 1, 'bogota', NULL);

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
  ADD PRIMARY KEY (`idEjercicio`),
  ADD KEY `fk_autor_ejercicio` (`autEjercicio`);

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
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `idDiag` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `idEjercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ejercicio_rutina`
--
ALTER TABLE `ejercicio_rutina`
  MODIFY `idEje_Rut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  MODIFY `idEntrenador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rutina`
--
ALTER TABLE `rutina`
  MODIFY `idRutina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  MODIFY `idSuscrip` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Filtros para la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD CONSTRAINT `fk_autor_ejercicio` FOREIGN KEY (`autEjercicio`) REFERENCES `entrenador` (`idEntrenador`);

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
