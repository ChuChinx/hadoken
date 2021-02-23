-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_hado
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `categoria_status` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `categoria_fechareg` date DEFAULT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'LACTEOS','ACTIVO','2021-02-06'),(2,'JUGOS','ACTIVO','2021-02-08'),(3,'REFRESCO','ACTIVO','2021-02-08'),(4,'CEREAL','ACTIVO','2021-02-08'),(5,'SALSA','ACTIVO','2021-02-08'),(6,'FRUTA','ACTIVO','2021-02-09'),(7,'VERDURA','ACTIVO','2021-02-09'),(8,'huhuh','INACTIVO','2021-02-12');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `cliente_fechareg` date DEFAULT NULL,
  `cliente_status` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_id` int DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `FK_cliente_persona_id` (`persona_id`),
  CONSTRAINT `FK_cliente_persona_id` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'2021-02-12','ACTIVO',2),(2,'2021-02-13','ACTIVO',14),(3,'2021-02-16','ACTIVO',16);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo` (
  `combo_id` int NOT NULL AUTO_INCREMENT,
  `combo_nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `combo_foto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `combo_status` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `combo_precioventa` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`combo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo`
--

LOCK TABLES `combo` WRITE;
/*!40000 ALTER TABLE `combo` DISABLE KEYS */;
INSERT INTO `combo` VALUES (1,'COMBO A','controlador/combo/img/combo_defecto.png','ACTIVO',35.00),(2,'COMBO B','controlador/combo/img/combo_defecto.png','ACTIVO',39.90),(3,'YOSHI','controlador/combo/img/COMB132202122346.jpg','ACTIVO',39.90),(4,'MEGAMAN X','controlador/combo/img/COMB1322021223418.jpg','ACTIVO',29.90),(5,'COMBO Z','controlador/combo/img/COMB1322021223449.jpg','ACTIVO',149.90),(6,'YOSHIXH','controlador/combo/img/COMB1322021214728.PNG','ACTIVO',69.90),(7,'COMBO HADOKEN','controlador/combo/img/combo_defecto.png','ACTIVO',59.90),(8,'COMBO AEA','controlador/combo/img/combo_defecto.png','ACTIVO',19.90),(9,'COMBO YATUSA','controlador/combo/img/combo_defecto.png','ACTIVO',89.90),(10,'COMBO YAPX','controlador/combo/img/combo_defecto.png','ACTIVO',2314.35),(11,'COMBO C','controlador/combo/img/COMB1422021211021.jpg','ACTIVO',124.90),(12,'COMBO MAMERSON','controlador/combo/img/COMB162202118848.PNG','ACTIVO',99.90),(13,'COMBO PRUEBA','controlador/combo/img/combo_defecto.png','ACTIVO',20.00);
/*!40000 ALTER TABLE `combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_combo`
--

DROP TABLE IF EXISTS `detalle_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_combo` (
  `detallecombo_id` int NOT NULL AUTO_INCREMENT,
  `detallecombo_cantidad` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `combo_id` int DEFAULT NULL,
  PRIMARY KEY (`detallecombo_id`),
  KEY `FK_detalle_combo_producto_id` (`producto_id`),
  KEY `FK_detalle_combo_combo_id` (`combo_id`),
  CONSTRAINT `FK_detalle_combo_combo_id` FOREIGN KEY (`combo_id`) REFERENCES `combo` (`combo_id`),
  CONSTRAINT `FK_detalle_combo_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_combo`
--

LOCK TABLES `detalle_combo` WRITE;
/*!40000 ALTER TABLE `detalle_combo` DISABLE KEYS */;
INSERT INTO `detalle_combo` VALUES (1,5,1,6),(2,5,2,6),(3,5,3,6),(4,1,10,6),(5,1,11,6),(6,1,12,6),(7,10,2,12),(8,10,1,12),(9,10,3,12),(10,1,10,12),(11,1,12,12),(12,1,11,12),(13,6,1,1),(14,6,2,1),(15,6,3,1),(16,2,10,1),(17,2,11,1),(18,2,12,1);
/*!40000 ALTER TABLE `detalle_combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ingreso`
--

DROP TABLE IF EXISTS `detalle_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ingreso` (
  `detalleingreso_id` int NOT NULL AUTO_INCREMENT,
  `ingreso_id` int DEFAULT NULL,
  `insumo_id` int DEFAULT NULL,
  `detalleingreso_cantidad` decimal(10,2) DEFAULT NULL,
  `detalleingreso_precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`detalleingreso_id`),
  KEY `FK_detalle_ingreso_ingreso_id` (`ingreso_id`),
  KEY `FK_detalle_ingreso_insumo_id` (`insumo_id`),
  CONSTRAINT `FK_detalle_ingreso_ingreso_id` FOREIGN KEY (`ingreso_id`) REFERENCES `ingreso` (`ingreso_id`),
  CONSTRAINT `FK_detalle_ingreso_insumo_id` FOREIGN KEY (`insumo_id`) REFERENCES `insumo` (`insumo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ingreso`
--

LOCK TABLES `detalle_ingreso` WRITE;
/*!40000 ALTER TABLE `detalle_ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_producto`
--

DROP TABLE IF EXISTS `detalle_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_producto` (
  `detalleproducto_id` int NOT NULL AUTO_INCREMENT,
  `detalleproducto_cantidad` int DEFAULT NULL,
  `insumo_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  PRIMARY KEY (`detalleproducto_id`),
  KEY `FK_detalle_producto_insumo_id` (`insumo_id`),
  KEY `FK_detalle_producto_producto_id` (`producto_id`),
  CONSTRAINT `FK_detalle_producto_insumo_id` FOREIGN KEY (`insumo_id`) REFERENCES `insumo` (`insumo_id`),
  CONSTRAINT `FK_detalle_producto_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_producto`
--

LOCK TABLES `detalle_producto` WRITE;
/*!40000 ALTER TABLE `detalle_producto` DISABLE KEYS */;
INSERT INTO `detalle_producto` VALUES (1,1,1,1),(2,50,2,1),(3,50,3,1),(4,10,4,1);
/*!40000 ALTER TABLE `detalle_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `detalleventa_id` int NOT NULL AUTO_INCREMENT,
  `venta_id` int DEFAULT NULL,
  `combo_id` int DEFAULT NULL,
  `detalleventa_cantidad` decimal(10,2) DEFAULT NULL,
  `detalleventa_precio` decimal(10,2) DEFAULT NULL,
  `detalleventa_descuento` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`detalleventa_id`),
  KEY `FK_detalle_venta_venta_id` (`venta_id`),
  KEY `FK_detalle_venta_combo_id` (`combo_id`),
  CONSTRAINT `FK_detalle_venta_combo_id` FOREIGN KEY (`combo_id`) REFERENCES `combo` (`combo_id`),
  CONSTRAINT `FK_detalle_venta_venta_id` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`venta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso`
--

DROP TABLE IF EXISTS `ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingreso` (
  `ingreso_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `ingreso_ticomprobante` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingreso_seriecomprobante` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingreso_numcomprobante` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingreso_fecha` date DEFAULT NULL,
  `ingreso_total` decimal(10,2) DEFAULT NULL,
  `ingreso_impuesto` decimal(10,2) DEFAULT NULL,
  `ingreso_status` enum('INGRESADO','PENDIENTE') COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingreso_porcentaje` decimal(2,2) DEFAULT NULL,
  PRIMARY KEY (`ingreso_id`),
  KEY `FK_ingreso_proveedor_id` (`proveedor_id`),
  KEY `FK_ingreso_usuario_id` (`usuario_id`),
  CONSTRAINT `FK_ingreso_proveedor_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`),
  CONSTRAINT `FK_ingreso_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso`
--

LOCK TABLES `ingreso` WRITE;
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
INSERT INTO `ingreso` VALUES (1,1,1,'FACTURA','FAC','BB12345X1','2021-02-13',2452.23,0.18,'INGRESADO',NULL),(2,1,1,'FACTURA','001','100','2021-02-22',55.00,5.00,'INGRESADO',0.10),(3,1,1,'FACTURA','001','003','2021-02-22',230.10,35.10,'INGRESADO',0.18),(4,2,1,'FACTURA','1','2','2021-02-22',27.50,2.50,'INGRESADO',0.10);
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `insumo_id` int NOT NULL AUTO_INCREMENT,
  `insumo_nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `insumo_stock` decimal(10,2) DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `unidad_id` int DEFAULT NULL,
  `insumo_foto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `insumo_status` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`insumo_id`),
  KEY `FK_insumo_categoria_id` (`categoria_id`),
  KEY `FK_insumo_unidad_id` (`unidad_id`),
  CONSTRAINT `FK_insumo_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`),
  CONSTRAINT `FK_insumo_unidad_id` FOREIGN KEY (`unidad_id`) REFERENCES `unidad_medida` (`unidad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'ARROZ',5.00,7,6,'controlador/insumo/img/INS922021232015.jpg','ACTIVO'),(2,'PALTA',100.00,7,7,'controlador/insumo/img/INS1022021151325.jpg','ACTIVO'),(3,'PALTAS',50.00,7,7,'controlador/insumo/img/INS92202123178.jpg','ACTIVO'),(4,'INSUMO',60.00,3,5,'controlador/insumo/img/INS922021195639.jpg','ACTIVO'),(5,'COCA COLA',70.00,3,7,'controlador/insumo/img/INS1322021234933.PNG','ACTIVO'),(6,'SALSA',0.00,3,5,'controlador/insumo/img/INS1022021193337.jpg','ACTIVO'),(7,'INSUMO A',0.00,6,7,'controlador/insumo/img/INS1022021193451.jpg','ACTIVO'),(8,'INSUMO D',0.00,1,5,'controlador/insumo/img/insumo_defecto.png','ACTIVO'),(9,'INSUMO C',0.00,6,7,'controlador/insumo/img/insumo_defecto.png','ACTIVO'),(10,'INSUMO B',0.00,2,2,'controlador/insumo/img/insumo_defecto.png','ACTIVO'),(11,'INSUMO F',0.00,6,7,'controlador/insumo/img/insumo_defecto.png','ACTIVO'),(12,'INSUMO E',0.00,6,7,'controlador/insumo/img/insumo_defecto.png','ACTIVO'),(13,'TQTQTQT',0.00,2,2,'controlador/insumo/img/insumo_defecto.png','ACTIVO'),(14,'UKUKUKUKUKU',0.00,2,2,'controlador/insumo/img/insumo_defecto.png','ACTIVO');
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `persona_id` int NOT NULL AUTO_INCREMENT,
  `persona_nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `persona_paterno` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_materno` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_nrodocumento` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_tipodocumento` enum('DNI','RUC','PASAPORTE') COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_sexo` enum('MASCULINO','FEMENINO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_telefono` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_fechareg` date DEFAULT NULL,
  `persona_status` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'ALAN','SALINAS','CAVERO','44058536','DNI','MASCULINO','940812714',NULL,'ACTIVO'),(2,'HENRY','CAVERO','BANCAYAN','1111111111','RUC','MASCULINO','987654321','2021-02-07','ACTIVO'),(3,'MARCO EDUARDO','SALINAS','CAVERO','23232323','DNI','MASCULINO','982721342','2021-02-07','ACTIVO'),(4,'ANTHONY JESUS','SALINAS','CAVERO','28343245','DNI','MASCULINO','999662536','2021-02-07','ACTIVO'),(5,'IUIUITYIT','TYUTYUTY','TKTKTKYJT','5331','DNI','FEMENINO','311','2021-02-07','INACTIVO'),(6,'AEA','MANO','QF','12312','RUC','FEMENINO','89898989','2021-02-07','INACTIVO'),(7,'QWE','QWE','QWE','123123123','DNI','MASCULINO','123','2021-02-07','ACTIVO'),(8,'QWEQWE','ASDASD','ASDASD','1231','DNI','MASCULINO','12312312','2021-02-07','ACTIVO'),(9,'QWE','QWEQWRRQRQRQ','RQWQWEQRR','23123','DNI','MASCULINO','1233213123123','2021-02-07','ACTIVO'),(10,'ASDAQWEQWEWE','QWEQWE','ASD','123','DNI','MASCULINO','123123123123','2021-02-07','ACTIVO'),(11,'ALAN EDGAR','QWE QWEQWRQRRQ','QWEQWE','456456456','DNI','MASCULINO','456','2021-02-07','INACTIVO'),(12,'QWEWQE QWE','QWE QWE','QWE EE','098','DNI','MASCULINO','123','2021-02-07','INACTIVO'),(13,'QWEQWE','WQEQWR','REYEYERY','5464574574','PASAPORTE','FEMENINO','431516161','2021-02-07','INACTIVO'),(14,'KOKRWO','QWEURUHV','EKWQRN','11111111112','DNI','MASCULINO','1234','2021-02-13','ACTIVO'),(15,'LUIS','RAMOS','TORRES','24242424','RUC','MASCULINO','312121231','2021-02-13','ACTIVO'),(16,'LEONARDOX','GARCIAX','SALINAS','24242131','DNI','MASCULINO','98466249','2021-02-16','ACTIVO');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `producto_nombre` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `producto_foto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `producto_status` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'ACEVICHADOX','controlador/producto/img/PRO1722021125120.jpg','ACTIVO'),(2,'FURAISS','controlador/producto/img/PRO1722021111312.jpg','ACTIVO'),(3,'AAAA','controlador/producto/img/producto_defecto.png','ACTIVO'),(4,'BBBB','controlador/producto/img/producto_defecto.png','ACTIVO'),(5,'EW','controlador/producto/img/PRO132202115298.jpg','ACTIVO'),(6,'YYYY','controlador/producto/img/PRO1322021152919.jpg','ACTIVO'),(7,'DDDD','controlador/producto/img/PRO1322021133627.jpg','ACTIVO'),(8,'EEEE','controlador/producto/img/producto_defecto.png','ACTIVO'),(9,'FFFF','controlador/producto/img/producto_defecto.png','ACTIVO'),(10,'PRODUCTO A','controlador/producto/img/PRO1322021151712.jpg','ACTIVO'),(11,'PRODUCTO M','controlador/producto/img/PRO1322021235728.jpg','ACTIVO'),(12,'PRODUCTO B','controlador/producto/img/producto_defecto.png','ACTIVO');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_numcontacto` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_contacto` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proveedor_status` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_id` int DEFAULT NULL,
  `proveedor_razonsocial` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  KEY `FK_proveedor_persona_id` (`persona_id`),
  CONSTRAINT `FK_proveedor_persona_id` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'940812241','CHELEMENTX','ACTIVO',2,'SOCIEDADPC S.A.'),(2,'928475','SR TORRES','ACTIVO',15,'LUISAEAMANO');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rol_status` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `rol_fechareg` date DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ADMINISTRADOR','ACTIVO',NULL),(2,'VENDEDOR','ACTIVO','2021-02-06'),(3,'CONSULTANTE','ACTIVO','2021-02-06'),(4,'REGISTRADOR','ACTIVO','2021-02-06'),(5,'CAJERO','ACTIVO','2021-02-06'),(6,'asd','INACTIVO','2021-02-06'),(7,'asdf','INACTIVO','2021-02-06'),(8,'qweqweqwe','INACTIVO','2021-02-06'),(9,'qwer','INACTIVO','2021-02-06'),(10,'zxc','INACTIVO','2021-02-06'),(11,'zxcv','INACTIVO','2021-02-06'),(12,'aea','INACTIVO','2021-02-07'),(13,'asdasdas','INACTIVO','2021-02-07'),(14,'ROL_1','ACTIVO','2021-02-08'),(15,'ROL_2','ACTIVO','2021-02-13'),(16,'ROL_VEND','ACTIVO','2021-02-15');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medida` (
  `unidad_id` int NOT NULL AUTO_INCREMENT,
  `unidad_nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad_status` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidad_fechareg` date DEFAULT NULL,
  `unidad_abreviatura` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`unidad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (1,'KILOGRAMO','INACTIVO','2021-02-09','Kg'),(2,'MILILITROS','ACTIVO','2021-02-09','ml'),(3,'MILILITROS2','INACTIVO','2021-02-09','ml2'),(4,'MILIGRAMO','INACTIVO','2021-02-09','mg'),(5,'LITRO','ACTIVO','2021-02-09','l'),(6,'GRAMO','ACTIVO','2021-02-09','g'),(7,'UNIDAD','ACTIVO','2021-02-09','und'),(8,'ASAS','INACTIVO','2021-02-12','AS');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_password` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_email` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_intento` int DEFAULT NULL,
  `usuario_status` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_rol` int DEFAULT NULL,
  `usuario_imagen` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `persona_id` int DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `FK_usuario_id_rol` (`id_rol`),
  KEY `FK_usuario_persona_id` (`persona_id`),
  CONSTRAINT `FK_usuario_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `FK_usuario_persona_id` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','$2y$10$M4WGv379GJ4uqWk.Ddq6Be7tsO4H0mDrze/r9VByWA44xuP07zRae','alansalinasc@gmail.com',1,'ACTIVO',1,'controlador/usuario/img/IMG1522021225338.jpg',1),(2,'asalinas','$2y$10$Uv9avp0LTwoifiUJ8PPZ5Oz7ssd0/3KyR1.9yTCJ3yJG7.ktjTwLW','asd@gmail.com',1,'ACTIVO',1,'controlador/usuario/img/IMG82202194240.jpg',1),(3,'asalinas','$2y$10$eH01tPeO.andjZ9vn/awjeVEHfGGXakD0Sc2KYO8p6ZbIR8vkGOFO','asd@gmail.com',1,'INACTIVO',1,'controlador/usuario/img/IMG822021193745.jpg',1),(4,'asalinas2','$2y$10$Gz5.2HI3q7ISbCNk2fVPbO3mBTkQ6Y4chxIWZd9pHE/tpo8xBRY/C','qqq@gmail.com',1,'ACTIVO',4,'controlador/usuario/img/IMG822021105438.jpg',1),(5,'qweqew','$2y$10$eTQKjPwj8TsYKI9x6kcHMeddh7653lO5ouZPXS3HjErk.oI5oggQS','qweqwe@hotmail.com',1,'INACTIVO',2,'controlador/usuario/img/IMG822021193650.jpg',2),(6,'tyutyu','$2y$10$fU8l/MCyeZbYaliRqI5a2eBfP0SpC.3nDyi0ZcfdlooqCC9ivE5D.','yui@gmail.com',1,'ACTIVO',5,'controlador/usuario/img/IMG822021193058.jpg',2),(7,'lklkkl','$2y$10$KHIBLRIa1AUyixbrCYfWZOlq1qIslkgwApZcjV6I2ZYVdQ151lJi.','popo78787@gmail.com',1,'ACTIVO',14,'controlador/usuario/img/IMG822021192842.jpg',7),(8,'siscon','$2y$10$2FMejwebaFMTZR7dv9OFQu/Y2VcWGd.VnaNzhr.XHqPRmHxTl94di','aln_druida@hotmail.com',1,'ACTIVO',1,'controlador/usuario/img/IMG1822021221814.jpg',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `venta_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `venta_ticomprobante` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `venta_seriecomprobante` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `venta_numcomprobante` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `venta_fecha` date DEFAULT NULL,
  `venta_impuesto` decimal(10,2) DEFAULT NULL,
  `venta_total` decimal(10,2) DEFAULT NULL,
  `venta_status` enum('PAGADA','ANULADA','PENDIENTE') COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `FK_venta_cliente_id` (`cliente_id`),
  KEY `FK_venta_usuario_id` (`usuario_id`),
  CONSTRAINT `FK_venta_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  CONSTRAINT `FK_venta_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_hado'
--

--
-- Dumping routines for database 'bd_hado'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_DATOS_PERSONA_PROFILE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_DATOS_PERSONA_PROFILE`(IN ID INT, IN NOMBRE VARCHAR(100), IN PATERNO VARCHAR(50), IN MATERNO VARCHAR(50), IN NUMERODOCUMENTO VARCHAR(50), 
IN TIPODOCUMENTO VARCHAR(20), IN SEXO VARCHAR(10), IN TELEFONO VARCHAR(20))
BEGIN
	DECLARE cantidad INT;
    DECLARE IDPERSONA INT;
    DECLARE documentoactual INT;
    SET @IDPERSONA:=(SELECT persona_id FROM usuario WHERE usuario_id=ID);
    SET @documentoactual:=(SELECT persona_nrodocumento FROM persona WHERE persona_id=@IDPERSONA);
    IF @documentoactual=NUMERODOCUMENTO THEN
		UPDATE persona SET 
        persona_nombre=NOMBRE, 
        persona_paterno=PATERNO, 
        persona_materno=MATERNO, 
        persona_tipodocumento=TIPODOCUMENTO, 
        persona_sexo=SEXO, 
        persona_telefono=TELEFONO
        WHERE persona_id=@IDPERSONA;
        SELECT 1;
    ELSE
		SET @cantidad:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento=NUMERODOCUMENTO);
		IF @cantidad = 0 THEN
			UPDATE persona SET 
			persona_nombre=NOMBRE, 
			persona_paterno=PATERNO, 
			persona_materno=MATERNO, 
			persona_nrodocumento=NUMERODOCUMENTO, 
			persona_tipodocumento=TIPODOCUMENTO, 
			persona_sexo=SEXO, 
			persona_telefono=TELEFONO
			WHERE persona_id=@IDPERSONA;
			SELECT 1;
		ELSE
			SELECT 2;
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_CATEGORIA`(IN ID INT, IN CATEGORIAACTUAL VARCHAR(50), IN CATEGORIANUEVO VARCHAR(50), IN STATUS VARCHAR(50))
BEGIN
	DECLARE cantidad INT;
    IF CATEGORIAACTUAL = CATEGORIANUEVO THEN
		UPDATE categoria SET
        categoria_status = STATUS
        WHERE categoria_id = ID;
        SELECT 1;
    ELSE 
		SET cantidad:=(SELECT COUNT(*) FROM categoria WHERE categoria_nombre=CATEGORIANUEVO);
        IF cantidad = 0 THEN
			UPDATE categoria SET
			categoria_nombre = CATEGORIANUEVO,
            categoria_status = STATUS
			WHERE categoria_id = ID;
			SELECT 1;
		ELSE
			SELECT 2;
		END IF;
    END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_COMBO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_COMBO`(IN IDCOMBO INT, IN COMBO VARCHAR(255), IN PRECIOVENTA DECIMAL(10,2), IN ESTATUS VARCHAR(15))
BEGIN
	DECLARE cantidad INT;
    DECLARE comboactual VARCHAR(255);
    SET @comboactual:=(SELECT combo_nombre FROM combo WHERE combo_id=IDCOMBO);
    IF @comboactual=COMBO THEN
		UPDATE combo SET
        combo_precioventa=PRECIOVENTA, 
        combo_status=ESTATUS
        WHERE combo_id=IDCOMBO;
        SELECT 1;
    ELSE
		SET @cantidad:=(SELECT COUNT(*) FROM combo WHERE combo_nombre=COMBO);
        IF @cantidad = 0 THEN
			UPDATE combo SET
            combo_nombre=COMBO,
            combo_precioventa=PRECIOVENTA, 
			combo_status=ESTATUS
			WHERE combo_id=IDCOMBO;
            SELECT 1;
		ELSE
			SELECT 2;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_COMBO_FOTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_COMBO_FOTO`(IN ID INT, IN FOTO VARCHAR(250))
BEGIN
	UPDATE combo 
    SET combo_foto=FOTO WHERE combo_id=ID;
    SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_INSUMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_INSUMO`(IN IDINSUMO INT, IN INSUMO VARCHAR(255), IN CATEGORIA INT, IN UNIDAD INT, IN ESTATUS VARCHAR(15))
BEGIN
	DECLARE cantidad INT;
    DECLARE insumoactual VARCHAR(255);
    SET @insumoactual:=(SELECT insumo_nombre FROM insumo WHERE insumo_id=IDINSUMO);
    IF @insumoactual=INSUMO THEN
		UPDATE insumo SET
        categoria_id=CATEGORIA,
        unidad_id=UNIDAD,
        insumo_status=ESTATUS
        WHERE insumo_id=IDINSUMO;
        SELECT 1;
    ELSE
		SET @cantidad:=(SELECT COUNT(*) FROM insumo WHERE insumo_nombre=INSUMO);
        IF @cantidad = 0 THEN
			UPDATE insumo SET
            insumo_nombre=INSUMO,
            categoria_id=CATEGORIA,
			unidad_id=UNIDAD,
			insumo_status=ESTATUS
			WHERE insumo_id=IDINSUMO;
            SELECT 1;
		ELSE
			SELECT 2;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_INSUMO_FOTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_INSUMO_FOTO`(IN ID INT, IN FOTO VARCHAR(250))
BEGIN
	UPDATE insumo 
    SET insumo_foto=FOTO WHERE insumo_id=ID;
    SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_PERSONA`(IN IDPERSONA INT, IN NOMBRE VARCHAR(100), IN PATERNO VARCHAR(50), IN MATERNO VARCHAR(50), IN NUMERODOCUMENTOA VARCHAR(20), 
IN NUMERODOCUMENTON VARCHAR(20), IN TIPODOCUMENTO VARCHAR(20), IN SEXO VARCHAR(10), IN TELEFONO VARCHAR(20), IN STATUS VARCHAR(20))
BEGIN
	DECLARE cantidad INT;
    IF NUMERODOCUMENTOA = NUMERODOCUMENTON THEN
		UPDATE persona SET
        persona_nombre = NOMBRE,
        persona_paterno = PATERNO,
        persona_materno = MATERNO,
        persona_tipodocumento = TIPODOCUMENTO,
        persona_sexo = SEXO,
        persona_telefono = TELEFONO,
        persona_status = STATUS
        WHERE persona_id = IDPERSONA;
        SELECT 1;
    ELSE 
		SET @cantidad:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento=NUMERODOCUMENTON);
        IF @cantidad = 0 THEN
			UPDATE persona SET
			persona_nombre = NOMBRE,
			persona_paterno = PATERNO,
			persona_materno = MATERNO,
            persona_nrodocumento = NUMERODOCUMENTON,
			persona_tipodocumento = TIPODOCUMENTO,
			persona_sexo = SEXO,
			persona_telefono = TELEFONO,
			persona_status = STATUS
			WHERE persona_id = IDPERSONA;
			SELECT 1;
		ELSE
			SELECT 2;
		END IF;
    END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_PRODUCTO`(IN IDPRODUCTO INT, IN PRODUCTO VARCHAR(255), IN ESTATUS VARCHAR(15))
BEGIN
	DECLARE cantidad INT;
    DECLARE productoactual VARCHAR(255);
    SET @productoactual:=(SELECT producto_nombre FROM producto WHERE producto_id=IDPRODUCTO);
    IF @productoactual=PRODUCTO THEN
		UPDATE producto SET
        producto_status=ESTATUS
        WHERE producto_id=IDPRODUCTO;
        SELECT 1;
    ELSE
		SET @cantidad:=(SELECT COUNT(*) FROM producto WHERE producto_nombre=PRODUCTO);
        IF @cantidad = 0 THEN
			UPDATE producto SET
            producto_nombre=PRODUCTO,
            producto_status=ESTATUS
			WHERE producto_id=IDPRODUCTO;
            SELECT 1;
		ELSE
			SELECT 2;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_PRODUCTO_FOTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_PRODUCTO_FOTO`(IN ID INT, IN FOTO VARCHAR(250))
BEGIN
	UPDATE producto 
    SET producto_foto=FOTO WHERE producto_id=ID;
    SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_ROL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_ROL`(IN ID INT, IN ROLACTUAL VARCHAR(50), IN ROLNUEVO VARCHAR(50), IN STATUS VARCHAR(50))
BEGIN
	DECLARE cantidad INT;
    IF ROLACTUAL = ROLNUEVO THEN
		UPDATE rol SET
        rol_status = STATUS
        WHERE id_rol = ID;
        SELECT 1;
    ELSE 
		SET cantidad:=(SELECT COUNT(*) FROM rol WHERE rol_nombre=ROLNUEVO);
        IF cantidad = 0 THEN
			UPDATE rol SET
			rol_nombre = ROLNUEVO,
            rol_status = STATUS
			WHERE id_rol = ID;
			SELECT 1;
		ELSE
			SELECT 2;
		END IF;
    END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_UNIDADMEDIDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_UNIDADMEDIDA`(IN ID INT, IN UNIDADACTUAL VARCHAR(100), IN UNIDADNUEVO VARCHAR(100), IN ABREVIATURA VARCHAR(5), IN ESTATUS VARCHAR(50))
BEGIN
	DECLARE cantidad INT;
    IF UNIDADACTUAL = UNIDADNUEVO THEN
		UPDATE unidad_medida SET
        unidad_abreviatura = ABREVIATURA,
        unidad_status = ESTATUS
        WHERE unidad_id = ID;
        SELECT 1;
    ELSE 
		SET @cantidad:=(SELECT COUNT(*) FROM unidad_medida WHERE unidad_nombre=UNIDADNUEVO);
        IF @cantidad = 0 THEN
			UPDATE unidad_medida SET
			unidad_nombre = UNIDADNUEVO,
            unidad_abreviatura = ABREVIATURA,
			unidad_status = ESTATUS
            WHERE unidad_id = ID;
			SELECT 1;
		ELSE
			SELECT 2;
		END IF;
    END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_USUARIO`(IN ID INT, IN IDPERSONA INT, IN EMAILNUEVO VARCHAR(255), IN IDROL INT, IN ESTATUS VARCHAR(10))
BEGIN
	DECLARE cantidad INT;
    DECLARE emailactual VARCHAR(50);
    SET @emailactual:=(SELECT usuario_email FROM usuario WHERE usuario_id=ID);
    IF @emailactual = EMAILNUEVO THEN
		UPDATE usuario SET
        persona_id = IDPERSONA,
        id_rol = IDROL,
        usuario_status = ESTATUS
        WHERE usuario_id = ID;
        SELECT 1;
    ELSE 
		SET @cantidad:=(SELECT COUNT(*) FROM usuario WHERE usuario_email=EMAILNUEVO);
        IF @cantidad = 0 THEN
			UPDATE usuario SET
			persona_id = IDPERSONA,
			id_rol = IDROL,
			usuario_status = ESTATUS,
            usuario_email = EMAILNUEVO
			WHERE usuario_id = ID;
			SELECT 1;
		ELSE
			SELECT 2;
		END IF;
    END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_USUARIO_FOTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_USUARIO_FOTO`(IN ID INT, IN FOTO VARCHAR(250))
BEGIN
	UPDATE usuario 
    SET usuario_imagen=FOTO WHERE usuario_id=ID;
    SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CATEGORIA`()
SELECT c.categoria_id, c.categoria_nombre, c.categoria_fechareg, c.categoria_status FROM categoria as c ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CLIENTE`()
SELECT concat_ws(' ', p.persona_nombre, p.persona_paterno, p.persona_materno) as persona, p.persona_nrodocumento, 
p.persona_tipodocumento, p.persona_sexo, p.persona_telefono, p.persona_id, c.cliente_status, c.cliente_fechareg, 
c.cliente_id 
FROM cliente as c
INNER JOIN persona as p ON c.persona_id=p.persona_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO`()
SELECT combo_id, combo_nombre, combo_precioventa, combo_foto, combo_status
FROM combo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_ADD`()
SELECT c.combo_id, c.combo_nombre, c.combo_foto, c.combo_status
FROM combo as c WHERE c.combo_status='ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_CATEGORIA`()
SELECT categoria_id, categoria_nombre FROM categoria WHERE categoria_status='ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_INSUMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_INSUMO`()
SELECT insumo_id, insumo_nombre FROM insumo WHERE insumo_status='ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PERSONA`()
SELECT persona.persona_id, CONCAT_WS(' ', persona.persona_nombre, persona_paterno, persona_materno) FROM persona WHERE persona_status='ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PRODUCTO`()
SELECT producto_id, producto_nombre FROM producto WHERE producto_status='ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PROVEEDOR`()
SELECT p.proveedor_id, p.proveedor_razonsocial FROM proveedor AS p
    WHERE p.proveedor_status='ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_ROL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_ROL`()
SELECT id_rol, rol_nombre FROM rol WHERE rol_status='ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_UNIDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_UNIDAD`()
SELECT unidad_id, unidad_nombre FROM unidad_medida WHERE unidad_status='ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLEPROD_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DETALLEPROD_PRODUCTO`()
SELECT d.detalleproducto_id, d.producto_id, p.producto_nombre, p.producto_foto FROM detalle_producto as d
INNER JOIN producto as p ON d.producto_id=p.producto_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_INGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_INGRESO`(IN INICIO DATE, IN FIN DATE)
SELECT i.ingreso_id, i.proveedor_id, i.usuario_id, i.ingreso_ticomprobante, i.ingreso_seriecomprobante, i.ingreso_numcomprobante, i.ingreso_fecha,
i.ingreso_total, i.ingreso_impuesto, i.ingreso_status, u.usuario_nombre, CONCAT_WS(' ', pe.persona_nombre, pe.persona_paterno, pe.persona_materno) as proveedor
FROM ingreso as i
INNER JOIN usuario as u ON i.usuario_id=u.usuario_id
INNER JOIN proveedor as p ON i.proveedor_id=p.proveedor_id
INNER JOIN persona as pe ON p.persona_id=pe.persona_id
WHERE i.ingreso_fecha BETWEEN INICIO AND FIN ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_INSUMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_INSUMO`()
SELECT i.insumo_id, i.insumo_nombre, i.insumo_stock, i.categoria_id, i.unidad_id, i.insumo_foto, i.insumo_status, u.unidad_nombre, c.categoria_nombre
FROM insumo as i
INNER JOIN unidad_medida as u ON i.unidad_id = u.unidad_id
INNER JOIN categoria as c ON i.categoria_id = c.categoria_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_INSUMO_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_INSUMO_ADD`()
SELECT i.insumo_id, i.insumo_nombre, i.insumo_stock, i.unidad_id, u.unidad_nombre, u.unidad_abreviatura
FROM insumo as i
INNER JOIN unidad_medida as u ON i.unidad_id = u.unidad_id
WHERE i.insumo_status='ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_INSUMO_DETALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_INSUMO_DETALLE`(IN ID INT)
SELECT d.producto_id, i.insumo_nombre, d.detalleproducto_cantidad, u.unidad_abreviatura FROM detalle_producto as d
	INNER JOIN insumo as i ON d.insumo_id=i.insumo_id
	INNER JOIN unidad_medida as u ON i.unidad_id=u.unidad_id
    WHERE d.producto_id=ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PERSONA`()
SELECT CONCAT_WS(' ', persona_nombre, persona_paterno, persona_materno) as persona, persona_id, persona_nombre, persona_paterno, persona_materno, 
persona_nrodocumento, persona_tipodocumento, persona_sexo, persona_telefono, persona_status FROM persona ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PRODUCTO`()
SELECT p.producto_id, p.producto_nombre, p.producto_foto, p.producto_status
FROM producto as p ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_PRODUCTO_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PRODUCTO_ADD`()
SELECT p.producto_id, p.producto_nombre, p.producto_foto, p.producto_status
FROM producto as p WHERE p.producto_status='ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_PRODUCTO_DETALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PRODUCTO_DETALLE`(IN ID INT)
SELECT d.combo_id, p.producto_nombre, d.detallecombo_cantidad FROM detalle_combo as d
	INNER JOIN producto as p ON d.producto_id=p.producto_id
    WHERE d.combo_id=ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PROVEEDOR`()
SELECT concat_ws(' ', p.persona_nombre, p.persona_paterno, p.persona_materno) as persona, p.persona_nrodocumento, 
	p.persona_tipodocumento, pr.proveedor_razonsocial, p.persona_telefono, p.persona_id, pr.proveedor_numcontacto, pr.proveedor_contacto, pr.persona_id,
    pr.proveedor_id, pr.proveedor_status
	FROM proveedor as pr
	INNER JOIN persona as p ON pr.persona_id=p.persona_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_ROL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ROL`()
SELECT * FROM rol ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_UNIDADMEDIDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_UNIDADMEDIDA`()
SELECT u.unidad_id, u.unidad_nombre, u.unidad_abreviatura, u.unidad_fechareg, u.unidad_status FROM unidad_medida as u ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO`()
SELECT u.usuario_id, u.usuario_nombre, u.usuario_email, u.usuario_status, u.usuario_imagen, u.id_rol,
u.persona_id, r.rol_nombre, CONCAT_WS(' ', p.persona_nombre, p.persona_paterno, p.persona_materno) as persona 
FROM usuario as u
INNER JOIN rol as r ON  u.id_rol=r.id_rol
LEFT JOIN persona as p ON u.persona_id=p.persona_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MODIFICAR_ESTATUS_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_CLIENTE`(IN IDCLIENTE INT, IN ESTATUS VARCHAR(15))
UPDATE cliente SET cliente_status=ESTATUS WHERE cliente_id=IDCLIENTE ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MODIFICAR_ESTATUS_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_ESTATUS_PROVEEDOR`(IN IDPROVEEDOR INT, IN ESTATUS VARCHAR(15))
UPDATE proveedor SET proveedor_status=ESTATUS WHERE proveedor_id=IDPROVEEDOR ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MODIFICAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MODIFICAR_PROVEEDOR`(IN IDPROVEEDOR INT, IN RAZONSOCIAL VARCHAR(255), IN NOMCONTACTO VARCHAR(255), IN NUMCONTACTO VARCHAR(15))
UPDATE proveedor SET proveedor_razonsocial=RAZONSOCIAL, proveedor_contacto=NOMCONTACTO, proveedor_numcontacto=NUMCONTACTO
    WHERE proveedor_id=IDPROVEEDOR ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CATEGORIA`(IN CATEGORIA VARCHAR(50))
BEGIN
	DECLARE cantidad INT;
    SET @cantidad:=(SELECT COUNT(*) FROM categoria WHERE categoria_nombre=CATEGORIA);
    IF @cantidad = 0 THEN
		INSERT INTO categoria(categoria_nombre, categoria_fechareg, categoria_status) VALUES (CATEGORIA, CURDATE(), 'ACTIVO');
        SELECT 1;
	ELSE
		SELECT 2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CLIENTE`(IN NOMBRE VARCHAR(100), IN PATERNO VARCHAR(50), IN MATERNO VARCHAR(50), IN NUMERODOCUMENTO VARCHAR(20), 
IN TIPODOCUMENTO VARCHAR(20), IN SEXO VARCHAR(10), IN TELEFONO VARCHAR(20))
BEGIN
	DECLARE cantidad INT;
    SET @cantidad:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento=NUMERODOCUMENTO);
    IF @cantidad = 0 THEN
		INSERT INTO persona(persona_nombre, persona_paterno, persona_materno, persona_nrodocumento, persona_tipodocumento, persona_sexo, persona_telefono,
        persona_fechareg, persona_status) VALUES (NOMBRE, PATERNO, MATERNO, NUMERODOCUMENTO, TIPODOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO');
        INSERT INTO cliente (cliente_fechareg, cliente_status, persona_id) VALUES (CURDATE(), 'ACTIVO', LAST_INSERT_ID());
        SELECT 1;
	ELSE
		SELECT 2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_COMBO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_COMBO`(IN COMBO VARCHAR(255), IN PRECIOVENTA DECIMAL(10,2), IN RUTA VARCHAR(255))
BEGIN
	DECLARE cantidad INT;
    SET @cantidad:=(SELECT COUNT(*) FROM combo WHERE combo_nombre=COMBO);
    IF @cantidad=0 THEN
		INSERT INTO combo(combo_nombre, combo_precioventa, combo_foto, combo_status) 
        VALUES (COMBO, PRECIOVENTA, RUTA, 'ACTIVO');
        SELECT 1;
    ELSE
		SELECT 2;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_COMBO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DETALLE_COMBO`(IN IDCOMB INT)
BEGIN
		SELECT IDCOMB;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_INSUMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DETALLE_INSUMO`(IN ID INT, IN IDINSUMO INT, IN CANTIDAD INT)
INSERT INTO detalle_producto (producto_id, insumo_id, detalleproducto_cantidad) 
    VALUES (ID, IDINSUMO, CANTIDAD) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DETALLE_PRODUCTO`(IN IDPRO INT)
BEGIN
		/*INSERT INTO detalle_producto(producto_id) VALUES (IDPRO);*/
        /*SELECT LAST_INSERT_ID();*/
        SELECT IDPRO;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_PRODUCTO_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DETALLE_PRODUCTO_ADD`(IN ID INT, IN IDPRODUCTO INT, IN CANTIDAD INT)
INSERT INTO detalle_combo (combo_id, producto_id, detallecombo_cantidad) 
    VALUES (ID, IDPRODUCTO, CANTIDAD) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_INGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_INGRESO`(IN IDPROVEEDOR INT, IN IDUSUARIO INT, IN TIPO VARCHAR(50), IN SERIE VARCHAR(20), IN NUMCOMPROBANTE VARCHAR(20), 
IN TOTAL DECIMAL(10,2), IN IMPUESTO DECIMAL(10,2), IN PORCENTAJE DECIMAL(2,2))
BEGIN /*begin end porq voy a retornar datos*/
		INSERT INTO ingreso (proveedor_id, usuario_id, ingreso_ticomprobante, ingreso_seriecomprobante, ingreso_numcomprobante, ingreso_fecha, ingreso_total, 
							ingreso_impuesto, ingreso_status, ingreso_porcentaje)
		VALUES (IDPROVEEDOR, IDUSUARIO, TIPO, SERIE, NUMCOMPROBANTE, curdate(), TOTAL, IMPUESTO, 'INGRESADO', PORCENTAJE);
		SELECT LAST_INSERT_ID();
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_INSUMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_INSUMO`(IN INSUMO VARCHAR(255), IN CATEGORIA INT, IN UNIDAD INT, IN RUTA VARCHAR(255))
BEGIN
	DECLARE cantidad INT;
    SET @cantidad:=(SELECT COUNT(*) FROM insumo WHERE insumo_nombre=INSUMO);
    IF @cantidad=0 THEN
		INSERT INTO insumo(insumo_nombre, insumo_stock, categoria_id, unidad_id, insumo_foto, insumo_status) 
        VALUES (INSUMO, 0, CATEGORIA, UNIDAD, RUTA, 'ACTIVO');
        SELECT 1;
    ELSE
		SELECT 2;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PERSONA`(IN NOMBRE VARCHAR(100), IN PATERNO VARCHAR(50), IN MATERNO VARCHAR(50), IN NUMERODOCUMENTO VARCHAR(20), 
IN TIPODOCUMENTO VARCHAR(20), IN SEXO VARCHAR(10), IN TELEFONO VARCHAR(20))
BEGIN
	DECLARE cantidad INT;
    SET @cantidad:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento=NUMERODOCUMENTO);
    IF @cantidad = 0 THEN
		INSERT INTO persona(persona_nombre, persona_paterno, persona_materno, persona_nrodocumento, persona_tipodocumento, persona_sexo, persona_telefono,
        persona_fechareg, persona_status) VALUES (NOMBRE, PATERNO, MATERNO, NUMERODOCUMENTO, TIPODOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO');
        SELECT 1;
	ELSE
		SELECT 2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PRODUCTO`(IN PRODUCTO VARCHAR(255), IN RUTA VARCHAR(255))
BEGIN
	DECLARE cantidad INT;
    SET @cantidad:=(SELECT COUNT(*) FROM producto WHERE producto_nombre=PRODUCTO);
    IF @cantidad=0 THEN
		INSERT INTO producto(producto_nombre, producto_foto, producto_status) 
        VALUES (PRODUCTO, RUTA, 'ACTIVO');
        SELECT 1;
    ELSE
		SELECT 2;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROVEEDOR`(IN NOMBRE VARCHAR(100), IN PATERNO VARCHAR(50), IN MATERNO VARCHAR(50), IN NUMERODOCUMENTO VARCHAR(20), 
IN TIPODOCUMENTO VARCHAR(20), IN SEXO VARCHAR(10), IN TELEFONO VARCHAR(20), IN RAZONSOCIAL VARCHAR(255), IN NOMCONTACTO VARCHAR(255), IN NUMCONTACTO VARCHAR(15))
BEGIN
	DECLARE cantidad INT;
    SET @cantidad:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento=NUMERODOCUMENTO AND persona_tipodocumento='RUC');
    IF @cantidad = 0 THEN
		INSERT INTO persona(persona_nombre, persona_paterno, persona_materno, persona_nrodocumento, persona_tipodocumento, persona_sexo, persona_telefono,
        persona_fechareg, persona_status) VALUES (NOMBRE, PATERNO, MATERNO, NUMERODOCUMENTO, TIPODOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO');
        INSERT INTO proveedor (persona_id, proveedor_razonsocial, proveedor_contacto, proveedor_numcontacto, proveedor_status) 
        VALUES (last_insert_id(), RAZONSOCIAL, NOMCONTACTO, NUMCONTACTO, 'ACTIVO');
        SELECT 1;
	ELSE
		SELECT 2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ROL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ROL`(IN ROL VARCHAR(50))
BEGIN
	DECLARE cantidad INT;
    SET @cantidad:=(SELECT COUNT(*) FROM rol WHERE rol_nombre=ROL);
    IF @cantidad = 0 THEN
		INSERT INTO rol(rol_nombre, rol_fechareg, rol_status) VALUES (ROL, CURDATE(), 'ACTIVO');
        SELECT 1;
	ELSE
		SELECT 2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_UNIDADMEDIDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_UNIDADMEDIDA`(IN UNIDAD VARCHAR(100), IN ABREVIATURA VARCHAR(5))
BEGIN
	DECLARE cantidad INT;
    SET @cantidad:=(SELECT COUNT(*) FROM unidad_medida WHERE unidad_nombre=UNIDAD);
    IF @cantidad = 0 THEN
		INSERT INTO unidad_medida(unidad_nombre, unidad_fechareg, unidad_status, unidad_abreviatura) VALUES (UNIDAD, CURDATE(), 'ACTIVO', ABREVIATURA);
        SELECT 1;
	ELSE
		SELECT 2;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_USUARIO`(IN USUARIO VARCHAR(20), IN PASS VARCHAR(250), IN IDPERSONA INT, IN EMAIL VARCHAR(250),
IN IDROL INT, IN RUTA VARCHAR(250))
BEGIN
	DECLARE cantidad INT;
    SET @cantidad:=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre=USUARIO OR usuario_email=EMAIL);
    IF @cantidad=0 THEN
		INSERT INTO usuario(usuario_nombre, usuario_password, persona_id, usuario_email, id_rol, usuario_imagen, usuario_intento,
		usuario_status) VALUES (USUARIO, PASS, IDPERSONA, EMAIL, IDROL, RUTA, 1, 'ACTIVO');
        SELECT 1;
    ELSE
		SELECT 2;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRAER_DATOS_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRAER_DATOS_USUARIO`(IN ID INT)
SELECT u.usuario_id, u.usuario_nombre, u.usuario_password, u.usuario_email, u.usuario_intento, u.usuario_status, u.id_rol, r.rol_nombre,
p.persona_nombre, p.persona_paterno, p.persona_materno, p.persona_nrodocumento, p.persona_tipodocumento, p.persona_sexo, p.persona_telefono, 
p.persona_fechareg, u.usuario_imagen 
FROM usuario as u
INNER JOIN rol as r ON  u.id_rol=r.id_rol
INNER JOIN persona as p ON u.persona_id=p.persona_id
WHERE u.usuario_id=ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRAER_STOCK_INSUMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRAER_STOCK_INSUMO`(IN ID INT)
SELECT insumo_id, insumo_stock  FROM insumo WHERE insumo_id=ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRAER_UNIDADMEDIDA_INSUMO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRAER_UNIDADMEDIDA_INSUMO`(IN ID INT)
SELECT i.insumo_id, u.unidad_abreviatura FROM insumo as i
INNER JOIN unidad_medida as u ON i.unidad_id=u.unidad_id
WHERE insumo_id=ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VERIFICAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_USUARIO`(IN USUARIO VARCHAR(20))
SELECT * FROM usuario WHERE usuario_nombre=USUARIO ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-23  0:11:38
