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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idaddress` int NOT NULL AUTO_INCREMENT,
  `Parentid` int NOT NULL,
  `LocationName` varchar(145) DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,0,'Egypt','2021-09-06 22:04:27',0),(2,1,'Cairo','2021-09-06 22:05:24',0),(3,1,'Alexandria','2021-09-06 22:05:24',0),(4,1,'Tanta','2021-09-06 22:05:24',0),(5,1,'Aswan','2021-09-06 22:05:24',0),(6,2,'Tagamoa','2021-09-06 22:12:43',0),(7,3,'Kornesh','2021-09-06 22:12:43',0),(8,4,'Nahas Street','2021-09-06 22:12:43',0),(9,5,'Abu simbl','2021-09-06 22:12:43',0),(10,6,'90 Street','2021-09-06 22:12:43',0);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoption`
--

DROP TABLE IF EXISTS `adoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption` (
  `idadoption` int NOT NULL,
  `iduser` int NOT NULL,
  `idorphan` int NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idadoption`),
  KEY `orphanid_idx` (`idorphan`),
  KEY `userid_idx` (`iduser`),
  CONSTRAINT `orphanid` FOREIGN KEY (`idorphan`) REFERENCES `orphan` (`idorphan`),
  CONSTRAINT `userid` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption`
--

LOCK TABLES `adoption` WRITE;
/*!40000 ALTER TABLE `adoption` DISABLE KEYS */;
INSERT INTO `adoption` VALUES (1,1,6,'2021-09-06 22:48:57',0),(2,3,2,'2021-09-06 22:48:58',0);
/*!40000 ALTER TABLE `adoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donationdetails`
--

DROP TABLE IF EXISTS `donationdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donationdetails` (
  `iddonation` int NOT NULL,
  `iduser` int NOT NULL,
  `iddonationplatform` int NOT NULL,
  `value` json NOT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`iddonation`),
  KEY `donationoptionid_idx` (`iddonationplatform`),
  KEY `iduser_idx` (`iduser`),
  CONSTRAINT `iddonationplatform` FOREIGN KEY (`iddonationplatform`) REFERENCES `donationplatform` (`iddonationplatform`),
  CONSTRAINT `iduser` FOREIGN KEY (`iduser`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donationdetails`
--

LOCK TABLES `donationdetails` WRITE;
/*!40000 ALTER TABLE `donationdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `donationdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donationoptions`
--

DROP TABLE IF EXISTS `donationoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donationoptions` (
  `iddonationoption` int NOT NULL AUTO_INCREMENT,
  `optionname` varchar(255) NOT NULL,
  `optiontype` enum('NULL','INT','BOOL','STR','OBJ','ARR') NOT NULL,
  `idparent` int NOT NULL DEFAULT '0',
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`iddonationoption`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donationoptions`
--

LOCK TABLES `donationoptions` WRITE;
/*!40000 ALTER TABLE `donationoptions` DISABLE KEYS */;
INSERT INTO `donationoptions` VALUES (1,'Object','OBJ',0,NULL,0),(2,'Array','ARR',0,NULL,0);
/*!40000 ALTER TABLE `donationoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donationplatform`
--

DROP TABLE IF EXISTS `donationplatform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donationplatform` (
  `iddonationplatform` int NOT NULL,
  `donationtplatform` varchar(255) NOT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`iddonationplatform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donationplatform`
--

LOCK TABLES `donationplatform` WRITE;
/*!40000 ALTER TABLE `donationplatform` DISABLE KEYS */;
/*!40000 ALTER TABLE `donationplatform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donationplatformoption`
--

DROP TABLE IF EXISTS `donationplatformoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donationplatformoption` (
  `iddonationpaymentoption` int NOT NULL,
  `iddonationpayment` int NOT NULL,
  `idoption` int NOT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`iddonationpaymentoption`),
  KEY `Donationid_idx` (`iddonationpayment`),
  KEY `Optionid_idx` (`idoption`),
  CONSTRAINT `Donationid` FOREIGN KEY (`iddonationpayment`) REFERENCES `donationplatform` (`iddonationplatform`),
  CONSTRAINT `Optionid` FOREIGN KEY (`idoption`) REFERENCES `donationoptions` (`iddonationoption`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donationplatformoption`
--

LOCK TABLES `donationplatformoption` WRITE;
/*!40000 ALTER TABLE `donationplatformoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `donationplatformoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `idFiles` int NOT NULL,
  `Filename` varchar(145) DEFAULT NULL,
  `FilePhysicalpath` varchar(445) DEFAULT NULL,
  `UserfileId` int DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idFiles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'Zeyad-File','C/Files/ZeyadFile',1,'2021-09-06 23:10:15',0),(2,'Abdo-File','C/Files/abdoFile',2,'2021-09-06 23:10:15',0),(3,'Kero-File','C/Files/kiroFile',3,'2021-09-06 23:10:15',0);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthstatustypes`
--

DROP TABLE IF EXISTS `healthstatustypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthstatustypes` (
  `idHealthStatusTypes` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idHealthStatusTypes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthstatustypes`
--

LOCK TABLES `healthstatustypes` WRITE;
/*!40000 ALTER TABLE `healthstatustypes` DISABLE KEYS */;
INSERT INTO `healthstatustypes` VALUES (1,'Fever','2021-09-07 11:41:26',0),(2,'Back Pain','2021-09-07 11:41:26',0),(3,'Coughing','2021-09-07 11:41:26',0),(4,'Stomachache','2021-09-07 11:41:26',0),(5,'Headache','2021-09-07 11:41:26',0),(6,'Healthy','2021-09-07 11:42:45',0);
/*!40000 ALTER TABLE `healthstatustypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobby`
--

DROP TABLE IF EXISTS `hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobby` (
  `idHobby` int NOT NULL,
  `Hobby name` varchar(100) DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idHobby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobby`
--

LOCK TABLES `hobby` WRITE;
/*!40000 ALTER TABLE `hobby` DISABLE KEYS */;
INSERT INTO `hobby` VALUES (1,'Football','2021-09-07 05:16:20',0),(2,'Reading','2021-09-07 05:16:20',0),(3,'Drawing','2021-09-07 05:16:20',0),(4,'Basketball','2021-09-07 05:16:20',0),(5,'Running','2021-09-07 05:16:20',0);
/*!40000 ALTER TABLE `hobby` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `idLanguage` int NOT NULL,
  `LanguageName` varchar(145) DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idLanguage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English','2021-09-06 23:03:44',0),(2,'Arabic','2021-09-06 23:03:44',0),(3,'German','2021-09-06 23:03:44',0);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `idMessages` int NOT NULL,
  `MessageText` json DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  `MessageTypeID` int DEFAULT NULL,
  PRIMARY KEY (`idMessages`),
  KEY `MessageTypeID_idx` (`MessageTypeID`),
  CONSTRAINT `MessageTypeID` FOREIGN KEY (`MessageTypeID`) REFERENCES `messagetype` (`idMessageType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,NULL,'2021-09-06 23:03:52',0,1),(2,NULL,'2021-09-06 23:03:52',0,1),(3,NULL,'2021-09-06 23:03:52',0,2);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messagetouser`
--

DROP TABLE IF EXISTS `messagetouser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messagetouser` (
  `idMessagetouser` int NOT NULL,
  `Messageid` int DEFAULT NULL,
  `UserMessageId` int DEFAULT NULL,
  `Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idMessagetouser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messagetouser`
--

LOCK TABLES `messagetouser` WRITE;
/*!40000 ALTER TABLE `messagetouser` DISABLE KEYS */;
INSERT INTO `messagetouser` VALUES (1,1,1,'2021-09-06 23:03:52',0),(2,2,5,'2021-09-06 23:03:52',0),(3,3,2,'2021-09-06 23:03:52',0);
/*!40000 ALTER TABLE `messagetouser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messagetype`
--

DROP TABLE IF EXISTS `messagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messagetype` (
  `idMessageType` int NOT NULL,
  `MessageType` varchar(45) DEFAULT NULL,
  `Createdat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idMessageType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messagetype`
--

LOCK TABLES `messagetype` WRITE;
/*!40000 ALTER TABLE `messagetype` DISABLE KEYS */;
INSERT INTO `messagetype` VALUES (1,'Error','2021-09-06 23:15:42',0),(2,'Email','2021-09-06 23:15:42',0),(3,'Warning','2021-09-07 11:12:21',0);
/*!40000 ALTER TABLE `messagetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orphan`
--

DROP TABLE IF EXISTS `orphan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orphan` (
  `idorphan` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  `IsAdopted` tinyint DEFAULT '0',
  `IsMale` tinyint DEFAULT NULL,
  PRIMARY KEY (`idorphan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orphan`
--

LOCK TABLES `orphan` WRITE;
/*!40000 ALTER TABLE `orphan` DISABLE KEYS */;
INSERT INTO `orphan` VALUES (1,'Ahmed',10,'2021-09-07 05:19:01',0,0,1),(2,'Mohamed',12,'2021-09-07 05:19:01',0,0,1),(3,'Salma',6,'2021-09-07 05:19:01',0,0,0),(4,'Rana',8,'2021-09-07 05:19:01',0,0,0),(5,'Mina',5,'2021-09-07 05:19:01',0,0,1),(6,'Haidy',15,'2021-09-07 05:19:01',0,0,0);
/*!40000 ALTER TABLE `orphan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orphanhealthdetails`
--

DROP TABLE IF EXISTS `orphanhealthdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orphanhealthdetails` (
  `idOrphanHealthDetails` int NOT NULL,
  `OrpId` int DEFAULT NULL,
  `StatustpyeId` int DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idOrphanHealthDetails`),
  KEY `OrpId_idx` (`OrpId`),
  KEY `StatustpyeId_idx` (`StatustpyeId`),
  CONSTRAINT `OrpId` FOREIGN KEY (`OrpId`) REFERENCES `orphan` (`idorphan`),
  CONSTRAINT `StatustpyeId` FOREIGN KEY (`StatustpyeId`) REFERENCES `healthstatustypes` (`idHealthStatusTypes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orphanhealthdetails`
--

LOCK TABLES `orphanhealthdetails` WRITE;
/*!40000 ALTER TABLE `orphanhealthdetails` DISABLE KEYS */;
INSERT INTO `orphanhealthdetails` VALUES (1,1,5,'2021-09-07 11:41:45',0),(2,2,3,'2021-09-07 11:41:45',0),(3,3,2,'2021-09-07 11:41:45',0),(4,4,4,'2021-09-07 11:41:45',0),(5,5,1,'2021-09-07 11:41:45',0);
/*!40000 ALTER TABLE `orphanhealthdetails` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page` (
  `idpage` int NOT NULL,
  `Pagename` varchar(245) DEFAULT NULL,
  `idparent` int NOT NULL DEFAULT '0',
  `Physical Addres` varchar(245) DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idpage`),
  KEY `parent page ID_idx` (`idparent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'Homepage',0,'Homepage.HTML','2021-09-06 22:44:42',0),(2,'DonationPage',1,'DonationPage.HTML','2021-09-06 22:44:42',0),(3,'ViewOrphansPage',1,'ViewOrphansPage.HTML','2021-09-06 22:44:42',0),(4,'MyProfile',1,'MyProfile.HTML','2021-09-06 22:44:42',0),(5,'PayDonation',2,'PayDonation.HTML','2021-09-06 22:44:42',0);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `idReport` int NOT NULL,
  `ReportName` varchar(45) DEFAULT NULL,
  `UserReport` int DEFAULT NULL,
  `SQLStatement` text,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idReport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,'Orphan Health Report',4,'Text','2021-09-06 23:12:16',0),(2,'Orphan House report',5,'Text','2021-09-06 23:12:16',0),(3,'Profilereport',1,'Text','2021-09-06 23:12:16',0),(4,'Profilereport',2,'Text','2021-09-06 23:12:16',0),(5,'Profilereport',3,'Text','2021-09-06 23:12:16',0),(6,'Profilereport',4,'Text','2021-09-06 23:12:16',0),(7,'Profilereport',5,'Text','2021-09-06 23:12:16',0);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telephone`
--

DROP TABLE IF EXISTS `telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telephone` (
  `idtelephone` int NOT NULL,
  `TelphoneNumber` varchar(45) DEFAULT NULL,
  `Carrier` varchar(45) DEFAULT NULL,
  `usertelephone` int DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idtelephone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephone`
--

LOCK TABLES `telephone` WRITE;
/*!40000 ALTER TABLE `telephone` DISABLE KEYS */;
INSERT INTO `telephone` VALUES (1,'0128057578','Orange',1,'2021-09-06 22:37:46',0),(2,'0102457887','Vodafone',3,'2021-09-06 22:37:46',0),(3,'0114576789','Etisalat',2,'2021-09-06 22:37:46',0);
/*!40000 ALTER TABLE `telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `idThemes` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Colour` varchar(45) DEFAULT NULL,
  `Position` varchar(45) DEFAULT NULL,
  `Style` varchar(45) DEFAULT NULL,
  `BackGroundColour` varchar(45) DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `Isdeleted` tinyint DEFAULT '0',
  `Text Colour` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idThemes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'View button','Red','North','Italic','White','2021-09-06 23:08:30',0,'Black'),(2,'Pay Donation Button','Blue','South','Bold','Black','2021-09-06 23:08:30',0,'White'),(3,'My Profile Button','Black','Middle','Bold','Grey','2021-09-06 23:08:30',0,'Blue');
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactionlog`
--

DROP TABLE IF EXISTS `transactionlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactionlog` (
  `idTransactionLog` int NOT NULL,
  `TransactionMessage` text,
  `TransactionUserId` int DEFAULT NULL,
  `TransactionDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idTransactionLog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactionlog`
--

LOCK TABLES `transactionlog` WRITE;
/*!40000 ALTER TABLE `transactionlog` DISABLE KEYS */;
INSERT INTO `transactionlog` VALUES (1,'You Updated your Profile',1,'2021-09-06 23:32:48',0),(2,'You Updated Salma Health Status',4,'2021-09-06 23:32:48',0);
/*!40000 ALTER TABLE `transactionlog` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `IsMale` tinyint DEFAULT NULL,
  `IsMarried` tinyint DEFAULT NULL,
  `CreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  `typeid` int DEFAULT NULL,
  `AddressID` int DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  KEY `Usertypeid_idx` (`typeid`) /*!80000 INVISIBLE */,
  KEY `AddressID_idx` (`AddressID`),
  CONSTRAINT `AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`idaddress`),
  CONSTRAINT `typeid` FOREIGN KEY (`typeid`) REFERENCES `usertype` (`idusertype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Zeyad Magdy','12',1,2,'2021-09-06 22:41:45',0,2,6),(2,'Abdo Essam','123',1,2,'2021-09-06 22:41:45',0,4,3),(3,'Kero','1234',1,2,'2021-09-06 22:41:45',0,2,4),(4,'Salma Fouad','12345',2,2,'2021-09-06 22:41:45',0,3,5),(5,'Dr Ayman','1',1,2,'2021-09-06 22:41:45',0,1,2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertype` (
  `idusertype` int NOT NULL,
  `typename` varchar(32) DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idusertype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (1,'Admin','2021-09-06 22:37:46',0),(2,'NormalUser','2021-09-06 22:37:46',0),(3,'Caretaker','2021-09-06 22:37:46',0),(4,'Teacher','2021-09-06 22:37:46',0);
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertypepage`
--

DROP TABLE IF EXISTS `usertypepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertypepage` (
  `idusertypepage` int NOT NULL,
  `usertypeid` int DEFAULT NULL,
  `pageid` int DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idusertypepage`),
  UNIQUE KEY `userpages_idx` (`usertypeid`,`pageid`),
  KEY `pageid_idx` (`pageid`),
  KEY `usertypeid_idx` (`usertypeid`) /*!80000 INVISIBLE */,
  CONSTRAINT `pageid` FOREIGN KEY (`pageid`) REFERENCES `page` (`idpage`),
  CONSTRAINT `usertypeid` FOREIGN KEY (`usertypeid`) REFERENCES `usertype` (`idusertype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertypepage`
--

LOCK TABLES `usertypepage` WRITE;
/*!40000 ALTER TABLE `usertypepage` DISABLE KEYS */;
INSERT INTO `usertypepage` VALUES (1,1,1,'2021-09-07 05:19:01',0),(2,1,2,'2021-09-07 05:19:01',0),(3,1,3,'2021-09-07 05:19:01',0),(4,1,4,'2021-09-07 05:19:01',0),(5,1,5,'2021-09-07 05:19:01',0),(6,3,3,'2021-09-07 05:19:01',0),(7,3,4,'2021-09-07 05:19:01',0),(8,4,3,'2021-09-07 05:19:01',0),(9,4,4,'2021-09-07 05:19:01',0),(10,2,1,'2021-09-07 05:19:01',0),(11,2,2,'2021-09-07 05:19:01',0),(12,2,3,'2021-09-07 05:19:01',0),(13,2,4,'2021-09-07 05:19:01',0),(14,2,5,'2021-09-07 05:19:01',0);
/*!40000 ALTER TABLE `usertypepage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `words`
--

DROP TABLE IF EXISTS `words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `words` (
  `idWord` int NOT NULL,
  `Word` varchar(245) DEFAULT NULL,
  `Languageid` int DEFAULT NULL,
  `Createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  `IsDeleted` tinyint DEFAULT '0',
  PRIMARY KEY (`idWord`),
  KEY `Languageid_idx` (`Languageid`),
  CONSTRAINT `Languageid` FOREIGN KEY (`Languageid`) REFERENCES `language` (`idLanguage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `words`
--

LOCK TABLES `words` WRITE;
/*!40000 ALTER TABLE `words` DISABLE KEYS */;
INSERT INTO `words` VALUES (1,'Profile',1,'2021-09-06 23:03:49',0),(2,'الملف الشخصي',2,'2021-09-06 23:03:49',0),(3,'Profile',3,'2021-09-06 23:03:49',0),(4,'Donate',1,'2021-09-06 23:03:49',0),(5,'التبرع',2,'2021-09-06 23:03:49',0),(6,'Spenden',3,'2021-09-06 23:03:49',0),(7,'View Orphans',1,'2021-09-06 23:03:49',0),(8,'مشاهدة ملف اليتامي',2,'2021-09-06 23:03:49',0),(9,'Waisen ansehen',3,'2021-09-06 23:03:49',0);
/*!40000 ALTER TABLE `words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-07 11:55:01
