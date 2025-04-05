-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: eval
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `per_identificacion` int(11) NOT NULL,
  `per_nombre` varchar(20) DEFAULT NULL,
  `per_apellidos` varchar(20) DEFAULT NULL,
  `per_categoria` varchar(15) DEFAULT NULL,
  `per_telefono` varchar(10) DEFAULT NULL,
  `per_nacimiento` date DEFAULT NULL,
  `per_direccion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`per_identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (15628913,'gregorio','pati?o','paramedico','3215685823','1989-12-12','cra 10 #81-21'),(16928913,'mario','gomez','enfermero','3278285823','1987-01-10','cra 10 #81-21'),(35454941,'pepito','jimenez','conductor','3202358695','1984-01-11','cll 21 #35-13'),(35491545,'juan','perez','medico','3103458695','1979-05-06','cra 23 #15-23'),(58454941,'william','espinel','paramedico','3202355789','1994-01-10','cll 11 #50-23'),(59128913,'andres','mena','medico','3197585823','1980-05-11','cll 10 #23-20'),(59764213,'nicolas','gomez','camillero','3197555789','1990-12-05','cra 13 #13-13'),(59768913,'santiago','alarcon','medico','3197585823','1991-11-01','cll 3 #23-18'),(78128913,'andres','gallo','conductor','3297585823','1979-02-11','cll 30 #11-21'),(87264213,'nicolas','cifuentes','enfermera','3148355789','1987-10-05','cra 11 #10-83');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `punto10`
--

