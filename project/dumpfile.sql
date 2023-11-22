-- MariaDB dump 10.19-11.3.0-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: board
-- ------------------------------------------------------
-- Server version	11.3.0-MariaDB

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `adddress` varchar(255) DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chang` (`NAME`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES
(1,'lee',NULL,NULL,'user',NULL,120),
(2,'kim','abc@naver.com','abc','user',NULL,NULL),
(3,'kim','abc@naver.com','abc','user',NULL,NULL),
(4,'kim','abc@naver.com','abc','user',NULL,NULL),
(5,'kim','abc@naver.com','abc','user',NULL,NULL);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `author_for_view`
--

DROP TABLE IF EXISTS `author_for_view`;
/*!50001 DROP VIEW IF EXISTS `author_for_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `author_for_view` AS SELECT
 1 AS `name`,
  1 AS `email` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `contents` varchar(3000) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES
(3,'hello1','contents',1,100,NULL),
(6,NULL,NULL,1,100,'2023-11-17 16:35:46'),
(7,'tarzan','jungle',2,1000,'2023-11-20 11:37:35'),
(8,'faker','mid',3,1100,'2023-11-20 11:48:10'),
(9,'pyez','AD',3,1000,'2023-11-21 10:45:44'),
(10,'chovy','mid',NULL,1000,'2023-11-21 10:46:34'),
(11,'doran','TOP',NULL,1000,'2023-11-21 10:46:34'),
(12,'lee','changseon',4,NULL,'2023-11-22 14:42:34'),
(13,'ac@naver.com','lee0',NULL,NULL,'2023-11-22 16:15:17'),
(14,'ac@naver.com','lee1',NULL,NULL,'2023-11-22 16:15:17'),
(15,'ac@naver.com','lee2',NULL,NULL,'2023-11-22 16:15:17'),
(16,'ac@naver.com','lee3',NULL,NULL,'2023-11-22 16:15:17'),
(17,'ac@naver.com','lee4',NULL,NULL,'2023-11-22 16:15:17'),
(18,'ac@naver.com','lee5',NULL,NULL,'2023-11-22 16:15:17'),
(19,'ac@naver.com','lee6',NULL,NULL,'2023-11-22 16:15:17'),
(20,'ac@naver.com','lee7',NULL,NULL,'2023-11-22 16:15:17'),
(21,'ac@naver.com','lee8',NULL,NULL,'2023-11-22 16:15:17'),
(22,'ac@naver.com','lee9',NULL,NULL,'2023-11-22 16:15:17'),
(23,'ac@naver.com','lee10',NULL,NULL,'2023-11-22 16:15:17'),
(24,'ac@naver.com','lee11',NULL,NULL,'2023-11-22 16:15:17'),
(25,'ac@naver.com','lee12',NULL,NULL,'2023-11-22 16:15:17'),
(26,'ac@naver.com','lee13',NULL,NULL,'2023-11-22 16:15:17'),
(27,'ac@naver.com','lee14',NULL,NULL,'2023-11-22 16:15:17'),
(28,'ac@naver.com','lee15',NULL,NULL,'2023-11-22 16:15:17'),
(29,'ac@naver.com','lee16',NULL,NULL,'2023-11-22 16:15:17'),
(30,'ac@naver.com','lee17',NULL,NULL,'2023-11-22 16:15:17'),
(31,'ac@naver.com','lee18',NULL,NULL,'2023-11-22 16:15:17'),
(32,'ac@naver.com','lee19',NULL,NULL,'2023-11-22 16:15:17'),
(33,'ac@naver.com','lee20',NULL,NULL,'2023-11-22 16:15:17'),
(34,'ac@naver.com','lee21',NULL,NULL,'2023-11-22 16:15:17'),
(35,'ac@naver.com','lee22',NULL,NULL,'2023-11-22 16:15:17'),
(36,'ac@naver.com','lee23',NULL,NULL,'2023-11-22 16:15:17'),
(37,'ac@naver.com','lee24',NULL,NULL,'2023-11-22 16:15:17'),
(38,'ac@naver.com','lee25',NULL,NULL,'2023-11-22 16:15:17'),
(39,'ac@naver.com','lee26',NULL,NULL,'2023-11-22 16:15:17'),
(40,'ac@naver.com','lee27',NULL,NULL,'2023-11-22 16:15:17'),
(41,'ac@naver.com','lee28',NULL,NULL,'2023-11-22 16:15:17'),
(42,'ac@naver.com','lee29',NULL,NULL,'2023-11-22 16:15:17'),
(43,'ac@naver.com','lee30',NULL,NULL,'2023-11-22 16:15:17'),
(44,'ac@naver.com','lee31',NULL,NULL,'2023-11-22 16:15:17'),
(45,'ac@naver.com','lee32',NULL,NULL,'2023-11-22 16:15:17'),
(46,'ac@naver.com','lee33',NULL,NULL,'2023-11-22 16:15:17'),
(47,'ac@naver.com','lee34',NULL,NULL,'2023-11-22 16:15:17'),
(48,'ac@naver.com','lee35',NULL,NULL,'2023-11-22 16:15:17'),
(49,'ac@naver.com','lee36',NULL,NULL,'2023-11-22 16:15:17'),
(50,'ac@naver.com','lee37',NULL,NULL,'2023-11-22 16:15:17'),
(51,'ac@naver.com','lee38',NULL,NULL,'2023-11-22 16:15:17'),
(52,'ac@naver.com','lee39',NULL,NULL,'2023-11-22 16:15:17'),
(53,'ac@naver.com','lee40',NULL,NULL,'2023-11-22 16:15:17'),
(54,'ac@naver.com','lee41',NULL,NULL,'2023-11-22 16:15:17'),
(55,'ac@naver.com','lee42',NULL,NULL,'2023-11-22 16:15:17'),
(56,'ac@naver.com','lee43',NULL,NULL,'2023-11-22 16:15:17'),
(57,'ac@naver.com','lee44',NULL,NULL,'2023-11-22 16:15:17'),
(58,'ac@naver.com','lee45',NULL,NULL,'2023-11-22 16:15:17'),
(59,'ac@naver.com','lee46',NULL,NULL,'2023-11-22 16:15:17'),
(60,'ac@naver.com','lee47',NULL,NULL,'2023-11-22 16:15:17'),
(61,'ac@naver.com','lee48',NULL,NULL,'2023-11-22 16:15:17'),
(62,'ac@naver.com','lee49',NULL,NULL,'2023-11-22 16:15:17'),
(63,'ac@naver.com','lee50',NULL,NULL,'2023-11-22 16:15:17'),
(64,'ac@naver.com','lee51',NULL,NULL,'2023-11-22 16:15:17'),
(65,'ac@naver.com','lee52',NULL,NULL,'2023-11-22 16:15:17'),
(66,'ac@naver.com','lee53',NULL,NULL,'2023-11-22 16:15:17'),
(67,'ac@naver.com','lee54',NULL,NULL,'2023-11-22 16:15:17'),
(68,'ac@naver.com','lee55',NULL,NULL,'2023-11-22 16:15:17'),
(69,'ac@naver.com','lee56',NULL,NULL,'2023-11-22 16:15:17'),
(70,'ac@naver.com','lee57',NULL,NULL,'2023-11-22 16:15:17'),
(71,'ac@naver.com','lee58',NULL,NULL,'2023-11-22 16:15:17'),
(72,'ac@naver.com','lee59',NULL,NULL,'2023-11-22 16:15:17'),
(73,'ac@naver.com','lee60',NULL,NULL,'2023-11-22 16:15:17'),
(74,'ac@naver.com','lee61',NULL,NULL,'2023-11-22 16:15:17'),
(75,'ac@naver.com','lee62',NULL,NULL,'2023-11-22 16:15:17'),
(76,'ac@naver.com','lee63',NULL,NULL,'2023-11-22 16:15:17'),
(77,'ac@naver.com','lee64',NULL,NULL,'2023-11-22 16:15:17'),
(78,'ac@naver.com','lee65',NULL,NULL,'2023-11-22 16:15:17'),
(79,'ac@naver.com','lee66',NULL,NULL,'2023-11-22 16:15:17'),
(80,'ac@naver.com','lee67',NULL,NULL,'2023-11-22 16:15:17'),
(81,'ac@naver.com','lee68',NULL,NULL,'2023-11-22 16:15:17'),
(82,'ac@naver.com','lee69',NULL,NULL,'2023-11-22 16:15:17'),
(83,'ac@naver.com','lee70',NULL,NULL,'2023-11-22 16:15:17'),
(84,'ac@naver.com','lee71',NULL,NULL,'2023-11-22 16:15:17'),
(85,'ac@naver.com','lee72',NULL,NULL,'2023-11-22 16:15:17'),
(86,'ac@naver.com','lee73',NULL,NULL,'2023-11-22 16:15:17'),
(87,'ac@naver.com','lee74',NULL,NULL,'2023-11-22 16:15:17'),
(88,'ac@naver.com','lee75',NULL,NULL,'2023-11-22 16:15:17'),
(89,'ac@naver.com','lee76',NULL,NULL,'2023-11-22 16:15:17'),
(90,'ac@naver.com','lee77',NULL,NULL,'2023-11-22 16:15:17'),
(91,'ac@naver.com','lee78',NULL,NULL,'2023-11-22 16:15:17'),
(92,'ac@naver.com','lee79',NULL,NULL,'2023-11-22 16:15:17'),
(93,'ac@naver.com','lee80',NULL,NULL,'2023-11-22 16:15:17'),
(94,'ac@naver.com','lee81',NULL,NULL,'2023-11-22 16:15:17'),
(95,'ac@naver.com','lee82',NULL,NULL,'2023-11-22 16:15:17'),
(96,'ac@naver.com','lee83',NULL,NULL,'2023-11-22 16:15:17'),
(97,'ac@naver.com','lee84',NULL,NULL,'2023-11-22 16:15:17'),
(98,'ac@naver.com','lee85',NULL,NULL,'2023-11-22 16:15:17'),
(99,'ac@naver.com','lee86',NULL,NULL,'2023-11-22 16:15:17'),
(100,'ac@naver.com','lee87',NULL,NULL,'2023-11-22 16:15:17'),
(101,'ac@naver.com','lee88',NULL,NULL,'2023-11-22 16:15:17'),
(102,'ac@naver.com','lee89',NULL,NULL,'2023-11-22 16:15:17'),
(103,'ac@naver.com','lee90',NULL,NULL,'2023-11-22 16:15:17'),
(104,'ac@naver.com','lee91',NULL,NULL,'2023-11-22 16:15:17'),
(105,'ac@naver.com','lee92',NULL,NULL,'2023-11-22 16:15:17'),
(106,'ac@naver.com','lee93',NULL,NULL,'2023-11-22 16:15:17'),
(107,'ac@naver.com','lee94',NULL,NULL,'2023-11-22 16:15:17'),
(108,'ac@naver.com','lee95',NULL,NULL,'2023-11-22 16:15:17'),
(109,'ac@naver.com','lee96',NULL,NULL,'2023-11-22 16:15:17'),
(110,'ac@naver.com','lee97',NULL,NULL,'2023-11-22 16:15:17'),
(111,'ac@naver.com','lee98',NULL,NULL,'2023-11-22 16:15:17'),
(112,'ac@naver.com','lee99',NULL,NULL,'2023-11-22 16:15:17');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_blob`
--

DROP TABLE IF EXISTS `table_blob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_blob` (
  `id` int(11) DEFAULT NULL,
  `myimg` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_blob`
--

LOCK TABLES `table_blob` WRITE;
/*!40000 ALTER TABLE `table_blob` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_blob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `author_for_view`
--

/*!50001 DROP VIEW IF EXISTS `author_for_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `author_for_view` AS select `author`.`NAME` AS `name`,`author`.`email` AS `email` from `author` */;
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

-- Dump completed on 2023-11-22 17:05:28
