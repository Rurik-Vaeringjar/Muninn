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
-- Table structure for table `craftable`
--

DROP TABLE IF EXISTS `craftable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftable` (
  `id` varchar(20) NOT NULL,
  `source` varchar(20) DEFAULT NULL,
  `lvl` tinyint(4) DEFAULT NULL,
  `mats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`mats` is null or json_valid(`mats`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftable`
--

LOCK TABLES `craftable` WRITE;
/*!40000 ALTER TABLE `craftable` DISABLE KEYS */;
INSERT INTO `craftable` VALUES ('BlackSoup','Cauldron',1,'[{\"mat\":\"Bloodbag\",\"qty\":1},{\"mat\":\"Honey\", \"qty\":1},{\"mat\":\"Turnip\", \"qty\":1}]'),('BloodPudding','Cauldron',4,'[{\"mat\":\"Thistle\", \"qty\":2},{\"mat\":\"Bloodbag\",\"qty\":2},{\"mat\":\"Barley flour\",\"qty\":4}]'),('BoarJerky','Cauldron',1,'[{\"mat\":\"Boar meat\", \"qty\":1},{\"mat\":\"Honey\",\"qty\":1}]'),('Bread','Stone oven',NULL,'[{\"mat\":\"Bread dough\",\"qty\":1}]'),('Carrot','Farming',NULL,'[{\"mat\":\"Carrot Seed\",\"qty\":1}]'),('CarrotSoup','Cauldron',1,'[{\"mat\":\"Mushroom\", \"qty\":1},{\"mat\":\"Carrot\",\"qty\":3}]'),('CookedDeerMeat','Cooking station',NULL,'[{\"mat\":\"Deer meat\", \"qty\":1}]'),('CookedLoxMeat','Iron cooking station',NULL,'[{\"mat\":\"Lox meat\",\"qty\":1}]'),('CookedMeat','Cooking station',NULL,'[{\"mat\":\"Boar meat\",\"qty\":1}]'),('CookedWolfMeat','Cooking station',NULL,'[{\"mat\":\"Wolf meat\",\"qty\":1}]'),('DeerStew','Cauldron',1,'[{\"mat\":\"Blueberries\",\"qty\":1},{\"mat\":\"Carrot\",\"qty\":1},{\"mat\":\"Cooked deer meat\",\"qty\":1}]'),('Eyescream','Cauldron',3,'[{\"mat\":\"Greydwarf eye\",\"qty\":3},{\"mat\":\"Freeze gland\",\"qty\":1}]'),('FishCooked','Cooking station',NULL,'[{\"mat\":\"Raw fish\",\"qty\":1}]'),('FishWraps','Cauldron',4,'[{\"mat\":\"Cooked fish\",\"qty\":2},{\"mat\":\"Barley flour\",\"qty\":4}]'),('LoxPie','Stone oven',NULL,'[{\"mat\":\"Unbaked low pie\",\"qty\":1}]'),('MinceMeatSauce','Cauldron',1,'[{\"mat\":\"Boat meat\",\"qty\":1},{\"mat\":\"Neck tail\",\"qty\":1},{\"mat\":\"Carrot\",\"qty\":1}]'),('NeckTailGrilled','Cooked station',NULL,'[{\"mat\":\"Neck tail\",\"qty\":1}]'),('Onion','Farming',NULL,'[{\"mat\":\"Onion seed\",\"qty\":1}]'),('OnionSoup','Cauldron',1,'[{\"mat\":\"Onion\",\"qty\":3}]'),('QueensJam','Cauldron',1,'[{\"mat\":\"Raspberries\",\"qty\":8},{\"mat\":\"Blueberries\",\"qty\":6}]'),('Sausages','Cauldron',2,'[{\"mat\":\"Entrails\",\"qty\":4},{\"mat\":\"Boar meat\",\"qty\":1},{\"mat\":\"Thistle\",\"qty\":1}]'),('SerpentMeatCooked','Iron cooking station',NULL,'[{\"mat\":\"Serpent meat\",\"qty\":1}]'),('SerpentStew','Cauldron',1,'[{\"mat\":\"Mushroom\",\"qty\":1},{\"mat\":\"Cooked serpent meat\",\"qty\":1},{\"mat\":\"Honey\",\"qty\":2}]'),('ShocklateSmoothie','Cauldron',2,'[{\"mat\":\"Ooze\",\"qty\":1},{\"mat\":\"Raspberries\",\"qty\":2},{\"mat\":\"Blueberries\",\"qty\":2}]'),('TurnipStew','Cauldron',1,'[{\"mat\":\"Boar meat\",\"qty\":1},{\"mat\":\"Turnip\",\"qty\":3}]'),('Wolfjerky','Cauldron',3,'[{\"mat\":\"Wolf meat\",\"qty\":1},{\"mat\":\"Honey\",\"qty\":1}]'),('Wolfmeatskewer','Cauldron',3,'[{\"mat\":\"Wolf meat\",\"qty\":1},{\"mat\":\"Mushroom\",\"qty\":2},{\"mat\":\"Onion\",\"qty\":1}]');
/*!40000 ALTER TABLE `craftable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropable`
--

DROP TABLE IF EXISTS `dropable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropable` (
  `id` varchar(20) DEFAULT NULL,
  `source` tinytext DEFAULT NULL,
  `chance` double DEFAULT NULL,
  `location` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropable`
--

LOCK TABLES `dropable` WRITE;
/*!40000 ALTER TABLE `dropable` DISABLE KEYS */;
INSERT INTO `dropable` VALUES ('Blueberries','Bushes',NULL,'Black Forest'),('Cloudberry','Bushes',NULL,'Plains'),('Honey','Beehive',NULL,NULL),('Mushroom',NULL,NULL,'Meadows'),('Mushroom',NULL,NULL,'Black Forest'),('Mushroom',NULL,NULL,'Swamp'),('MushroomBlue','Console command',NULL,NULL),('MushroomYellow',NULL,NULL,'Burial Chambers'),('MushroomYellow',NULL,NULL,'Troll Cave'),('MushroomYellow',NULL,NULL,'Sunken Crypts'),('Raspberry','Bushes',NULL,'Meadows');
/*!40000 ALTER TABLE `dropable` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `food` VALUES ('BlackSoup',50,17,3,1200),('BloodPudding',25,75,2,1800),('Blueberries',8,25,1,600),('BoarJerky',23,23,2,1800),('Bread',23,70,2,1500),('Carrot',10,32,1,600),('CarrotSoup',15,45,2,1500),('Cloudberry',13,40,1,900),('CookedDeerMeat',35,12,2,1200),('CookedLoxMeat',50,16,3,2000),('CookedMeat',30,10,2,1200),('CookedWolfMeat',45,15,3,1200),('DeerStew',45,15,3,1500),('Eyescream',21,65,1,1500),('FishCooked',45,15,2,1200),('FishWraps',70,23,4,1500),('Honey',8,35,1,900),('LoxPie',75,24,4,1800),('MinceMeatSauce',40,13,3,1500),('Mushroom',15,15,1,900),('MushroomBlue',20,20,1,600),('MushroomYellow',10,30,1,600),('NeckTailGrilled',25,8,2,1200),('Onion',13,40,1,900),('OnionSoup',20,60,1,1200),('QueensJam',14,40,2,1200),('Raspberry',7,20,1,600),('Sausages',55,18,3,1500),('SerpentMeatCooked',70,23,3,1500),('SerpentStew',80,26,4,1800),('ShocklateSmoothie',16,50,1,1200),('TurnipStew',18,55,2,1500),('Wolfjerky',33,33,3,1800),('Wolfmeatskewer',65,21,3,1500);
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
  `craftable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('BlackSoup','Black soup','A perfect balance of sweetness and acidity.','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/e/e6/BlackSoup.png',1),('BloodPudding','Blood pudding','It\'s bloody tasty.','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/2/28/Blood_pudding.png',1),('Blueberries','Blueberries','Tiny buy tasty.','food',1,0.1,50,'https://static.wikia.nocookie.net/valheim/images/a/af/Blueberries.png',0),('BoarJerky','Boar jerky','Lean and salty.','food',1,0.5,20,'https://static.wikia.nocookie.net/valheim/images/1/14/Boar_jerky.png',1),('Bread','Bread','A tasty loaf of bread.','food',1,0.5,20,'https://static.wikia.nocookie.net/valheim/images/e/e1/Bread.png',1),('Carrot','Carrot','An orange tasty treat.','food',1,0.3,50,'https://static.wikia.nocookie.net/valheim/images/c/c3/Carrot.png',1),('CarrotSoup','Carrot soup','A warm tasty soup made of mostly carrots.','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/0/00/Carrot_soup.png',1),('Cloudberry','Cloudberries','The gold of the forest.','food',1,0.1,50,'https://static.wikia.nocookie.net/valheim/images/e/e4/Cloudberries.png',0),('CookedDeerMeat','Cooked deer meat','All that running paid off.','food',1,1,20,'https://static.wikia.nocookie.net/valheim/images/e/e7/Deer_meat_cooked.png',1),('CookedLoxMeat','Cooked lox meat','A great hunk of tender meat, food fit for Valhalla!','food',1,1,20,'https://static.wikia.nocookie.net/valheim/images/4/40/Cooked_lox_meat.png',1),('CookedMeat','Cooked boar meat','An earthly taste.','food',1,1,20,'https://static.wikia.nocookie.net/valheim/images/0/01/Cooked_boar_meat.png',1),('CookedWolfMeat','Cooked wolf meat','A wild taste.','food',1,1,20,'https://static.wikia.nocookie.net/valheim/images/d/dc/Cooked_wolf_meat.png',1),('DeerStew','Deer stew','Fall-apart tender.','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/0/0e/Deer_Stew.png',1),('Eyescream','Eyescream','Crispy cool and creamy.','food',1,0.5,10,'https://static.wikia.nocookie.net/valheim/images/9/90/Eyescream.png',1),('FishCooked','Cooked fish','A tasty side of smoked fish.','food',1,1,20,'https://static.wikia.nocookie.net/valheim/images/1/16/Cooked_fish.png',1),('FishWraps','Fish wraps','Bread and fish, what more to wish?','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/b/b5/Fish_wraps.png',1),('Honey','Honey','Sweet and tasty.','food',1,0.2,50,'https://static.wikia.nocookie.net/valheim/images/c/c6/Honey.png',0),('LoxPie','Lox meat pie','Break the crust to release a cloud of fragrant steam. Delicious!','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/5/5e/Lox_meat_pie.png',1),('MinceMeatSauce','Minced meat sauce','Chunks of goodness in a thick gravy.','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/5/58/Mincemeatsauce.png',1),('Mushroom','Mushroom','Bounty of the forest.','food',1,0.1,50,'https://static.wikia.nocookie.net/valheim/images/8/8c/Mushroom.png',0),('MushroomBlue','Blue mushroom','Glows with a soft blue hue.','food',1,0.1,50,'https://static.wikia.nocookie.net/valheim/images/0/03/Mushroomblue.png',0),('MushroomYellow','Yellow mushroom','An energetic glowing mushroom.','food',1,0.1,50,'https://static.wikia.nocookie.net/valheim/images/5/57/Yellow_mushroom.png',0),('NeckTailGrilled','Grilled neck tail','This savoury, charcoal-grilled meat has a slight aroma of seaweed and grass','food',1,0.5,20,'https://static.wikia.nocookie.net/valheim/images/0/06/Grilled_neck_tail.png',1),('Onion','Onion','A crunchy and spicy taste','food',1,0.3,50,'https://static.wikia.nocookie.net/valheim/images/5/51/Onion.png',1),('OnionSoup','Onion soup','Deliciously Rich','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/7/72/OnionSoup.png',1),('QueensJam','Queens jam','That classic tasty blend of raspberries and blueberries.','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/a/ad/Queens_jam.png',1),('Raspberry','Raspberries','Sweet and delicious','food',1,0.1,50,'https://static.wikia.nocookie.net/valheim/images/7/7e/Raspberries.png',0),('Sausages','Sausages','Links of savory, smoked meat.','food',1,0.5,20,'https://static.wikia.nocookie.net/valheim/images/a/a0/Sausages.png',1),('SerpentMeatCooked','Cooked serpent meat','A cooked slive of sea serpent, smells good.','food',1,10,50,'https://static.wikia.nocookie.net/valheim/images/c/c1/Cooked_serpent_meat.png',1),('SerpentStew','Serpent stew','Smells of honey and serpent...','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/5/55/Serpent_stew.png',1),('ShocklateSmoothie','Muckshake','Wakes you up!','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/1/1d/Shocklatesmoothie.png',1),('TurnipStew','Turnip stew','Nutritious and restorative.','food',1,1,10,'https://static.wikia.nocookie.net/valheim/images/f/fd/Turnip_stew.png',1),('Wolfjerky','Wolf jerky','Chewy and full of flavor.','food',1,1,20,'https://static.wikia.nocookie.net/valheim/images/8/8b/Wolfjerky.png',1),('Wolfmeatskewer','Wolf skewer','Dripping with taste.','food',1,0.5,20,'https://static.wikia.nocookie.net/valheim/images/d/d7/Wolf_skewer.png',1);
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

-- Dump completed on 2022-02-06 14:58:21
