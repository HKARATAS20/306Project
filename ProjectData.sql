-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `basket_items`
--

DROP TABLE IF EXISTS `basket_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket_items` (
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`product_id`,`supplier_id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `basket_items_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `basket_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `basket_items_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_product` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_items`
--

LOCK TABLES `basket_items` WRITE;
/*!40000 ALTER TABLE `basket_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`,`supplier_id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_product` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (14,31,1,1,1900),(14,31,2,1,1400),(14,31,3,1,1300),(14,48,1,1,600),(15,31,1,1,1900),(15,31,2,1,1400),(15,31,3,1,1300),(15,48,1,1,600),(16,31,1,1,1900),(16,31,2,1,1400),(16,31,3,1,1300),(16,55,3,1,70),(17,31,1,1,1900);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,'2023-06-11',NULL,5200.00),(2,5,'2023-06-11',NULL,5200.00),(3,5,'2023-06-11',NULL,5200.00),(4,5,'2023-06-11',NULL,5200.00),(5,5,'2023-06-12','KOC UNI',5200.00),(6,5,'2023-06-12','NULL',5200.00),(7,5,'2023-06-12','\'Koç Üniversitesi ENG B42\'',5200.00),(8,5,'2023-06-12','Koç Üniversitesi ENG B42',5200.00),(9,5,'2023-06-12','Koç Üniversitesi ENG B42',5200.00),(10,5,'2023-06-12','Koç Üniversitesi ENG B42',5200.00),(11,5,'2023-06-12','Koç Üniversitesi ENG B42',5200.00),(12,5,'2023-06-12','11',1.00),(13,5,'2023-06-12','Koç Üniversitesi ENG B42',5200.00),(14,5,'2023-06-12','Koç Üniversitesi ENG B42',5200.00),(15,5,'2023-06-12','Koç Üniversitesi ENG B42',5200.00),(16,5,'2023-06-12','Koç Üniversitesi ENG B42',4670.00),(17,5,'2023-06-12','Koç Üniversitesi ENG B42',1900.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `stock` int NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (31,'Apple MacBook Pro','A powerful laptop for professional use','Laptops',10,'macbook_pro.jpg','Apple'),(32,'HP Spectre x360','Convertible laptop with great design and performance','Laptops',5,'hp_spectre.jpg','HP'),(33,'Asus ROG Zephyrus G14','Powerful gaming laptop with great battery life','Laptops',8,'asus_rog.jpg','Asus'),(34,'Samsung Galaxy S21 Ultra','Flagship Android smartphone with amazing camera','Smartphones',15,'samsung_s21.jpg','Samsung'),(35,'OnePlus 9 Pro','High-end smartphone with great display and camera','Smartphones',12,'oneplus_9.jpg','OnePlus'),(36,'Google Pixel 5','Great camera and software features in a compact design','Smartphones',20,'google_pixel.jpg','Google'),(37,'Sony WH-1000XM4','Wireless noise-cancelling headphones with great sound','Headphones',25,'sony_wh1000xm4.jpg','Sony'),(38,'Bose QuietComfort 35 II','Legendary noise-cancelling headphones with great comfort','Headphones',18,'bose_qc35.jpg','Bose'),(39,'Jabra Elite 85t','Wireless earbuds with great sound and active noise-cancellation','Headphones',30,'jabra_elite.jpg','Jabra'),(40,'Logitech MX Master 3','Advanced wireless mouse for productivity','Mice',40,'logitech_mx.jpg','Logitech'),(41,'Microsoft Surface Precision Mouse','Ergonomic wireless mouse with customizable buttons','Mice',35,'surface_precision.jpg','Microsoft'),(42,'Razer DeathAdder V2','High-performance gaming mouse with great sensor','Mice',50,'razer_deathadder.jpg','Razer'),(43,'Dell Ultrasharp U2720Q','27-inch 4K monitor for stunning visuals','Monitors',6,'dell_u2720q.jpg','Dell'),(44,'LG 34GN850-B','34-inch ultrawide gaming monitor with great color accuracy','Monitors',4,'lg_34gn850.jpg','LG'),(45,'Asus TUF Gaming VG279QM','27-inch gaming monitor with 240Hz refresh rate and HDR','Monitors',10,'asus_vg279qm.jpg','Asus'),(46,'Nintendo Switch','Hybrid gaming console for playing at home or on-the-go','Gaming Consoles',8,'nintendo_switch.jpg','Nintendo'),(47,'Sony PlayStation 5','Next-gen gaming console with powerful hardware and exclusive games','Gaming Consoles',3,'sony_ps5.jpg','Sony'),(48,'Xbox Series X','Powerful gaming console with great backward compatibility','Gaming Consoles',5,'xbox_series_x.jpg','Microsoft'),(49,'Fitbit Charge 5','Advanced fitness tracker with built-in GPS and heart rate monitor','Fitness Trackers',15,'fitbit_charge5.jpg','Fitbit'),(50,'Garmin Forerunner 945','Advanced GPS running watch with great battery life','Fitness Trackers',6,'garmin_forerunner.jpg','Garmin'),(51,'Apple Watch Series 6','Smartwatch with advanced health and fitness features','Fitness Trackers',10,'apple_watch6.jpg','Apple'),(52,'Amazon Echo Show 10','Smart display with Alexa and 10.1-inch HD screen','Smart Speakers',10,'amazon_echo_show10.jpg','Amazon'),(53,'Google Nest Hub Max','Smart display with Google Assistant and 10-inch screen','Smart Speakers',8,'google_nest_hub.jpg','Google'),(54,'Sonos One','Smart speaker with great sound and support for multiple voice assistants','Smart Speakers',12,'sonos_one.jpg','Sonos'),(55,'Canon EOS R6','Full-frame mirrorless camera for professional photographers','Cameras',3,'canon_eos_r6.jpg','Canon'),(56,'Nikon Z7 II','High-resolution mirrorless camera with great image quality','Cameras',2,'nikon_z7ii.jpg','Nikon'),(57,'Sony Alpha a7 III','Versatile full-frame mirrorless camera for enthusiasts','Cameras',4,'sony_alpha_a7iii.jpg','Sony'),(58,'Western Digital My Passport','Portable external hard drive for backing up data','Storage',20,'wd_my_passport.jpg','Western Digital'),(59,'Samsung T5 Portable SSD','Compact and fast external SSD for high-speed data transfer','Storage',15,'samsung_t5_ssd.jpg','Samsung'),(60,'Seagate Backup Plus Slim','Slim and portable external hard drive with large storage capacity','Storage',10,'seagate_backup_plus.jpg','Seagate');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_product`
--

DROP TABLE IF EXISTS `supplier_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_product` (
  `supplier_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`supplier_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `supplier_product_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`),
  CONSTRAINT `supplier_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_product`
--

LOCK TABLES `supplier_product` WRITE;
/*!40000 ALTER TABLE `supplier_product` DISABLE KEYS */;
INSERT INTO `supplier_product` VALUES (1,31,1899.99,5),(1,40,49.99,25),(1,41,29.99,20),(1,48,599.99,3),(1,49,399.99,5),(1,56,139.99,5),(1,57,119.99,7),(2,31,1399.99,8),(2,35,899.99,7),(2,36,649.99,12),(2,42,1799.99,4),(2,43,1199.99,6),(2,44,799.99,8),(2,50,79.99,20),(2,51,59.99,15),(2,52,39.99,25),(2,58,549.99,4),(2,59,399.99,6),(2,60,899.99,5),(3,31,1299.99,3),(3,37,299.99,15),(3,38,249.99,9),(3,39,199.99,18),(3,45,499.99,10),(3,46,399.99,12),(3,47,299.99,15),(3,53,129.99,8),(3,54,89.99,12),(3,55,69.99,18);
/*!40000 ALTER TABLE `supplier_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Supplier A','supplierA@example.com'),(2,'Supplier B','supplierB@example.com'),(3,'Supplier C','supplierC@example.com');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-12 12:25:33
