-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2025 a las 06:56:26
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
  `tipEjercicio` enum('Fuerza - pecho','Fuerza - espalda','Fuerza - piernas','Cardio','Movilidad','Estiramiento','Core / Abdomen','Explosivo / Potencia','Descanso') NOT NULL,
  `autorEjercicio` int(11) DEFAULT NULL,
  `urlVideo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`idEjercicio`, `nomEjercicio`, `descEjercicio`, `tipEjercicio`, `autorEjercicio`, `urlVideo`) VALUES
(1, 'Descanso', 'Pausar la actividad física para que los músculos se recuperen', 'Descanso', NULL, 'https://www.youtube.com/embed/g64BkZjSNBM?si=ecHGnyqm5C3CATqF'),
(2, 'Press de banca', 'Acostado en banco, baja y sube la barra desde el pecho con control.', 'Fuerza - pecho', NULL, 'https://www.youtube.com/embed/AcYaaJLWhvU?si=pLibwnjmlsogEhRK'),
(3, 'Resistencia', 'Realizar un trote suave ya sea al aire libre o en cinta.', 'Cardio', NULL, 'https://www.youtube.com/embed/6_5_wI-FXzE?si=He-ly0W_Vt-rCvvZ'),
(4, 'Abdominales', 'Harás  abdominales clásicas sobre una superficie apta para realizarlas.', 'Fuerza - pecho', NULL, 'https://www.youtube.com/embed/FBh_7mQvkFc?si=VIMge9s9HNiDVvAk');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio_rutina`
--

CREATE TABLE `ejercicio_rutina` (
  `idEjercicio_Rutina` int(11) NOT NULL,
  `fkIdEjercicio` int(11) NOT NULL,
  `fkIdRutina` int(11) NOT NULL,
  `semana` int(11) NOT NULL,
  `dia` int(2) NOT NULL,
  `ordenEjercicio` int(2) NOT NULL,
  `serie` int(2) NOT NULL,
  `repeticiones` int(3) NOT NULL,
  `peso_tiempo` int(4) NOT NULL,
  `intesidad` enum('baja','intermedia','alta','maxima') NOT NULL,
  `descanso` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicio_rutina`
--

INSERT INTO `ejercicio_rutina` (`idEjercicio_Rutina`, `fkIdEjercicio`, `fkIdRutina`, `semana`, `dia`, `ordenEjercicio`, `serie`, `repeticiones`, `peso_tiempo`, `intesidad`, `descanso`) VALUES
(1, 4, 1, 1, 1, 1, 3, 10, 0, 'intermedia', 5),
(2, 3, 1, 1, 1, 2, 1, 2, 30, 'baja', 10),
(3, 2, 1, 1, 1, 3, 2, 10, 30, 'intermedia', 5),
(4, 1, 1, 1, 2, 1, 1, 1, 0, 'baja', 0),
(5, 4, 1, 1, 3, 1, 3, 10, 0, 'intermedia', 5),
(6, 3, 1, 1, 3, 2, 2, 1, 30, 'baja', 5),
(7, 2, 1, 1, 3, 3, 2, 10, 30, 'intermedia', 5),
(8, 1, 1, 1, 4, 1, 1, 1, 0, 'baja', 0),
(9, 4, 1, 1, 5, 1, 2, 10, 0, 'intermedia', 10),
(10, 3, 1, 1, 5, 2, 1, 1, 40, 'baja', 15),
(11, 4, 1, 1, 6, 1, 4, 10, 0, 'intermedia', 5),
(12, 3, 1, 1, 6, 2, 3, 1, 25, 'intermedia', 5),
(13, 1, 1, 1, 7, 1, 1, 1, 0, 'baja', 0),
(14, 2, 1, 2, 1, 1, 3, 10, 20, 'intermedia', 5),
(15, 3, 1, 2, 1, 2, 3, 10, 15, 'intermedia', 10),
(16, 1, 1, 2, 2, 1, 1, 1, 0, 'baja', 0),
(17, 1, 1, 2, 3, 1, 4, 12, 25, 'intermedia', 5),
(18, 3, 1, 2, 3, 2, 4, 12, 30, 'alta', 10),
(19, 1, 1, 2, 4, 1, 1, 1, 1, 'baja', 0),
(20, 2, 1, 2, 5, 1, 5, 15, 35, 'alta', 10),
(21, 4, 1, 2, 5, 2, 5, 15, 40, 'alta', 10),
(22, 1, 1, 2, 6, 1, 1, 1, 1, 'baja', 0),
(23, 3, 1, 2, 7, 1, 3, 10, 20, 'intermedia', 10),
(24, 2, 1, 2, 7, 2, 3, 10, 15, 'intermedia', 10);

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
  `nomRutina` varchar(50) NOT NULL,
  `semanasRutina` int(3) NOT NULL,
  `descRutina` varchar(100) NOT NULL,
  `nivelRutina` enum('basico','intermedio','avanzado') NOT NULL,
  `creacionRutina` date NOT NULL,
  `autorRutina` int(11) DEFAULT NULL,
  `autorCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rutina`
--

INSERT INTO `rutina` (`idRutina`, `nomRutina`, `semanasRutina`, `descRutina`, `nivelRutina`, `creacionRutina`, `autorRutina`, `autorCliente`) VALUES
(1, 'Rutina Estándar', 2, 'En esta rutina encontraras ejercicios básicos para generar resistencia y ganar masa muscular.', 'basico', '2025-06-28', NULL, NULL);

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
  `valorSuscripcion` int(10) NOT NULL,
  `estadoPagoSuscripcion` enum('activo','inactivo') NOT NULL DEFAULT 'inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suscripcion`
--

INSERT INTO `suscripcion` (`idSuscripcion`, `fkIdEntrenador`, `fkIdCliente`, `inicioSuscripcion`, `finSuscripcion`, `estadoSuscripcion`, `renovaciones`, `valorSuscripcion`, `estadoPagoSuscripcion`) VALUES
(2, 2, 3, '2025-06-30', '2025-07-30', 'inactiva', 0, 0, 'inactivo');

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
  `especialidad` varchar(40) DEFAULT NULL,
  `xpAños` float DEFAULT NULL,
  `biografia` varchar(200) DEFAULT NULL,
  `promCalificacion` float DEFAULT NULL,
  `estadoUsuario` enum('activo','inactivo') NOT NULL,
  `fkIdRutina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nomUsuario`, `apeUsuario`, `emaUsuario`, `passUsuario`, `tipDocumento`, `numDocumento`, `ciudadUsuario`, `rolUsuario`, `especialidad`, `xpAños`, `biografia`, `promCalificacion`, `estadoUsuario`, `fkIdRutina`) VALUES
