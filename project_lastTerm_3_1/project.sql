-- MariaDB dump 10.19-11.1.0-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: project_db
-- ------------------------------------------------------
-- Server version	11.1.0-MariaDB

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
-- Table structure for table `project_board`
--

DROP TABLE IF EXISTS `project_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_board` (
  `board_seq` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `writer` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL COMMENT 'SHA256방식으로 데이터 저장',
  `contents` text DEFAULT NULL,
  `hits` int(10) unsigned DEFAULT NULL,
  `reg_dt` datetime DEFAULT NULL,
  `mod_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`board_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_board`
--

LOCK TABLES `project_board` WRITE;
/*!40000 ALTER TABLE `project_board` DISABLE KEYS */;
INSERT INTO `project_board` VALUES
(1,'미확인 입금자 안내','admin',NULL,'평일 오후 1- 6시 070 - 8111 - 0841로 전화주시거나\r\n\r\nQ&A 게시판에\r\n\r\n입금날짜, 주문자 성함/ 입금자 성함, 금액\r\n\r\n글 남겨주시면 확인처리 해드리겠습니다\r\n\r\n\r\n\r\n주문시 적어주신 정보와 성함, 금액이 동일하여야 정확한 확인 가능합니다\r\n\r\n자동 입금 확인처리는 입금 후 15분~1시간정도 소요됩니다',NULL,NULL,NULL),
(9,'배송 준비기간 : 입금 후 최소 하루~일주일정도 소요됩니다(주말제외,평일기준)','admin',NULL,'안녕하세요.\r\n\r\n배송 준비기간 안내드립니다.\r\n\r\n\r\n\r\n당일발송이라 적혀있는 상품은 평일 오후 3시 이전 입금해주시면 당일 발송(당일출발O,당일도착X)\r\n\r\n\r\n\r\n그외의 모든 상품은 입금 후 최소 하루에서 일주일정도 배송 준비기간 소요되세요(주말제외,평일기준)\r\n\r\n입금일에서 일주일내로 발송 가능한 경우에는 따로 입고지연표시 되지 않으시구요.\r\n\r\n입금 후 7일내로 발송해드리지 못하는 경우에는 배송지연 문자로 안내드리고 있습니다.\r\n\r\n\r\n\r\n또한 기본 배송 준비기간인 일주일내로 구매상품 보내드리지 못하는 경우에는 저희쪽에서 택배비 부담하고 준비된 상품 먼저 개별발송 해드린답니다.\r\n\r\n\r\n\r\n상품 재고가 사무실에 넉넉하게 있는 경우에는 빠른 발송 가능하나\r\n\r\n재고가 소진되어 재입고를 기다리는 중이거나\r\n\r\n주말이 끼어있어서 배송 준비기간이 늘어나는 경우가 있으므로\r\n\r\n\r\n\r\n★빠른 배송을 원하실 경우 입금 전 미리 문의해주시고 주문 부탁드립니다.\r\n\r\n\r\n\r\n\r\n\r\n기본 배송료는 2500원이며, 7만원이상 구매시 무료배송됩니다.\r\n\r\n배송업체는 대한통운입니다.\r\n(제주 산간지역은 추가 배송비가 부가되며 반품 배송비도 동일)',NULL,NULL,NULL);
/*!40000 ALTER TABLE `project_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_items`
--

DROP TABLE IF EXISTS `project_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `memo` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `favorite` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_items`
--

LOCK TABLES `project_items` WRITE;
/*!40000 ALTER TABLE `project_items` DISABLE KEYS */;
INSERT INTO `project_items` VALUES
(1,'anrak','anrak','images/anrak.jpg',32000,NULL,NULL,NULL),
(2,'bamak','bamak','images/bamak.jpg',30000,NULL,NULL,NULL),
(3,'midnight_tshirt','midnight_tshirt','images/midnight_tshirt.jpg',50000,NULL,NULL,NULL),
(4,'pullupblack_set','pullupblack_set','images/pullupblack_set.jpg',40000,NULL,NULL,NULL);
/*!40000 ALTER TABLE `project_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_purchase`
--

DROP TABLE IF EXISTS `project_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_purchase`
--

LOCK TABLES `project_purchase` WRITE;
/*!40000 ALTER TABLE `project_purchase` DISABLE KEYS */;
INSERT INTO `project_purchase` VALUES
(1,'id',1,'anrak',1,30000,NULL,NULL),
(2,NULL,1,'anrak',NULL,32000,NULL,NULL),
(3,NULL,2,'bamak',NULL,30000,NULL,NULL),
(4,NULL,2,'bamak',NULL,30000,NULL,NULL),
(5,NULL,3,'midnight_tshirt',NULL,50000,NULL,NULL),
(6,NULL,3,'midnight_tshirt',NULL,50000,NULL,NULL);
/*!40000 ALTER TABLE `project_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_review`
--

DROP TABLE IF EXISTS `project_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_review` (
  `id` int(11) NOT NULL COMMENT '그냥 임의의 숫자',
  `username` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `score` int(11) NOT NULL,
  `image` varbinary(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_review`
--

LOCK TABLES `project_review` WRITE;
/*!40000 ALTER TABLE `project_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_user`
--

DROP TABLE IF EXISTS `project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `p_name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `birth` varchar(50) NOT NULL,
  `pnum` varchar(50) NOT NULL,
  `address_num` varchar(50) DEFAULT NULL,
  `address_road` varchar(50) DEFAULT NULL,
  `address_detail` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user`
--

LOCK TABLES `project_user` WRITE;
/*!40000 ALTER TABLE `project_user` DISABLE KEYS */;
INSERT INTO `project_user` VALUES
('admin','admin','관리자','man','2023-06-06','01033338888','서울시','','',NULL,NULL),
('example_username','example_password','example_p_name','example_gender','1992-01-01','example_pnum','example_address_num','example_address_road','example_address_detail','2023-06-16 17:53:45','2023-06-16 17:53:45'),
('haneul','1004','기마늘','woman','2011-04-23','01055555555','서울시','','',NULL,NULL),
('id','pas','송영재','남','0601','123','1@nvve.com','고아덕4로','2345','2065-12-05 00:00:00',NULL),
('thddudwo','123456','송영','man','2023-06-06','01012222222','','','',NULL,NULL);
/*!40000 ALTER TABLE `project_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-19 20:05:45
