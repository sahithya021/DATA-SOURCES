-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: Sports
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `athletes`
--

DROP TABLE IF EXISTS `athletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `athletes` (
  `AthleteID` int(11) NOT NULL,
  `FullName` varchar(30) NOT NULL,
  `DateofBirth` date NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `EmailAddress` varchar(30) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `TeamID` int(11) NOT NULL,
  PRIMARY KEY (`AthleteID`),
  KEY `Athletes_Teams` (`TeamID`),
  CONSTRAINT `Athletes_Teams` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athletes`
--

LOCK TABLES `athletes` WRITE;
/*!40000 ALTER TABLE `athletes` DISABLE KEYS */;
INSERT INTO `athletes` VALUES (1,'LeBron James','1984-12-30','Male','lbj23@gmail.com',12151234,1),(2,'Stephen Curry','1988-03-14','Male','steph30@gmail.com',15105556,2),(3,'Simone Biles','1997-03-14','Male','simoneb@gmail.com',13125550,4),(4,'Lionel Messi','1987-06-24','Male','lm10@gmail.com',33655532,2),(5,'John Smith','1997-01-01','Male','johnsmith@gmail.com',555124567,1);
/*!40000 ALTER TABLE `athletes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `CoachID` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `EmailAddress` varchar(30) NOT NULL,
  `PhoneNumber` int(11) NOT NULL,
  `TeamID` int(11) NOT NULL,
  PRIMARY KEY (`CoachID`),
  KEY `Coaches_Teams` (`TeamID`),
  KEY `idx_cfirstname` (`FirstName`),
  CONSTRAINT `Coaches_Teams` FOREIGN KEY (`TeamID`) REFERENCES `teams` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (2,'Samantha','Jones','samanthajones@gmail.com',850969232,2),(3,'David','Lee','davidlee@gmail.com',201274308,3),(4,'Mark','Jones','markjones@gmail.com',552345678,2);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `FacilityID` int(11) NOT NULL,
  `FacilityName` varchar(30) NOT NULL,
  `FacilityAddress` varchar(30) NOT NULL,
  `FacilityCity` varchar(30) NOT NULL,
  `FacilityState` varchar(30) NOT NULL,
  `FacilityCountry` varchar(30) NOT NULL,
  `FacilityType` varchar(30) NOT NULL,
  PRIMARY KEY (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'LA Stadium','123 Main St','Los Angeles','California','United States','Gym'),(2,'Staples Center','1111 S Figueroa St','Los Angeles','California','United States','Stadium'),(3,'Madison Square Garden','4 Pennsylvania Plaza','New York City','New York','United States','Stadium');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `GameID` int(11) NOT NULL,
  `GameDate` date NOT NULL,
  `GameTime` varchar(20) NOT NULL,
  `GameLocation` varchar(20) NOT NULL,
  `HomeTeamID` int(11) NOT NULL,
  `AwayTeamID` int(11) NOT NULL,
  `FacilityID` int(11) NOT NULL,
  PRIMARY KEY (`GameID`),
  KEY `Away_Team_Games` (`AwayTeamID`),
  KEY `Games_Facilities` (`FacilityID`),
  KEY `Home_Team_Games` (`HomeTeamID`),
  KEY `idx_gamelocation` (`GameLocation`),
  CONSTRAINT `Away_Team_Games` FOREIGN KEY (`AwayTeamID`) REFERENCES `teams` (`TeamID`),
  CONSTRAINT `Games_Facilities` FOREIGN KEY (`FacilityID`) REFERENCES `facilities` (`FacilityID`),
  CONSTRAINT `Home_Team_Games` FOREIGN KEY (`HomeTeamID`) REFERENCES `teams` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'2023-04-01','14:30:00','Stadium A',1,2,2),(2,'2023-04-02','10:00:00','Field B',3,4,1),(3,'2023-04-03','16:00:00','Gymnasium C',2,3,3);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injuries`
--

DROP TABLE IF EXISTS `injuries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injuries` (
  `InjuryID` int(11) NOT NULL,
  `InjuryDate` date NOT NULL,
  `RecoveryTime` varchar(20) NOT NULL,
  `AthleteID` int(11) NOT NULL,
  PRIMARY KEY (`InjuryID`),
  KEY `Injuries_Athletes` (`AthleteID`),
  CONSTRAINT `Injuries_Athletes` FOREIGN KEY (`AthleteID`) REFERENCES `athletes` (`AthleteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injuries`
--

LOCK TABLES `injuries` WRITE;
/*!40000 ALTER TABLE `injuries` DISABLE KEYS */;
INSERT INTO `injuries` VALUES (1,'2022-05-15','2 weeks',1),(2,'2022-06-10','4 weeks',2),(3,'2022-07-01','3 weeks',4);
/*!40000 ALTER TABLE `injuries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `StatisticsID` int(11) NOT NULL,
  `PointsScored` int(11) NOT NULL,
  `Assists` int(11) NOT NULL,
  `GameID` int(11) NOT NULL,
  `AthleteID` int(11) NOT NULL,
  PRIMARY KEY (`StatisticsID`),
  KEY `Statistics_Athletes` (`AthleteID`),
  KEY `Statistics_Games` (`GameID`),
  CONSTRAINT `Statistics_Athletes` FOREIGN KEY (`AthleteID`) REFERENCES `athletes` (`AthleteID`),
  CONSTRAINT `Statistics_Games` FOREIGN KEY (`GameID`) REFERENCES `games` (`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (1,10,3,1,3),(2,5,2,3,2),(3,8,1,2,1),(4,7,5,3,4);
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `TeamID` int(11) NOT NULL,
  `TeamName` varchar(30) NOT NULL,
  `HomeCity` varchar(30) NOT NULL,
  `HomeState` varchar(30) NOT NULL,
  `HomeCountry` varchar(30) NOT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `idx_teamname` (`TeamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Los Angeles Lakers','Los Angeles','California','United States'),(2,'Golden State Warriors','San Francisco','California','United States'),(3,'Manchester City FC','Manchester','NULL','United Kingdom'),(4,'New York Yankees','New York City','New York','United States'),(5,'New York Yankees','New York City','New York','United States');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_athletes_injuries`
--

DROP TABLE IF EXISTS `v_athletes_injuries`;
/*!50001 DROP VIEW IF EXISTS `v_athletes_injuries`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_athletes_injuries` AS SELECT 
 1 AS `FullName`,
 1 AS `InjuryDate`,
 1 AS `RecoveryTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_game_statistics`
--

DROP TABLE IF EXISTS `v_game_statistics`;
/*!50001 DROP VIEW IF EXISTS `v_game_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_game_statistics` AS SELECT 
 1 AS `GameLocation`,
 1 AS `PointsScored`,
 1 AS `Assists`,
 1 AS `FacilityID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `workouts`
--

DROP TABLE IF EXISTS `workouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workouts` (
  `WorkoutID` int(11) NOT NULL,
  `WorkoutDate` date NOT NULL,
  `WorkoutTime` varchar(30) NOT NULL,
  `ExerciseType` varchar(30) NOT NULL,
  `Weight` varchar(30) NOT NULL,
  `AthleteID` int(11) NOT NULL,
  PRIMARY KEY (`WorkoutID`),
  KEY `Workouts_Athletes` (`AthleteID`),
  CONSTRAINT `Workouts_Athletes` FOREIGN KEY (`AthleteID`) REFERENCES `athletes` (`AthleteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workouts`
--

LOCK TABLES `workouts` WRITE;
/*!40000 ALTER TABLE `workouts` DISABLE KEYS */;
INSERT INTO `workouts` VALUES (1,'2022-05-01','9:00am','Bench Press','135 lbs',3),(2,'2022-06-05','10:30am','Squats','185 lbs',2),(3,'2022-07-10','11:00am','Deadlifts','225 lbs',4);
/*!40000 ALTER TABLE `workouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v_athletes_injuries`
--

/*!50001 DROP VIEW IF EXISTS `v_athletes_injuries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_athletes_injuries` AS select `a`.`FullName` AS `FullName`,`i`.`InjuryDate` AS `InjuryDate`,`i`.`RecoveryTime` AS `RecoveryTime` from (`athletes` `a` join `injuries` `i`) where (`a`.`AthleteID` = `i`.`AthleteID`) group by `a`.`FullName`,`i`.`InjuryDate`,`i`.`RecoveryTime` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_game_statistics`
--

/*!50001 DROP VIEW IF EXISTS `v_game_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_game_statistics` AS select `g`.`GameLocation` AS `GameLocation`,`s`.`PointsScored` AS `PointsScored`,`s`.`Assists` AS `Assists`,`g`.`FacilityID` AS `FacilityID` from (`statistics` `s` join `games` `g`) where ((`g`.`GameID` = `s`.`GameID`) and (`s`.`PointsScored` > 5)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24 14:49:32
