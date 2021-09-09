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
-- Table structure for table `hobbyactivitylog`
--

DROP TABLE IF EXISTS `hobbyactivitylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobbyactivitylog` (
  `idHobbyActivityLog` int NOT NULL,
  `PlayedHobbyid` int DEFAULT NULL,
  `Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Playing-Duration` int DEFAULT NULL,
  `OrID` int DEFAULT NULL,
  PRIMARY KEY (`idHobbyActivityLog`),
  KEY `PlayedHobbyid_idx` (`PlayedHobbyid`),
  KEY `OrID_idx` (`OrID`),
  CONSTRAINT `OrID` FOREIGN KEY (`OrID`) REFERENCES `orphan` (`idorphan`),
  CONSTRAINT `PlayedHobbyid` FOREIGN KEY (`PlayedHobbyid`) REFERENCES `hobby` (`idHobby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobbyactivitylog`
--

LOCK TABLES `hobbyactivitylog` WRITE;
/*!40000 ALTER TABLE `hobbyactivitylog` DISABLE KEYS */;
INSERT INTO `hobbyactivitylog` VALUES (1,1,'2021-09-07 11:21:56',3,1),(2,1,'2021-09-07 11:21:56',2,2),(3,2,'2021-09-07 11:21:56',5,3),(4,3,'2021-09-07 11:21:56',4,4),(5,5,'2021-09-07 11:21:56',1,5);
/*!40000 ALTER TABLE `hobbyactivitylog` ENABLE KEYS */;
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
