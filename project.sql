-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: DBMS_PROJECT
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Departments` (
  `name` varchar(100) DEFAULT NULL,
  `dno` int(11) NOT NULL,
  `hod` varchar(100) DEFAULT NULL,
  `strength` int(11) DEFAULT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
/*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
INSERT INTO `Departments` VALUES ('mechanical',2,'Sunil Kumar',7),('civil',3,'Shashikala',20),('asdas',7,'pavan',12),('Lol',9,'Sugyan',4),('Theatre',10,'Sakshi',1);
/*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger str_before_dept_trig before insert on Departments for each row begin set NEW.strength=0; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `External_Marks`
--

DROP TABLE IF EXISTS `External_Marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `External_Marks` (
  `usn` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `subcode` varchar(20) NOT NULL,
  `external` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `grade` char(1) DEFAULT NULL,
  `result` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`usn`,`sem`,`subcode`),
  KEY `subcode` (`subcode`),
  CONSTRAINT `External_Marks_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `Students` (`usn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `External_Marks_ibfk_2` FOREIGN KEY (`subcode`) REFERENCES `Subjects` (`subcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `External_Marks`
--

LOCK TABLES `External_Marks` WRITE;
/*!40000 ALTER TABLE `External_Marks` DISABLE KEYS */;
INSERT INTO `External_Marks` VALUES (1,1,'code4',60,100,NULL,NULL),(3,1,'code4',3,4,'D','FAIL'),(23,3,'code4',45,89,'A','PASS');
/*!40000 ALTER TABLE `External_Marks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger trig before insert on External_Marks for each row begin if(NEW.total > 80) then set NEW.grade='A'; set NEW.result='PASS'; elseif(NEW.total > 70) then set NEW.grade='B';set NEW.result='PASS'; elseif(NEW.total > 60) then set NEW.grade='C';set NEW.result='FAIL'; else set NEW.grade='D';set NEW.result='FAIL'; END if; End */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Internal_Marks`
--

DROP TABLE IF EXISTS `Internal_Marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Internal_Marks` (
  `usn` int(11) NOT NULL,
  `sem` int(11) NOT NULL,
  `subcode` varchar(20) NOT NULL,
  `iat1` int(11) DEFAULT NULL,
  `iat2` int(11) DEFAULT NULL,
  `iat3` int(11) DEFAULT NULL,
  `final_iat` int(11) DEFAULT NULL,
  PRIMARY KEY (`usn`,`sem`,`subcode`),
  KEY `subcode` (`subcode`),
  CONSTRAINT `Internal_Marks_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `Students` (`usn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Internal_Marks_ibfk_2` FOREIGN KEY (`subcode`) REFERENCES `Subjects` (`subcode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Internal_Marks`
--

LOCK TABLES `Internal_Marks` WRITE;
/*!40000 ALTER TABLE `Internal_Marks` DISABLE KEYS */;
INSERT INTO `Internal_Marks` VALUES (22,3,'code4',50,50,50,50),(100,1,'code10',10,20,30,20);
/*!40000 ALTER TABLE `Internal_Marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `usn` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cur_sem` int(11) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL,
  `batch` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`usn`),
  KEY `dno` (`dno`),
  CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `Departments` (`dno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1,'ASHISH GUPTA',1,7,'2019-2020'),(3,'BHOOMIKA M',1,3,'2019-2020'),(4,'BRIJESH BABU',2,7,'2020-2021'),(5,'CHANDAN N',2,3,'2020-2021'),(6,'SASIDHAR REDDY',2,3,'2020-2021'),(7,'DHEERAJ J C',3,7,'2021-2022'),(8,'EBENEZER B',3,3,'2021-2022'),(9,'FOZAIL AKRAM',3,3,'2021-2022'),(10,'GANESH J K',4,7,'2022-2023'),(11,'KRISHNA KESHAN',4,3,'2022-2023'),(12,'LIKITH KUMAR K',4,3,'2022-2023'),(13,'MAMTHA M V',5,7,'2023-2024'),(14,'NISARGA K',5,3,'2023-2024'),(15,'PAVAN RAJKUMAR MAGESH',5,3,'2023-2024'),(16,'PRAKHYATH JAIN',6,7,'2024-2025'),(17,'PRATEEK KUMAR SINGH',6,3,'2024-2025'),(18,'PRATYUSH SINHA',6,3,'2024-2025'),(19,'RICHARD DELWIN MYLOTH',7,7,'2025-2026'),(20,'RISHAB MOHAN',7,3,'2025-2026'),(21,'ROSHNI KUNDU',7,3,'2025-2026'),(22,'rajkumar',7,7,'1234-2324'),(23,'SAGUN',8,3,'2026-2027'),(24,'SMRITHY C',8,3,'2026-2027'),(25,'SOURABH RAJENDRA AWATE',1,7,'2019-2020'),(26,'SOURAV KUMAR GIRI',2,3,'2020-2021'),(27,'SUGYAN ANAND MAHARANA',3,3,'2021-2022'),(70,'aman',3,9,'2010-2013'),(78,'ayush',3,9,'2019-2023'),(100,'GOYAL',1,10,'2010-2013'),(111,'asdrerqw',1,2,'1122-1234'),(890,'qwerty',4,2,'1122-1234'),(1012,'pacasd',4,7,'1122-1234'),(12322,'qwe',3,2,'1122-1234'),(34562,'pretthi',5,2,'1122-1234'),(123456,'asd',1,2,'1122-1234');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger str_trig after insert on Students for each row update Departments set strength=strength+1 where Departments.dno=NEW.dno */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger str_afterins_student_trig after insert on Students for each row update Departments set strength=(strength+1)-1 where Departments.dno=NEW.dno */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger str_afterdel_student_trig after delete on Students for each row update Departments set strength=strength-1 where Departments.dno=OLD.dno */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Subjects`
--

DROP TABLE IF EXISTS `Subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subjects` (
  `subcode` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `credits` int(11) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`subcode`),
  KEY `dno` (`dno`),
  CONSTRAINT `Subjects_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `Departments` (`dno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subjects`
--

LOCK TABLES `Subjects` WRITE;
/*!40000 ALTER TABLE `Subjects` DISABLE KEYS */;
INSERT INTO `Subjects` VALUES ('code10','dance',4,10),('code4','sub4',3,2),('code5','sub5',3,2),('code6','sub6',3,2),('code7','sub7',5,3),('code8','sub8',5,3),('code9','sub9',5,3);
/*!40000 ALTER TABLE `Subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-02 10:27:40
