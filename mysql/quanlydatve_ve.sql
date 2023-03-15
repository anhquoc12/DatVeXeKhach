-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quanlydatve
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `ve`
--

DROP TABLE IF EXISTS `ve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ve` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tuyenduong` int NOT NULL,
  `id_khach_hang` int NOT NULL,
  `id_hangve` int NOT NULL,
  `id_ghe` int NOT NULL,
  `id_nv` int DEFAULT NULL,
  `GiaVe` float NOT NULL,
  `ngay_xuat_ve` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`id_tuyenduong`,`id_khach_hang`),
  KEY `id_tuyenduong` (`id_tuyenduong`),
  KEY `id_khach_hang` (`id_khach_hang`),
  KEY `id_hangve` (`id_hangve`),
  KEY `id_ghe` (`id_ghe`),
  KEY `id_nv` (`id_nv`),
  CONSTRAINT `ve_ibfk_1` FOREIGN KEY (`id_tuyenduong`) REFERENCES `tuyenduong` (`id`),
  CONSTRAINT `ve_ibfk_2` FOREIGN KEY (`id_khach_hang`) REFERENCES `customer` (`id`),
  CONSTRAINT `ve_ibfk_3` FOREIGN KEY (`id_hangve`) REFERENCES `hangve` (`id`),
  CONSTRAINT `ve_ibfk_4` FOREIGN KEY (`id_ghe`) REFERENCES `ghe` (`id`),
  CONSTRAINT `ve_ibfk_5` FOREIGN KEY (`id_nv`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ve`
--

LOCK TABLES `ve` WRITE;
/*!40000 ALTER TABLE `ve` DISABLE KEYS */;
INSERT INTO `ve` VALUES (1,1,4,2,19,NULL,134552000,'2020-07-10 19:04:00'),(2,3,5,2,9,NULL,115000,'2025-01-07 02:13:00'),(3,6,6,2,7,NULL,256000,'2023-08-12 06:37:00');
/*!40000 ALTER TABLE `ve` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-15 21:28:06
