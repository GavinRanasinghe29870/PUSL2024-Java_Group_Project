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
-- Table structure for table `movie_time_slots`
--

DROP TABLE IF EXISTS `movie_time_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_time_slots` (
  `m_id` int NOT NULL,
  `m_time_slot` varchar(50) NOT NULL,
  KEY `m_id` (`m_id`),
  CONSTRAINT `movie_time_slots_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `movies` (`m_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_time_slots`
--

LOCK TABLES `movie_time_slots` WRITE;
/*!40000 ALTER TABLE `movie_time_slots` DISABLE KEYS */;
INSERT INTO `movie_time_slots` VALUES (13,'10:30 AM'),(14,'10:30 AM'),(14,'02:10 PM'),(15,'10:30 AM'),(16,'10:30 AM'),(17,'10:30 AM'),(21,'10:30 AM'),(21,'02:10 PM'),(22,'10:30 AM'),(22,'10:15 PM'),(23,'10:30 AM'),(23,'02:10 PM'),(24,'10:30 AM'),(24,'02:10 PM'),(24,'06:30 PM'),(25,'10:30 AM'),(25,'10:15 PM'),(26,'10:30 AM'),(27,'10:30 AM'),(28,'10:30 AM');
/*!40000 ALTER TABLE `movie_time_slots` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 13:33:30
