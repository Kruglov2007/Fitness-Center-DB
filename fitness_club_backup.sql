-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: fitness_club
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `check_ins`
--

DROP TABLE IF EXISTS `check_ins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_ins` (
  `id_check_in` int NOT NULL AUTO_INCREMENT,
  `check_in_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_out_time` datetime DEFAULT NULL,
  `locker_number` int NOT NULL,
  `id_client` int NOT NULL,
  PRIMARY KEY (`id_check_in`),
  KEY `fk_checkins_clients` (`id_client`),
  KEY `idx_checkins_time` (`check_in_time`),
  CONSTRAINT `fk_checkins_clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_ins`
--

LOCK TABLES `check_ins` WRITE;
/*!40000 ALTER TABLE `check_ins` DISABLE KEYS */;
INSERT INTO `check_ins` VALUES (2,'2026-02-15 18:30:00','2026-02-15 20:15:00',15,2),(3,'2026-02-16 11:15:00','2026-02-16 13:00:00',88,3),(4,'2026-02-16 19:00:00',NULL,23,4);
/*!40000 ALTER TABLE `check_ins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_registrations`
--

DROP TABLE IF EXISTS `class_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_registrations` (
  `id_registration` int NOT NULL AUTO_INCREMENT,
  `registration_date` datetime NOT NULL,
  `id_class` int NOT NULL,
  `id_client` int NOT NULL,
  PRIMARY KEY (`id_registration`),
  KEY `fk_registrations_classes` (`id_class`),
  KEY `fk_registrations_clients` (`id_client`),
  CONSTRAINT `fk_registrations_classes` FOREIGN KEY (`id_class`) REFERENCES `classes` (`id_class`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_registrations_clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_registrations`
--

LOCK TABLES `class_registrations` WRITE;
/*!40000 ALTER TABLE `class_registrations` DISABLE KEYS */;
INSERT INTO `class_registrations` VALUES (1,'2026-02-14 12:00:00',1,2),(2,'2026-02-15 10:00:00',3,3);
/*!40000 ALTER TABLE `class_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id_class` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(45) DEFAULT NULL,
  `id_staff` int NOT NULL,
  `id_room` int NOT NULL,
  PRIMARY KEY (`id_class`),
  KEY `fk_classes_room` (`id_room`),
  KEY `fk_classes_staff` (`id_staff`),
  CONSTRAINT `fk_classes_room` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_classes_staff` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Хатха-Йога (Утро)',2,2),(2,'CrossFit Hard',1,3),(3,'Aqua Aerobics',3,4);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_memberships`
--

DROP TABLE IF EXISTS `client_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_memberships` (
  `id_sale` int NOT NULL AUTO_INCREMENT,
  `purchase_date` date NOT NULL,
  `end_date` date NOT NULL,
  `id_client` int NOT NULL,
  `id_membership` int NOT NULL,
  PRIMARY KEY (`id_sale`),
  KEY `fk_cm_clients` (`id_client`),
  KEY `fk_cm_memberships` (`id_membership`),
  KEY `idx_cm_client_end` (`id_client`,`end_date`),
  CONSTRAINT `fk_cm_clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cm_memberships` FOREIGN KEY (`id_membership`) REFERENCES `memberships` (`id_membership`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_memberships`
--

LOCK TABLES `client_memberships` WRITE;
/*!40000 ALTER TABLE `client_memberships` DISABLE KEYS */;
INSERT INTO `client_memberships` VALUES (2,'2026-01-15','2027-01-15',2,3),(3,'2026-02-01','2026-05-01',3,2),(4,'2026-02-10','2026-03-10',4,1);
/*!40000 ALTER TABLE `client_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `birth_date` date NOT NULL,
  `registration_date` date NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `idx_clients_lastname` (`last_name`),
  KEY `idx_clients_phone` (`phone`),
  CONSTRAINT `chk_clients_email` CHECK ((`email` like _utf8mb4'%@%'))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (2,'Мария','Петрова','masha.kr@yandex.ru','+79112223344','1998-11-22','2026-01-15'),(3,'Елена','Кузнецова','elena.kuz@gmail.com','+79114445566','1987-07-05','2026-02-01'),(4,'Игорь','Белов','belov_igor@mail.ru','+79117778899','2001-02-28','2026-02-10'),(5,'Ярослав','Круглов','iaroslav.belarus@gmail.com','+375292289435','2007-11-02','2026-10-11'),(6,'Илья','Хованский','hovan.me@gmail.com','+375297560089','2024-10-09','2026-10-11'),(8,'Артём','Кучинский','kucha@gmail.com','+375 25 964 1756','2007-11-22','2026-11-08');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id_equipment` int NOT NULL AUTO_INCREMENT,
  `equipment_name` varchar(100) NOT NULL,
  `purchase_date` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `id_room` int NOT NULL,
  PRIMARY KEY (`id_equipment`),
  KEY `fk_equipment_room` (`id_room`),
  CONSTRAINT `fk_equipment_room` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Беговая дорожка LifeFitness','2025-12-01','Исправен',1),(2,'Набор профессиональных гантелей','2025-12-05','Исправен',1),(3,'Коврики для йоги (20 шт.)','2026-01-08','Исправен',2),(4,'Петли TRX','2026-01-20','В ремонте',3);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberships` (
  `id_membership` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_membership`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES (1,'Месячный безлимит (Дневной)',3200.00),(2,'Студенческий 3 месяца',7500.00),(3,'Годовой VIP (Все включено)',29900.00);
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id_room` int NOT NULL AUTO_INCREMENT,
  `room_name` varchar(50) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`id_room`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'Главный тренажерный зал',60),(2,'Зал групповых программ А',20),(3,'Зона единоборств и кроссфита',15),(4,'Аква-зона (Бассейн)',30);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_orders`
--

DROP TABLE IF EXISTS `service_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `id_client` int NOT NULL,
  `id_service` int NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `fk_orders_clients` (`id_client`),
  KEY `fk_orders_services` (`id_service`),
  CONSTRAINT `fk_orders_clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_services` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_orders`
--

LOCK TABLES `service_orders` WRITE;
/*!40000 ALTER TABLE `service_orders` DISABLE KEYS */;
INSERT INTO `service_orders` VALUES (2,'2026-02-05 16:30:00',2,2),(3,'2026-02-12 18:00:00',4,3);
/*!40000 ALTER TABLE `service_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id_service` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Персональная тренировка',1800.00),(2,'Консультация нутрициолога',2500.00),(3,'Лимфодренажный массаж',2200.00);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id_staff` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `role` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`id_staff`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Дмитрий','Ковалев','Старший тренер','+79991112233'),(2,'Светлана','Морозова','Тренер по йоге','+79992223344'),(3,'Владимир','Ткачев','Инструктор','+79993334455'),(4,'Ирина','Павлова','Администратор','+79994445566');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-25  0:03:43
