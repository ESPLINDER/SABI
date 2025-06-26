-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2025 a las 00:22:24
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
  `idCalificaion` int(11) NOT NULL,
  `fkIdCliente` int(11) NOT NULL,
  `fkIdRutina` int(11) NOT NULL,
  `calificacion` float NOT NULL,
  `fechaCalificacion` date NOT NULL,
  `comentario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `idDiagnostico` int(12) NOT NULL,
  `fkIdCliente` int(11) NOT NULL,
  `fkIdRutina` int(11) DEFAULT NULL,
  `genero` enum('masculino','femenino') NOT NULL,
  `edad` int(3) NOT NULL,
  `estatura` float NOT NULL,
  `peso` float NOT NULL,
  `imcCliente` float NOT NULL,
  `fechaDiagnostico` date NOT NULL,
  `frecuenciaDiagnostico` int(2) NOT NULL,
  `proxDiagnostico` date NOT NULL,
  `objetivo` varchar(30) NOT NULL,
  `medidaBrazo` float NOT NULL,
  `medidaCintura` float NOT NULL,
  `medidaPierna` float NOT NULL,
  `condicionMedica` varchar(30) NOT NULL,
  `medicamentos` varchar(30) NOT NULL,
  `frecCardiaca` varchar(10) NOT NULL,
  `nivelHidratacion` varchar(20) NOT NULL,
  `tipoHidratacion` varchar(100) NOT NULL,
  `nivelActividadFisica` enum('sedentario','ligeramente activo','moderadamente activo','muy activo','extremadamente activo') NOT NULL,
  `suplementos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `idEjercicio` int(11) NOT NULL,
  `nomEjercicio` varchar(20) NOT NULL,
  `descEjercicio` varchar(100) NOT NULL,
  `tipEjercicio` varchar(20) NOT NULL,
  `autorEjercicio` int(11) DEFAULT NULL,
  `urlVideo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio_rutina`
--

CREATE TABLE `ejercicio_rutina` (
  `idEjercicio` int(11) NOT NULL,
  `fkIdEjercicio` int(11) NOT NULL,
  `fkIdRutina` int(11) NOT NULL,
  `semana` int(11) NOT NULL,
  `dia` int(2) NOT NULL,
  `serie` int(2) NOT NULL,
  `repeticiones` int(3) NOT NULL,
  `peso` int(4) NOT NULL,
  `intesidad` enum('baja','intermedia','alta','maxima') NOT NULL,
  `descanso` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes`
--

CREATE TABLE `redes` (
  `idRed` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `nomRed` varchar(15) NOT NULL,
  `urlRed` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutina`
--

CREATE TABLE `rutina` (
  `idRutina` int(11) NOT NULL,
  `semanasRutina` int(3) NOT NULL,
  `descRutina` varchar(100) NOT NULL,
  `nivelRutina` enum('basico','intermedio','avanzado') NOT NULL,
  `creacionRutina` date NOT NULL,
  `autorRutina` int(11) DEFAULT NULL,
  `autorCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripcion`
--

CREATE TABLE `suscripcion` (
  `idSuscripcion` int(11) NOT NULL,
  `fkIdEntrenador` int(11) NOT NULL,
  `fkIdCliente` int(11) NOT NULL,
  `inicioSuscripcion` date NOT NULL,
  `finSuscripcion` date NOT NULL,
  `estadoSuscripcion` enum('activa','inactiva') NOT NULL,
  `renovaciones` int(3) NOT NULL,
  `valorSuscripcion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nomUsuario` varchar(20) NOT NULL,
  `apeUsuario` varchar(20) NOT NULL,
  `emaUsuario` varchar(40) NOT NULL,
  `passUsuario` varchar(100) NOT NULL,
  `tipDocumento` enum('CC','TI','CE') NOT NULL,
  `numDocumento` int(11) NOT NULL,
  `ciudadUsuario` varchar(20) NOT NULL,
  `rolUsuario` enum('entrenador','cliente') NOT NULL,
  `especialidad` varchar(40) NOT NULL,
  `xpAños` float NOT NULL,
  `biografia` varchar(200) NOT NULL,
  `promCalificacion` float NOT NULL,
  `estadoUsuario` enum('activo','inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`idCalificaion`),
  ADD KEY `fkIdCliente` (`fkIdCliente`,`fkIdRutina`),
  ADD KEY `fkIdRutina` (`fkIdRutina`);

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`idDiagnostico`),
  ADD KEY `fkIdRutina` (`fkIdRutina`),
  ADD KEY `fkIdCliente` (`fkIdCliente`);

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`idEjercicio`),
  ADD KEY `autorEjercicio` (`autorEjercicio`);

--
-- Indices de la tabla `ejercicio_rutina`
--
ALTER TABLE `ejercicio_rutina`
  ADD PRIMARY KEY (`idEjercicio`),
  ADD KEY `fkIdEjercicio` (`fkIdEjercicio`,`fkIdRutina`),
  ADD KEY `fkIdRutina` (`fkIdRutina`);

--
-- Indices de la tabla `redes`
--
ALTER TABLE `redes`
  ADD PRIMARY KEY (`idRed`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `rutina`
--
ALTER TABLE `rutina`
  ADD PRIMARY KEY (`idRutina`),
  ADD KEY `autorRutina` (`autorRutina`,`autorCliente`),
  ADD KEY `autorCliente` (`autorCliente`);

--
-- Indices de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD PRIMARY KEY (`idSuscripcion`),
  ADD KEY `fkIdEntrenador` (`fkIdEntrenador`,`fkIdCliente`),
  ADD KEY `fkIdCliente` (`fkIdCliente`);

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
  MODIFY `idCalificaion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `idDiagnostico` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `idEjercicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejercicio_rutina`
--
ALTER TABLE `ejercicio_rutina`
  MODIFY `idEjercicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `redes`
--
ALTER TABLE `redes`
  MODIFY `idRed` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rutina`
--
ALTER TABLE `rutina`
  MODIFY `idRutina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  MODIFY `idSuscripcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`fkIdCliente`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`fkIdRutina`) REFERENCES `rutina` (`idRutina`);

--
-- Filtros para la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `diagnostico_ibfk_1` FOREIGN KEY (`fkIdRutina`) REFERENCES `rutina` (`idRutina`),
  ADD CONSTRAINT `diagnostico_ibfk_2` FOREIGN KEY (`fkIdCliente`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD CONSTRAINT `ejercicio_ibfk_1` FOREIGN KEY (`autorEjercicio`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `ejercicio_rutina`
--
ALTER TABLE `ejercicio_rutina`
  ADD CONSTRAINT `ejercicio_rutina_ibfk_1` FOREIGN KEY (`fkIdEjercicio`) REFERENCES `ejercicio` (`idEjercicio`),
  ADD CONSTRAINT `ejercicio_rutina_ibfk_2` FOREIGN KEY (`fkIdRutina`) REFERENCES `rutina` (`idRutina`);

--
-- Filtros para la tabla `redes`
--
ALTER TABLE `redes`
  ADD CONSTRAINT `redes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `rutina`
--
ALTER TABLE `rutina`
  ADD CONSTRAINT `rutina_ibfk_1` FOREIGN KEY (`autorCliente`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `rutina_ibfk_2` FOREIGN KEY (`autorRutina`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  ADD CONSTRAINT `suscripcion_ibfk_1` FOREIGN KEY (`fkIdCliente`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `suscripcion_ibfk_2` FOREIGN KEY (`fkIdEntrenador`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