(1, 'Andres', 'Mena', 'andres@gmail.com', '123', 'CC', 1123530658, 'Bogotá', 'entrenador', 'fitness', 5, 'Soy un Entrenador dispuesto a ayudarte a mejorar brindándote la mejor rutina, solicítame ahora y empecemos.', 5, 'activo', NULL),
(2, 'Luisa', 'Alfonso', 'luisa@gmail.com', '123', 'CC', 1234567890, 'Bogotá', 'entrenador', ' transformación corporal', 2, 'Soy entrenadora dispuesta a hacer un gran cambio en tu cuerpo para mejor tu salud y tu físico.', 4, 'activo', NULL),
(3, 'Carlos', 'Colmenares', 'carlos@gmail.com', '123', 'CC', 1234509876, 'Bogotá', 'cliente', 'na', 0, 'na', 0, 'activo', NULL),
(4, 'Maria Luisa', 'Castro', 'Maria@gmail.com', '123', 'CC', 987654321, 'Cali', 'cliente', 'na', 0, 'na', 0, 'activo', NULL);

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
  ADD PRIMARY KEY (`idEjercicio_Rutina`),
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
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fkIdRutina` (`fkIdRutina`);

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
  MODIFY `idEjercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ejercicio_rutina`
--
ALTER TABLE `ejercicio_rutina`
  MODIFY `idEjercicio_Rutina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `redes`
--
ALTER TABLE `redes`
  MODIFY `idRed` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rutina`
--
ALTER TABLE `rutina`
  MODIFY `idRutina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
  MODIFY `idSuscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1235;

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

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`fkIdRutina`) REFERENCES `rutina` (`idRutina`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
