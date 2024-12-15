-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: abccinema
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `m_name` varchar(100) NOT NULL,
  `m_image` varchar(255) DEFAULT NULL,
  `m_description` varchar(1000) NOT NULL,
  `m_start_date` date DEFAULT NULL,
  `m_end_date` date DEFAULT NULL,
  `m_genres` varchar(45) NOT NULL,
  `m_cast` varchar(100) NOT NULL,
  `m_directors` varchar(100) NOT NULL,
  `m_writers` varchar(100) NOT NULL,
  `m_producers` varchar(100) NOT NULL,
  `m_music` varchar(45) NOT NULL,
  `m_price_adult` varchar(50) DEFAULT NULL,
  `m_price_child` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (13,'fwf','abcCinemaLogo.png','dffd','2024-12-17','2024-12-25','assa','asdc','dsac','dsac','dsc','dsadsc','1000.0','2000.0'),(14,'Avatar','Despicable ME 4.jpg','wqefew','2024-12-16','2024-12-26','ewfw','ewdef','wefc','wdfef','wdfef','wefde','2000.0','1000.0'),(15,'Avatar','abcCinemaLogo.png','wfe','2024-12-20','2024-12-21','sdf','sdf','fgh','qwe','xb','er','12.0','123.0'),(16,'Pushpa2','Rectangle 35@1x.jpg','Description','2024-12-19','2024-12-28','action','Vihanga,Agasthi,Joshua,Dulith,Udula','Gavin,KK','Ranasinghe,GK','producers','GavinMusic','1200.0','800.0'),(17,'Avatards','DESPICABLE.jpg','descri','2024-12-18','2024-12-28','action','Vihanga,Agasthi,Joshua,Dulith,Udula','Gavin,KK','Ranasinghe,GK','pppppp','GavinMusic','12333.0','1222.0'),(18,'Despicable4','Despicable ME 4.jpg','sdffhty','2024-12-15','2024-12-17','action','Vihanga,Agasthi,Joshua,Dulith,Udula','Gavin,KK','Ranasinghe,GK','ssldmsdx','GavinMusic','1200.0','1000.0'),(19,'Despicable4','DESPICABLE.jpg','ddddd','2024-12-17','2024-12-28','action','Vihanga,Agasthi,Joshua,Dulith,Udula','trefgt','Ranasinghe,GK','ssldmsdx','GavinMusic','1111.0','2222.0'),(20,'sfd','DESPICABLE.jpg','ddddd','2024-12-17','2024-12-25','action','Vihanga,Agasthi,Joshua,Dulith,Udula','trefgt','Ranasinghe,GK','producers','GavinMusic','1222.0','3444.0'),(21,'Despicable4','DESPICABLE.jpg','hhhhh','2024-12-18','2024-12-25','action','Vihanga,Agasthi,Joshua,Dulith,Udula','ebrw','sadsfsad','ssldmsdx','GavinMusic','1111.0','2222.0'),(22,'Despicable40','DESPICABLE.jpg','ddddeeee','2024-12-16','2024-12-17','action','Vihanga,Agasthi,Joshua,Dulith,Udula','Gavin,KK','Ranasinghe,GK','wef','bgfbhfgbfg','1111.0','2222.0'),(23,'Despicable ME 4','Despicable ME 4.jpg','Gru is back, and this time, he\'s navigating the chaos of family life, while also facing new challenges in his quest for redemption. After finally leaving behind his life of villainy, Gru, now a devoted husband and father, finds himself caught up in the antics of his mischievous daughters and his loyal Minions. However, when a new villain rises in the form of a mysterious, tech-savvy adversary, Gru must team up with his family and the Minions to save the world once again. Amidst the laughter and mayhem, Gru will discover that his greatest strength lies in his love for his family and his unique ability to turn even the worst situations into opportunities for good.','2024-12-17','2024-12-19','action','Steve Carell | Pierre Coffin | Kristen Wiig | Sofía Vergara ','Zack Snyder | Christopher Nolan | Kristen Wiig  ','Steve Carell | Pierre Coffin','Marty Bowen | Cristobal Tapia De Veer','Cristobal Tapia De Veer','1000.0','500.0'),(24,'Despicable4','Despicable ME 4.jpg','eeeeeeee','2024-12-25','2024-12-26','action','Vihanga,Agasthi,Joshua,Dulith,Udula','ef','bers','producers','GavinMusic','1000.0','2000.0'),(25,'Thor','','Thor Odinson is, easily, one of the most recognized Marvel heroes now, largely thanks to his appearance within Marvel Studio\'s MCU. Based on the god of the same name from Norse Mythology, he has been part of the comic world for a very long time and been part of the MCU since the first Thor film released back in 2011. Chris Hemsworth ','2024-12-17','2024-12-26','dcx','Vihanga,Agasthi,Joshua,Dulith,Udula','Gavin,KK','Ranasinghe,GK','ssldmsdx','GavinMusic','1000.0','500.0'),(26,'Avatar','Despicable ME 4.jpg','asd','2024-12-25','2024-12-17','sad','sde','defw','fef','efs','def','1000.0','2222.0'),(27,'Thor','','fgh','2024-12-17','2024-12-31','tgfrs','strh','strh','trgh','tzh','tsrh','1000.0','2000.0'),(28,'sdf','download.jpg','rge','2024-12-17','2024-12-24','wfrfe','frew','wAF','Waf','frgtggrg','wrf','2000.0','1000.0');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 13:33:31
