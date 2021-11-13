-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dbo.Announcement`
--

DROP TABLE IF EXISTS `dbo.Announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.Announcement` (
  `AnnouncementID` bigint(20) DEFAULT NULL,
  `AnnouncementName` varchar(23) DEFAULT NULL,
  `Designation` varchar(18) DEFAULT NULL,
  `DesignationType` varchar(1) DEFAULT NULL,
  `NumberofPositions` varchar(1) DEFAULT NULL,
  `JobDesc` varchar(18) DEFAULT NULL,
  `CompanyID` tinyint(4) DEFAULT NULL,
  `PostedDatetime` varchar(19) DEFAULT NULL,
  `Location` varchar(9) DEFAULT NULL,
  `RegistrationDeadline` varchar(19) DEFAULT NULL,
  `PrePlacementTalk` tinyint(4) DEFAULT NULL,
  `ShortlistfromResume` tinyint(4) DEFAULT NULL,
  `WrittenTestTechnical` tinyint(4) DEFAULT NULL,
  `WrittenTestAptitude` tinyint(4) DEFAULT NULL,
  `WrittenTestPsychometric` tinyint(4) DEFAULT NULL,
  `GroupDiscussion` tinyint(4) DEFAULT NULL,
  `TechnicalInterview` tinyint(4) DEFAULT NULL,
  `HRInterview` tinyint(4) DEFAULT NULL,
  `PrefferedPeriodofVisit` varchar(23) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.Announcement`
--