DROP TABLE IF EXISTS `punto10`;
/*!50001 DROP VIEW IF EXISTS `punto10`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `punto10` AS SELECT
 1 AS `per_identificacion`,
  1 AS `per_nombre`,
  1 AS `per_apellidos`,
  1 AS `per_categoria`,
  1 AS `per_telefono`,
  1 AS `per_nacimiento`,
  1 AS `per_direccion` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `punto11`
--

DROP TABLE IF EXISTS `punto11`;
/*!50001 DROP VIEW IF EXISTS `punto11`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `punto11` AS SELECT
 1 AS `per_identificacion`,
  1 AS `per_nombre`,
  1 AS `per_apellidos`,
  1 AS `per_categoria`,
  1 AS `per_telefono`,
  1 AS `per_nacimiento`,
  1 AS `per_direccion` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `punto12`
--

DROP TABLE IF EXISTS `punto12`;
/*!50001 DROP VIEW IF EXISTS `punto12`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `punto12` AS SELECT
 1 AS `veh_placa`,
  1 AS `veh_tipo`,
  1 AS `veh_modelo`,
  1 AS `veh__estado` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `punto_13_eval`
--

DROP TABLE IF EXISTS `punto_13_eval`;
/*!50001 DROP VIEW IF EXISTS `punto_13_eval`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `punto_13_eval` AS SELECT
 1 AS `veh_placa`,
  1 AS `veh_tipo`,
  1 AS `veh_modelo`,
  1 AS `veh__estado` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `punto_14_eval`
--

DROP TABLE IF EXISTS `punto_14_eval`;
/*!50001 DROP VIEW IF EXISTS `punto_14_eval`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `punto_14_eval` AS SELECT
 1 AS `veh_placa`,
  1 AS `veh_tipo`,
  1 AS `veh_modelo`,
  1 AS `veh__estado`,
  1 AS `sal_hora_regreso` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `punto_15_eval`
--

DROP TABLE IF EXISTS `punto_15_eval`;
/*!50001 DROP VIEW IF EXISTS `punto_15_eval`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `punto_15_eval` AS SELECT
 1 AS `per_identificacion`,
  1 AS `per_nombre`,
  1 AS `per_apellidos`,
  1 AS `per_categoria`,
  1 AS `per_telefono` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `salida_personal`
--

DROP TABLE IF EXISTS `salida_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salida_personal` (
  `sal_codigo` int(11) DEFAULT NULL,
  `per_identificacion` int(11) DEFAULT NULL,
  KEY `sal_codigo` (`sal_codigo`),
  KEY `per_identificacion` (`per_identificacion`),
  CONSTRAINT `salida_personal_ibfk_1` FOREIGN KEY (`sal_codigo`) REFERENCES `servicios` (`sal_codigo`),
  CONSTRAINT `salida_personal_ibfk_2` FOREIGN KEY (`per_identificacion`) REFERENCES `personal` (`per_identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida_personal`
--

LOCK TABLES `salida_personal` WRITE;
/*!40000 ALTER TABLE `salida_personal` DISABLE KEYS */;
INSERT INTO `salida_personal` VALUES (1,15628913),(2,16928913),(3,35454941),(4,35491545),(5,58454941);
/*!40000 ALTER TABLE `salida_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicios` (
  `sal_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `sal_motivo` varchar(20) DEFAULT NULL,
  `sal_fecha` date DEFAULT NULL,
  `sal_hora_salida` time DEFAULT NULL,
  `sal_hora_regreso` time DEFAULT NULL,
  `sal_costo` double(6,2) DEFAULT NULL,
  `veh_placa` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`sal_codigo`),
  KEY `veh_placa` (`veh_placa`),
  CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`veh_placa`) REFERENCES `vehiculo` (`veh_placa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'URGENCIA','2024-11-05','07:17:00','08:18:00',1.20,'123zxc'),(2,'SERVICIO','2021-11-05','17:05:59','18:17:15',4.20,'456asd'),(3,'EMERGENCIA','2015-08-21','05:08:00','08:09:21',5.40,'789qwe'),(4,'EMERGENCIA','2018-08-21','19:08:00','11:09:21',4.10,'123qwe'),(5,'SERVICIO','2001-05-09','07:05:59','11:17:05',2.90,'456zxc'),(6,'URGENCIA','1991-03-08','02:17:50','05:18:21',1.20,'123zxc'),(7,'TRASLADO','1995-08-30','02:21:50','03:25:21',2.20,'456asd'),(8,'TRASLADO','1995-08-30','13:34:50','15:25:21',1.40,'789qwe'),(9,'URGENCIA','2013-03-08','03:35:00','05:00:21',1.20,'123qwe'),(10,'TRASLADO','2022-06-24','12:00:54','15:35:54',6.10,'456zxc');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `veh_placa` varchar(6) NOT NULL,
  `veh_tipo` varchar(15) DEFAULT NULL,
  `veh_modelo` year(4) DEFAULT NULL,
  `veh__estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`veh_placa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES ('123qwe','ambulancia',2011,'activo'),('123zxc','ambulancia',1998,'activo'),('456asd','carro',2009,'activo'),('456zxc','carro',2010,'inactivo'),('789qwe','bus',1980,'inactivo');
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `punto10`
--

/*!50001 DROP VIEW IF EXISTS `punto10`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `punto10` AS select `personal`.`per_identificacion` AS `per_identificacion`,`personal`.`per_nombre` AS `per_nombre`,`personal`.`per_apellidos` AS `per_apellidos`,`personal`.`per_categoria` AS `per_categoria`,`personal`.`per_telefono` AS `per_telefono`,`personal`.`per_nacimiento` AS `per_nacimiento`,`personal`.`per_direccion` AS `per_direccion` from `personal` where `personal`.`per_categoria` = 'medico' and `personal`.`per_nacimiento` between '01-01-1979' and '31-12-1994' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `punto11`
--

/*!50001 DROP VIEW IF EXISTS `punto11`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `punto11` AS select `personal`.`per_identificacion` AS `per_identificacion`,`personal`.`per_nombre` AS `per_nombre`,`personal`.`per_apellidos` AS `per_apellidos`,`personal`.`per_categoria` AS `per_categoria`,`personal`.`per_telefono` AS `per_telefono`,`personal`.`per_nacimiento` AS `per_nacimiento`,`personal`.`per_direccion` AS `per_direccion` from `personal` where `personal`.`per_categoria` = 'enfermero' and `personal`.`per_apellidos` = 'M%' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `punto12`
--

/*!50001 DROP VIEW IF EXISTS `punto12`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `punto12` AS select `vehiculo`.`veh_placa` AS `veh_placa`,`vehiculo`.`veh_tipo` AS `veh_tipo`,`vehiculo`.`veh_modelo` AS `veh_modelo`,`vehiculo`.`veh__estado` AS `veh__estado` from `vehiculo` where `vehiculo`.`veh_tipo` = 'ambulancia' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `punto_13_eval`
--

/*!50001 DROP VIEW IF EXISTS `punto_13_eval`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `punto_13_eval` AS select `vehiculo`.`veh_placa` AS `veh_placa`,`vehiculo`.`veh_tipo` AS `veh_tipo`,`vehiculo`.`veh_modelo` AS `veh_modelo`,`vehiculo`.`veh__estado` AS `veh__estado` from `vehiculo` where `vehiculo`.`veh_modelo` > 2010 order by `vehiculo`.`veh_tipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `punto_14_eval`
--

/*!50001 DROP VIEW IF EXISTS `punto_14_eval`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `punto_14_eval` AS select `vehiculo`.`veh_placa` AS `veh_placa`,`vehiculo`.`veh_tipo` AS `veh_tipo`,`vehiculo`.`veh_modelo` AS `veh_modelo`,`vehiculo`.`veh__estado` AS `veh__estado`,`servicios`.`sal_hora_regreso` AS `sal_hora_regreso` from (`vehiculo` join `servicios` on(`servicios`.`veh_placa` = `vehiculo`.`veh_placa`)) where `servicios`.`sal_hora_regreso` >= '18:00:00' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `punto_15_eval`
--

/*!50001 DROP VIEW IF EXISTS `punto_15_eval`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `punto_15_eval` AS select `personal`.`per_identificacion` AS `per_identificacion`,`personal`.`per_nombre` AS `per_nombre`,`personal`.`per_apellidos` AS `per_apellidos`,`personal`.`per_categoria` AS `per_categoria`,`personal`.`per_telefono` AS `per_telefono` from (`personal` left join `salida_personal` on(`personal`.`per_identificacion` = `salida_personal`.`per_identificacion`)) where `salida_personal`.`sal_codigo` is null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-05 10:52:59
