-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: inventario
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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `almacen` (
  `idAlmacen` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idSucursal` int(10) unsigned NOT NULL,
  `idProducto` int(10) unsigned NOT NULL,
  `cantidadAlmacen` int(10) unsigned NOT NULL DEFAULT '0',
  `cantidadConsumo` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAlmacen`),
  KEY `idSucursal` (`idSucursal`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`) ON DELETE CASCADE,
  CONSTRAINT `almacen_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,1,1,1,1),(3,3,1,0,0),(4,3,2,0,0);
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacionbasicos`
--

DROP TABLE IF EXISTS `asignacionbasicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asignacionbasicos` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idTecnica` int(10) unsigned NOT NULL,
  `idProducto` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `idUsuario` (`idUsuario`),
  KEY `idTecnica` (`idTecnica`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `asignacionbasicos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE,
  CONSTRAINT `asignacionbasicos_ibfk_2` FOREIGN KEY (`idTecnica`) REFERENCES `tecnicas` (`idTecnica`) ON DELETE CASCADE,
  CONSTRAINT `asignacionbasicos_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacionbasicos`
--

LOCK TABLES `asignacionbasicos` WRITE;
/*!40000 ALTER TABLE `asignacionbasicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacionbasicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bajas`
--

DROP TABLE IF EXISTS `bajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bajas` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idProducto` int(10) unsigned NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `idUsuario` (`idUsuario`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `bajas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE,
  CONSTRAINT `bajas_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bajas`
--

LOCK TABLES `bajas` WRITE;
/*!40000 ALTER TABLE `bajas` DISABLE KEYS */;
/*!40000 ALTER TABLE `bajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bajasbasicos`
--

DROP TABLE IF EXISTS `bajasbasicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bajasbasicos` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idTecnica` int(10) unsigned NOT NULL,
  `idProducto` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `idUsuario` (`idUsuario`),
  KEY `idTecnica` (`idTecnica`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `bajasbasicos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE,
  CONSTRAINT `bajasbasicos_ibfk_2` FOREIGN KEY (`idTecnica`) REFERENCES `tecnicas` (`idTecnica`) ON DELETE CASCADE,
  CONSTRAINT `bajasbasicos_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bajasbasicos`
--

LOCK TABLES `bajasbasicos` WRITE;
/*!40000 ALTER TABLE `bajasbasicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bajasbasicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basicosenuso`
--

DROP TABLE IF EXISTS `basicosenuso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `basicosenuso` (
  `idTecnica` int(10) unsigned NOT NULL,
  `idProducto` int(10) unsigned NOT NULL,
  `enUso` tinyint(1) NOT NULL,
  KEY `idProducto` (`idProducto`),
  KEY `idTecnica` (`idTecnica`),
  CONSTRAINT `basicosenuso_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE,
  CONSTRAINT `basicosenuso_ibfk_2` FOREIGN KEY (`idTecnica`) REFERENCES `tecnicas` (`idTecnica`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicosenuso`
--

LOCK TABLES `basicosenuso` WRITE;
/*!40000 ALTER TABLE `basicosenuso` DISABLE KEYS */;
/*!40000 ALTER TABLE `basicosenuso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camiones`
--

DROP TABLE IF EXISTS `camiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `camiones` (
  `idVehiculo` int(11) DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `kilometraje` int(11) DEFAULT NULL,
  `noSerie` text,
  `placa` text,
  `noEconomico` text,
  `estadoGeoreferencia` text,
  `municipioGeoreferencia` text,
  `asentamientoGeoreferencia` text,
  `direccionGeoreferencia` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camiones`
--

LOCK TABLES `camiones` WRITE;
/*!40000 ALTER TABLE `camiones` DISABLE KEYS */;
INSERT INTO `camiones` VALUES (252209,18.422148,-93.207392,14906100,'3WKDD40X3DF844505','31-AA-9B','19','','','',''),(252208,17.942039,-92.980731,14267200,'3WKDD40X3DF844503','30-AA-9B','15','TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),(336510,20.660295,-97.554189,16800,'3WKDD40X0EF854250','206-EV-1','206','VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),(272546,17.942645,-92.980061,5615400,'3WKDD40X4DF845324','005-EX-2','017','TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','VILLAHERMOSA-REFORMA'),(344048,17.942038,-92.980938,829000,'3WKDD40XXEF855826','304-EV-4','30','TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ'),(336511,17.941864,-92.981105,7620800,'3WKDD40X4EF854249','205-EV-1','22','TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ'),(301691,17.94252,-92.98024,5149528,'3WKDD40XXEF851436','508-EU-7','5','TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','VILLAHERMOSA-REFORMA'),(301692,17.942077,-92.980665,7,'3WKDD40X1EF851437','783-EX-2','14','TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),(301690,25.26142,-104.0659,98388740,'','','','','','',''),(344050,20.660266,-97.554168,44673799,'','','','VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),(327071,17.941847,-92.980662,13789800,'','','','TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),(344052,20.660414,-97.554234,89468,'','','','VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),(344051,19.195391,-101.916468,148637661,'','','','MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125'),(NULL,NULL,NULL,NULL,NULL,'004-EX-2',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `camiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categorias` (
  `idCategoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (2,'Goldwell','Categoria Goldwell'),(3,'Guadalajara','Categoria Guadalajara'),(4,'Morgan Taylor','Categoria Morgan Taylor'),(5,'Nioxin','Categoria Nioxin'),(6,'Pestaña','Categoria Pestaña'),(7,'Prohesion','Categoria Prohesion'),(8,'Seche','Categoria Seche'),(9,'Urgente','Urge'),(10,'Normal','Normal'),(12,'Normall','Normal'),(15,'Guadalajaraa','asd');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `razonSocial` varchar(50) NOT NULL,
  `rfc` varchar(50) DEFAULT NULL,
  `domicilioFiscal` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `razonSocial` (`razonSocial`),
  UNIQUE KEY `razonSocial_2` (`razonSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,'mogell','bbbbbbbbbbbbbbbb','aaaaaaaaaaa','activo',1),(3,'global','hajkdhasd','asdads','asddas',1),(4,'floress','aaaaaaaaaaaa','jadhkjhasdkhad','dasd',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conductores`
--

DROP TABLE IF EXISTS `conductores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conductores` (
  `idConductor` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(70) DEFAULT NULL,
  `curp` varchar(20) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `categoria` varchar(20) DEFAULT NULL,
  `base` varchar(200) DEFAULT NULL,
  `numeroLicencia` varchar(20) DEFAULT NULL,
  `idLicencia` int(11) DEFAULT NULL,
  `expedicion` date DEFAULT NULL,
  `vigencia` date DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `numeroSeguro` varchar(50) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConductor`),
  UNIQUE KEY `curp` (`curp`),
  UNIQUE KEY `curp_2` (`curp`),
  UNIQUE KEY `numeroLicencia` (`numeroLicencia`),
  UNIQUE KEY `numeroSeguro` (`numeroSeguro`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conductores`
--

LOCK TABLES `conductores` WRITE;
/*!40000 ALTER TABLE `conductores` DISABLE KEYS */;
INSERT INTO `conductores` VALUES (2,'lusi','jkhasdjh','jhhaskdhkja','kjhasdkjhjasd','kjhaskjdhad','hkjasdh','456454',4,'2019-08-02','2019-08-10','asdasd','asdasd','2019-08-19',1),(4,'asda','asdasd','asdasdssssa','adasdasd','1','dadasd','345565477',4,'1990-06-25','1990-07-26','adsfdf','3467777','1990-07-22',1),(5,NULL,'assss','ssssssss','ssssssssss','ssss','ssssss','ssssssssss',4,'1990-02-25','1991-05-15','asdasd','11','1991-05-15',1),(6,NULL,'gggggggg','gggggggg','gggggg','gggggggg','gggggggg','222222222',4,'1990-02-25','1991-05-15','mexicano','33333333333333','1991-05-15',1),(7,'hhhh','h','h','h','h','1','1132231321s',4,'2019-08-22','2019-08-23','mexicano','tttttttt','2019-08-29',1),(8,'b','b','b','b','b','b','55555555',NULL,'2019-08-02','2019-08-17','mexicano','55667','2019-08-29',1),(10,'u','u','uu','u','u','u','u',NULL,'2019-08-01','2019-08-02','mexicano','234234','2019-08-22',1),(11,'t','t','t','tt','t','tt','t',NULL,'2019-08-01','2019-08-10','mexicano','45645765','2019-08-31',1),(14,'w','w','w','ww','w','w','23423',NULL,'2019-08-01','2019-08-02','mexicano','asdasddffffff','2019-08-30',1),(15,'y','yy','y','yy','y','y','y',NULL,'2019-08-15','2019-08-14','mexicano','15645546456','2019-08-14',1),(16,'nn','n','nn','n','nn','n','nn',NULL,'2019-08-22','2019-08-17','mexicano','n','2019-08-29',1),(17,'v','v','vv','v','v','v','v',NULL,'2019-08-23','2019-08-24','mexicano','3333333333','2019-08-30',1),(18,'k','k','k','kk','kk','k','k',NULL,'2019-08-10','2019-08-23','mexicano','k','2019-08-29',1),(19,'x','X','X','X','X','X','X',NULL,'2019-08-22','2019-08-23','Mejhasdh','5555555777','2019-08-29',1),(20,'zz','z','z','zz','z','z','z',NULL,'2019-08-02','2019-08-03','mexicano','555555444','2019-08-22',1),(22,'h','h','hgdfgdfgdfg','hh','h','h','h',NULL,'2001-06-25','2019-08-17','mexicano','565dgddhf','2019-08-25',1),(23,'ii','i','i','ii','i','ii','i',NULL,'2019-08-16','2019-08-17','mexicano','asdasdghfgh','2019-08-29',1),(24,'q','q','q','qq','q','q','q',NULL,'2019-08-08','2019-08-08','q','q','2019-08-23',1),(26,'t','t','tt','t','t','t','t4546',NULL,'2019-08-16','2019-08-17','mexicano','3223','2019-08-30',1),(27,'p','p','p','p','pp','p','p',NULL,'2019-08-01','2019-08-02','mexicano','p','2019-08-28',1),(28,'o','oo','oo','oo','o','o','oo',NULL,'2019-08-15','2019-08-15','o','o','2019-08-22',1),(31,'uu','u','uuiiiiiiiii','uu','u','u','234234',NULL,'2019-08-14','2019-08-15','mexicano','uiiiiiii','2019-08-28',1),(32,'bbbbb','bbbb','bbbbbb','bbbbbb','bbbbb','bbbbb','5145615640',NULL,'2019-08-02','2019-08-03','mexicano','asdasdasd','2019-08-29',1),(35,'nnnnnnnnnnnnnnn','nngdfg','ndfgdg','nndfgdfg','ndfgdfg','ndfg','nndfgdfg',NULL,'2019-08-02','2019-08-03','mexicano','asdasdaaa111','2019-08-22',1),(36,'1','1','1','1','1','1','1',NULL,'2019-08-15','2019-08-17','mexicano','1','2019-08-30',1);
/*!40000 ALTER TABLE `conductores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empresas` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `razonSocial` varchar(50) DEFAULT NULL,
  `rfc` varchar(50) DEFAULT NULL,
  `domicilioFiscal` varchar(200) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEmpresa`),
  UNIQUE KEY `razonSocial` (`razonSocial`),
  UNIQUE KEY `rfc` (`rfc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'mogela','aaaaaaaaaaaaaaa','jgasdgjha','hjgasdga',1);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `estados` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idEstado`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Aguascalientes','dasdasd'),(3,'Campeche','adasd'),(4,'Baja California','planta'),(5,'Chiapas','asdasd'),(6,'Baja California Sur','planta'),(7,'Chihuahua','dadsasd'),(8,'Sonora','asdasd');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licencias`
--

DROP TABLE IF EXISTS `licencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `licencias` (
  `idLicencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(5) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLicencia`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `nombre_2` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licencias`
--

LOCK TABLES `licencias` WRITE;
/*!40000 ALTER TABLE `licencias` DISABLE KEYS */;
INSERT INTO `licencias` VALUES (4,'F','faasfasdasd',1),(7,'C','dasd',1),(8,'J','asdasd',1),(9,'A','kadfkl',1);
/*!40000 ALTER TABLE `licencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movimientos` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idProducto` int(10) unsigned NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `idUsuario` (`idUsuario`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE,
  CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prioridades`
--

DROP TABLE IF EXISTS `prioridades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prioridades` (
  `idPrioridad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPrioridad`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prioridades`
--

LOCK TABLES `prioridades` WRITE;
/*!40000 ALTER TABLE `prioridades` DISABLE KEYS */;
INSERT INTO `prioridades` VALUES (1,'Alta','alta prioridad',1),(6,'normal','kjashdj',1);
/*!40000 ALTER TABLE `prioridades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productos` (
  `idProducto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idCategoria` int(10) unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `minimo` int(10) unsigned NOT NULL,
  `esBasico` tinyint(1) NOT NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=654 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,4,'All White Now','15ml','50000',1,0),(2,4,'Heaven Sent','15ml','50001',1,0);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remolques`
--

DROP TABLE IF EXISTS `remolques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `remolques` (
  `idRemolque` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `placas` varchar(20) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRemolque`),
  UNIQUE KEY `placas` (`placas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remolques`
--

LOCK TABLES `remolques` WRITE;
/*!40000 ALTER TABLE `remolques` DISABLE KEYS */;
INSERT INTO `remolques` VALUES (1,'tolbaa','asddas',1),(2,'pala ','hhhhhhhhhhhh',1);
/*!40000 ALTER TABLE `remolques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (3,'cargaa','hlahsh',1),(4,'maniobra','asdads',1);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (2,'Activo','khgdskjsdfsdasd'),(5,'Inactivo','hhhhhhhh');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sucursales` (
  `idSucursal` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plaza` varchar(30) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  PRIMARY KEY (`idSucursal`),
  UNIQUE KEY `plaza` (`plaza`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,'Dila','Hermosillo'),(2,'Cantabria','Hermosillo'),(3,'coapa','mexico');
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicas`
--

DROP TABLE IF EXISTS `tecnicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tecnicas` (
  `idTecnica` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idSucursal` int(10) unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  PRIMARY KEY (`idTecnica`),
  KEY `idSucursal` (`idSucursal`),
  CONSTRAINT `tecnicas_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicas`
--

LOCK TABLES `tecnicas` WRITE;
/*!40000 ALTER TABLE `tecnicas` DISABLE KEYS */;
INSERT INTO `tecnicas` VALUES (1,1,'Giovana','Flores'),(2,1,'Miriam','Lagarda'),(3,1,'Karla','Ripalda'),(4,2,'Norma','Ramirez'),(5,2,'Mayela','Lagarda'),(6,2,'Adriana','Morales'),(7,3,'gggg','gggg'),(8,3,'asdasdasd','asdasdasd');
/*!40000 ALTER TABLE `tecnicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ubicaciones` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES ('Posición Válida',0,'2019-05-03','16:38:21',2019,'05',5,'-93.207392,18.422148',252209,1,44026,4418119,2,18.422148,-93.207392,0,4,'2019-05-03 21:38:21','2019-05-03 16:38:21',14906100,'2019-05-03 16:38:21',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844505','31-AA-9B','19','',1,'','','',''),('Posición Válida',0,'2019-08-12','10:30:13',2019,'08',1,'-92.980731,17.942039',252208,1,44026,4329851,2,17.942039,-92.980731,0,97,'2019-08-12 15:30:13','2019-08-12 10:30:13',14267200,'2019-08-12 10:30:13',3,'Auto reporte por distancia o tiempo',8,'','3WKDD40X3DF844503','30-AA-9B','15','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),('Posición Válida',0,'2019-08-12','10:23:59',2019,'08',1,'-97.554189,20.660295',336510,1,44026,5063192,2,20.660295,-97.554189,0,95,'2019-08-12 15:23:59','2019-08-12 10:23:59',16800,'2019-08-12 10:23:59',29,'Auto reporte por distancia o tiempo',8,'','3WKDD40X0EF854250','206-EV-1','206','',1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),('Posición Válida',0,'2019-08-12','10:13:09',2019,'08',1,'-92.980061,17.942645',272546,1,44026,5059870,2,17.942645,-92.980061,0,28,'2019-08-12 15:13:09','2019-08-12 10:13:09',5615400,'2019-08-12 10:13:09',7,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4DF845324','005-EX-2','017','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','VILLAHERMOSA-REFORMA'),('Posición Válida',0,'2019-07-26','16:08:05',2019,'07',5,'-92.980938,17.942038',344048,1,44026,5061422,2,17.942038,-92.980938,0,67,'2019-07-26 21:08:05','2019-07-26 16:08:05',829000,'2019-07-26 16:08:05',1,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF855826','304-EV-4','30','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ'),('Posición Válida',0,'2019-08-12','10:34:34',2019,'08',1,'-92.981105,17.941864',336511,1,44026,5106169,2,17.941864,-92.981105,0,110,'2019-08-12 15:34:34','2019-08-12 10:34:34',7620800,'2019-08-12 10:34:34',9,'Auto reporte por distancia o tiempo',8,'','3WKDD40X4EF854249','205-EV-1','22','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','SAN JOSÉ'),('Posición Válida',0,'2019-08-12','10:43:22',2019,'08',1,'-92.98024,17.94252',301691,1,44026,5101058,2,17.94252,-92.98024,0,0,'2019-08-12 15:43:22','2019-08-12 10:43:22',5149528,'2019-08-12 10:43:22',49,'Auto reporte por distancia o tiempo',8,'','3WKDD40XXEF851436','508-EU-7','5','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','VILLAHERMOSA-REFORMA'),('Posición Válida',1,'2019-08-12','10:40:13',2019,'08',1,'-92.980665,17.942077',301692,1,44026,5254697,2,17.942077,-92.980665,0,0,'2019-08-12 15:40:13','2019-08-12 10:40:13',7,'2019-08-12 10:40:13',3,'Auto reporte por distancia o tiempo',8,'','3WKDD40X1EF851437','783-EX-2','14','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),('Posición Válida',0,'2018-02-07','09:12:45',2018,'2',3,'-104.0659,25.26142',301690,1,44026,1415883,2,25.26142,-104.0659,0,0,'2018-02-07 15:12:47','2018-02-07 09:12:45',98388740,'2018-02-07 09:12:47',110,'',1,'','','','','',1,'','','',''),('Posición Válida',0,'2018-01-15','09:24:10',2018,'1',1,'-97.554168,20.660266',344050,1,44026,1400438,2,20.660266,-97.554168,0,0,'2018-01-15 15:24:11','2018-01-15 09:24:10',44673799,'2018-01-15 09:24:11',40,'',6,'','','','','',1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),('Posición Válida',0,'2018-04-23','19:11:05',2018,'4',1,'-92.980662,17.941847',327071,1,44026,3429747,2,17.941847,-92.980662,0,151,'2018-04-24 00:09:09','2018-04-23 19:11:05',13789800,'2018-04-23 19:09:09',140,'',8,'','','','','',1,'TABASCO','CENTRO','RIO VIEJO 1RA. SECCION','PRIVADA SAN JOSÉ'),('Posición Válida',0,'2018-04-15','13:52:02',2018,'4',0,'-97.554234,20.660414',344052,1,44026,826716,2,20.660414,-97.554234,0,0,'2018-04-15 18:52:04','2018-04-15 13:52:02',89468,'2018-04-15 13:52:04',145,'',6,'','','','','',1,'VERACRUZ DE IGNACIO DE LA LLAVE','TIHUATLáN','',''),('Posición Válida',1,'2018-06-05','13:23:06',2018,'6',2,'-101.916468,19.195391',344051,1,44026,1701203,2,19.195391,-101.916468,0,0,'2018-06-05 18:17:41','2018-06-05 13:23:06',148637661,'2018-06-05 13:17:41',115,'',5,'','','','','',1,'MICHOACáN DE OCAMPO','NUEVO URECHO','','SIGLO XXI,1125'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'004-EX-2',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuarios` (
  `idUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idSucursal` int(10) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `permisos` int(10) unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `username` (`username`),
  KEY `idSucursal` (`idSucursal`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'gabrielat','12345678',2,'Gabriela Gricelda','Trujillo Creado',1),(2,1,'duniam','12345678',1,'Dunia','Morales',1),(3,2,'lourdesa','12345678',1,'Lourdes','Archuleta',1),(4,1,'yadirar','12345678',0,'Yadira','Rodriguez',1),(5,1,'berenicev','12345678',0,'Berenice','Vega',1),(6,2,'irman','12345678',0,'Irma','Navarro',1),(7,1,'wicho','$2a$10$vmWztGlSYHdITQ26Zeg7Fe6K1PoViFGhZkA08d2BsCbforV8wrrUi',0,'luis ','vazquez',1),(8,1,'admin','abcd1234',2,'Luis','vazquez',1),(9,3,'javier','$2a$10$Qc8BzDpHMBm4IV57/wIP3udJiCoLJmzQZyxJcgt71CSYQw8No5uni',1,'Javier','Rios',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-20 12:33:15
