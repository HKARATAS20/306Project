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


use project;
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
INSERT INTO `basket_items` VALUES (1,19,6,1,450),(4,1,2,1,150),(4,5,9,1,700);
/*!40000 ALTER TABLE `basket_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Ali','Yılmaz','aliyilmaz@mail.com','Atatürk Caddesi 123','Istanbul'),(2,'Ayşe','Kaya','aysekaya@mail.com','Cumhuriyet Sokak 456','Ankara'),(3,'Mehmet','Arslan','mehmetarslan@mail.com','İstiklal Caddesi 789','Izmir'),(4,'Fatma','Demir','fatmademir@mail.com','Kazım Karabekir Sokak 234','Bursa'),(5,'Mustafa','Öztürk','mustafaozturk@mail.com','Gazi Bulvarı 567','Antalya'),(6,'Zeynep','Çelik','zeynepcelik@mail.com','Adnan Menderes Caddesi 890','Konya'),(7,'Ahmet','Şahin','ahmetsahin@mail.com','Namık Kemal Sokak 123','Istanbul'),(8,'Hatice','Koç','haticekoc@mail.com','Palmiye Caddesi 234','Ankara'),(9,'Hüseyin','Aksoy','huseyinaksoy@mail.com','Atatürk Bulvarı 789','Izmir'),(10,'Sultan','Aydın','sultanaydin@mail.com','Mevlana Caddesi 234','Bursa'),(11,'Ahmet','Yıldırım','ahmetyildirim@mail.com','Cumhuriyet Mahallesi 123','Bolu'),(12,'Ayşe','Can','aysecan@mail.com','Atatürk Caddesi 456','Ankara'),(13,'Mehmet','Özdemir','mehmetozdemir@mail.com','İstiklal Sokak 789','Izmir'),(14,'Fatma','Kara','fatmakara@mail.com','Gazi Bulvarı 234','Bursa'),(15,'Mustafa','Demirci','mustafademirci@mail.com','Cumhuriyet Caddesi 567','Antalya'),(16,'Zeynep','Şahin','zeynepsahin@mail.com','Kazım Karabekir Sokak 890','Konya'),(17,'Sema','Koç','semakoc@mail.com','Mevlana Caddesi 456','Ankara'),(18,'Hakan','Aydın','hakanaydin@mail.com','Namık Kemal Sokak 789','Izmir'),(19,'Sibel','Kılıç','sibelkilic@mail.com','Yıldız Sokak 567','Bursa'),(20,'Murat','Aksoy','murataksoy@mail.com','Kazım Karabekir Caddesi 567','Antalya'),(21,'Ebru','Aslan','ebruaslan@mail.com','Atatürk Bulvarı 890','Konya'),(22,'Ali','Demir','alidemir@mail.com','Cumhuriyet Mahallesi 123','Duzce'),(23,'Fatma','Yılmaz','fatmayilmaz@mail.com','Gazi Bulvarı 234','Edirne'),(24,'Mustafa','Kurt','mustafakurt@mail.com','Cumhuriyet Caddesi 567','Mugla'),(25,'Zeynep','Yıldız','zeynepyildiz@mail.com','Gül Sokak 123','Trabzon'),(26,'Ali','Akgün','aliakgun@mail.com','Atatürk Bulvarı 123','Rize'),(27,'Sema','Kara','semakara@mail.com','Çiçek Caddesi 234','Mus'),(28,'Hakan','Aslan','hakanaslan@mail.com','Namık Kemal Sokak 789','Bingol'),(29,'Sibel','Koç','sibelkoc@mail.com','Park Caddesi 456','Hatay'),(30,'Murat','Öztürk','muratozturk@mail.com','Kazım Karabekir Caddesi 567','Adana'),(31,'Ebru','Güneş','ebrugunes@mail.com','Atatürk Bulvarı 890','Gaziantep'),(32,'Ahmet','Kılıç','ahmetkilic@mail.com','Gazi Bulvarı 123','Tekirdag'),(33,'Nazlı','Bulut','nazlibulut@mail.com','Mevlana Caddesi 456','Balikesir'),(34,'Kemal','Sönmez','kemalsonmez@mail.com','Atatürk Caddesi 789','Kayseri'),(35,'Ali','Kaya','alikaya@mail.com','Çay Sokak 123','Gaziantep'),(36,'Deniz','Yıldırım','denizyildirim@mail.com','Yıldırım Caddesi 456','Konya'),(37,'Ebru','Aydın','ebruaydin@mail.com','Çınar Caddesi 789','Bolu'),(38,'Hakan','Şahin','hakansahin@mail.com','Kale Sokak 234','Eskişehir'),(39,'Leyla','Öztürk','leylaozturk@mail.com','Gazi Caddesi 567','Balıkesir'),(40,'Metin','Koç','metinkoc@mail.com','Akasya Sokak 890','Denizli'),(41,'Nil','Demir','nildemir@mail.com','Gül Caddesi 123','Kocaeli'),(42,'Özlem','Yılmaz','ozlemyilmaz@mail.com','Palmiye Sokak 456','Muğla'),(43,'Serdar','Akgün','serdarakgun@mail.com','Sahil Caddesi 789','Rize'),(44,'Zeynep','Güneş','zeynepgunes@mail.com','Çınar Sokak 234','Manisa'),(45,'Ata','Erdal','ataerdal@mail.com','Koç Üniversitesi SGKM',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
INSERT INTO `order_items` VALUES (18,2,1,1,90),(18,21,2,1,350),(19,1,2,1,150),(19,8,3,1,1000),(19,17,10,1,60),(19,27,2,1,30),(20,12,7,1,250),(20,19,6,1,450),(20,20,9,1,600),(20,23,2,1,220),(21,6,8,1,1000),(21,12,4,1,800),(22,1,2,1,150),(22,14,11,1,130),(22,16,2,1,50),(22,27,10,1,80),(23,1,3,1,3000),(23,21,2,1,350),(23,25,12,1,900),(23,26,12,1,600),(24,11,2,1,150),(24,27,10,1,80),(25,1,1,1,1900),(25,2,1,1,90),(25,11,2,1,150),(25,14,6,1,450),(26,15,12,1,600),(26,16,2,1,50),(26,21,2,1,350),(26,23,2,1,220),(26,27,10,1,80),(27,5,3,1,3000),(28,1,3,1,3000),(28,3,4,1,70),(28,8,3,1,1000),(28,18,8,1,1000),(29,1,1,1,1900),(29,6,4,1,600),(29,9,6,1,400),(30,2,8,1,1800),(30,4,5,1,1200),(30,5,9,1,700),(31,1,2,1,150),(31,7,3,1,1500),(31,8,3,1,1000),(31,12,7,1,250),(31,13,7,1,180),(31,14,11,1,130),(32,1,2,1,150),(32,7,4,1,70),(32,14,6,1,450),(33,11,10,1,60),(33,13,7,1,180),(34,2,1,1,90),(35,22,6,1,400),(36,24,1,1,130),(37,10,11,1,130),(38,23,2,1,220),(38,25,12,1,900),(39,28,1,1,90),(40,1,3,1,3000),(40,16,2,1,50),(41,1,2,1,150),(42,17,9,1,600),(42,19,6,1,450),(43,26,12,1,600),(44,20,7,1,180),(45,1,1,1,1900),(45,16,2,1,50),(45,21,2,1,350),(46,1,2,1,150),(46,16,2,1,50),(46,24,1,1,130),(47,10,8,1,1800),(47,19,6,1,450),(47,25,12,1,900),(48,3,4,1,70),(49,4,5,1,1200),(50,4,2,1,60),(51,21,2,1,350),(52,24,1,1,130),(53,1,3,1,3000),(54,1,1,1,1900),(54,16,2,1,50),(55,16,2,1,50),(55,18,8,1,1000),(56,3,4,1,70),(57,25,12,1,900),(58,2,1,1,90),(59,1,2,1,150),(59,11,10,1,60),(59,16,2,1,50),(60,2,1,1,90),(60,24,1,1,130),(60,28,1,1,90);
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (18,4,'2023-06-12','Kazım Karabekir Sokak 234',440.00),(19,1,'2023-06-12','Atatürk Caddesi 123',1240.00),(20,6,'2023-06-12','Adnan Menderes Caddesi 890',1520.00),(21,6,'2023-06-12','Adnan Menderes Caddesi 890',1800.00),(22,18,'2023-06-12','Namık Kemal Sokak 789',410.00),(23,25,'2023-06-12','Gül Sokak 123',4850.00),(24,25,'2023-06-12','Gül Sokak 123',230.00),(25,32,'2023-06-12','Gazi Bulvarı 123',2590.00),(26,39,'2023-06-12','Gazi Caddesi 567',1300.00),(27,39,'2023-06-12','Gazi Caddesi 567',3000.00),(28,35,'2023-06-12','Çay Sokak 123',5070.00),(29,11,'2023-06-12','Cumhuriyet Mahallesi 123',2900.00),(30,15,'2023-06-12','Cumhuriyet Caddesi 567',3700.00),(31,7,'2023-06-12','Namık Kemal Sokak 123',3210.00),(32,7,'2023-06-12','Namık Kemal Sokak 123',670.00),(33,21,'2023-06-12','Atatürk Bulvarı 890',240.00),(34,40,'2023-06-12','Akasya Sokak 890',90.00),(35,34,'2023-06-12','Atatürk Caddesi 789',400.00),(36,42,'2023-06-12','Palmiye Sokak 456',130.00),(37,43,'2023-06-12','Sahil Caddesi 789',130.00),(38,43,'2023-06-12','Sahil Caddesi 789',1120.00),(39,32,'2023-06-12','Gazi Bulvarı 123',90.00),(40,25,'2023-06-12','Gül Sokak 123',3050.00),(41,12,'2023-06-12','Atatürk Caddesi 456',150.00),(42,12,'2023-06-12','Atatürk Caddesi 456',1050.00),(43,27,'2023-06-12','Çiçek Caddesi 234',600.00),(44,27,'2023-06-12','Çiçek Caddesi 234',180.00),(45,3,'2023-06-12','İstiklal Caddesi 789',2300.00),(46,2,'2023-06-12','Cumhuriyet Sokak 456',330.00),(47,16,'2023-06-12','Kazım Karabekir Sokak 890',3150.00),(48,4,'2023-06-12','Kazım Karabekir Sokak 234',70.00),(49,23,'2023-06-12','Gazi Bulvarı 234',1200.00),(50,23,'2023-06-12','Gazi Bulvarı 234',60.00),(51,23,'2023-06-12','Gazi Bulvarı 234',350.00),(52,18,'2023-06-12','Namık Kemal Sokak 789',130.00),(53,26,'2023-06-12','Atatürk Bulvarı 123',3000.00),(54,26,'2023-06-12','Atatürk Bulvarı 123',1950.00),(55,35,'2023-06-12','Çay Sokak 123',1050.00),(56,41,'2023-06-12','Gül Caddesi 123',70.00),(57,6,'2023-06-12','Adnan Menderes Caddesi 890',900.00),(58,25,'2023-06-12','Gül Sokak 123',90.00),(59,25,'2023-06-12','Gül Sokak 123',260.00),(60,45,'2023-06-13','Koç Üniversitesi SGKM',310.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Apple MacBook Pro','A powerful laptop for professional use','Laptops',10,'macbook_pro.jpg','Apple'),(2,'HP Spectre x360','Convertible laptop with great design and performance','Laptops',5,'hp_spectre.jpg','HP'),(3,'Asus ROG Zephyrus G14','Powerful gaming laptop with great battery life','Laptops',8,'asus_rog.jpg','Asus'),(4,'Samsung Galaxy S21 Ultra','Flagship Android smartphone with amazing camera','Smartphones',15,'samsung_s21.jpg','Samsung'),(5,'OnePlus 9 Pro','High-end smartphone with great display and camera','Smartphones',12,'oneplus_9.jpg','OnePlus'),(6,'Google Pixel 5','Great camera and software features in a compact design','Smartphones',20,'google_pixel.jpg','Google'),(7,'Sony WH-1000XM4','Wireless noise-cancelling headphones with great sound','Headphones',25,'sony_wh1000xm4.jpg','Sony'),(8,'Bose QuietComfort 35 II','Legendary noise-cancelling headphones with great comfort','Headphones',18,'bose_qc35.jpg','Bose'),(9,'Jabra Elite 85t','Wireless earbuds with great sound and active noise-cancellation','Headphones',30,'jabra_elite.jpg','Jabra'),(10,'Logitech MX Master 3','Advanced wireless mouse for productivity','Mice',40,'logitech_mx.jpg','Logitech'),(11,'Microsoft Surface Precision Mouse','Ergonomic wireless mouse with customizable buttons','Mice',35,'surface_precision.jpg','Microsoft'),(12,'Razer DeathAdder V2','High-performance gaming mouse with great sensor','Mice',50,'razer_deathadder.jpg','Razer'),(13,'Dell Ultrasharp U2720Q','27-inch 4K monitor for stunning visuals','Monitors',6,'dell_u2720q.jpg','Dell'),(14,'LG 34GN850-B','34-inch ultrawide gaming monitor with great color accuracy','Monitors',4,'lg_34gn850.jpg','LG'),(15,'Asus TUF Gaming VG279QM','27-inch gaming monitor with 240Hz refresh rate and HDR','Monitors',10,'asus_vg279qm.jpg','Asus'),(16,'Nintendo Switch','Hybrid gaming console for playing at home or on-the-go','Gaming Consoles',8,'nintendo_switch.jpg','Nintendo'),(17,'Sony PlayStation 5','Next-gen gaming console with powerful hardware and exclusive games','Gaming Consoles',3,'sony_ps5.jpg','Sony'),(18,'Xbox Series X','Powerful gaming console with great backward compatibility','Gaming Consoles',5,'xbox_series_x.jpg','Microsoft'),(19,'Fitbit Charge 5','Advanced fitness tracker with built-in GPS and heart rate monitor','Fitness Trackers',15,'fitbit_charge5.jpg','Fitbit'),(20,'Garmin Forerunner 945','Advanced GPS running watch with great battery life','Fitness Trackers',6,'garmin_forerunner.jpg','Garmin'),(21,'Apple Watch Series 6','Smartwatch with advanced health and fitness features','Fitness Trackers',10,'apple_watch6.jpg','Apple'),(22,'Amazon Echo Show 10','Smart display with Alexa and 10.1-inch HD screen','Smart Speakers',10,'amazon_echo_show10.jpg','Amazon'),(23,'Google Nest Hub Max','Smart display with Google Assistant and 10-inch screen','Smart Speakers',8,'google_nest_hub.jpg','Google'),(24,'Sonos One','Smart speaker with great sound and support for multiple voice assistants','Smart Speakers',12,'sonos_one.jpg','Sonos'),(25,'Canon EOS R6','Full-frame mirrorless camera for professional photographers','Cameras',3,'canon_eos_r6.jpg','Canon'),(26,'Nikon Z7 II','High-resolution mirrorless camera with great image quality','Cameras',2,'nikon_z7ii.jpg','Nikon'),(27,'Sony Alpha a7 III','Versatile full-frame mirrorless camera for enthusiasts','Cameras',4,'sony_alpha_a7iii.jpg','Sony'),(28,'Western Digital My Passport','Portable external hard drive for backing up data','Storage',20,'wd_my_passport.jpg','Western Digital'),(29,'Samsung T5 Portable SSD','Compact and fast external SSD for high-speed data transfer','Storage',15,'samsung_t5_ssd.jpg','Samsung'),(30,'Seagate Backup Plus Slim','Slim and portable external hard drive with large storage capacity','Storage',10,'seagate_backup_plus.jpg','Seagate');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`product_id`,`supplier_id`),
  KEY `rates_ibfk_2` (`product_id`),
  KEY `rates_ibfk_3` (`supplier_id`),
  CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `rates_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `rates_ibfk_3` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_product` (`supplier_id`),
  CONSTRAINT `ratings_chk_1` CHECK (((`rating` >= 0) and (`rating` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,17,10,3),(3,16,2,4),(4,3,4,4),(7,1,2,4),(7,7,3,5),(7,7,4,4),(7,8,3,5),(7,12,7,3),(7,13,7,1),(7,14,11,4),(11,1,1,5),(11,6,4,3),(11,9,6,4),(12,1,2,5),(12,17,9,4),(15,2,8,1),(15,4,5,5),(15,5,9,3),(18,24,1,2),(21,11,10,5),(21,13,7,2),(23,4,2,4),(23,21,2,2),(25,1,2,5),(25,1,3,4),(25,11,10,2),(25,16,2,3),(26,16,2,5),(27,20,7,4),(27,26,12,4),(32,11,2,4),(32,28,1,4),(34,22,6,2),(35,1,3,2),(35,3,4,5),(35,18,8,3),(39,15,12,5),(39,21,2,4),(39,27,10,2),(40,2,1,5),(42,24,1,4),(43,10,11,5),(43,23,2,5),(45,2,1,4);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
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
INSERT INTO `supplier_product` VALUES (1,1,1824.77,1),(1,4,1141.45,2),(1,7,316.47,3),(1,10,91.06,4),(1,13,401.51,5),(1,16,229.10,6),(1,19,164.33,7),(1,22,205.56,8),(1,25,1143.57,9),(1,28,138.42,10),(2,2,1898.05,1),(2,5,1059.75,2),(2,8,302.29,3),(2,11,76.55,4),(2,14,402.31,5),(2,17,213.81,6),(2,20,118.61,7),(2,23,239.10,8),(2,26,1212.15,9),(2,29,171.47,10),(3,3,1987.43,1),(3,6,1108.34,2),(3,9,389.69,3),(3,12,95.78,4),(3,15,460.65,5),(3,18,213.62,6),(3,21,136.04,7),(3,24,244.54,8),(3,27,1102.54,9),(3,30,184.01,10),(4,1,1978.63,1),(4,4,1189.05,2),(4,7,304.69,3),(4,10,81.96,4),(4,13,485.22,5),(4,16,201.96,6),(4,19,161.61,7),(4,22,232.73,8),(4,25,1962.95,9),(4,28,185.07,10),(5,2,1872.93,1),(5,5,1054.22,2),(5,8,326.16,3),(5,11,84.84,4),(5,14,468.79,5),(5,17,228.68,6),(5,20,157.26,7),(5,23,235.56,8),(5,26,1408.34,9),(5,29,190.83,10),(6,3,1863.34,1),(6,6,1171.71,2),(6,9,334.27,3),(6,12,74.13,4),(6,15,466.03,5),(6,18,226.66,6),(6,21,136.98,7),(6,24,232.25,8),(6,27,1838.84,9),(6,30,125.89,10),(7,1,1955.63,1),(7,3,1022.80,2),(7,5,323.55,3),(7,7,95.06,4),(7,9,447.06,5),(7,11,225.40,6),(7,13,165.76,7),(7,15,228.50,8),(7,17,1383.73,9),(7,19,120.87,10),(8,2,1978.47,1),(8,4,1167.13,2),(8,6,350.12,3),(8,8,99.97,4),(8,10,449.09,5),(8,12,213.74,6),(8,14,165.39,7),(8,16,235.63,8),(8,18,1111.07,9),(8,20,141.75,10),(9,3,1950.87,1),(9,5,1103.83,2),(9,7,333.26,3),(9,9,73.18,4),(9,11,453.14,5),(9,13,210.18,6),(9,15,108.15,7),(9,17,224.59,8),(9,19,1153.77,9),(9,21,129.32,10),(10,4,1800.90,1),(10,6,1028.61,2),(10,8,370.17,3),(10,10,72.38,4),(10,12,429.20,5),(10,14,206.65,6),(10,16,118.56,7),(10,18,224.77,8),(10,20,1780.82,9),(10,22,141.80,10),(11,5,1949.46,1),(11,7,1096.54,2),(11,9,317.15,3),(11,11,82.28,4),(11,13,453.22,5),(11,15,212.99,6),(11,17,145.43,7),(11,19,227.04,8),(11,21,1000.33,9),(11,23,137.93,10),(12,6,1979.07,1),(12,8,1067.80,2),(12,10,300.90,3),(12,12,70.84,4),(12,14,411.24,5),(12,16,214.35,6),(12,18,104.36,7),(12,20,241.87,8),(12,22,1023.69,9),(12,24,160.62,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Vatan Bilgisayar','vatanbilgisayar@mail.com'),(2,'Teknosa','teknosa@mail.com'),(3,'Hepsiburada','hepsiburada@mail.com'),(4,'Media Markt','mediamarkt@mail.com'),(5,'Bimeks','bimeks@mail.com'),(6,'E-Bayi','ebayi@mail.com'),(7,'GittiGidiyor','gittigidiyor@mail.com'),(8,'Amazon','amazon@mail.com'),(9,'Trendyol','trendyol@mail.com'),(10,'D&R','dr@mail.com'),(11,'Morhipo','morhipo@mail.com'),(12,'N11','n11@mail.com');
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

-- Dump completed on 2023-06-14 13:41:45
