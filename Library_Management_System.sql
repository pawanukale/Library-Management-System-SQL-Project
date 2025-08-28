-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: librarydb
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(150) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `total_copies` int NOT NULL,
  `available_copies` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`),
  KEY `idx_books_title` (`title`),
  CONSTRAINT `books_chk_1` CHECK ((`total_copies` >= 0)),
  CONSTRAINT `books_chk_2` CHECK ((`available_copies` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Alchemist','Paulo Coelho','Fiction',10,9,'2025-08-28 06:21:25'),(2,'Atomic Habits','James Clear','Self-Help',15,13,'2025-08-28 06:21:25'),(3,'The Pragmatic Programmer','Andrew Hunt','Programming',8,10,'2025-08-28 06:21:25'),(4,'Rich Dad Poor Dad','Robert Kiyosaki','Finance',12,12,'2025-08-28 06:21:25'),(5,'Clean Code','Robert C. Martin','Programming',10,10,'2025-08-28 06:21:25'),(6,'Think and Grow Rich','Napoleon Hill','Self Improvement',14,14,'2025-08-28 06:21:25'),(7,'Harry Potter and the Sorcerer\'s Stone','J.K. Rowling','Fantasy',20,20,'2025-08-28 06:21:25'),(9,'The 7 Habits of Highly Effective People','Stephen Covey','Self-Help',18,18,'2025-08-28 06:21:25'),(10,'Introduction to Algorithms','Thomas H. Cormen','Computer Science',5,5,'2025-08-28 06:21:25'),(11,'Data Science from Scratch','Joel Grus','Data Science',7,7,'2025-08-28 06:23:46');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow` (
  `borrow_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `member_id` int NOT NULL,
  `borrow_date` date NOT NULL DEFAULT (curdate()),
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `fk_book` (`book_id`),
  KEY `idx_borrow_member` (`member_id`),
  CONSTRAINT `fk_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES (1,1,1,'2025-08-01','2025-08-15','2025-08-14'),(2,2,2,'2025-08-02','2025-08-16','2025-08-17'),(3,3,3,'2025-08-03','2025-08-17','2025-08-28'),(4,4,4,'2025-08-04','2025-08-18','2025-08-18'),(5,5,5,'2025-08-05','2025-08-19','2025-08-21'),(6,6,6,'2025-08-06','2025-08-27',NULL),(7,7,7,'2025-08-07','2025-08-21','2025-08-22'),(11,2,5,'2025-08-28','2025-09-11',NULL),(12,2,5,'2025-08-28','2025-09-11',NULL),(13,2,5,'2025-08-28','2025-09-11',NULL);
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine`
--

DROP TABLE IF EXISTS `fine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine` (
  `fine_id` int NOT NULL AUTO_INCREMENT,
  `borrow_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid_status` enum('Unpaid','Paid') DEFAULT 'Unpaid',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`fine_id`),
  UNIQUE KEY `borrow_id` (`borrow_id`),
  CONSTRAINT `fk_borrow` FOREIGN KEY (`borrow_id`) REFERENCES `borrow` (`borrow_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine`
--

LOCK TABLES `fine` WRITE;
/*!40000 ALTER TABLE `fine` DISABLE KEYS */;
INSERT INTO `fine` VALUES (1,2,10.00,'Unpaid','2025-08-28 06:22:22'),(2,5,20.00,'Paid','2025-08-28 06:22:22'),(3,7,10.00,'Paid','2025-08-28 06:22:22'),(5,1,0.00,'Paid','2025-08-28 06:22:22'),(6,4,0.00,'Paid','2025-08-28 06:22:22'),(7,3,110.00,'Unpaid','2025-08-28 06:22:22'),(8,6,0.00,'Unpaid','2025-08-28 06:22:22'),(11,11,30.00,'Unpaid','2025-08-28 06:34:43');
/*!40000 ALTER TABLE `fine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_members_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Rahul Sharma','rahul@gmail.com','9112233445','2025-08-28 06:21:41'),(2,'Anita Desai','anita@gmail.com','9123456789','2025-08-28 06:21:41'),(3,'Vikram Singh','vikram@gmail.com','9988776655','2025-08-28 06:21:41'),(4,'Priya Sharma','priya@gmail.com','9876500000','2025-08-28 06:21:41'),(5,'Arjun Verma','arjun@gmail.com','9090909090','2025-08-28 06:21:41'),(6,'Sanya Kapoor','sanya@gmail.com','9123001122','2025-08-28 06:21:41'),(7,'Rohit Malhotra','rohit@gmail.com','9311223344','2025-08-28 06:21:41'),(8,'Meera Joshi','meera@gmail.com','9123450000','2025-08-28 06:21:41'),(10,'Pooja Nair','pooja@gmail.com','8888888888','2025-08-28 06:21:41'),(11,'Neha Rathi','neha@gmail.com','9876112233','2025-08-28 06:34:42');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-28 12:48:12
