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
-- Table structure for table `chi_tiet_ben_xe`
--

DROP TABLE IF EXISTS `chi_tiet_ben_xe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_ben_xe` (
  `id_benxe` int NOT NULL,
  `id_tuyenduong` int NOT NULL,
  PRIMARY KEY (`id_benxe`,`id_tuyenduong`),
  KEY `id_tuyenduong` (`id_tuyenduong`),
  CONSTRAINT `chi_tiet_ben_xe_ibfk_1` FOREIGN KEY (`id_benxe`) REFERENCES `benxe` (`id`),
  CONSTRAINT `chi_tiet_ben_xe_ibfk_2` FOREIGN KEY (`id_tuyenduong`) REFERENCES `tuyenduong` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_ben_xe`
--

LOCK TABLES `chi_tiet_ben_xe` WRITE;
/*!40000 ALTER TABLE `chi_tiet_ben_xe` DISABLE KEYS */;
INSERT INTO `chi_tiet_ben_xe` VALUES (8,1),(9,1),(1,2),(6,2),(7,3),(9,3),(1,4),(5,4),(4,5),(6,5),(3,6),(10,6),(5,7),(8,7),(5,8),(8,8),(6,9),(10,9),(5,10),(8,10),(2,11),(3,11),(3,12),(5,12),(3,13),(7,13),(6,14),(10,14),(2,15),(7,15),(6,16),(7,16),(6,17),(7,17),(2,18),(9,18),(7,19),(8,19),(8,20),(10,20),(9,21),(10,21),(3,22),(7,22),(2,23),(9,23),(2,24),(3,24),(3,25),(6,25),(3,26),(6,26),(6,27),(10,27),(1,28),(2,28),(9,29),(10,29),(1,30),(10,30),(1,56),(7,56),(1,57),(9,57),(7,58),(17,58),(1,59),(17,59),(1,60),(6,60);
/*!40000 ALTER TABLE `chi_tiet_ben_xe` ENABLE KEYS */;
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
