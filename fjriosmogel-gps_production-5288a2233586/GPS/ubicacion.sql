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
INSERT INTO `ubicacion` VALUES ('Posición Válida',0,'2019-05-03','16:38:21',2019,'05',5,'-93.207392,18.422148',252209,1,44026,4418119,2,18.422148,-93.207392,0,4,'2019-05-03 21:38:21','2019-05-03 16:38:21',14906100,'2019-05-03 16:38:21',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844505','31-AA-9B','19','',1,'','','',''),('Posición Válida',0,'2019-08-01','22:28:20',2019,'08',4,'-92.980701,17.941888',252208,1,44026,4329851,2,17.941888,-92.980701,0,128,'2019-08-02 03:28:20','2019-08-01 22:28:20',14267100,'2019-08-01 22:28:20',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503','30-AA-9B','15','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),('Posición Válida',0,'2019-08-01','22:22:08',2019,'08',4,'-97.554209,20.660237',336510,1,44026,5063192,2,20.660237,-97.554209,0,316,'2019-08-02 03:22:08','2019-08-01 22:22:08',16600,'2019-08-01 22:22:08',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250','206-EV-1','206','',1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),('Posición Válida',0,'2019-08-01','22:33:56',2019,'08',4,'-92.9806,17.941878',272546,1,44026,5059870,2,17.941878,-92.9806,0,28,'2019-08-02 03:33:56','2019-08-01 22:33:56',5615400,'2019-08-01 22:33:56',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324','005-EX-2','017','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),('Posición Válida',0,'2019-07-26','16:08:05',2019,'07',5,'-92.980938,17.942038',344048,1,44026,5061422,2,17.942038,-92.980938,0,67,'2019-07-26 21:08:05','2019-07-26 16:08:05',829000,'2019-07-26 16:08:05',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826','304-EV-4','30','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ'),('Posición Válida',0,'2019-08-01','22:20:14',2019,'08',4,'-92.980752,17.942162',336511,1,44026,5106169,2,17.942162,-92.980752,0,168,'2019-08-02 03:20:14','2019-08-01 22:20:14',7620600,'2019-08-01 22:20:14',161,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249','205-EV-1','22','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ'),('Posición Válida',0,'2019-08-01','22:25:35',2019,'08',4,'-92.98057,17.941887',301691,1,44026,5101058,2,17.941887,-92.98057,0,0,'2019-08-02 03:25:35','2019-08-01 22:25:35',4507883,'2019-08-01 22:25:35',123,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF851436','508-EU-7','5','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),('Posición Válida',0,'2018-02-07','09:12:45',2018,'2',3,'-104.0659,25.26142',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','','',1,'','','',''),('Posición Válida',0,'2018-01-15','09:24:10',2018,'1',1,'-97.554168,20.660266',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','','',1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),('Posición Válida',0,'2018-04-23','19:11:05',2018,'4',1,'-92.980662,17.941847',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),('Posición Válida',0,'2018-04-15','13:52:02',2018,'4',0,'-97.554234,20.660414',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','','',1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),('Posición Válida',1,'2018-06-05','13:23:06',2018,'6',2,'-101.916468,19.195391',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','','',1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125'),('Posición Válida',0,'2018-09-21','13:33:54',2018,'9',5,'-103.52459,19.904763',292837,1,44026,1918557,2,19.904763,-103.52459,0,0,'2018-09-21 18:33:52','2018-09-21 13:33:54',122759,'2018-09-21 13:33:52',83,'Auto reporte Keep Alive',1,'','3WKDD40X4DF849146','004-EX-2','04','',1,'','','','');
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-02 10:02:56
