CREATE DATABASE  IF NOT EXISTS `stadiums` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `stadiums`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stadiums
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.13-MariaDB

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `footballTeam` varchar(100) DEFAULT NULL,
  `stadiumName` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Ajax','Johan Cruyff Arena','Conoce el estadio del Ajax, el equipo más laureado de los Países Bajos y semillero de grandes futbolistas holandeses que han dejado su huella a nivel mundial.',300000.00,'stadium-1600906847164.jpg','2020-09-24 00:20:47','2020-09-24 01:22:36',NULL),(3,'AC Milán - Inter Milán','Giuseppe Meazza','El Giuseppe Meazza, o más conocido como el estadio \"San Ciro\", es el templo que alberga a los dos equipos de la ciudad. Los rossoneri y neroazzurros han conseguido grandes victorias y congregaciones allí. Ambos equipos supieron marcar tendencia a nivel mundial en distintas épocas por su estilo de juego.',300000.00,'stadium-1600911068170.jpg','2020-09-24 01:31:08','2020-09-24 01:31:08',NULL),(4,'Paris Saint-Germain','Le Parc des Princes','El estadio Parc des Princes, tiene una capacidad para 48.712 espectadores, ha sido la sede del Paris Saint-Germain desde 1973. También es el recinto donde el seleccionado francés de fútbol hace sus veces de local.',300000.00,'stadium-1600911541670.jpg','2020-09-24 01:39:01','2020-09-24 01:39:01',NULL),(5,'Bayern Munich','Allianz Arena','Ubicado en el barrio de Fröttmaning, al norte de Múnich, en el estado de Baviera, Alemania. Alberga los partidos como local del F. C. Bayern de Múnich, multicampeón de la Bundesliga.',200000.00,'stadium-1600911700865.jpg','2020-09-24 01:41:40','2020-09-24 01:43:20',NULL),(6,'Borussia Dortmund','Signal Iduna Park','Ubicado en la ciudad de Dortmund, en el estado federado de Renania del Norte-Westfalia, al oeste de Alemania. Es la sede del BV Borussia Dortmund. Con sus torres de suspensión amarillas el estadio es un símbolo de la ciudad de Dortmund.',200000.00,'stadium-1600911947381.jpg','2020-09-24 01:45:47','2020-09-24 01:45:47',NULL),(7,'River Plate','Antonio Vespucio Liberti','También conocido como Estadio Monumental o Monumental de Núñez, es el estadio del Club Atlético River Plate. Inaugurado el 26 de mayo de 1938. Es el estadio dedicado a la práctica futbolística con mayor capacidad de Argentina, y uno de los más grandes de América. ',100000.00,'stadium-1600912269380.jpg','2020-09-24 01:51:09','2020-09-24 01:51:09',NULL),(8,'Manchester United','Old Trafford','Apodado \"El teatro de los sueños\" por Sir Bobby Charlton,​ Old Trafford ha sido el hogar del United desde 1910. El estadio ha sido anfitrión de semifinales de la FA Cup, partidos de Inglaterra, partidos en la Copa del Mundo de 1966 y Eurocopa 1996, entre otros.',200000.00,'stadium-1600912526280.jpg','2020-09-24 01:55:26','2020-09-24 01:55:26',NULL),(9,'Liverpool FC','Anfield','La asistencia récord de 61 905 espectadores fue establecida en 1952 en un partido de la FA Cup entre Liverpool Football Club y Wolverhampton Wanderers Football Club. \"You\'ll Never Walk Alone\"',200000.00,'stadium-1600912789672.jpg','2020-09-24 01:59:49','2020-09-24 02:00:45',NULL),(10,'Real Madrid Club de Fútbol','Santiago Bernabéu','Se inauguró el 14 de diciembre de 1947 y su aforo actualmente es de 81 044 espectadores.1​El estadio está catalogado por la UEFA con la máxima distinción, «estadio de élite». ',200000.00,'stadium-1600912979638.jpg','2020-09-24 02:02:59','2020-09-24 02:02:59',NULL),(11,'FC Barcelona','Camp Nou','Inaugurado el 24 de septiembre de 1957 y catalogado por la UEFA en 1998 como «estadio de élite»,​ es el estadio con mayor capacidad de Europa y el cuarto de fútbol del mundo, con un aforo actual de 99 354 espectadores.',200000.00,'stadium-1600913092359.jpg','2020-09-24 02:04:52','2020-09-24 02:04:52',NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `category` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `image_UNIQUE` (`image`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mariano','Torrecilla','mariano@stadium.com','$2b$10$VyEcZBC7QAqRCXXjZz/kBObWJjXargfyOuZN.bo7dkfbiwk748Mra',9,'foto-1600991036481.jpg','2020-09-24 23:43:56','2020-09-24 23:43:56',NULL),(2,'Mariano','Torrecilla','marian@stadium.com','$2b$10$dBnd/NZLQE0seoJXWyVWqOG9pMN3bcOdzKoP7yTZxorseXaX.tTdS',9,'foto-1600991624247.jpg','2020-09-24 23:53:44','2020-09-24 23:53:44',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-25  9:23:00
