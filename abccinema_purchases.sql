-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: abccinema
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
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `adultTickets` int NOT NULL,
  `childTickets` int NOT NULL,
  `totalAmount` decimal(10,2) NOT NULL,
  `paymentMethod` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'John Doe','1234567890','john@example.com',2,1,3000.00,'Visa Card'),(2,'sup','cccc','cccc@jjfkf.com',0,0,0.00,'Credit Card'),(3,'aa','44','fkmjf@gmail.com',0,0,0.00,'Visa'),(4,'ooo','8888','hgyff@gmail.com',0,0,0.00,'Visa'),(5,'agasthi','0722','agasthisilva11a@gmail.com',0,0,0.00,'Visa Card'),(6,'vihanga','0799','hfuhfu@gmail.com',2,0,2000.00,'Credit Card'),(7,'vihanga','0799','hfuhfu@gmail.com',2,0,2000.00,'Credit Card'),(8,'vihanga','0799','hfuhfu@gmail.com',2,0,2000.00,'Credit Card'),(9,'gavin','0123','gavin@gmail.com',1,1,1800.00,'Credit Card'),(10,'imashi','0123','imashi@gmail.com',1,1,1800.00,'Credit Card'),(11,'omg','5678','omg@gmail.com',1,1,1800.00,'Visa'),(12,'woww','3456','wow@gmail.com',1,1,1800.00,'Master Card'),(13,'imashi','0123','imashi@gmail.com',0,0,0.00,'PayPal'),(14,'imashi','0123','imashi@gmail.com',1,1,1800.00,''),(15,'imashi','0123','imashi@gmail.com',1,0,1000.00,'PayPal'),(16,'imashi','0123','imashi@gmail.com',1,0,1000.00,'PayPal'),(17,'vihanga','0123','hfuhfu@gmail.com',1,0,1000.00,'PayPal'),(18,'vihanga','0123','hfuhfu@gmail.com',1,0,1000.00,'PayPal');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 13:58:07