LOCK TABLES `dbo.Announcement` WRITE;
/*!40000 ALTER TABLE `dbo.Announcement` DISABLE KEYS */;
INSERT INTO `dbo.Announcement` VALUES (1042021170921,'2_S_01-04-2021 17:09:21','SDE','S','','SDE',2,'2021-04-01 17:09:21','Bangalore','2021-03-31 00:00:00',1,1,1,0,0,1,1,1,'First week of September',3),(1042021202848,'3_S_01-04-2021 20:28:48','SDE','S','6','Software Developer',3,'2021-04-01 20:28:48','Bangalore','2021-03-31 00:00:00',1,1,0,1,0,0,1,0,'',4),(2042021112129,'IITGN_CDS_W','SDE','W','','Software',3,'2021-04-02 11:21:29','Bangalore','',0,1,0,0,0,0,1,1,'First week of September',0),(15042021172527,'Zomato_S','Software Developer','S','5','Develpoe software',5,'2021-04-15 17:25:27','Mumbai','2021-04-17 00:00:00',0,1,1,1,0,0,1,0,'Not sure',1),(29032021190518,'1_J_29-03-2021 19:05:18','SDE','J','2','Software Developer',2,'2021-03-29 19:05:18','Bangalore','2021-03-30 00:00:00',1,0,0,0,0,0,1,0,'First week of September',4);
/*!40000 ALTER TABLE `dbo.Announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.AnnouncementRound`
--

DROP TABLE IF EXISTS `dbo.AnnouncementRound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.AnnouncementRound` (
  `AnnouncementID` bigint(20) DEFAULT NULL,
  `RoundNumber` tinyint(4) DEFAULT NULL,
  `RoundName` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.AnnouncementRound`
--

LOCK TABLES `dbo.AnnouncementRound` WRITE;
/*!40000 ALTER TABLE `dbo.AnnouncementRound` DISABLE KEYS */;
INSERT INTO `dbo.AnnouncementRound` VALUES (1042021170921,0,'Applied'),(1042021170921,1,'HR Round'),(1042021170921,2,'Technical Round'),(1042021202848,0,'Applied'),(1042021202848,1,'Technical Round'),(1042021202848,2,'Selected'),(15042021172527,0,'Applied'),(29032021190518,0,'Applied'),(29032021190518,1,'Technical Round'),(29032021190518,2,'HR Round'),(29032021190518,3,'Selected');
/*!40000 ALTER TABLE `dbo.AnnouncementRound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.AnnouncementStudents`
--

DROP TABLE IF EXISTS `dbo.AnnouncementStudents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.AnnouncementStudents` (
  `AnnouncementID` bigint(20) DEFAULT NULL,
  `StudentRoll` int(11) DEFAULT NULL,
  `StudentName` varchar(13) DEFAULT NULL,
  `ResumePath` varchar(63) DEFAULT NULL,
  `RoundNumber` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.AnnouncementStudents`
--

LOCK TABLES `dbo.AnnouncementStudents` WRITE;
/*!40000 ALTER TABLE `dbo.AnnouncementStudents` DISABLE KEYS */;
INSERT INTO `dbo.AnnouncementStudents` VALUES (29032021190518,17110037,'Chandan Maji','/filesStorage/Resumes/17110037_29032021190518_Chandan Maji.pdf',2),(1042021170921,17110037,'Chandan Maji','/filesStorage/Resumes/17110037_1042021170921_Chandan Maji.pdf',2),(15042021172527,17110037,'Chandan Maji ','/filesStorage/Resumes/17110037_15042021172527_Chandan Maji .pdf',0);
/*!40000 ALTER TABLE `dbo.AnnouncementStudents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.AvailablePrograms`
--

DROP TABLE IF EXISTS `dbo.AvailablePrograms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.AvailablePrograms` (
  `ProgramID` tinyint(4) DEFAULT NULL,
  `DEGREE_NAME` varchar(5) DEFAULT NULL,
  `DISCP_CODE` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.AvailablePrograms`
--

LOCK TABLES `dbo.AvailablePrograms` WRITE;
/*!40000 ALTER TABLE `dbo.AvailablePrograms` DISABLE KEYS */;
INSERT INTO `dbo.AvailablePrograms` VALUES (1,'BTECH','CSE');
/*!40000 ALTER TABLE `dbo.AvailablePrograms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.CDS_employee`
--

DROP TABLE IF EXISTS `dbo.CDS_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.CDS_employee` (
  `CDS_EMP_ID` tinyint(4) DEFAULT NULL,
  `CDS_EMP_FIRST_NAME` varchar(6) DEFAULT NULL,
  `CDS_EMP_LAST_NAME` varchar(4) DEFAULT NULL,
  `CDS_EMP_ROLE` varchar(4) DEFAULT NULL,
  `CDS_EMP_DESIG` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.CDS_employee`
--

LOCK TABLES `dbo.CDS_employee` WRITE;
/*!40000 ALTER TABLE `dbo.CDS_employee` DISABLE KEYS */;
INSERT INTO `dbo.CDS_employee` VALUES (1,'Sample','User','Head','Admin');
/*!40000 ALTER TABLE `dbo.CDS_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.CompanyInfo`
--

DROP TABLE IF EXISTS `dbo.CompanyInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.CompanyInfo` (
  `UserMail` varchar(25) DEFAULT NULL,
  `Password` int(11) DEFAULT NULL,
  `Company` varchar(9) DEFAULT NULL,
  `Country` varchar(5) DEFAULT NULL,
  `Pincode` varchar(6) DEFAULT NULL,
  `Address` varchar(23) DEFAULT NULL,
  `Website` varchar(11) DEFAULT NULL,
  `OrganizationType` varchar(14) DEFAULT NULL,
  `IndustryType` varchar(6) DEFAULT NULL,
  `Mobile` varchar(13) DEFAULT NULL,
  `Person` varchar(12) DEFAULT NULL,
  `PersonDesignation` varchar(10) DEFAULT NULL,
  `CDS_emp_ID` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `CompanyID` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.CompanyInfo`
--

LOCK TABLES `dbo.CompanyInfo` WRITE;
/*!40000 ALTER TABLE `dbo.CompanyInfo` DISABLE KEYS */;
INSERT INTO `dbo.CompanyInfo` VALUES ('chandan.maji@iitgn.ac.in',12345678,'IITGN CDS','India','382355','IIT Gandhinagar, Gujrat','iitgn.ac.in','Private Sector','IT','09913808346','Chandan Maji','HR',1,2,2),('chandan1999maji@gmail.com',12345678,'IITGN CDS','','','','','Private Sector','IT','+919913808346','Chandan Maji','HR',1,2,3),('peeyu704@gmail.com',39954288,'IITGN','India','382355','IIT Gandhinagar','iitgn.ac.in','Private Sector','IT','65956464684','Peeyush','HR',1,2,4),('kalyan.reddy@iitgn.ac.in',1234,'Zomato','INDIA','560064','NOne','Zomato.com','Public Sector','Others','9448569325','Kalyan','HR Manager',1,2,5);
/*!40000 ALTER TABLE `dbo.CompanyInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.DEGREES_LIST`
--

DROP TABLE IF EXISTS `dbo.DEGREES_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.DEGREES_LIST` (
  `DEGREE_NAME` varchar(5) DEFAULT NULL,
  `DEGREE_DESC` varchar(22) DEFAULT NULL,
  `DEGREE_STATUS` tinyint(4) DEFAULT NULL,
  `DEGREE_STATUS_DESC` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.DEGREES_LIST`
--

LOCK TABLES `dbo.DEGREES_LIST` WRITE;
/*!40000 ALTER TABLE `dbo.DEGREES_LIST` DISABLE KEYS */;
INSERT INTO `dbo.DEGREES_LIST` VALUES ('BTECH','Bachelor of Technology',1,'');
/*!40000 ALTER TABLE `dbo.DEGREES_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.EarlyHiring`
--

DROP TABLE IF EXISTS `dbo.EarlyHiring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.EarlyHiring` (
  `AnnouncementID` bigint(20) DEFAULT NULL,
  `JanuaryOnboarding` tinyint(4) DEFAULT NULL,
  `InterestedEarly` tinyint(4) DEFAULT NULL,
  `ExcludeEarlyGraduates` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.EarlyHiring`
--

LOCK TABLES `dbo.EarlyHiring` WRITE;
/*!40000 ALTER TABLE `dbo.EarlyHiring` DISABLE KEYS */;
INSERT INTO `dbo.EarlyHiring` VALUES (29032021190518,0,1,0);
/*!40000 ALTER TABLE `dbo.EarlyHiring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.Eligibility`
--

DROP TABLE IF EXISTS `dbo.Eligibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.Eligibility` (
  `AnnouncementID` bigint(20) DEFAULT NULL,
  `CPI` decimal(3,2) DEFAULT NULL,
  `BacklogsAllowed` tinyint(4) DEFAULT NULL,
  `DegreeName` varchar(5) DEFAULT NULL,
  `Discp_code` varchar(3) DEFAULT NULL,
  `YEAR_CODE` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.Eligibility`
--

LOCK TABLES `dbo.Eligibility` WRITE;
/*!40000 ALTER TABLE `dbo.Eligibility` DISABLE KEYS */;
INSERT INTO `dbo.Eligibility` VALUES (29032021190518,0.00,0,'BTECH','CSE',''),(1042021170921,0.00,0,'BTECH','CSE',''),(1042021202848,0.00,0,'BTECH','CSE',''),(2042021112129,0.00,0,'BTECH','CSE',''),(15042021172527,8.00,1,'BTECH','CSE','');
/*!40000 ALTER TABLE `dbo.Eligibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.Recover`
--

DROP TABLE IF EXISTS `dbo.Recover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.Recover` (
  `UID` varchar(36) DEFAULT NULL,
  `companyID` tinyint(4) DEFAULT NULL,
  `Date` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.Recover`
--

LOCK TABLES `dbo.Recover` WRITE;
/*!40000 ALTER TABLE `dbo.Recover` DISABLE KEYS */;
INSERT INTO `dbo.Recover` VALUES ('7F27740F-1274-4152-B82A-86372C0A6A21',3,'2021-04-02 10:43:37'),('81FD5DF1-26E0-4A6A-9086-AA0B5485226E',5,'2021-10-12 16:26:35'),('A53F0479-38BA-4392-ACF5-4BC39D255BCB',5,'2021-05-25 16:46:29'),('4993A343-56DC-440C-BF9F-938452E81CF0',5,'2021-05-25 16:59:27'),('79461711-BB10-4866-AF16-AE21B5C3A59E',5,'2021-07-27 17:29:12');
/*!40000 ALTER TABLE `dbo.Recover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.SalaryDetails`
--

DROP TABLE IF EXISTS `dbo.SalaryDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.SalaryDetails` (
  `AnnouncementID` bigint(20) DEFAULT NULL,
  `DegreeName` varchar(5) DEFAULT NULL,
  `Basic` int(11) DEFAULT NULL,
  `HRA` mediumint(9) DEFAULT NULL,
  `Others` mediumint(9) DEFAULT NULL,
  `Gross` int(11) DEFAULT NULL,
  `TakeHome` mediumint(9) DEFAULT NULL,
  `CTC` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.SalaryDetails`
--

LOCK TABLES `dbo.SalaryDetails` WRITE;
/*!40000 ALTER TABLE `dbo.SalaryDetails` DISABLE KEYS */;
INSERT INTO `dbo.SalaryDetails` VALUES (29032021190518,'BTECH',6,5,0,12,0,12),(1042021170921,'BTECH',6,5,1,12,0,12),(15042021172527,'BTECH',1000000,100000,50000,1200000,800000,1000000);
/*!40000 ALTER TABLE `dbo.SalaryDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.StudentDetails`
--

DROP TABLE IF EXISTS `dbo.StudentDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.StudentDetails` (
  `stu_roll` int(11) DEFAULT NULL,
  `stu_email` varchar(24) DEFAULT NULL,
  `stu_firstname` varchar(7) DEFAULT NULL,
  `stu_lastname` varchar(5) DEFAULT NULL,
  `stu_middlename` varchar(7) DEFAULT NULL,
  `stu_programcode` tinyint(4) DEFAULT NULL,
  `stu_cpi` decimal(3,2) DEFAULT NULL,
  `stu_enrollmentYear` smallint(6) DEFAULT NULL,
  `stu_hasbacklogs` tinyint(4) DEFAULT NULL,
  `stu_graduationStatus` tinyint(4) DEFAULT NULL,
  `stu_verificationStatus` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.StudentDetails`
--

LOCK TABLES `dbo.StudentDetails` WRITE;
/*!40000 ALTER TABLE `dbo.StudentDetails` DISABLE KEYS */;
INSERT INTO `dbo.StudentDetails` VALUES (17110001,'rachel.green@iitgn.ac.in','Rachel','Green','',1,8.50,2017,0,1,''),(17110021,'anubhav.jain@iitgn.ac.in','Anubhav','Jain','',1,0.00,2017,0,0,''),(17110037,'chandan.maji@iitgn.ac.in','Chandan','Maji','',1,0.00,2017,0,0,''),(17110050,'william.pitt@iitgn.ac.in','William','Pitt','Bradley',1,7.82,2017,1,0,'');
/*!40000 ALTER TABLE `dbo.StudentDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.discipline`
--

DROP TABLE IF EXISTS `dbo.discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.discipline` (
  `DISCP_CODE` varchar(3) DEFAULT NULL,
  `DISCP_DESC` varchar(16) DEFAULT NULL,
  `DISCP_STATUS` tinyint(4) DEFAULT NULL,
  `DISCP_STATUS_DESC` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.discipline`
--

LOCK TABLES `dbo.discipline` WRITE;
/*!40000 ALTER TABLE `dbo.discipline` DISABLE KEYS */;
INSERT INTO `dbo.discipline` VALUES ('CSE','Computer Science',1,'');
/*!40000 ALTER TABLE `dbo.discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.float_registration_form`
--

DROP TABLE IF EXISTS `dbo.float_registration_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.float_registration_form` (
  `float_reg_id` tinyint(4) DEFAULT NULL,
  `regis_open_date` varchar(10) DEFAULT NULL,
  `regis_close_date` varchar(10) DEFAULT NULL,
  `regis_expiry_date` varchar(10) DEFAULT NULL,
  `regis_type` varchar(1) DEFAULT NULL,
  `regis_type_desc` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.float_registration_form`
--

LOCK TABLES `dbo.float_registration_form` WRITE;
/*!40000 ALTER TABLE `dbo.float_registration_form` DISABLE KEYS */;
INSERT INTO `dbo.float_registration_form` VALUES (8,'2021-04-08','2021-04-15','2021-04-30','J',''),(9,'2021-04-07','2021-04-09','2021-04-30','I','');
/*!40000 ALTER TABLE `dbo.float_registration_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.reqList`
--

DROP TABLE IF EXISTS `dbo.reqList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.reqList` (
  `Email` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.reqList`
--

LOCK TABLES `dbo.reqList` WRITE;
/*!40000 ALTER TABLE `dbo.reqList` DISABLE KEYS */;
INSERT INTO `dbo.reqList` VALUES ('skalyanreddy123@gmail.com');
/*!40000 ALTER TABLE `dbo.reqList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo.stu_cds_registration`
--

DROP TABLE IF EXISTS `dbo.stu_cds_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo.stu_cds_registration` (
  `stu_roll` int(11) DEFAULT NULL,
  `float_reg_id` tinyint(4) DEFAULT NULL,
  `stu_regis_status` tinyint(4) DEFAULT NULL,
  `stu_regis_status_desc` varchar(8) DEFAULT NULL,
  `stu_date_of_regis` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo.stu_cds_registration`
--

LOCK TABLES `dbo.stu_cds_registration` WRITE;
/*!40000 ALTER TABLE `dbo.stu_cds_registration` DISABLE KEYS */;
INSERT INTO `dbo.stu_cds_registration` VALUES (17110037,8,1,'','2021-04-09'),(17110037,9,1,'Approved','2021-04-09'),(17110001,8,2,'','2021-04-09'),(17110001,9,0,'Pending','2021-04-09'),(17110050,8,1,'Approved','2021-04-09'),(17110050,9,0,'Pending','2021-04-09');
/*!40000 ALTER TABLE `dbo.stu_cds_registration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-22 15:26:18
