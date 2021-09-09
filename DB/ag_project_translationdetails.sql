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
-- Table structure for table `translationdetails`
--

DROP TABLE IF EXISTS `translationdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translationdetails` (
  `idTranslationDetails` int NOT NULL,
  `WordID` int DEFAULT NULL,
  `TranslatedWordID` int DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idTranslationDetails`),
  KEY `WordID_idx` (`WordID`,`TranslatedWordID`),
  KEY `TranslatedWordID_idx` (`TranslatedWordID`),
  CONSTRAINT `TranslatedWordID` FOREIGN KEY (`TranslatedWordID`) REFERENCES `words` (`idWord`),
  CONSTRAINT `WordID` FOREIGN KEY (`WordID`) REFERENCES `words` (`idWord`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translationdetails`
--

LOCK TABLES `translationdetails` WRITE;
/*!40000 ALTER TABLE `translationdetails` DISABLE KEYS */;
INSERT INTO `translationdetails` VALUES (1,1,2,'2021-09-06 23:03:52',0),(2,1,3,'2021-09-06 23:03:52',0),(3,4,5,'2021-09-06 23:03:52',0),(4,4,6,'2021-09-06 23:03:52',0),(5,7,8,'2021-09-06 23:03:52',0),(6,7,9,'2021-09-06 23:03:52',0);
/*!40000 ALTER TABLE `translationdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-07 11:54:50
