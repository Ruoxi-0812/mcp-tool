-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (x86_64)
--
-- Host: localhost    Database: bing_local
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `movie_data`
--

DROP TABLE IF EXISTS `movie_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text,
  `genres` varchar(255) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_data`
--

LOCK TABLES `movie_data` WRITE;
/*!40000 ALTER TABLE `movie_data` DISABLE KEYS */;
INSERT INTO `movie_data` VALUES (1,'Inception','https://www.imdb.com/title/tt1375666/','A thief who enters dreams to steal secrets takes on one last job.','Sci-Fi, Action, Thriller',8.8,2010),(2,'Everything Everywhere All at Once','https://www.imdb.com/title/tt6710474/','A multiverse adventure where a woman discovers infinite versions of herself.','Sci-Fi, Comedy, Drama',8.1,2022),(3,'The Shawshank Redemption','https://www.imdb.com/title/tt0111161/','Two imprisoned men bond over years and find redemption.','Drama, Crime',9.3,1994),(4,'Parasite','https://www.imdb.com/title/tt6751668/','Greed and class discrimination threaten the relationship between two families.','Thriller, Drama',8.6,2019),(5,'Your Name','https://www.imdb.com/title/tt5311514/','Two teenagers share a profound connection despite never having met.','Romance, Animation, Fantasy',8.5,2016),(6,'Interstellar','https://www.imdb.com/title/tt0816692/','A team of explorers travel through a wormhole in space.','Sci-Fi, Adventure, Drama',8.6,2014),(7,'The Godfather','https://www.imdb.com/title/tt0068646/','The aging patriarch of an organized crime dynasty transfers control to his son.','Crime, Drama',9.2,1972),(8,'La La Land','https://www.imdb.com/title/tt3783958/','A jazz musician and an aspiring actress fall in love in Los Angeles.','Musical, Romance, Drama',8,2016),(9,'Coco','https://www.imdb.com/title/tt2380307/','A young boy embarks on a journey to the land of the dead.','Animation, Family, Music',8.4,2017),(10,'The Matrix','https://www.imdb.com/title/tt0133093/','A computer hacker learns about the true nature of reality.','Sci-Fi, Action',8.7,1999);
/*!40000 ALTER TABLE `movie_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-11 13:43:26
