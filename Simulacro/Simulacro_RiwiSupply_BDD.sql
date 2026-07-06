-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: riwisupply
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.25-MariaDB

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
-- Table structure for table `bodegas`
--

DROP TABLE IF EXISTS `bodegas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodegas` (
  `id_bodega` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_bodega` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `direccion_bodega` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_bodega`),
  KEY `fk_bodegas_ciudad` (`id_ciudad`),
  CONSTRAINT `fk_bodegas_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodegas`
--

LOCK TABLES `bodegas` WRITE;
/*!40000 ALTER TABLE `bodegas` DISABLE KEYS */;
INSERT INTO `bodegas` VALUES (1,'bodega central bogotá',1,'carrera 30 #15-40'),(2,'bodega norte barranquilla',2,'calle 80 # 43-20'),(3,'bodega sur-cali',5,'av. americas #5-30'),(4,'bodega medellín',3,'carrera 50 #45-67');
/*!40000 ALTER TABLE `bodegas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `uq_categorias_nombre` (`nombre_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (10,'Aluminio'),(5,'Construcción'),(1,'Eléctrico'),(9,'Electrónica e IT'),(7,'Ferretería'),(6,'Materiales'),(4,'Metales'),(8,'Pinturas'),(3,'Plásticos'),(2,'Plomería');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pais` int(11) NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  UNIQUE KEY `uq_ciudades_nombre_pais` (`nombre_ciudad`,`id_pais`),
  KEY `fk_ciudades_pais` (`id_pais`),
  CONSTRAINT `fk_ciudades_pais` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (2,'Barranquilla',1),(1,'Bogotá',1),(4,'Bucaramanga',1),(5,'Cali',1),(3,'Medellín',1);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_compra` date NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  `cantidad_comprada` int(11) NOT NULL,
  `valor_total_compra` decimal(14,2) GENERATED ALWAYS AS (`precio_unitario` * `cantidad_comprada`) STORED,
  PRIMARY KEY (`id_compra`),
  KEY `idx_compras_fecha` (`fecha_compra`),
  KEY `idx_compras_proveedor` (`id_proveedor`),
  KEY `idx_compras_producto` (`id_producto`),
  CONSTRAINT `fk_compras_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE,
  CONSTRAINT `fk_compras_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON UPDATE CASCADE,
  CONSTRAINT `chk_compras_cantidad` CHECK (`cantidad_comprada` > 0),
  CONSTRAINT `chk_compras_precio` CHECK (`precio_unitario` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` (`id_compra`, `fecha_compra`, `id_proveedor`, `id_producto`, `precio_unitario`, `cantidad_comprada`) VALUES (1,'2023-07-12',5,107,8500.00,184),(2,'2023-08-25',4,104,15000.00,66),(3,'2023-10-04',1,107,8500.00,136),(4,'2024-04-27',2,103,8900.00,81),(5,'2024-07-06',6,106,22000.00,37),(6,'2024-06-17',5,108,27000.00,184),(7,'2023-06-16',2,103,8900.00,147),(8,'2023-07-18',4,103,8900.00,132),(9,'2023-03-03',1,108,28000.00,72),(10,'2024-04-11',4,108,29000.00,133),(11,'2024-04-07',4,101,1250.00,24),(12,'2024-08-24',2,105,35500.00,187),(13,'2023-12-12',5,104,15000.00,111),(14,'2023-11-28',5,106,22500.00,64),(15,'2023-11-10',2,107,8500.00,104),(16,'2023-05-18',5,103,9000.00,111),(17,'2023-09-17',4,108,28000.00,165),(18,'2024-05-06',1,105,35000.00,195),(19,'2024-08-11',3,103,8800.00,163),(20,'2023-06-03',3,105,35500.00,123),(21,'2024-05-31',5,107,8500.00,94),(22,'0000-00-00',2,106,22000.00,70),(23,'2023-02-01',5,101,1200.00,9),(24,'2023-05-24',6,105,35000.00,148),(25,'2023-04-02',1,103,8900.00,14),(26,'2024-05-19',3,108,28000.00,169),(27,'2024-04-30',5,108,28500.00,175),(28,'2023-09-12',4,105,35500.00,40),(29,'2023-04-28',4,103,8900.00,181),(30,'2024-06-20',2,103,8900.00,67),(31,'2024-12-02',1,107,8500.00,138),(34,'2023-02-28',5,104,15000.00,89),(36,'2024-07-16',1,104,15500.00,126),(37,'2024-05-13',2,101,1200.00,186),(38,'2024-10-05',6,104,15000.00,167),(39,'2024-03-06',4,108,28500.00,111),(40,'2023-03-23',2,107,8500.00,189),(42,'2023-07-18',2,107,8500.00,123),(43,'2023-08-12',5,104,15500.00,33),(44,'0000-00-00',5,107,8000.00,87),(46,'2023-11-14',1,106,21000.00,17),(47,'2023-03-30',4,105,36000.00,116),(48,'2024-10-28',4,101,1200.00,61),(49,'2024-02-13',5,105,35500.00,194),(50,'2023-08-31',6,101,1200.00,93),(51,'2024-02-14',4,106,21000.00,49),(52,'2024-03-26',5,105,35000.00,169),(53,'2024-01-10',2,106,21000.00,8),(54,'2023-01-26',6,106,22500.00,151),(55,'2023-03-09',5,105,35000.00,79),(56,'2023-03-12',1,107,8500.00,44),(58,'2023-03-04',1,106,23000.00,34),(60,'2024-03-28',2,104,15000.00,16),(61,'2024-04-08',3,106,23000.00,157),(63,'2023-11-09',2,101,1150.00,144),(64,'2024-12-01',1,108,28000.00,24),(65,'2024-06-27',1,104,15500.00,97),(66,'2024-03-20',2,101,1300.00,21),(67,'2023-01-23',1,105,35000.00,119),(68,'2023-06-20',6,108,28000.00,11),(69,'2023-05-25',2,103,8900.00,126),(70,'2024-01-23',6,106,22000.00,153),(72,'0000-00-00',2,103,9000.00,80),(73,'2023-06-29',3,104,15000.00,110),(75,'2024-03-25',6,103,8900.00,13),(76,'2023-08-28',1,104,15000.00,100),(77,'2023-05-05',4,103,8900.00,175),(79,'2023-07-11',2,106,22500.00,189),(80,'2023-12-06',6,105,34000.00,120);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_bodega` int(11) NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_empleados_bodega` (`id_bodega`),
  CONSTRAINT `fk_empleados_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `bodegas` (`id_bodega`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'María Pérez',2),(2,'Andrés Gómez',3),(3,'Carlos Rodríguez',1),(4,'Luisa Martínez',4);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventario`
--

DROP TABLE IF EXISTS `movimientos_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_inventario` (
  `id_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) NOT NULL,
  `id_bodega` int(11) NOT NULL,
  `id_tipo_movimiento` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `cantidad_movimiento` int(11) NOT NULL,
  `stock_actual` int(11) NOT NULL,
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `fk_mov_compra` (`id_compra`),
  KEY `fk_mov_tipo` (`id_tipo_movimiento`),
  KEY `fk_mov_empleado` (`id_empleado`),
  KEY `idx_mov_bodega` (`id_bodega`),
  CONSTRAINT `fk_mov_bodega` FOREIGN KEY (`id_bodega`) REFERENCES `bodegas` (`id_bodega`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_compra` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON UPDATE CASCADE,
  CONSTRAINT `fk_mov_tipo` FOREIGN KEY (`id_tipo_movimiento`) REFERENCES `tipos_movimiento` (`id_tipo_movimiento`) ON UPDATE CASCADE,
  CONSTRAINT `chk_mov_cantidad` CHECK (`cantidad_movimiento` > 0),
  CONSTRAINT `chk_mov_stock` CHECK (`stock_actual` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
INSERT INTO `movimientos_inventario` VALUES (1,1,2,1,1,170,17,''),(2,2,2,1,1,39,487,'compra ordinaria'),(3,3,2,2,1,26,18,''),(4,4,3,1,2,42,124,'pedido urgente'),(5,5,2,1,1,17,361,''),(6,6,1,1,3,138,36,'n/a'),(7,7,3,1,2,85,432,'compra ordinaria'),(8,8,4,2,4,129,353,''),(9,9,2,1,1,59,95,'reposición de stock'),(10,10,3,2,2,61,492,'ninguna'),(11,11,1,2,3,19,299,''),(12,12,1,2,3,81,218,'pedido urgente'),(13,13,3,2,2,5,490,'ok'),(14,14,1,1,3,20,483,'compra ordinaria'),(15,15,2,2,1,75,59,'compra ordinaria'),(16,16,4,1,4,30,344,'revisar calidad'),(17,17,4,2,4,98,453,''),(18,18,4,2,4,25,455,'n/a'),(19,19,1,1,3,143,258,'pedido urgente'),(20,20,1,2,3,27,322,'ok'),(21,21,4,1,4,55,52,'compra ordinaria'),(22,22,4,1,4,43,360,'compra ordinaria'),(23,23,2,1,1,9,472,'n/a'),(24,24,3,1,2,55,384,'revisar calidad'),(25,25,4,2,4,10,303,'ninguna'),(26,26,1,2,3,68,81,'compra ordinaria'),(27,27,4,2,4,26,249,'compra ordinaria'),(28,28,4,2,4,36,258,''),(29,29,1,2,3,175,99,'revisar calidad'),(30,30,1,1,3,31,409,''),(31,31,4,2,4,2,110,'devolución parcial'),(34,34,3,1,2,34,22,'ok'),(36,36,3,1,2,60,334,'pedido urgente'),(37,37,4,2,4,15,93,'pedido urgente'),(38,38,3,2,2,162,27,'revisar calidad'),(39,39,3,2,2,44,94,'reposición de stock'),(40,40,1,1,3,29,371,'compra ordinaria'),(42,42,2,2,1,43,473,'ok'),(43,43,3,2,2,5,322,'pedido urgente'),(44,44,3,2,2,55,492,'pedido urgente'),(46,46,2,1,1,6,69,'compra ordinaria'),(47,47,4,2,4,84,139,'pedido urgente'),(48,48,2,1,1,46,43,'pedido urgente'),(49,49,3,1,2,101,494,'ninguna'),(50,50,2,1,1,6,318,'reposición de stock'),(51,51,2,1,1,20,189,'ok'),(52,52,1,1,3,149,367,'ok'),(53,53,2,1,1,7,164,'pedido urgente'),(54,54,3,1,2,76,92,'revisar calidad'),(55,55,3,2,2,61,201,''),(56,56,3,2,2,42,175,'n/a'),(58,58,2,2,1,24,438,'reposición de stock'),(60,60,2,2,1,14,333,'n/a'),(61,61,3,2,2,153,121,''),(63,63,2,1,1,103,187,''),(64,64,4,2,4,21,26,'reposición de stock'),(65,65,4,2,4,34,362,'reposición de stock'),(66,66,1,1,3,18,42,'ok'),(67,67,1,1,3,32,163,'compra ordinaria'),(68,68,2,1,1,7,88,'n/a'),(69,69,3,2,2,103,399,'pedido urgente'),(70,70,3,1,2,100,70,'ok'),(72,72,3,1,2,65,197,''),(73,73,1,1,3,42,338,'devolución parcial'),(75,75,3,1,2,2,93,'pedido urgente'),(76,76,4,1,4,46,142,'ninguna'),(77,77,3,1,2,95,55,'ok'),(79,79,1,2,3,117,248,'ok'),(80,80,2,2,1,115,236,'');
/*!40000 ALTER TABLE `movimientos_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pais`),
  UNIQUE KEY `uq_paises_nombre` (`nombre_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'colombia');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion_producto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_subcategoria` int(11) NOT NULL,
  `id_unidad_medida` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_unidad` (`id_unidad_medida`),
  KEY `idx_productos_subcat` (`id_subcategoria`),
  CONSTRAINT `fk_productos_subcategoria` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id_subcategoria`) ON UPDATE CASCADE,
  CONSTRAINT `fk_productos_unidad` FOREIGN KEY (`id_unidad_medida`) REFERENCES `unidades_medida` (`id_unidad_medida`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (101,'Tornillo hexagonal 1/2 pulgada','Tornillo metálico para uso estructural',10,1),(103,'Tubo PVC 4 pulgadas','Tubo de PVC sanitario diámetro 4 pulgadas',4,2),(104,'Válvula de paso 1/2 pulgada','Válvula de paso en bronce 1/2\"',12,1),(105,'Pintura base agua blanca 1 GL','Pintura de caucho base agua color blanco',11,4),(106,'Perfil aluminio 1 pulgada x 1 pulgada','Perfil de aluminio cuadrado 1 pulgada',5,2),(107,'Interruptor simple','Interruptor eléctrico sencillo 110 V',3,1),(108,'Cemento gris 50 kg','Cemento Portland 50 kg',6,3);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit_proveedor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono_proveedor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_proveedor` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_ciudad` int(11) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `uq_proveedores_nit` (`nit_proveedor`),
  KEY `idx_proveedores_ciudad` (`id_ciudad`),
  CONSTRAINT `fk_proveedores_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'ferreteria torres s.a.s.','900123456-1','3101234567','ferreteria.torres@gmail.com',1),(2,'distribuidora electronica medellin','800987654-2','3209876543','dist_electronica@gmail.com',3),(3,'plastiflex cali ltda','860456789-3','3154567890','plastiflex@cali.com',5),(4,'suministros industriales del norte','901234567-4','3057891234','suministros.norte@empresa.co',2),(5,'tecno partes ltda.','700345678-5','6014567890','tecnopartes@empresa.com',1),(6,'metales y aleaciones s.a','890654321-6','3168765432','metales@industriacol.com',4);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategorias`
--

DROP TABLE IF EXISTS `subcategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategorias` (
  `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_subcategoria` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_subcategoria`),
  UNIQUE KEY `uq_subcat_nombre_categoria` (`nombre_subcategoria`,`id_categoria`),
  KEY `fk_subcategorias_categoria` (`id_categoria`),
  CONSTRAINT `fk_subcategorias_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategorias`
--

LOCK TABLES `subcategorias` WRITE;
/*!40000 ALTER TABLE `subcategorias` DISABLE KEYS */;
INSERT INTO `subcategorias` VALUES (11,'Acabados',8),(2,'Accesorios',2),(7,'Aglomerantes',5),(15,'Cables',9),(6,'Cementos',5),(1,'Controles',1),(17,'Estructuras',10),(16,'Fijaciones',7),(3,'Interruptores',1),(5,'Perfiles',4),(9,'Pinturas',8),(12,'Pinturas base agua',8),(14,'Redes',9),(8,'Tornillos',7),(4,'Tuberías',3),(13,'Tubos',3),(10,'Válvulas',2);
/*!40000 ALTER TABLE `subcategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_movimiento`
--

DROP TABLE IF EXISTS `tipos_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_movimiento` (
  `id_tipo_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tipo_movimiento`),
  UNIQUE KEY `uq_tipo_movimiento` (`nombre_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_movimiento`
--

LOCK TABLES `tipos_movimiento` WRITE;
/*!40000 ALTER TABLE `tipos_movimiento` DISABLE KEYS */;
INSERT INTO `tipos_movimiento` VALUES (1,'ENTRADA'),(2,'SALIDA');
/*!40000 ALTER TABLE `tipos_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_medida`
--

DROP TABLE IF EXISTS `unidades_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades_medida` (
  `id_unidad_medida` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_unidad` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abreviatura` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_unidad_medida`),
  UNIQUE KEY `uq_unidad_abreviatura` (`abreviatura`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_medida`
--

LOCK TABLES `unidades_medida` WRITE;
/*!40000 ALTER TABLE `unidades_medida` DISABLE KEYS */;
INSERT INTO `unidades_medida` VALUES (1,'Unidad','UND'),(2,'Metro','MT'),(3,'Galón','GAL'),(4,'Bulto','BTO'),(5,'Metro lineal','ML');
/*!40000 ALTER TABLE `unidades_medida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-06  1:14:45
