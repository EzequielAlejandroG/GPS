create database bd;
  use bd;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: bd
-- ------------------------------------------------------
-- Server version 8.0.16

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
INSERT INTO `category` VALUES (6,'luis felipe',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (144,'asdasdasdasdasd','vccccccccccc','dasdadsdsasd',0,1),(888,'jkajkdjadkj','kjasdjkajsdj','akjfhkjsahfkjskldfh',0,1),(5342,'mogelaaq','adsdadsasdas','asdasdasdkjhj',1,1),(6666,'aaaaaq','adsdasdasdav','asda',1,1),(44026,'mogel','adsadskjdfkj','asfdasfdsadfdsfsf',1,1),(55555,'mogelaa','adsadskjdfkj','asfdasfdsadfdsfsfaa',2,1),(66663,'mogelaaa','cccccccccccc','asdads',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2,'asdmogel','mogelggg','mogelf'),(6,'sdas','sadasd','adsd'),(10,'asfasf','fasfas','asffas'),(11,'fasfsa','asfasdf','asfafs'),(12,'luis','dasdasd','asd'),(13,'luis','dasdasd','asd'),(14,'luis','dasdasd','asd'),(15,'dasd','asd','das'),(16,'','',''),(17,'dasd','asd','asd'),(18,'','',''),(19,'felipe','jhasdjhk','555555'),(20,'asdasd','dasdasd','dasd'),(21,'asd','dasd','asd'),(22,'','',''),(23,'ads','dasd','dasd'),(24,'angel',' iahdkldas','4444'),(25,'zuko','kjaksdlj','56464'),(26,'sdfadf','dsfsdf','fsdf'),(27,'','',''),(34,'fsdf','fsdf','fsdf'),(35,'','yfgfhjv',''),(36,'','','5555555555555'),(37,'','',''),(38,'','',''),(39,'','',''),(40,'','',''),(41,'dasdjkhjk','hjkhjkhjk','hjkhjk'),(42,'dasdrtyr','rtyrty','rtyrty'),(43,'jak','jkhjkfhjfh','y76868'),(44,'','','');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (2,NULL,'luis felipe','tiko@mogel.com.mx','abcd1234');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'mogelggggggggggggggggggaaaaaaaaaaaaa','adsdasdasdad','asdadsadsgggggggggggggggg',1),(3,'asdasda','asdasdasdads','dasdasd',1),(4,'mogel','lajdkljjadkl','asdasdad',1),(5,'dasdasdasda','dasdasdasdas','dasdasd',1),(6,'','','',1),(7,'','','',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Aguas Calientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'Ciudad de México'),(6,'Chiapas'),(7,'Chihuahua'),(8,'Coahuila'),(9,'Colima'),(10,'Durango'),(11,'Estado de México'),(12,'Guanajuato'),(13,'Guerrero'),(14,'Hidalgo'),(15,'Jalisco'),(16,'Michoacán'),(17,'Morelos'),(18,'Nayarit'),(19,'Nuevo León'),(20,'Oaxaca'),(21,'Puebla'),(22,'Querétaro'),(23,'Quintana Roo'),(24,'San Luis Potosí'),(25,'Sinaloa'),(26,'Sonora'),(27,'Tabasco'),(28,'Tamaulipas'),(29,'Tlaxcala'),(30,'Veracruz '),(31,'Yucatán'),(32,'Zacatecas'),(33,'asdasd'),(34,'');
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
INSERT INTO `kind` VALUES (1,'Ticket',NULL),(2,'Bug',NULL),(3,'Sugerencia',NULL),(4,'Caracteristica',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licencia`
--

LOCK TABLES `licencia` WRITE;
/*!40000 ALTER TABLE `licencia` DISABLE KEYS */;
INSERT INTO `licencia` VALUES (2,'A','Se emite para conductores que hacen uso personal de su coche, es decir sin fines comerciales de ningún tipo. Esta licencia no está permitida para automovilistas que ofrecen servicio de guía o transporte hacia centros marítimos o aeropuertos.',1),(3,'B','La deben obtener los propietarios de transporte de carga en sus diferentes modalidades, excepto los que manejen los doblemente articulados, los que acarreen materiales, residuos o desechos peligrosos.',1),(4,'C',' Está destinada para los conductores que manejen camiones de carga pero de dos o más ejes (rabón o torton) excepto para los que transporten materiales, residuos, remanentes y desechos peligrosos.',1),(5,'D','Es autorizada para conducir coches destinados para la prestación de servicios de turismo en su modalidad de chofer-guía.',1),(6,'E','Es la licencia que requieren los choferes de transporte de carga general y carga especializada, es decir para los que conduzcan automotores con materiales, residuos, remanentes y desechos peligrosos. Es especial para tracto camiones doblemente articulados (TSR y TSS).',1),(7,'F','Autoriza conducir vehículos destinados para la prestación del servicio de transporte de pasajeros hacia puertos marítimos y aeropuertos federales.',1),(8,'','',1);
/*!40000 ALTER TABLE `licencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description2` varchar(200) DEFAULT NULL,
  `creat_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (24,'googlee','https://www.gmail.com.mx','wicho',1,'repitiendo pruebaaa',NULL),(25,'zxcxzc','https://www.facebook.com.mxx','zxczxc',1,'xcz',NULL),(26,'zxczxc','https://www.google.com.mx','czxc',1,'zxc',NULL),(27,'googlee','https://www.facebook.com.mxx','dasda',1,'dasd',NULL),(28,'wicho','https://www.google.com.mx','adsd',1,'asdHH',NULL),(29,'','','',1,'',NULL),(30,'sdasd','https://www.facebook.com.mxx','dasd',1,'asd',NULL),(31,'luis','https://www.gmail.com.mx','abcd12',1,'dsfhlakj',NULL),(32,'facebook','https://www.facebook.com.mxx','asdasd',1,'ads',NULL),(33,'wicho','https://www.facebook.com.mxx','asdasd',1,'wicho',NULL),(34,'Diamon','https://diamon.com.mx','sadasdHGGHHHH',1,'dasdads',NULL),(35,'googlee','https://www.gmail.com.mx','werwer',1,'wer',NULL),(37,'snapchar','https://snapchat.com.mx','ejemploofgdfg',2,'ejemplo',NULL);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operador`
--

LOCK TABLES `operador` WRITE;
/*!40000 ALTER TABLE `operador` DISABLE KEYS */;
INSERT INTO `operador` VALUES (8,'asdasd',NULL,NULL,NULL,'2019-06-07','','2019-06-14',NULL,1);
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
INSERT INTO `priority` VALUES (1,'Alta',NULL),(2,'Media',NULL),(3,'baja',NULL),(8,'Urgentee',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remolque`
--

LOCK TABLES `remolque` WRITE;
/*!40000 ALTER TABLE `remolque` DISABLE KEYS */;
INSERT INTO `remolque` VALUES (10,'Encontrak','qqqqqqq',1),(11,'asasd','asdasd',1),(12,'sdfdsfdfs','dfssdfdfs',1),(13,'','',1),(14,'','',1),(15,'asdasd','dasdasd',2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (2,'dasdasdadd',1),(3,'asdasddassdasd',1),(4,'ljkjggkjkjhhk',1),(5,'asdasdasd',1),(6,'asdasdasd',1),(7,'asdfadfsasdf',1),(8,'adsasdasd',1),(9,'',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('U9KD8QQvYfXQf4FxvkiZGiIzLKL3XiFp',1563390412,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),('WyO2VxbUXhkd8csrK_sdp5C2ndZ8Xehj',1563165510,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}');
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
INSERT INTO `status` VALUES (1,'Pendiente'),(2,'En Desarrollo'),(3,'Terminado'),(4,'Cancelado');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `kind_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `asigned_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL DEFAULT '1',
  `status_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `priority_id` (`priority_id`),
  KEY `status_id` (`status_id`),
  KEY `user_id` (`user_id`),
  KEY `kind_id` (`kind_id`),
  KEY `category_id` (`category_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`priority_id`) REFERENCES `priority` (`id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`kind_id`) REFERENCES `kind` (`id`),
  CONSTRAINT `ticket_ibfk_5` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `ticket_ibfk_6` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `mesParcialRespuesta` int(11) DEFAULT NULL,
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
  `direccionGeoreferencia` text,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` VALUES ('Posición Válida',0,'2019-06-03','13:38:39',2019,6,1,'-92.981197,17.942131',344048,1,44026,5061422,2,NULL,NULL,0,90,'2019-06-03 18:38:39','2019-06-03 13:38:39',828900,'2019-06-03 13:38:39',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826',NULL,'30',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Válida',0,'2018-02-07','09:12:45',2018,2,3,'25.26142,-104.0659',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','',NULL,1,'','','','',NULL),('Posición Válida',0,'2018-01-15','09:24:10',2018,1,1,'20.660266,-97.554168',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2018-04-23','19:11:05',2018,4,1,'17.941847,-92.980662',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2018-04-15','13:52:02',2018,4,0,'20.660414,-97.554234',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',1,'2018-06-05','13:23:06',2018,6,2,'19.195391,-101.916468',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','',NULL,1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125',NULL),('Posición Válida',0,'2018-09-21','13:33:54',2018,9,5,'19.904763,-103.52459',292837,1,44026,1918557,2,NULL,NULL,0,0,'2018-09-21 18:33:52','2018-09-21 13:33:54',122759,'2018-09-21 13:33:52',83,'Auto reporte Keep Alive',1,'','3WKDD40X4DF849146',NULL,'04',NULL,1,'','','','',NULL),('Posición Válida',0,'2019-06-03','13:36:23',2019,6,1,'-103.525473,19.904366',301691,1,44026,5101058,2,NULL,NULL,0,0,'2019-06-03 18:36:23','2019-06-03 13:36:23',54,'2019-06-03 13:36:23',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF851436',NULL,'5',NULL,1,'JALISCO','ATOYAC','','GUADALAJARA - COLIMA',NULL),('Posición Válida',1,'2019-06-03','13:46:29',2019,6,1,'-92.980557,17.942595',252208,1,44026,4329851,2,NULL,NULL,0,43,'2019-06-03 18:46:29','2019-06-03 13:46:29',12691400,'2019-06-03 13:46:29',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503',NULL,'15',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','TALLER MURO',NULL),('Posición Válida',0,'2019-06-03','13:33:43',2019,6,1,'-92.980941,17.941958',336511,1,44026,5106169,2,NULL,NULL,0,113,'2019-06-03 18:33:43','2019-06-03 13:33:43',2867700,'2019-06-03 13:33:43',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249',NULL,'22',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Antigüa',0,'2015-07-02','17:41:00',2015,7,3,'-98.02915,20.186785',327072,1,44026,1332146,2,20.186785,-98.02915,0,0,'2015-07-02 17:41:00','2015-07-02 17:41:00',61135881,'2015-07-02 17:41:00',NULL,'CLIENTE',8,'','','','',NULL,3,'','','','',NULL),('Posición Válida',0,'2019-06-03','13:23:30',2019,6,1,'-97.554252,20.66008',336510,1,44026,5063192,2,NULL,NULL,0,318,'2019-06-03 18:23:30','2019-06-03 13:23:30',8700,'2019-06-03 13:23:30',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250',NULL,'206',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2019-06-03','13:35:54',2019,6,1,'-92.980742,17.941863',272546,1,44026,5059870,2,NULL,NULL,0,175,'2019-06-03 18:35:54','2019-06-03 13:35:54',4420900,'2019-06-03 13:35:54',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324',NULL,'017',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2019-06-04','11:38:45',2019,6,2,'-92.980966,17.941875',344048,1,44026,5061422,2,NULL,NULL,0,90,'2019-06-04 16:38:45','2019-06-04 11:38:45',828900,'2019-06-04 11:38:45',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826',NULL,'30',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Válida',0,'2018-02-07','09:12:45',2018,2,3,'25.26142,-104.0659',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','',NULL,1,'','','','',NULL),('Posición Válida',0,'2018-01-15','09:24:10',2018,1,1,'20.660266,-97.554168',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2018-04-23','19:11:05',2018,4,1,'17.941847,-92.980662',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2018-04-15','13:52:02',2018,4,0,'20.660414,-97.554234',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',1,'2018-06-05','13:23:06',2018,6,2,'19.195391,-101.916468',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','',NULL,1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125',NULL),('Posición Válida',0,'2018-09-21','13:33:54',2018,9,5,'19.904763,-103.52459',292837,1,44026,1918557,2,NULL,NULL,0,0,'2018-09-21 18:33:52','2018-09-21 13:33:54',122759,'2018-09-21 13:33:52',83,'Auto reporte Keep Alive',1,'','3WKDD40X4DF849146',NULL,'04',NULL,1,'','','','',NULL),('Posición Válida',0,'2019-06-04','11:36:23',2019,6,2,'-103.52548,19.904359',301691,1,44026,5101058,2,NULL,NULL,0,0,'2019-06-04 16:36:23','2019-06-04 11:36:23',54,'2019-06-04 11:36:23',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF851436',NULL,'5',NULL,1,'JALISCO','ATOYAC','','GUADALAJARA - COLIMA',NULL),('Posición Válida',0,'2019-06-04','11:29:44',2019,6,2,'-92.980577,17.942548',252208,1,44026,4329851,2,NULL,NULL,0,43,'2019-06-04 16:29:44','2019-06-04 11:29:44',12691400,'2019-06-04 11:29:44',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503',NULL,'15',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','TALLER MURO',NULL),('Posición Válida',0,'2019-06-04','11:33:56',2019,6,2,'-92.980869,17.942059',336511,1,44026,5106169,2,NULL,NULL,0,113,'2019-06-04 16:33:56','2019-06-04 11:33:56',2867700,'2019-06-04 11:33:56',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249',NULL,'22',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Antigüa',0,'2015-07-02','17:41:00',2015,7,3,'-98.02915,20.186785',327072,1,44026,1332146,2,20.186785,-98.02915,0,0,'2015-07-02 17:41:00','2015-07-02 17:41:00',61135881,'2015-07-02 17:41:00',NULL,'CLIENTE',8,'','','','',NULL,3,'','','','',NULL),('Posición Válida',0,'2019-06-04','11:23:42',2019,6,2,'-97.554275,20.660028',336510,1,44026,5063192,2,NULL,NULL,0,318,'2019-06-04 16:23:42','2019-06-04 11:23:42',8700,'2019-06-04 11:23:42',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250',NULL,'206',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2019-06-04','11:35:48',2019,6,2,'-92.980312,17.942118',272546,1,44026,5059870,2,NULL,NULL,0,175,'2019-06-04 16:35:48','2019-06-04 11:35:48',4420900,'2019-06-04 11:35:48',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324',NULL,'017',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2019-06-04','11:38:45',2019,6,2,'-92.980966,17.941875',344048,1,44026,5061422,2,NULL,NULL,0,90,'2019-06-04 16:38:45','2019-06-04 11:38:45',828900,'2019-06-04 11:38:45',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826',NULL,'30',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Válida',0,'2018-02-07','09:12:45',2018,2,3,'25.26142,-104.0659',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','',NULL,1,'','','','',NULL),('Posición Válida',0,'2018-01-15','09:24:10',2018,1,1,'20.660266,-97.554168',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2018-04-23','19:11:05',2018,4,1,'17.941847,-92.980662',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2018-04-15','13:52:02',2018,4,0,'20.660414,-97.554234',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',1,'2018-06-05','13:23:06',2018,6,2,'19.195391,-101.916468',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','',NULL,1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125',NULL),('Posición Válida',0,'2018-09-21','13:33:54',2018,9,5,'19.904763,-103.52459',292837,1,44026,1918557,2,NULL,NULL,0,0,'2018-09-21 18:33:52','2018-09-21 13:33:54',122759,'2018-09-21 13:33:52',83,'Auto reporte Keep Alive',1,'','3WKDD40X4DF849146',NULL,'04',NULL,1,'','','','',NULL),('Posición Válida',0,'2019-06-04','11:36:23',2019,6,2,'-103.52548,19.904359',301691,1,44026,5101058,2,NULL,NULL,0,0,'2019-06-04 16:36:23','2019-06-04 11:36:23',54,'2019-06-04 11:36:23',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF851436',NULL,'5',NULL,1,'JALISCO','ATOYAC','','GUADALAJARA - COLIMA',NULL),('Posición Válida',0,'2019-06-04','11:29:44',2019,6,2,'-92.980577,17.942548',252208,1,44026,4329851,2,NULL,NULL,0,43,'2019-06-04 16:29:44','2019-06-04 11:29:44',12691400,'2019-06-04 11:29:44',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503',NULL,'15',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','TALLER MURO',NULL),('Posición Válida',0,'2019-06-04','11:33:56',2019,6,2,'-92.980869,17.942059',336511,1,44026,5106169,2,NULL,NULL,0,113,'2019-06-04 16:33:56','2019-06-04 11:33:56',2867700,'2019-06-04 11:33:56',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249',NULL,'22',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Antigüa',0,'2015-07-02','17:41:00',2015,7,3,'-98.02915,20.186785',327072,1,44026,1332146,2,20.186785,-98.02915,0,0,'2015-07-02 17:41:00','2015-07-02 17:41:00',61135881,'2015-07-02 17:41:00',NULL,'CLIENTE',8,'','','','',NULL,3,'','','','',NULL),('Posición Válida',0,'2019-06-04','11:23:42',2019,6,2,'-97.554275,20.660028',336510,1,44026,5063192,2,NULL,NULL,0,318,'2019-06-04 16:23:42','2019-06-04 11:23:42',8700,'2019-06-04 11:23:42',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250',NULL,'206',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2019-06-04','11:35:48',2019,6,2,'-92.980312,17.942118',272546,1,44026,5059870,2,NULL,NULL,0,175,'2019-06-04 16:35:48','2019-06-04 11:35:48',4420900,'2019-06-04 11:35:48',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324',NULL,'017',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2019-06-06','12:38:53',2019,6,4,'-92.981093,17.941823',344048,1,44026,5061422,2,NULL,NULL,0,90,'2019-06-06 17:38:53','2019-06-06 12:38:53',828900,'2019-06-06 12:38:53',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826',NULL,'30',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Válida',0,'2018-02-07','09:12:45',2018,2,3,'25.26142,-104.0659',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','',NULL,1,'','','','',NULL),('Posición Válida',0,'2018-01-15','09:24:10',2018,1,1,'20.660266,-97.554168',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2018-04-23','19:11:05',2018,4,1,'17.941847,-92.980662',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2018-04-15','13:52:02',2018,4,0,'20.660414,-97.554234',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',1,'2018-06-05','13:23:06',2018,6,2,'19.195391,-101.916468',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','',NULL,1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125',NULL),('Posición Válida',0,'2018-09-21','13:33:54',2018,9,5,'19.904763,-103.52459',292837,1,44026,1918557,2,NULL,NULL,0,0,'2018-09-21 18:33:52','2018-09-21 13:33:54',122759,'2018-09-21 13:33:52',83,'Auto reporte Keep Alive',1,'','3WKDD40X4DF849146',NULL,'04',NULL,1,'','','','',NULL),('Posición Válida',0,'2019-06-06','12:36:23',2019,6,4,'-103.525441,19.90441',301691,1,44026,5101058,2,NULL,NULL,0,0,'2019-06-06 17:36:23','2019-06-06 12:36:23',54,'2019-06-06 12:36:23',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF851436',NULL,'5',NULL,1,'JALISCO','ATOYAC','','GUADALAJARA - COLIMA',NULL),('Posición Válida',0,'2019-06-06','12:17:57',2019,6,4,'-92.980815,17.942234',252208,1,44026,4329851,2,NULL,NULL,0,311,'2019-06-06 17:17:57','2019-06-06 12:17:57',13081400,'2019-06-06 12:17:57',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503',NULL,'15',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Válida',0,'2019-06-06','12:22:50',2019,6,4,'-92.980848,17.942333',336511,1,44026,5106169,2,NULL,NULL,0,237,'2019-06-06 17:22:50','2019-06-06 12:22:50',3257700,'2019-06-06 12:22:50',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249',NULL,'22',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','TALLER MURO',NULL),('Posición Antigüa',0,'2015-07-02','17:41:00',2015,7,3,'-98.02915,20.186785',327072,1,44026,1332146,2,20.186785,-98.02915,0,0,'2015-07-02 17:41:00','2015-07-02 17:41:00',61135881,'2015-07-02 17:41:00',NULL,'CLIENTE',8,'','','','',NULL,3,'','','','',NULL),('Posición Válida',0,'2019-06-06','12:25:39',2019,6,4,'-97.554191,20.660117',336510,1,44026,5063192,2,NULL,NULL,0,318,'2019-06-06 17:25:39','2019-06-06 12:25:39',8700,'2019-06-06 12:25:39',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250',NULL,'206',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2019-06-06','12:35:36',2019,6,4,'-92.98062,17.941875',272546,1,44026,5059870,2,NULL,NULL,0,175,'2019-06-06 17:35:36','2019-06-06 12:35:36',4420900,'2019-06-06 12:35:36',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324',NULL,'017',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2019-05-03','16:38:21',2019,5,5,'-93.207392,18.422148',252209,1,44026,4418119,2,NULL,NULL,0,4,'2019-05-03 21:38:21','2019-05-03 16:38:21',14906100,'2019-05-03 16:38:21',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844505',NULL,'19',NULL,1,'','','','',NULL),('Posición Válida',0,'2019-06-20','16:30:58',2019,6,4,'-92.98073,17.941981',252208,1,44026,4329851,2,NULL,NULL,0,340,'2019-06-20 21:30:58','2019-06-20 16:30:58',13243100,'2019-06-20 16:30:58',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503',NULL,'15',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2019-06-20','16:23:03',2019,6,4,'-97.554207,20.660169',336510,1,44026,5063192,2,NULL,NULL,0,318,'2019-06-20 21:23:03','2019-06-20 16:23:03',8700,'2019-06-20 16:23:03',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250',NULL,'206',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2019-06-20','16:19:17',2019,6,4,'-94.372559,18.14905',272546,1,44026,5059870,2,NULL,NULL,0,21,'2019-06-20 21:19:17','2019-06-20 16:19:17',4983900,'2019-06-20 16:19:17',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324',NULL,'017',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','COATZACOALCOS','','',NULL),('Posición Válida',0,'2019-06-20','16:08:23',2019,6,4,'-92.981022,17.941873',344048,1,44026,5061422,2,NULL,NULL,0,90,'2019-06-20 21:08:23','2019-06-20 16:08:23',828900,'2019-06-20 16:08:23',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826',NULL,'30',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Válida',0,'2019-06-20','16:03:30',2019,6,4,'-92.980733,17.942017',336511,1,44026,5106169,2,NULL,NULL,0,241,'2019-06-20 21:03:30','2019-06-20 16:03:30',3651700,'2019-06-20 16:03:30',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249',NULL,'22',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2019-06-20','16:12:23',2019,6,4,'-103.52545,19.904366',301691,1,44026,5101058,2,NULL,NULL,0,0,'2019-06-20 21:12:23','2019-06-20 16:12:23',95,'2019-06-20 16:12:23',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF851436',NULL,'5',NULL,1,'JALISCO','ATOYAC','','GUADALAJARA - COLIMA',NULL),('Posición Válida',0,'2018-02-07','09:12:45',2018,2,3,'-104.0659,25.26142',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','',NULL,1,'','','','',NULL),('Posición Válida',0,'2018-01-15','09:24:10',2018,1,1,'-97.554168,20.660266',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2018-04-23','19:11:05',2018,4,1,'-92.980662,17.941847',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2018-04-15','13:52:02',2018,4,0,'-97.554234,20.660414',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',1,'2018-06-05','13:23:06',2018,6,2,'-101.916468,19.195391',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','',NULL,1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125',NULL),('Posición Válida',0,'2018-09-21','13:33:54',2018,9,5,'-103.52459,19.904763',292837,1,44026,1918557,2,NULL,NULL,0,0,'2018-09-21 18:33:52','2018-09-21 13:33:54',122759,'2018-09-21 13:33:52',83,'Auto reporte Keep Alive',1,'','3WKDD40X4DF849146',NULL,'04',NULL,1,'','','','',NULL),('Posición Antigüa',0,'2015-07-02','17:41:00',2015,7,3,'-98.02915,20.186785',327072,1,44026,1332146,2,20.186785,-98.02915,0,0,'2015-07-02 17:41:00','2015-07-02 17:41:00',61135881,'2015-07-02 17:41:00',NULL,'CLIENTE',8,'','','','',NULL,3,'','','','',NULL),('Posición Válida',0,'2019-05-03','16:38:21',2019,5,5,'-93.207392,18.422148',252209,1,44026,4418119,2,NULL,NULL,0,4,'2019-05-03 21:38:21','2019-05-03 16:38:21',14906100,'2019-05-03 16:38:21',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844505',NULL,'19',NULL,1,'','','','',NULL),('Posición Válida',0,'2019-07-10','17:29:21',2019,7,3,'-92.980744,17.941836',252208,1,44026,4329851,2,NULL,NULL,0,4,'2019-07-10 22:29:21','2019-07-10 17:29:21',14082100,'2019-07-10 17:29:21',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503',NULL,'15',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',1,'2019-07-10','17:55:32',2019,7,3,'-97.554528,20.660466',336510,1,44026,5063192,2,20.660466,-97.554528,0,4,'2019-07-10 22:55:32','2019-07-10 17:55:32',9900,'2019-07-10 17:55:32',9,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250','206-EV-1','206',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2019-07-10','17:34:50',2019,7,3,'-92.980989,17.941956',272546,1,44026,5059870,2,17.941956,-92.980989,0,45,'2019-07-10 22:34:50','2019-07-10 17:34:50',5151500,'2019-07-10 17:34:50',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324','005-EX-2','017',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Válida',0,'2019-07-10','17:38:01',2019,7,3,'-92.980552,17.941876',344048,1,44026,5061422,2,17.941876,-92.980552,0,163,'2019-07-10 22:38:01','2019-07-10 17:38:01',829000,'2019-07-10 17:38:01',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826','304-EV-4','30',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2019-07-10','17:32:57',2019,7,3,'-92.980982,17.942556',336511,1,44026,5106169,2,17.942556,-92.980982,0,59,'2019-07-10 22:32:57','2019-07-10 17:32:57',3873700,'2019-07-10 17:32:57',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249','205-EV-1','22',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','TALLER MURO',NULL),('Posición Válida',0,'2019-07-10','17:40:23',2019,7,3,'-103.525529,19.904384',301691,1,44026,5101058,2,19.904384,-103.525529,0,0,'2019-07-10 22:40:23','2019-07-10 17:40:23',230,'2019-07-10 17:40:23',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF851436','508-EU-7','5',NULL,1,'JALISCO','ATOYAC','','GUADALAJARA - COLIMA',NULL),('Posición Válida',0,'2018-02-07','09:12:45',2018,2,3,'-104.0659,25.26142',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','',NULL,1,'','','','',NULL),('Posición Válida',0,'2018-01-15','09:24:10',2018,1,1,'-97.554168,20.660266',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2018-04-23','19:11:05',2018,4,1,'-92.980662,17.941847',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2018-04-15','13:52:02',2018,4,0,'-97.554234,20.660414',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',1,'2018-06-05','13:23:06',2018,6,2,'-101.916468,19.195391',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','',NULL,1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125',NULL),('Posición Válida',0,'2018-09-21','13:33:54',2018,9,5,'-103.52459,19.904763',292837,1,44026,1918557,2,19.904763,-103.52459,0,0,'2018-09-21 18:33:52','2018-09-21 13:33:54',122759,'2018-09-21 13:33:52',83,'Auto reporte Keep Alive',1,'','3WKDD40X4DF849146','004-EX-2','04',NULL,1,'','','','',NULL),('Posición Antigüa',0,'2015-07-02','17:41:00',2015,7,3,'-98.02915,20.186785',327072,1,44026,1332146,2,20.186785,-98.02915,0,0,'2015-07-02 17:41:00','2015-07-02 17:41:00',61135881,'2015-07-02 17:41:00',NULL,'CLIENTE',8,'','','','',NULL,3,'','','','',NULL),('Posición Válida',0,'2019-05-03','16:38:21',2019,5,5,'-93.207392,18.422148',252209,1,44026,4418119,2,NULL,NULL,0,4,'2019-05-03 21:38:21','2019-05-03 16:38:21',14906100,'2019-05-03 16:38:21',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844505',NULL,'19',NULL,1,'','','','',NULL),('Posición Válida',0,'2019-07-10','17:29:21',2019,7,3,'-92.980744,17.941836',252208,1,44026,4329851,2,NULL,NULL,0,4,'2019-07-10 22:29:21','2019-07-10 17:29:21',14082100,'2019-07-10 17:29:21',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503',NULL,'15',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',1,'2019-07-10','17:55:32',2019,7,3,'-97.554528,20.660466',336510,1,44026,5063192,2,20.660466,-97.554528,0,4,'2019-07-10 22:55:32','2019-07-10 17:55:32',9900,'2019-07-10 17:55:32',9,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250','206-EV-1','206',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2019-07-10','17:34:50',2019,7,3,'-92.980989,17.941956',272546,1,44026,5059870,2,17.941956,-92.980989,0,45,'2019-07-10 22:34:50','2019-07-10 17:34:50',5151500,'2019-07-10 17:34:50',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324','005-EX-2','017',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Válida',0,'2019-07-10','17:38:01',2019,7,3,'-92.980552,17.941876',344048,1,44026,5061422,2,17.941876,-92.980552,0,163,'2019-07-10 22:38:01','2019-07-10 17:38:01',829000,'2019-07-10 17:38:01',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826','304-EV-4','30',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2019-07-10','17:32:57',2019,7,3,'-92.980982,17.942556',336511,1,44026,5106169,2,17.942556,-92.980982,0,59,'2019-07-10 22:32:57','2019-07-10 17:32:57',3873700,'2019-07-10 17:32:57',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249','205-EV-1','22',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','TALLER MURO',NULL),('Posición Válida',0,'2019-07-10','17:40:23',2019,7,3,'-103.525529,19.904384',301691,1,44026,5101058,2,19.904384,-103.525529,0,0,'2019-07-10 22:40:23','2019-07-10 17:40:23',230,'2019-07-10 17:40:23',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF851436','508-EU-7','5',NULL,1,'JALISCO','ATOYAC','','GUADALAJARA - COLIMA',NULL),('Posición Válida',0,'2018-02-07','09:12:45',2018,2,3,'-104.0659,25.26142',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','',NULL,1,'','','','',NULL),('Posición Válida',0,'2018-01-15','09:24:10',2018,1,1,'-97.554168,20.660266',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2018-04-23','19:11:05',2018,4,1,'-92.980662,17.941847',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2018-04-15','13:52:02',2018,4,0,'-97.554234,20.660414',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',1,'2018-06-05','13:23:06',2018,6,2,'-101.916468,19.195391',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','',NULL,1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125',NULL),('Posición Válida',0,'2018-09-21','13:33:54',2018,9,5,'-103.52459,19.904763',292837,1,44026,1918557,2,19.904763,-103.52459,0,0,'2018-09-21 18:33:52','2018-09-21 13:33:54',122759,'2018-09-21 13:33:52',83,'Auto reporte Keep Alive',1,'','3WKDD40X4DF849146','004-EX-2','04',NULL,1,'','','','',NULL),('Posición Antigüa',0,'2015-07-02','17:41:00',2015,7,3,'-98.02915,20.186785',327072,1,44026,1332146,2,20.186785,-98.02915,0,0,'2015-07-02 17:41:00','2015-07-02 17:41:00',61135881,'2015-07-02 17:41:00',NULL,'CLIENTE',8,'','','','',NULL,3,'','','','',NULL),('Posición Válida',0,'2019-05-03','16:38:21',2019,5,5,'-93.207392,18.422148',252209,1,44026,4418119,2,18.422148,-93.207392,0,4,'2019-05-03 21:38:21','2019-05-03 16:38:21',14906100,'2019-05-03 16:38:21',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844505','31-AA-9B','19',NULL,1,'','','','',NULL),('Posición Válida',0,'2019-07-10','17:59:15',2019,7,3,'-92.980744,17.941836',252208,1,44026,4329851,2,NULL,NULL,0,4,'2019-07-10 22:59:15','2019-07-10 17:59:15',14082100,'2019-07-10 17:59:15',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503',NULL,'15',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2019-07-10','17:57:58',2019,7,3,'-97.554528,20.660466',336510,1,44026,5063192,2,20.660466,-97.554528,0,4,'2019-07-10 22:57:58','2019-07-10 17:57:58',9900,'2019-07-10 17:57:58',9,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250','206-EV-1','206',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2019-07-10','18:04:57',2019,7,3,'-92.980989,17.941956',272546,1,44026,5059870,2,17.941956,-92.980989,0,45,'2019-07-10 23:04:57','2019-07-10 18:04:57',5151500,'2019-07-10 18:04:57',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324','005-EX-2','017',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ',NULL),('Posición Válida',0,'2019-07-10','18:07:56',2019,7,3,'-92.980552,17.941876',344048,1,44026,5061422,2,17.941876,-92.980552,0,163,'2019-07-10 23:07:56','2019-07-10 18:07:56',829000,'2019-07-10 18:07:56',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826','304-EV-4','30',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2019-07-10','18:03:02',2019,7,3,'-92.980982,17.942556',336511,1,44026,5106169,2,17.942556,-92.980982,0,59,'2019-07-10 23:03:02','2019-07-10 18:03:02',3873700,'2019-07-10 18:03:02',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249','205-EV-1','22',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','TALLER MURO',NULL),('Posición Válida',0,'2019-07-10','18:10:23',2019,7,3,'-103.525521,19.904393',301691,1,44026,5101058,2,19.904393,-103.525521,0,0,'2019-07-10 23:10:23','2019-07-10 18:10:23',230,'2019-07-10 18:10:23',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF851436','508-EU-7','5',NULL,1,'JALISCO','ATOYAC','','GUADALAJARA - COLIMA',NULL),('Posición Válida',0,'2018-02-07','09:12:45',2018,2,3,'-104.0659,25.26142',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','',NULL,1,'','','','',NULL),('Posición Válida',0,'2018-01-15','09:24:10',2018,1,1,'-97.554168,20.660266',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',0,'2018-04-23','19:11:05',2018,4,1,'-92.980662,17.941847',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','',NULL,1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ',NULL),('Posición Válida',0,'2018-04-15','13:52:02',2018,4,0,'-97.554234,20.660414',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','',NULL,1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','','',NULL),('Posición Válida',1,'2018-06-05','13:23:06',2018,6,2,'-101.916468,19.195391',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','',NULL,1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125',NULL),('Posición Válida',0,'2018-09-21','13:33:54',2018,9,5,'-103.52459,19.904763',292837,1,44026,1918557,2,19.904763,-103.52459,0,0,'2018-09-21 18:33:52','2018-09-21 13:33:54',122759,'2018-09-21 13:33:52',83,'Auto reporte Keep Alive',1,'','3WKDD40X4DF849146','004-EX-2','04',NULL,1,'','','','',NULL),('Posición Antigüa',0,'2015-07-02','17:41:00',2015,7,3,'-98.02915,20.186785',327072,1,44026,1332146,2,20.186785,-98.02915,0,0,'2015-07-02 17:41:00','2015-07-02 17:41:00',61135881,'2015-07-02 17:41:00',NULL,'CLIENTE',8,'','','','',NULL,3,'','','','',NULL);
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `profile_pic` varchar(250) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `kind` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','Amner Saucedo Sosa','waptoing7@gmail.com','90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad','default.png',1,1,'2017-07-15 12:05:45');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'wicho','$2a$10$ZZpgz3lhw4IAUPwmuEjDe.xf2UTm7sBmMWxZDPH3L9PWcNmyCEUgC','luis',NULL,'2019-05-28 19:06:51',NULL,NULL),(2,'zuko','$2a$10$efpZvslrJY06i8Dr7/Sj4uYOd3Xfj4iWZiZDtEvc/Q1s49GCenI9O','angel',NULL,'2019-05-28 19:06:51',NULL,NULL),(3,'tiko','$2a$10$7zmeepYFhQCLN6aLSvaGaeBRUwwPk3K.zAtJSjfLyqnxcu15jtB1i','roberto',NULL,'2019-05-28 19:06:51',NULL,NULL),(4,'wicho','$2a$10$lif/mQgtPtV8zl9A9muNju1E64zCBENcUXlH2eyV2ap98EdVYc/wq','luis',NULL,'2019-05-28 19:07:51',NULL,NULL),(5,'wicho','$2a$10$G6F0WhFWwjbiRjszetHgF.BYk2FIWba5XSH6BhiBEF3bleo1igbH6','luis',NULL,'2019-05-28 19:11:53',NULL,NULL),(6,'manuel','$2a$10$a1WfVuGtH34iKxy9qCfOtuQbDSrzbRXNFYAQQ7jSqEhjj34HDU7BG','manuel','manuel@mgoel.com',NULL,NULL,NULL),(7,'carlos','$2a$10$an4wz0XMSNITzgcZX2Vqb.DtSxAPsLeV3z.o4chRmJAkXEBcsn5qa','carlos','carlos@mogel.com.mx',NULL,NULL,NULL);
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

-- Dump completed on 2019-07-16 17:24:45
