-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: benxe
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `user_id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_admin_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL,
  `company_id` int NOT NULL,
  `packet_id` int NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_opt` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bill_package_idx` (`packet_id`),
  KEY `fk_bill_com_idx` (`company_id`),
  CONSTRAINT `fk_bill_com` FOREIGN KEY (`company_id`) REFERENCES `car_company` (`id`),
  CONSTRAINT `fk_bill_package` FOREIGN KEY (`packet_id`) REFERENCES `package` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `ticket_quantity` int NOT NULL,
  `total` decimal(45,0) DEFAULT NULL,
  `book_status` int DEFAULT NULL,
  `customer_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,2,320000,NULL,'Äáº·ng Minh Triá»u','0948513923'),(3,2,320000,NULL,'Dang Minh Trieu','0948513923'),(4,2,320000,NULL,'Dang Minh Trieu','0948513923'),(5,2,320000,NULL,'Dang Minh Trieu','0948513923');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_company`
--

DROP TABLE IF EXISTS `car_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_company` (
  `id` int NOT NULL,
  `company_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_com_package_idx` (`expire_date`),
  CONSTRAINT `fk_com_user` FOREIGN KEY (`id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_company`
--

LOCK TABLES `car_company` WRITE;
/*!40000 ALTER TABLE `car_company` DISABLE KEYS */;
INSERT INTO `car_company` VALUES (4,'Trung Nga','Hồ Chí Minh',NULL,'phuongtrang@gmail.com','0948513923'),(6,'Minh Triều','Hồ Chí Minh',NULL,'nhaxe03@gmail.com','0948513923'),(20,'Cúc Tùng','Hồ Chí Minh',NULL,'cuctung@gmail.com','0948513923'),(29,'Thai Thanh','Ho Chi Minh',NULL,'thaithanh@gmail.com','0948513923');
/*!40000 ALTER TABLE `car_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user_idx` (`user_id`),
  KEY `fk_comment_com_idx` (`company_id`),
  CONSTRAINT `fk_comment_com` FOREIGN KEY (`company_id`) REFERENCES `car_company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (5,1,4,'Hello mấy cưng','2022-08-26 17:33:19'),(6,1,4,'Kỳ v ta','2022-08-26 17:59:02'),(7,2,4,'Hello mấy cưng','2022-08-26 18:08:46'),(8,2,4,'Nhà xe như bùi','2022-08-26 18:14:30'),(9,2,4,'Bài viết như lồn','2022-08-26 18:15:41'),(10,2,4,'Bài viết như bùi','2022-08-26 19:43:01'),(11,2,4,'Bài viết như bùi','2022-08-26 19:44:57'),(12,4,4,'Hello mấy cưng','2022-08-27 15:10:43'),(13,1,4,'CMT','2022-09-01 22:43:14'),(14,4,4,'CMT TEST','2022-09-01 23:29:06'),(15,4,4,'CMT TEST','2022-09-01 23:30:35'),(16,4,4,'CMT TEST','2022-09-01 23:31:06'),(17,4,4,'CMT TEST','2022-09-01 23:45:26'),(18,4,4,'FINAL LOAD TEST','2022-09-01 23:46:02');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `user_id` int NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_cus_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `id` int NOT NULL,
  `package_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(45,0) DEFAULT NULL,
  `expire_date` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,'30 days',2000000,30),(2,'6 months',10000000,180),(3,'12 months',18000000,365);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `province_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'TP.Hồ Chí Minh'),(2,'Bình Thuận'),(3,'Đà Nẵng'),(4,'Ninh Thuận'),(5,'Bến Tre');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `point` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rate_user_idx` (`user_id`),
  KEY `fk_rate_com_idx` (`company_id`),
  CONSTRAINT `fk_rate_com` FOREIGN KEY (`company_id`) REFERENCES `car_company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rate_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `route_id` int NOT NULL AUTO_INCREMENT,
  `starting_place` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destination` int DEFAULT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`route_id`),
  KEY `fk_route_com_idx` (`company_id`),
  KEY `fk_route_province_idx` (`destination`),
  CONSTRAINT `fk_route_com` FOREIGN KEY (`company_id`) REFERENCES `car_company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_route_province` FOREIGN KEY (`destination`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (12,'TP. Hồ Chí Minh',2,4),(14,'TP.Ho Chi Minh',3,4),(15,'TP.Ho Chi Minh',5,4);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_details`
--

