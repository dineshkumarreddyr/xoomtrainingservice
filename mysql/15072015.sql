-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: xoomtrainings
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `countrylist`
--

DROP TABLE IF EXISTS `countrylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countrylist` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(200) NOT NULL,
  PRIMARY KEY (`countryid`),
  UNIQUE KEY `countryid_UNIQUE` (`countryid`),
  UNIQUE KEY `countryname_UNIQUE` (`countryname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='List of all countries across the globe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrylist`
--

LOCK TABLES `countrylist` WRITE;
/*!40000 ALTER TABLE `countrylist` DISABLE KEYS */;
INSERT INTO `countrylist` VALUES (6,'India'),(7,'Outside of India');
/*!40000 ALTER TABLE `countrylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursedetails`
--

DROP TABLE IF EXISTS `coursedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursedetails` (
  `xtcoursedetailid` int(11) NOT NULL AUTO_INCREMENT,
  `xtcoursename` varchar(200) NOT NULL,
  `xtcoursedescription` longtext,
  `xtcoursestartdate` date NOT NULL,
  `xtcoursedurationtype` varchar(100) NOT NULL,
  `xtcourseduration` int(11) NOT NULL,
  `xtcoursedays` longtext NOT NULL,
  `xtcoursestarttime` time NOT NULL,
  `xtcourseendtime` time NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createduser` varchar(50) DEFAULT NULL,
  `modifieduser` varchar(50) DEFAULT NULL,
  `xtcourseid` int(11) NOT NULL,
  PRIMARY KEY (`xtcoursedetailid`),
  UNIQUE KEY `xtcoursename_UNIQUE` (`xtcoursename`),
  UNIQUE KEY `xtcourseid_UNIQUE` (`xtcourseid`),
  CONSTRAINT `xtcourseid` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursedetails`
--

LOCK TABLES `coursedetails` WRITE;
/*!40000 ALTER TABLE `coursedetails` DISABLE KEYS */;
INSERT INTO `coursedetails` VALUES (2,'Big Data and Hadoop','Become a hadoop expert by mastering MapReduce, Yarn, Pig, Hive, HBase, Oozie, Flume and Sqoop while working on industry based use-cases and Projects','2015-07-20','Week',5,'Sat, Sun','07:00:00','10:00:00',NULL,NULL,NULL,NULL,20),(3,'SAP ABAP','Resource of an Oraganization','2015-06-15','Week',12,'Week days','20:00:00','22:00:00',NULL,NULL,NULL,NULL,14),(4,'PEGA','Starting a Pega7 Rule','2015-07-22','Week',8,'Sat,Sun','18:00:00','21:00:00',NULL,NULL,NULL,NULL,15),(5,'Hadoop Adminstrator','Load Data and Run Applications','2015-06-16','Week',12,'Week days','06:00:00','08:00:00',NULL,NULL,NULL,NULL,16),(6,'Java','OOPs Programming','2015-05-26','Week',9,'Sat,Sun','09:00:00','11:00:00',NULL,NULL,NULL,NULL,17),(7,'APACHE SPARK AND SCALA','Traditional RDBMS Databases vs Big Data','2015-06-22','Week',21,'Sat,Sun','13:00:00','15:00:00',NULL,NULL,NULL,NULL,18),(8,'APACHE CASSANDRA','About Apache Cassandra','2015-05-29','Week',11,'Week days','19:00:00','21:00:00',NULL,NULL,NULL,NULL,19),(9,'Android Development','Mobile Application Development','2015-07-02','Week',6,'Sat,Sun','09:00:00','12:00:00',NULL,NULL,NULL,NULL,21),(10,'Mongo DB','What is Mongo DB and Why?','2015-06-22','Week',9,'Week days','10:00:00','12:00:00',NULL,NULL,NULL,NULL,22),(11,'Oracle DBA','Architecture & Configuration','2015-07-13','Week',7,'Week days','09:00:00','12:00:00',NULL,NULL,NULL,NULL,23),(12,'Microstrategy','Microstrategy Architecture,Desktop','2015-08-02','Week',8,'Week days','11:00:00','13:00:00',NULL,NULL,NULL,NULL,24),(13,'Selenium','When selenium can useful in testing','2015-06-16','Week',16,'Sat,Sun','09:00:00','12:00:00',NULL,NULL,NULL,NULL,25);
/*!40000 ALTER TABLE `coursedetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savedcart`
--

DROP TABLE IF EXISTS `savedcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savedcart` (
  `idsavedcart` int(11) NOT NULL AUTO_INCREMENT,
  `transactionid` text NOT NULL,
  `xtcourseid` int(11) NOT NULL,
  `xtuserid` int(11) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createduser` varchar(50) NOT NULL DEFAULT 'Admin',
  `modifieduser` varchar(50) NOT NULL DEFAULT 'Admin',
  `enrollstatus` varchar(10) NOT NULL DEFAULT 'saved',
  PRIMARY KEY (`idsavedcart`),
  UNIQUE KEY `idsavedcart_UNIQUE` (`idsavedcart`),
  KEY `savedcartcourseid_idx` (`xtcourseid`),
  KEY `savedcartuserid_idx` (`xtuserid`),
  CONSTRAINT `savedcartcourseid` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savedcartuserid` FOREIGN KEY (`xtuserid`) REFERENCES `xtusers` (`xtuserid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savedcart`
--

LOCK TABLES `savedcart` WRITE;
/*!40000 ALTER TABLE `savedcart` DISABLE KEYS */;
INSERT INTO `savedcart` VALUES (26,'1vmsbicraiu9s14ct6d3hcp1p',15,2,NULL,NULL,'dinesh.rachumalla@hotmail.com','dinesh.rachumalla@hotmail.com','saved');
/*!40000 ALTER TABLE `savedcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xtcoursefaq`
--

DROP TABLE IF EXISTS `xtcoursefaq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xtcoursefaq` (
  `idxtcoursefaq` int(11) NOT NULL AUTO_INCREMENT,
  `xtcoursequestion` text NOT NULL,
  `xtcourseasnwer` longtext NOT NULL,
  `xtcourseid` int(11) NOT NULL,
  `createduser` varchar(50) DEFAULT 'Admin',
  `modifieduser` varchar(50) DEFAULT 'Admin',
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`idxtcoursefaq`),
  UNIQUE KEY `idxtcoursefaq_UNIQUE` (`idxtcoursefaq`),
  KEY `xtcourseidfaq` (`xtcourseid`),
  CONSTRAINT `xtcourseidfaq` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Frequently asked questions for particular course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xtcoursefaq`
--

LOCK TABLES `xtcoursefaq` WRITE;
/*!40000 ALTER TABLE `xtcoursefaq` DISABLE KEYS */;
INSERT INTO `xtcoursefaq` VALUES (4,'Vivamus sagittis egestas mauris','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sagittis egestas mauris ut vehicula. Cras viverra ac orci ac aliquam. Nulla eget condimentum mauris, eget tincidunt est.',14,'Admin','Admin','2015-05-28 01:36:42','2015-05-28 01:36:42'),(5,'Cras viverra ac orci ac','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sagittis egestas mauris ut vehicula. Cras viverra ac orci ac aliquam. Nulla eget condimentum mauris, eget tincidunt est.',14,'Admin','Admin','2015-05-28 01:36:42','2015-05-28 01:36:42'),(6,'Sed Diam Nonummy Euismod','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sagittis egestas mauris ut vehicula. Cras viverra ac orci ac aliquam. Nulla eget condimentum mauris, eget tincidunt est.',14,'Admin','Admin','2015-05-28 01:36:42','2015-05-28 01:36:42');
/*!40000 ALTER TABLE `xtcoursefaq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xtcoursereviews`
--

DROP TABLE IF EXISTS `xtcoursereviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xtcoursereviews` (
  `xtcoursereviewid` int(11) NOT NULL AUTO_INCREMENT,
  `xtlearners` int(11) NOT NULL DEFAULT '0',
  `xtrating` int(11) NOT NULL DEFAULT '2',
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `createduser` varchar(50) DEFAULT NULL,
  `modifieduser` varchar(50) DEFAULT NULL,
  `xtcourseid` int(11) NOT NULL,
  PRIMARY KEY (`xtcoursereviewid`),
  KEY `xtratingcourseid` (`xtcourseid`),
  CONSTRAINT `xtratingcourseid` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xtcoursereviews`
--

LOCK TABLES `xtcoursereviews` WRITE;
/*!40000 ALTER TABLE `xtcoursereviews` DISABLE KEYS */;
INSERT INTO `xtcoursereviews` VALUES (1,200,5,NULL,NULL,NULL,NULL,14),(2,300,4,NULL,NULL,NULL,NULL,15),(3,150,2,NULL,NULL,NULL,NULL,16),(4,300,4,NULL,NULL,NULL,NULL,17),(5,200,5,NULL,NULL,NULL,NULL,18),(6,100,4,NULL,NULL,NULL,NULL,19),(7,200,4,NULL,NULL,NULL,NULL,20),(8,500,5,NULL,NULL,NULL,NULL,21),(9,600,3,NULL,NULL,NULL,NULL,22),(10,200,5,NULL,NULL,NULL,NULL,23),(11,400,5,NULL,NULL,NULL,NULL,24),(12,150,5,NULL,NULL,NULL,NULL,25);
/*!40000 ALTER TABLE `xtcoursereviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xtcourses`
--

DROP TABLE IF EXISTS `xtcourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xtcourses` (
  `xtcourseid` int(11) NOT NULL AUTO_INCREMENT,
  `xtcoursename` varchar(100) NOT NULL,
  `xtcourseshortdescp` longtext,
  `xtcourseduration` varchar(100) DEFAULT NULL,
  `xtinrprice` int(11) NOT NULL,
  `xtcourseimg` longtext,
  `xtcourserating` int(11) NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `xtcoursetype` varchar(100) NOT NULL,
  `xtusprice` int(11) NOT NULL,
  PRIMARY KEY (`xtcourseid`),
  UNIQUE KEY `xtcourseid_UNIQUE` (`xtcourseid`),
  UNIQUE KEY `xtcoursename_UNIQUE` (`xtcoursename`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xtcourses`
--

LOCK TABLES `xtcourses` WRITE;
/*!40000 ALTER TABLE `xtcourses` DISABLE KEYS */;
INSERT INTO `xtcourses` VALUES (14,'SAP ABAP','Provides training and Placement','48',12500,'http://45.55.171.166:9545/images/sap.png',5,NULL,NULL,'recommended',340),(15,'PEGA','Pega training','32',43332,'http://45.55.171.166:9545/images/pega.png',4,NULL,NULL,'recommended',230),(16,'HADOOP-ADMINISTRATOR','Hadoop big data training','23',12400,'http://45.55.171.166:9545/images/hadoop-admin.png',5,NULL,NULL,'recommended',430),(17,'JAVA','Java J2EE','54',45000,'http://45.55.171.166:9545/images/java.png',5,NULL,NULL,'recommended',122),(18,'APACHE SPARK AND SCALA','Training and Placement','22',32200,'http://45.55.171.166:9545/images/apachespark.png',5,NULL,NULL,'popular',678),(19,'APACHE CASSANDRA','Developmet and learning','45',23000,'http://45.55.171.166:9545/images/cassandra.png',4,NULL,NULL,'popular',211),(20,'BIG DATA - HADOOP','big data learning','12',12000,'http://45.55.171.166:9545/images/hadoop.png',5,NULL,NULL,'popular',433),(21,'ANDROID DEVELOPMENT','Mobile android development','12',10000,'http://45.55.171.166:9545/images/android.png',4,NULL,NULL,'popular',765),(22,'MONGO DB','Data management','8',3000,'http://45.55.171.166:9545/images/mongo-db.png',5,NULL,NULL,'popular',322),(23,'ORACLE DBA','Database management','60',43000,'http://45.55.171.166:9545/images/oracle.png',5,NULL,NULL,'popular',111),(24,'MICROSTRATEGY','Training and real time experience','30',30000,'http://45.55.171.166:9545/images/microsthatagy.png',5,NULL,NULL,'popular',987),(25,'SELENIUM','Testing realtime learning','15',15000,'http://45.55.171.166:9545/images/selinum.png',4,NULL,NULL,'popular',211);
/*!40000 ALTER TABLE `xtcourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xtcoursespec`
--

DROP TABLE IF EXISTS `xtcoursespec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xtcoursespec` (
  `idxtcoursespec` int(11) NOT NULL AUTO_INCREMENT,
  `xtaboutcourse` longtext NOT NULL,
  `xtcurriculum` longtext NOT NULL,
  `xtcourseid` int(11) NOT NULL,
  `createduser` varchar(50) DEFAULT 'Admin',
  `modifieduser` varchar(50) DEFAULT 'Admin',
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`idxtcoursespec`),
  KEY `xtcourseidspec` (`xtcourseid`),
  CONSTRAINT `xtcourseidspec` FOREIGN KEY (`xtcourseid`) REFERENCES `xtcourses` (`xtcourseid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xtcoursespec`
--

LOCK TABLES `xtcoursespec` WRITE;
/*!40000 ALTER TABLE `xtcoursespec` DISABLE KEYS */;
INSERT INTO `xtcoursespec` VALUES (1,'Duis autem eum iriure dolor in hendrerit in vulputate velit esse molestie consequat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat.','Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.',14,'Admin','Admin','2015-05-28 01:29:25','2015-05-28 01:29:25');
/*!40000 ALTER TABLE `xtcoursespec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xtusers`
--

DROP TABLE IF EXISTS `xtusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xtusers` (
  `xtuserid` int(11) NOT NULL AUTO_INCREMENT,
  `xtuserfirstname` varchar(60) NOT NULL,
  `xtuserlastname` varchar(60) NOT NULL,
  `xtusernumber` varchar(20) NOT NULL,
  `xtuserindian` char(1) NOT NULL,
  `xtusercountry` varchar(50) NOT NULL,
  `xtusername` varchar(100) DEFAULT NULL,
  `xtuseremail` varchar(100) DEFAULT NULL,
  `xtuserpassword` longtext NOT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `xtactivestate` int(11) NOT NULL,
  PRIMARY KEY (`xtuserid`),
  UNIQUE KEY `xtusername_UNIQUE` (`xtusername`),
  UNIQUE KEY `xtuseremail_UNIQUE` (`xtuseremail`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Store sign up users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xtusers`
--

LOCK TABLES `xtusers` WRITE;
/*!40000 ALTER TABLE `xtusers` DISABLE KEYS */;
INSERT INTO `xtusers` VALUES (2,'Dinesh','Rachumalla','9738134646','1','India','dinesh.rachumalla@hotmail.com','dinesh.rachumalla@hotmail.com','f461de21f86ad8a4237ee17f0fee2257','2015-05-22 20:32:58','2015-05-22 20:32:58',1),(3,'k','raju','9040823680','1','Outside of India','raju@innovinit.com','raju@innovinit.com','4f2b1dcedc2b694d22a20821f3ee7918','2015-06-27 08:34:08','2015-06-27 08:34:08',0),(4,'sunil','puvvada','9550946216','1','India','pgksunilkumar@innovinit.com','pgksunilkumar@innovinit.com','edc2e08876a050db4e4350d9e67bb612','2015-06-27 08:34:17','2015-06-27 08:34:17',0),(5,'sunil','puvvada','9550946216','1','India','sunil.innovinit@gmail.com','sunil.innovinit@gmail.com','edc2e08876a050db4e4350d9e67bb612','2015-06-27 08:46:45','2015-06-27 08:46:45',0),(6,'sunil','puvvada','9550946216','1','India','pgksunilkumar@gmail.com','pgksunilkumar@gmail.com','f461de21f86ad8a4237ee17f0fee2257','2015-07-08 13:06:11','2015-07-08 13:06:11',0),(7,'sunil','innovin','8977719969','1','India','pgkskumar@gmail.com','pgkskumar@gmail.com','243e565b6feda40244318aea52a55d24','2015-07-08 13:07:47','2015-07-08 13:07:47',0),(8,'aplaraju','k','9040823680','1','India','aplarajuk@gmail.com','aplarajuk@gmail.com','4f2b1dcedc2b694d22a20821f3ee7918','2015-07-08 13:20:59','2015-07-08 13:20:59',0);
/*!40000 ALTER TABLE `xtusers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-15  2:42:15
