-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: joseviveresbd
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

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
-- Table structure for table `abonos`
--

DROP TABLE IF EXISTS `abonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abonos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(255) DEFAULT NULL,
  `valor` decimal(11,2) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `abonos_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos`
--

LOCK TABLES `abonos` WRITE;
/*!40000 ALTER TABLE `abonos` DISABLE KEYS */;
INSERT INTO `abonos` VALUES (8,'abono ',25.00,1,'2023-03-16'),(9,'abono ',25.00,1,'2023-03-16'),(10,'abono 1',20.00,3,'2023-03-16'),(11,'abono 2',3.00,1,'2023-03-16'),(12,'abono 3',30.00,1,'2023-03-16'),(13,'abono 3',30.00,1,'2023-03-16'),(14,'abono ',5.00,1,'2023-03-16'),(15,'abono ',5.00,1,'2023-03-16');
/*!40000 ALTER TABLE `abonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado_movimiento` varchar(50) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `id_concepto_movimiento` int(11) NOT NULL,
  `id_metodo_pago` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  KEY `id_persona` (`id_proveedor`),
  KEY `id_concepto_movimiento` (`id_concepto_movimiento`) USING BTREE,
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`id_concepto_movimiento`) REFERENCES `concepto_movimiento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_ibfk_4` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movimientos_ibfk_5` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (195,'compra de productos',784.00,'2023-03-16','13:16:00','PAGADA','1',3,4,1,NULL,1),(196,'',25.00,'2023-03-16','13:22:00','PAGADA','1',1,1,NULL,NULL,1),(197,'',63.00,'2023-03-16','13:23:00','A CREDITO','0',1,1,NULL,17,1),(198,'compra aceite',320.00,'2023-03-16','13:23:00','A CREDITO','1',3,2,1,NULL,1),(199,'',63.00,'2023-03-16','14:19:00','PAGADO','1',1,1,NULL,2,1),(200,'',25.00,'2023-03-16','14:27:00','A CREDITO','1',1,1,NULL,2,1),(201,'',38.00,'2023-09-14','15:16:00','PAGADA','1',1,1,NULL,NULL,3),(202,'',50.00,'2023-09-14','15:17:00','PAGADA','1',1,1,NULL,NULL,3);
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` blob NOT NULL,
  `estado` varchar(25) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'SUPERUSUARIO','ezcolmenarjose@gmail.com','��<M����o�6\Z�_��)�7�\\�����Mku�x�詄�d�(j߉,�-%:��q��T먗r		��hނ[��\ZG�����C����7\n�d�[y_OI���xݷT�V��;:�\n�i}\rH��>�{�WkK<��u��-)Cސ�pjg�,�&k}��\'>Ћ���ѓ��Fz�)5��!ӈÌa�\rdۯ�b�(eEI;\n\r�cA$&9�H9a>95)	����1gg�kIN\ZZ2;����ſ$i4`\"`vP�@��\02s��','1',3),(3,'ARIANNA','aripaocol@gmail.com','FUH��4᭖>�Uw��9�7�����H;4�y�l� �ew�O�=�\ZV�֎����\Zr,���&�1\"A���<{)�{U�ƿ_�����}A���I�ǵ�L=�5�G!��Х��C�g����m�^.$�[�\Z���M��i�`D���G�S�f�^H����cCw�T�\ZP8+4�[X�v��\0�Y���v���c��p}�R�\0\0����]?��w|ɥ�����\'�cƦ�pt6��x��5H0\Z�Q�l','1',3),(21,'PAOLA25','ARICOL25@GMAIL.COM','hH���\nc�l���	�y�;��$A�ʾF�#\"zG�V�~�41�����c0����r�7������Dw���\\�B������%��[w�Kcqa[�]p�Tp��|�v!��A�Bu��g�\"�w���D�v��������e�5���;7��W� ����\\?*�6�7��\rR���(�{��~�䜖�d���D3�5@%R%�f}〛/�8N��	�%�r���ـ\"%��1з��','1',3),(22,'PAOLA02','colmenarjose2512@gmail.com','F�f�	��\n\rĹ����\\�ج������!PCC7�4W���6o��w~g1��Z���\"ɋ2\ZK�\r�W����@��J�5�T���L8�с�g���R\'�m$��d��.���)��ݬ]�=�`��J�೶�M��\\w\0��c���$9}����$s��FXp������o5��.�Y�,<�\0��uб�Kx�e)c^��.Uv�;��Ǭ�<R�(%�a#O��βZ�M��tUG�#	m&����4Xs�K����5.���d,�K�<','1',3);
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

-- Dump completed on 2023-09-28 21:30:58
