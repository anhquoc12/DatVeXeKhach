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
-- Table structure for table `tuyenduong`
--

DROP TABLE IF EXISTS `tuyenduong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuyenduong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_tuyen_duong` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tg_khoihanh` datetime NOT NULL,
  `tg_chay` time NOT NULL,
  `giave_hv1` float NOT NULL,
  `giave_hv2` float NOT NULL,
  `id_nv` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_nv` (`id_nv`),
  CONSTRAINT `tuyenduong_ibfk_1` FOREIGN KEY (`id_nv`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuyenduong`
--

LOCK TABLES `tuyenduong` WRITE;
/*!40000 ALTER TABLE `tuyenduong` DISABLE KEYS */;
INSERT INTO `tuyenduong` VALUES (1,'BX Hải Dương - BX Đồng Nai','2020-07-10 19:04:00','16:12:00',684000,134000,2),(2,'BX Thanh Hóa - BX Kiên Giang','2020-12-02 22:07:00','14:37:00',877000,466000,2),(3,'BX Đồng Nai - BX Đồng Tháp','2025-01-07 02:13:00','08:46:00',575000,115000,2),(4,'BX Hà Nội - BX Kiên Giang','2024-09-21 14:45:00','21:55:00',868000,789000,2),(5,'BX Thanh Hóa - BX Miền Đông','2023-10-25 22:43:00','13:55:00',627000,571000,2),(6,'BX Cà Mau - BX Bình Thuận','2023-08-12 06:37:00','15:30:00',351000,256000,2),(7,'BX Hà Nội - BX Hải Dương','2022-01-15 07:38:00','16:39:00',836000,383000,2),(8,'BX Hải Dương - BX Hà Nội','2025-03-24 19:02:00','20:42:00',827000,122000,2),(9,'BX Cà Mau - BX Thanh Hóa','2025-04-17 20:45:00','05:23:00',325000,161000,2),(10,'BX Hải Dương - BX Hà Nội','2022-11-15 06:19:00','13:45:00',760000,228000,2),(11,'BX Bình Thuận - BX Cần Thơ','2022-12-24 22:26:00','06:14:00',527000,503000,2),(12,'BX Bình Thuận - BX Hà Nội','2025-07-27 23:19:00','04:54:00',947000,629000,2),(13,'BX Bình Thuận - BX Đồng Tháp','2022-11-02 09:19:00','02:36:00',970000,622000,2),(14,'BX Cà Mau - BX Thanh Hóa','2020-03-02 15:52:00','04:45:00',576000,182000,2),(15,'BX Cần Thơ - BX Đồng Tháp','2020-08-27 14:22:00','02:03:00',581000,476000,2),(16,'BX Đồng Tháp - BX Thanh Hóa','2024-08-06 03:59:00','09:25:00',798000,490000,2),(17,'BX Đồng Tháp - BX Thanh Hóa','2020-12-15 08:51:00','02:23:00',612000,590000,2),(18,'BX Cần Thơ - BX Đồng Nai','2023-09-14 04:07:00','10:30:00',629000,364000,2),(19,'BX Đồng Tháp - BX Hải Dương','2024-07-19 04:15:00','22:04:00',651000,165000,2),(20,'BX Hải Dương - BX Cà Mau','2022-06-26 17:42:00','13:34:00',769000,115000,2),(21,'BX Đồng Nai - BX Cà Mau','2024-01-13 12:52:00','01:06:00',386000,331000,2),(22,'BX Bình Thuận - BX Đồng Tháp','2024-03-03 01:39:00','01:01:00',623000,203000,2),(23,'BX Đồng Nai - BX Cần Thơ','2021-01-10 15:42:00','18:31:00',763000,173000,2),(24,'BX Cần Thơ - BX Bình Thuận','2025-12-16 06:19:00','11:24:00',641000,583000,2),(25,'BX Bình Thuận - BX Thanh Hóa','2021-06-26 12:49:00','12:27:00',458000,156000,2),(26,'BX Bình Thuận - BX Thanh Hóa','2025-05-28 09:32:00','13:05:00',625000,269000,2),(27,'BX Cà Mau - BX Thanh Hóa','2022-11-11 15:44:00','02:33:00',421000,211000,2),(28,'BX Kiên Giang - BX Cần Thơ','2023-05-03 07:05:00','01:23:00',409000,344000,2),(29,'BX Cà Mau - BX Đồng Nai','2025-09-17 03:17:00','03:52:00',830000,342000,2),(30,'BX Cà Mau - BX Kiên Giang','2021-05-02 18:44:00','22:57:00',624000,577000,2),(56,'BX Kiên Giang - BX Đồng Tháp','2023-04-01 22:17:00','05:30:00',800000,500000,2),(57,'BX Kiên Giang - BX Đồng Nai','2023-02-11 23:16:00','04:30:00',800000,500000,2),(58,'BX Lai Châu - BX Đồng Tháp','2023-03-09 23:11:00','02:30:00',800000,500000,2),(59,'BX Kiên Giang - BX Lai Châu','2023-03-17 23:15:00','00:30:00',800000,500000,1),(60,'BX Kiên Giang - BX Thanh Hóa','2023-03-08 23:27:00','00:30:00',800000,500000,1);
/*!40000 ALTER TABLE `tuyenduong` ENABLE KEYS */;
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
