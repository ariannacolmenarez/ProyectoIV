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
INSERT INTO `usuarios` VALUES (1,'SUPERUSUARIO','ezcolmenarjose@gmail.com','®Â<MÖ¥Å¶oÓ6\ZÎ_¥ﬁ)∞7˚\\áç˛ÊÙMku√xúË©Ñïdå(jﬂâ,ƒ-%:¥…qèÓùTÎ®ór		ÜÖhﬁÇ[Èù\ZG–¿§Ÿ˚C™±˝Í7\nëdù[y_OIÄ∞îx›∑T‹Võƒ;:ß\nêi}\rHÙí>›{ªWkK<Ï—u∫ë-)Cﬁê≥pjg˘,É&k}è‚\'>–ãïÒ„ï—ìöÙFz·)5åº!”à√åaÔ\rd€Ø∑b™(eEI;\n\r™cA$&9√H9a>95)	¶ﬁ˝„•1ggÌkIN\ZZ2;óÆéª≈ø$i4`\"`vPÑ@ˇØ\02sàè','1',3),(3,'ARIANNA','aripaocol@gmail.com','FUHÃà4·≠ñ>êUwÒ≤9Æ7úá˜¯‹H;4‰y≥l≠ Ãew®O–=ü\ZV”÷éò∑≥ÿ\Zr,àá&¡1\"A‘ˆü<{)≈{Uæ∆ø_˜˘Õ‡‘}AâÄèIÚgÃÅıL=ﬁ5ÈG!¶£–•£úCÄg¨ê“ÃmÅ^.$¶[á\Zü¶ãM®ˇi∫`D€˘≥G‘SƒfÉ^H˛Ü›≈cCwõT›\ZP8+4Á[X˛v¨‡ß\0“Yıˆ‡vÙ…ùcú‘p}ŸRñ\0\0¿É˝ü]?Â±w|…•´íë¬˚\'‘c∆¶ÿpt6§≈xåö5H0\ZƒQçl','1',3),(21,'PAOLA25','ARICOL25@GMAIL.COM','hHæ°è\ncÉl„Ëﬁ	åyﬁ;áµ$A≥ æFû#\"zGÓ†Vù~„41¸≈«Ë≈c0ß≥·„r∏7¥ëÿÙ‚¸Dwò⁄‰\\…BÍÄ€∞∫î¡%ØÖ[w¬ä∑Kcqa[œ]pœTpìπ|óv!—ÏAûBuÉÿgÊ\"⁄wÀ€ÚíÜ¬éD¥v›·Ø§úëÊÇÿeì5©∆¯;7ƒÊW– ˚√”¸\\?*Á6Æ7˜ï\rRÎıò(â{˚ì~È‰úñÔöd’úÚD3©5@%R%Ëf}„Äõ/≤8NÇÖ	ˇ%érïº·ŸÄ\"%£˜1–∑à∏','1',3),(22,'PAOLA02','colmenarjose2512@gmail.com','Fêf—	ñÙ\n\rƒπ˜Çº®\\∫ÿ¨™ä≠˜º‹!PCC7•4Wê∏Ê6oŒÁw~g1πËZôäü\"…ã2\ZKŒ\råW¸úíÇ@ñéJú5¸T±∑˜L8›—ÅÈgäãÀR\'∂m$¸çdñÂ.∞•˛)õ◊›¨]∏=¡`ôõJŸ‡≥∂µMπŸ\\w\0’Óc›Õ›$9}É‡ãŸ$s™≥FXp˜Ö÷ıÀ˜o5Åö.ëY•,<Ë\0õΩu–±˝Kx¬e)c^˚ê.Uv ;ªª«¨Å<R„æ(%õa#OÃ˝Œ≤ZôMØÌtUG˛#	m&˛ûﬂ“4Xs¢KéÅÿ≈5.Ò„µ¨d,ÕK<','1',3);
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