DROP TABLE IF EXISTS `shipment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment_details` (
  `ship_id` int NOT NULL,
  `sender` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiving_time` datetime DEFAULT NULL,
  `sending_time` datetime DEFAULT NULL,
  `cost` decimal(45,0) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `trip_id` int NOT NULL,
  PRIMARY KEY (`ship_id`),
  KEY `fk_ship_trip_idx` (`trip_id`),
  CONSTRAINT `fk_ship_trip` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_details`
--

LOCK TABLES `shipment_details` WRITE;
/*!40000 ALTER TABLE `shipment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `seat_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(45,0) DEFAULT NULL,
  `trip_id` int NOT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `fk_ticket_trip_idx` (`trip_id`),
  KEY `fk_ticket_book_idx` (`book_id`),
  CONSTRAINT `fk_ticket_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `fk_ticket_trip` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (19,'A2D',145000,33,NULL),(20,'A1D',145000,33,NULL),(21,'A2D',160000,35,NULL),(22,'A1D',160000,35,NULL),(23,'A2D',160000,36,3),(24,'A1D',160000,36,3),(25,'C2D',160000,35,4),(26,'C1D',160000,35,4),(27,'A2T',160000,35,5),(28,'B1T',160000,35,5),(29,'A2D',145000,38,NULL),(30,'A1D',145000,38,NULL);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `trip_id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `departure_time` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_price` decimal(45,0) DEFAULT NULL,
  `route_id` int NOT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `fk_trip_route_idx` (`route_id`),
  CONSTRAINT `fk_trip_route` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (30,'2022-08-29','07:00','2 tieng',145000,12),(31,'2022-08-29','08:00','2 tieng',145000,12),(32,'2022-08-29','09:00','2 tieng',145000,12),(33,'2022-08-30','07:00','2 tiáº¿ng',145000,12),(34,'2022-08-30','09:00','2 tiáº¿ng',145000,12),(35,'2022-09-01','07:00','2 tieng',160000,15),(36,'2022-09-01','09:00','2 tieng',160000,15),(38,'2022-09-02','09:00','2 tieng',145000,12);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'trieu92dmt','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO','trieu251101@gmail.com','0948513923',NULL,'ROLE_USER',NULL),(2,'trieu12ik24','$2a$10$hG6ne4YMCWU/0tYr.HhgCeC.TW2kuWVyy1rioh4mSJtdSjDtCFAKu','trieu@gmail.com','0948513923',NULL,'ROLE_USER',NULL),(3,'admin01','$2a$10$qv8SsUwRnp/YhPWTPqdgp.MXJ01hcW4ji6wKvP6.qkWWx1ZxhqxyG','trieu92dmt@gmail.com','0948513923',NULL,'ROLE_ADMIN',NULL),(4,'nhaxe01','$2a$10$baCNXtHzm0.nRDwgaXPe4eZeOQILg2WBfRVM.tOGj5tyX8m17wlt6','nhaxe01@gmail.com','0948513923','https://res.cloudinary.com/duilcpycp/image/upload/v1661672218/oh7flyphkvleidfftirr.png','ROLE_COMPANY',NULL),(5,'nhaxetest','$2a$10$gcIiUScPISAVtY83xjT5j.RCBZXnTKbqMqhWgiLZa8UWPf8TJ4FQK','test@gmail.com','0948513923',NULL,'ROLE_COMPANY',NULL),(6,'nhaxe02','$2a$10$o1Ok8lrAosCyCBAAra00X.46Vq.msQE6Luw8GNkoQzxo.mjj1VOJO','nhaxe02@gmail.com','0948513923',NULL,'ROLE_COMPANY',NULL),(8,'usertest','$2a$10$d9HRJAoQ.nQp/iHt5dUNcOl15ehDuFYj4/HxeIzdVo.VL0A0ImCUa','usertest@gmail.com','0948513923',NULL,'ROLE_USER',NULL),(20,'cuctung','$2a$10$on5Pk747RD5VfsZnfnaya.C6ngWuKJZODGy7kH64A6e4ZhqBWO5hK','cuctung@gmail.com','0948513923',NULL,'ROLE_COMPANY',NULL),(29,'thaithanh','$2a$10$8/1zeDTralkwpBZZoRwN1.rSDO3bMh1VrENM2zYD41S5wmt/uIpTK','thaithanh@gmail.com','0948513923',NULL,'ROLE_COMPANY',NULL),(30,'user001','$2a$10$LAp/H3p.h/4nRAtM5EgVA.PDdSG6ry1GHhia.kodoE3LQmu9/Li1C','user001@gmail.com','0948513923','https://res.cloudinary.com/minhtrieu-cloudinary/image/upload/v1661619527/rkren0obyueqlndsnuon.png','ROLE_USER',NULL),(31,'user002','$2a$10$0E./zqLjLz8xFYMRRSDCNeeQinHQF6GxKvY0mYFRUzwhDoJmwe.fe','user002@gmail.com','0948513923','https://res.cloudinary.com/minhtrieu-cloudinary/image/upload/v1661619527/rkren0obyueqlndsnuon.png','ROLE_USER',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-02  6:20:20
