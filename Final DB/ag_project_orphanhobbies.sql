-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: ag_project
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `orphanhobbies`
--

DROP TABLE IF EXISTS `orphanhobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orphanhobbies` (
  `idOrphanHobbies` int NOT NULL AUTO_INCREMENT,
  `Orphanidref` int DEFAULT NULL,
  `Hobbyid` int DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idOrphanHobbies`),
  KEY `Hobbyid_idx` (`Hobbyid`),
  KEY `Orphanidref_idx` (`Orphanidref`),
  CONSTRAINT `Hobbyid` FOREIGN KEY (`Hobbyid`) REFERENCES `hobby` (`idHobby`),
  CONSTRAINT `Orphanidref` FOREIGN KEY (`Orphanidref`) REFERENCES `orphan` (`idorphan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orphanhobbies`
--

LOCK TABLES `orphanhobbies` WRITE;
/*!40000 ALTER TABLE `orphanhobbies` DISABLE KEYS */;
INSERT INTO `orphanhobbies` VALUES (1,3,4,'2021-09-07 05:19:01',0),(2,2,3,'2021-09-07 05:19:01',0),(3,1,1,'2021-09-07 05:19:01',0),(4,4,2,'2021-09-07 05:19:01',0),(5,5,1,'2021-09-07 05:19:01',0),(6,6,5,'2021-09-07 05:19:01',0);
/*!40000 ALTER TABLE `orphanhobbies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-07 11:54:51
