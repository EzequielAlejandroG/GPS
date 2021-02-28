create database bd;
  use bd;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: bd
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `razonsocial` varchar(50) DEFAULT NULL,
  `rfc` varchar(12) DEFAULT NULL,
  `domicilio_fiscal` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razonsocial` varchar(200) DEFAULT NULL,
  `rfc` varchar(50) DEFAULT NULL,
  `domicilio_fiscal` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kind`
--

DROP TABLE IF EXISTS `kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kind`
--

LOCK TABLES `kind` WRITE;
/*!40000 ALTER TABLE `kind` DISABLE KEYS */;
/*!40000 ALTER TABLE `kind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licencia`
--

DROP TABLE IF EXISTS `licencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `licencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` char(1) DEFAULT NULL,
  `descripcion` text,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licencia`
--

LOCK TABLES `licencia` WRITE;
/*!40000 ALTER TABLE `licencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `licencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operador`
--

DROP TABLE IF EXISTS `operador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operador` (
  `id_operador` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `categoria` varchar(20) DEFAULT NULL,
  `base` varchar(255) DEFAULT NULL,
  `tipo_licencia` varchar(20) DEFAULT NULL,
  `vigencia` date DEFAULT NULL,
  `numero_seguro` varchar(50) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_operador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operador`
--

LOCK TABLES `operador` WRITE;
/*!40000 ALTER TABLE `operador` DISABLE KEYS */;
/*!40000 ALTER TABLE `operador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority`
--

LOCK TABLES `priority` WRITE;
/*!40000 ALTER TABLE `priority` DISABLE KEYS */;
/*!40000 ALTER TABLE `priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remolque`
--

DROP TABLE IF EXISTS `remolque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `remolque` (
  `id_remolque` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `placas` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_remolque`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remolque`
--

LOCK TABLES `remolque` WRITE;
/*!40000 ALTER TABLE `remolque` DISABLE KEYS */;
INSERT INTO `remolque` VALUES (17,'adasd','asdasd',8);
/*!40000 ALTER TABLE `remolque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ruta` (
  `idruta` int(11) NOT NULL AUTO_INCREMENT,
  `idVehiculo` int(11) DEFAULT NULL,
  `id_remolque` int(11) DEFAULT NULL,
  `salida` varchar(200) DEFAULT NULL,
  `destino` varchar(200) DEFAULT NULL,
  `id_operador` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  `tiempo_estimado` time DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `id_prioridad` int(11) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`idruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('Ew2zozf8iYuRuGO75hmq7Y24fM4lD5fK',1564527638,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('Nc0g_FZ9MQL1hK1YPE7ukGUBjct7zHmX',1564528069,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}'),('TNimgotHeFdTeOT5rOWJmwjtyR-LX95r',1564527637,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('UHFGCkgz_1W9VJtM2HnCkyL7ATo4-YWZ',1564527637,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('YWkAqfGpL57P4mUsGJxL2QvD3KO0Jxhd',1564527638,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('sLBr9DIv_pf3UY2sPXblqghvVu6Itexs',1564527638,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('tF4I3FE7gfjnyVardzbJup_LIYfyNrrf',1564527638,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('wXiekR-C5RGNqf5W_ix-On4SQBhTWVzt',1564527637,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `truck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_economico` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `noserie` varchar(50) DEFAULT NULL,
  `factura` varchar(50) DEFAULT NULL,
  `placa_federal` varchar(50) DEFAULT NULL,
  `poliza` varchar(50) DEFAULT NULL,
  `fecha_vencimiento_poliza` date DEFAULT NULL,
  `pago_tenencia` varchar(200) DEFAULT NULL,
  `verificacion_humo` varchar(20) DEFAULT NULL,
  `verificacion_fisico_mecanico` varchar(20) DEFAULT NULL,
  `jave` varchar(50) DEFAULT NULL,
  `tarjeta_gasolina` varchar(50) DEFAULT NULL,
  `numero_tarjeta` varchar(50) DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `nombre_operador` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ubicacion` (
  `tipoPosicion` text,
  `estadoMotor` int(11) DEFAULT NULL,
  `fechaParcialRespuesta` text,
  `tiempoParcialRespuesta` text,
  `anoParcialRespuesta` int(11) DEFAULT NULL,
  `mesParcialRespuesta` text,
  `diaSemanaRespuesta` int(11) DEFAULT NULL,
  `geoPunto` text,
  `idVehiculo` int(11) DEFAULT NULL,
  `idCobertura` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idEquipo` int(11) DEFAULT NULL,
  `idTipoVehiculo` int(11) DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `velocidad` int(11) DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  `fechaPosicion` text,
  `fechaRespuesta` text,
  `kilometraje` int(11) DEFAULT NULL,
  `fechaPosicionHcm` text,
  `idTrayecto` int(11) DEFAULT NULL,
  `notificacion` text,
  `idNotificacion` int(11) DEFAULT NULL,
  `argumentoNotificacion` text,
  `noSerie` text,
  `placa` text,
  `noEconomico` text,
  `idServicio` text,
  `idTipoPosicion` int(11) DEFAULT NULL,
  `estadoGeoreferencia` text,
  `municipioGeoreferencia` text,
  `asentamientoGeoreferencia` text,
  `direccionGeoreferencia` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` VALUES ('Posición Válida',0,'2019-05-03','16:38:21',2019,'05',5,'-93.207392,18.422148',252209,1,44026,4418119,2,18.422148,-93.207392,0,4,'2019-05-03 21:38:21','2019-05-03 16:38:21',14906100,'2019-05-03 16:38:21',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844505','31-AA-9B','19','',1,'','','',''),('Posición Válida',0,'2019-07-29','16:29:10',2019,'07',1,'-92.980898,17.942299',252208,1,44026,4329851,2,17.942299,-92.980898,0,128,'2019-07-29 21:29:10','2019-07-29 16:29:10',14267100,'2019-07-29 16:29:10',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503','30-AA-9B','15','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','TALLER MURO'),('Posición Válida',0,'2019-07-29','16:23:02',2019,'07',1,'-97.554203,20.660259',336510,1,44026,5063192,2,20.660259,-97.554203,0,316,'2019-07-29 21:23:02','2019-07-29 16:23:02',16600,'2019-07-29 16:23:02',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250','206-EV-1','206','',1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),('Posición Válida',0,'2019-07-29','16:34:50',2019,'07',1,'-92.980668,17.941833',272546,1,44026,5059870,2,17.941833,-92.980668,0,28,'2019-07-29 21:34:50','2019-07-29 16:34:50',5615400,'2019-07-29 16:34:50',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324','005-EX-2','017','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),('Posición Válida',0,'2019-07-26','16:08:05',2019,'07',5,'-92.980938,17.942038',344048,1,44026,5061422,2,17.942038,-92.980938,0,67,'2019-07-26 21:08:05','2019-07-26 16:08:05',829000,'2019-07-26 16:08:05',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826','304-EV-4','30','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ'),('Posición Válida',0,'2019-07-29','16:27:35',2019,'07',1,'-97.488186,25.87107',336511,1,44026,5106169,2,25.87107,-97.488186,0,189,'2019-07-29 21:27:35','2019-07-29 16:27:35',6102300,'2019-07-29 16:27:35',67,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249','205-EV-1','22','',1,'TAMAULIPAS','MATAMOROS','MODELO','SIN NOMBRE'),('Posición Válida',0,'2019-07-29','16:41:48',2019,'07',1,'-97.487995,25.871004',301691,1,44026,5101058,2,25.871004,-97.487995,0,0,'2019-07-29 21:41:48','2019-07-29 16:41:48',2997533,'2019-07-29 16:41:48',33,'Ignición Off',6,'','3WKDD40XXEF851436','508-EU-7','5','',1,'TAMAULIPAS','MATAMOROS','MODELO','SIN NOMBRE'),('Posición Válida',0,'2018-02-07','09:12:45',2018,'2',3,'-104.0659,25.26142',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','','',1,'','','',''),('Posición Válida',0,'2018-01-15','09:24:10',2018,'1',1,'-97.554168,20.660266',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','','',1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),('Posición Válida',0,'2018-04-23','19:11:05',2018,'4',1,'-92.980662,17.941847',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),('Posición Válida',0,'2018-04-15','13:52:02',2018,'4',0,'-97.554234,20.660414',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','','',1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),('Posición Válida',1,'2018-06-05','13:23:06',2018,'6',2,'-101.916468,19.195391',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','','',1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125'),('Posición Válida',0,'2018-09-21','13:33:54',2018,'9',5,'-103.52459,19.904763',292837,1,44026,1918557,2,19.904763,-103.52459,0,0,'2018-09-21 18:33:52','2018-09-21 13:33:54',122759,'2018-09-21 13:33:52',83,'Auto reporte Keep Alive',1,'','3WKDD40X4DF849146','004-EX-2','04','',1,'','','','');
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `creat_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_pic` varchar(250) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'wicho','$2a$10$cwjleM7J5xlB9cGe44kYiu5u3hgyRRHPIs9ZUCy1gaebVI8x8zP36','luis vazquez','luis.vazquez@mogel.com.mx',NULL,'camion.jpg',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-29 18:10:36
