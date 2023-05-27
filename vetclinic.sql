-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: vetclinic
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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `idappointments` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `office` varchar(10) DEFAULT NULL,
  `services_idservices` int NOT NULL,
  `medcard_idmedcard` int NOT NULL,
  `doctors_iddoctors` int NOT NULL,
  PRIMARY KEY (`idappointments`,`services_idservices`,`medcard_idmedcard`,`doctors_iddoctors`),
  UNIQUE KEY `date_UNIQUE` (`date`),
  UNIQUE KEY `idappointments_UNIQUE` (`idappointments`),
  KEY `fk_appointments_services1_idx` (`services_idservices`),
  KEY `fk_appointments_doctors1_idx` (`doctors_iddoctors`),
  KEY `fk_appointments_medcard1_idx` (`medcard_idmedcard`),
  CONSTRAINT `fk_appointments_doctors1` FOREIGN KEY (`doctors_iddoctors`) REFERENCES `doctors` (`iddoctors`),
  CONSTRAINT `fk_appointments_medcard1` FOREIGN KEY (`medcard_idmedcard`) REFERENCES `medcard` (`idmedcard`),
  CONSTRAINT `fk_appointments_services1` FOREIGN KEY (`services_idservices`) REFERENCES `services` (`idservices`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Приемы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `iddoctors` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Birthday` date NOT NULL,
  `TelNum` bigint NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Specialization` varchar(45) NOT NULL,
  `Degree` varchar(100) NOT NULL,
  `DateOfHire` date NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iddoctors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ветеринарные врачи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (0,'admin','2000-01-01',1234,'admin@admin.com','testtest','-','-','2000-01-01','1',1),(1,'Дмитрий Петрович Кузнецов','1972-11-18',89153535610,'Doctor13@mail.ru','ул. Павла Корчагина, д. 11','Ветеринарный врач УЗИ','Высшее образование','2020-06-12','12345',0),(2,'Сергей Александрович Кувшинов','1970-09-05',89197595624,'Doctor12@mail.ru','ул. Верхняя Красносельская, д. 14, стр. 1','Ветеринарный врач хирург','Высшее образование','2016-11-01','1234',0),(3,'Светлана Николаевна Яценко','1985-06-30',89047514224,'Doctor11@mail.ru','Серебрянический переулок, д. 4 стр. 1','Главный ветеринарный врач','Высшее образование','2019-05-22','123',0);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medcard`
--

DROP TABLE IF EXISTS `medcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medcard` (
  `idmedcard` int NOT NULL,
  `petname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `breed` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Commentary` varchar(100) DEFAULT NULL,
  `owners_idOwner` int NOT NULL,
  `treatment_idtreatment` int NOT NULL,
  `birthday` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmedcard`,`treatment_idtreatment`,`owners_idOwner`),
  UNIQUE KEY `idmedcard_UNIQUE` (`idmedcard`),
  KEY `fk_medcard_treatment1_idx` (`treatment_idtreatment`),
  KEY `fk_medcard_owners1_idx` (`owners_idOwner`),
  CONSTRAINT `fk_medcard_owners1` FOREIGN KEY (`owners_idOwner`) REFERENCES `owners` (`idOwner`),
  CONSTRAINT `fk_medcard_treatment1` FOREIGN KEY (`treatment_idtreatment`) REFERENCES `treatment` (`idtreatment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='мед. карта животного';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medcard`
--

LOCK TABLES `medcard` WRITE;
/*!40000 ALTER TABLE `medcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `medcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines` (
  `idmedicines` int NOT NULL,
  `Code` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`idmedicines`),
  UNIQUE KEY `idmedicines_UNIQUE` (`idmedicines`),
  UNIQUE KEY `Code_UNIQUE` (`Code`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Лекарственные средства';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (1,'Q1264','Boli Amoksiklav'),(2,'Q2267','Pulvis Amoksiklav'),(3,'Q4112','Amoximag'),(4,'Q1111','Pulvis Amoxicillini 10 %'),(5,'Q8541','Amoxicillin 15 %'),(6,'Q2456','Bimoxyl LA'),(7,'Q4672','Synuxol'),(8,'Q1999','Diofurum'),(9,'Q2256','Cloxamast'),(10,'Q2298','Mastomicin');
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `idOwner` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Birthday` date DEFAULT NULL,
  `TelNum` bigint DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Adress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOwner`),
  UNIQUE KEY `idOwner_UNIQUE` (`idOwner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Хозяин питомца';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Баглаева Алтана','2014-05-14',79024577797,'baglaeva@gmail.com','no');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `idservices` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Cost` varchar(45) NOT NULL,
  PRIMARY KEY (`idservices`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Предоставляемые вет клиникой услуги';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Консультация','лорем ипсум','1000р'),(2,'Прививка от бешенства','лорем ипсум','1000р');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `idtreatment` int NOT NULL,
  `medicines_idmedicines` int NOT NULL,
  `recomendations` varchar(200) NOT NULL,
  PRIMARY KEY (`idtreatment`),
  KEY `fk_treatment_medicines1_idx` (`medicines_idmedicines`),
  CONSTRAINT `fk_treatment_medicines1` FOREIGN KEY (`medicines_idmedicines`) REFERENCES `medicines` (`idmedicines`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='назначенное лечение для животного';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-27  6:33:22
