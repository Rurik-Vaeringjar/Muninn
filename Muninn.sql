-- MySQL dump 10.19  Distrib 10.3.32-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Muninn
-- ------------------------------------------------------
-- Server version	10.3.32-MariaDB-0ubuntu0.20.04.1

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
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `id` varchar(20) NOT NULL,
  `health` tinyint(3) unsigned DEFAULT NULL,
  `stamina` tinyint(3) unsigned DEFAULT NULL,
  `healing` tinyint(3) unsigned DEFAULT NULL,
  `duration` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES ('BlackSoup',50,17,3,1200),('BloodPudding',25,75,2,1800),('Blueberries',8,25,1,600),('BoarJerky',23,23,2,1800),('Bread',23,70,2,1500),('Carrot',10,32,1,600),('CarrotSoup',15,45,2,1500),('Cloudberry',13,40,1,900),('CookedDeerMeat',35,12,2,1200),('CookedMeat',30,10,2,1200),('MushroomBlue',20,20,1,600);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` varchar(20) NOT NULL,
  `name` varchar(24) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `tele` tinyint(1) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `stack` tinyint(3) unsigned DEFAULT NULL,
  `wikiaThumbnail` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('BlackSoup','Black Soup','A perfect balance of sweetness and acidity.','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/e/e6/BlackSoup.png'),('BloodPudding','Blood Pudding','It\'s bloody tasty.','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/2/28/Blood_pudding.png'),('Blueberries','Blueberries','Tiny buy tasty.','food',1,0.1,50,'https://static.wikia.nocookie.net/valheim/images/a/af/Blueberries.png'),('BoarJerky','Boar Jerky','Lean and salty.','food',1,0.5,20,'https://static.wikia.nocookie.net/valheim/images/1/14/Boar_jerky.png'),('Bread','Bread','A tasty loaf of bread.','food',1,0.5,20,'https://static.wikia.nocookie.net/valheim/images/e/e1/Bread.png'),('Carrot','Carrot','An orange tasty treat.','food',1,0.3,50,'https://static.wikia.nocookie.net/valheim/images/c/c3/Carrot.png'),('CarrotSoup','Carrot Soup','A warm tasty soup made of mostly carrots.','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/0/00/Carrot_soup.png'),('Cloudberry','Cloudberries','The gold of the forest.','food',1,0.1,50,'https://static.wikia.nocookie.net/valheim/images/e/e4/Cloudberries.png'),('CookedDeerMeat','Cooked Deer Meat','All that running paid off.','food',1,1,20,'https://static.wikia.nocookie.net/valheim/images/e/e7/Deer_meat_cooked.png'),('CookedMeat','Cooked Boar Meat','An earthly taste.','food',1,1,20,'https://static.wikia.nocookie.net/valheim/images/0/01/Cooked_boar_meat.png'),('MushroomBlue','Blue Mushroom','Glows with a soft blue hue.','food',1,0.1,50,'https://static.wikia.nocookie.net/valheim/images/0/03/Mushroomblue.png');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-04 12:28:14
