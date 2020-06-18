-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: take_out_system
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `Dish_name`
--

DROP TABLE IF EXISTS `Dish_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dish_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(11) NOT NULL,
  `dish_price` decimal(5,2) NOT NULL,
  `dish_sale` int(11) NOT NULL,
  `dish_image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dish_name`
--

LOCK TABLES `Dish_name` WRITE;
/*!40000 ALTER TABLE `Dish_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dish_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dish_name_noodle_key`
--

DROP TABLE IF EXISTS `Dish_name_noodle_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dish_name_noodle_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_name_id` int(11) NOT NULL,
  `noodles_shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Dish_name_noodle_key_dish_name_id_noodles_shop_id_8721014d_uniq` (`dish_name_id`,`noodles_shop_id`),
  KEY `Dish_name_noodle_key_noodles_shop_id_08adbd0c_fk_Nooldles_` (`noodles_shop_id`),
  CONSTRAINT `Dish_name_noodle_key_dish_name_id_952e68fd_fk_Dish_name_id` FOREIGN KEY (`dish_name_id`) REFERENCES `Dish_name` (`id`),
  CONSTRAINT `Dish_name_noodle_key_noodles_shop_id_08adbd0c_fk_Nooldles_` FOREIGN KEY (`noodles_shop_id`) REFERENCES `Nooldles_shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dish_name_noodle_key`
--

LOCK TABLES `Dish_name_noodle_key` WRITE;
/*!40000 ALTER TABLE `Dish_name_noodle_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dish_name_noodle_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nooldles_shop`
--

DROP TABLE IF EXISTS `Nooldles_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nooldles_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noodle_name` varchar(32) NOT NULL,
  `noodle_adress` varchar(128) NOT NULL,
  `noodle_sales` int(11) NOT NULL,
  `noodle_img` varchar(100) NOT NULL,
  `noodle_status` tinyint(1) NOT NULL,
  `noodle_paise` decimal(2,1) NOT NULL,
  `noodle_created_time` datetime(6) NOT NULL,
  `bg_img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nooldles_shop`
--

LOCK TABLES `Nooldles_shop` WRITE;
/*!40000 ALTER TABLE `Nooldles_shop` DISABLE KEYS */;
INSERT INTO `Nooldles_shop` VALUES (1,'重庆小面','金蝶软件园Ａ-栋',4500,'static/upload/stores/2019-11-05_23-22-58_的屏幕截图.png',1,4.5,'2019-11-06 01:09:30.514373',''),(2,'好好吃酸辣粉','南京市中山北路45号',3500,'static/upload/stores/2019-11-05_20-06-29_的屏幕截图.png',1,3.6,'2019-11-06 01:11:26.408739',''),(3,'秦都乌冬面','瑞金路3号店',2300,'static/upload/stores/2019-11-05_23-21-16_的屏幕截图.png',1,3.4,'2019-11-06 01:09:30.401616',''),(4,'兰州拉面','总统府15号',2600,'static/upload/stores/2019-11-05_21-36-29_的屏幕截图.png',1,3.7,'2019-11-06 01:11:26.239766',''),(5,'火锅米线','江北新村',1400,'static/upload/stores/2019-11-05_23-13-26_的屏幕截图.png',1,3.9,'2019-11-06 01:11:26.075116',''),(6,'功夫炒面','江宁区东山街道店',3460,'static/upload/stores/2019-11-05_23-15-24_的屏幕截图.png',1,4.6,'2019-11-06 01:09:30.234436',''),(7,'海鲜面馆','瑞金北村51号',4150,'static/upload/stores/2019-11-05_23-17-41_的屏幕截图.png',1,3.8,'2019-11-06 01:09:30.068713',''),(8,'老面馆','城南店',6300,'static/upload/stores/2019-11-05_23-19-53_的屏幕截图.png',1,4.6,'2019-11-06 01:09:29.939541',''),(9,'火辣炸鸡','江北店',2645,'static/upload/stores/2019-11-09_16-01-23_的屏幕截图.png',1,4.6,'2019-11-09 08:02:29.174001',''),(10,'巨好吃炸鸡块','中山南路36号',3890,'static/upload/stores/2019-11-09_16-01-12_的屏幕截图.png',1,4.5,'2019-11-09 14:23:03.538402','');
/*!40000 ALTER TABLE `Nooldles_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add dish_name',7,'add_dish_name'),(20,'Can change dish_name',7,'change_dish_name'),(21,'Can delete dish_name',7,'delete_dish_name'),(22,'Can add noodles_shop',8,'add_noodles_shop'),(23,'Can change noodles_shop',8,'change_noodles_shop'),(24,'Can delete noodles_shop',8,'delete_noodles_shop'),(25,'Can add 商家',9,'add_store'),(26,'Can change 商家',9,'change_store'),(27,'Can delete 商家',9,'delete_store'),(28,'Can add 商品',10,'add_good'),(29,'Can change 商品',10,'change_good'),(30,'Can delete 商品',10,'delete_good'),(31,'Can add 用户',11,'add_userprofile'),(32,'Can change 用户',11,'change_userprofile'),(33,'Can delete 用户',11,'delete_userprofile'),(34,'Can add weibo user',12,'add_weibouser'),(35,'Can change weibo user',12,'change_weibouser'),(36,'Can delete weibo user',12,'delete_weibouser'),(37,'Can add 订单',13,'add_order'),(38,'Can change 订单',13,'change_order'),(39,'Can delete 订单',13,'delete_order'),(40,'Can add 留言表',14,'add_message'),(41,'Can change 留言表',14,'change_message'),(42,'Can delete 留言表',14,'delete_message');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$SmlnZEbw9fc6$4DHv0SSTarM+neFRVZ586lI1zWwIqDRZ0cgFMbRpHuo=','2019-11-24 12:04:13.778454',1,'order_system','','','',1,1,'2019-11-02 06:54:39.085762');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-11-02 07:00:00.075343','1','<重庆小面>',1,'[{\"added\": {}}]',8,1),(2,'2019-11-02 07:01:20.052343','1','<重庆小面>',2,'[{\"changed\": {\"fields\": [\"noodle_adress\"]}}]',8,1),(3,'2019-11-05 12:08:14.526050','2','<好好吃酸辣粉>',1,'[{\"added\": {}}]',8,1),(4,'2019-11-05 13:16:53.079667','3','<秦都瓦罐面>',1,'[{\"added\": {}}]',8,1),(5,'2019-11-05 13:38:06.266008','4','<兰州拉面>',1,'[{\"added\": {}}]',8,1),(6,'2019-11-05 13:39:03.773680','1','<重庆小面>',2,'[{\"changed\": {\"fields\": [\"noodle_adress\"]}}]',8,1),(7,'2019-11-05 15:14:46.498884','5','<火锅米线>',1,'[{\"added\": {}}]',8,1),(8,'2019-11-05 15:16:50.557282','6','<功夫炒面>',1,'[{\"added\": {}}]',8,1),(9,'2019-11-05 15:19:38.170076','7','<海鲜面馆>',1,'[{\"added\": {}}]',8,1),(10,'2019-11-05 15:20:39.773713','8','<老面馆>',1,'[{\"added\": {}}]',8,1),(11,'2019-11-05 15:22:27.603010','3','<秦都乌冬面>',2,'[{\"changed\": {\"fields\": [\"noodle_name\", \"noodle_img\"]}}]',8,1),(12,'2019-11-05 15:23:32.802904','1','<重庆小面>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(13,'2019-11-05 15:29:33.769310','8','<老面馆>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(14,'2019-11-05 15:29:33.880747','7','<海鲜面馆>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(15,'2019-11-05 15:29:34.102953','6','<功夫炒面>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(16,'2019-11-05 15:29:34.215040','5','<火锅米线>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(17,'2019-11-05 15:29:34.326571','4','<兰州拉面>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(18,'2019-11-05 15:29:34.415286','3','<秦都乌冬面>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(19,'2019-11-05 15:29:34.504747','2','<好好吃酸辣粉>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(20,'2019-11-05 15:29:34.593988','1','<重庆小面>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(21,'2019-11-06 01:07:06.949606','2','<好好吃酸辣粉>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(22,'2019-11-06 01:07:59.369950','4','<兰州拉面>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(23,'2019-11-06 01:09:30.011976','8','<老面馆>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(24,'2019-11-06 01:09:30.123416','7','<海鲜面馆>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(25,'2019-11-06 01:09:30.345553','6','<功夫炒面>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(26,'2019-11-06 01:09:30.457173','3','<秦都乌冬面>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(27,'2019-11-06 01:09:30.592628','1','<重庆小面>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(28,'2019-11-06 01:11:26.128374','5','<火锅米线>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(29,'2019-11-06 01:11:26.350785','4','<兰州拉面>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(30,'2019-11-06 01:11:26.462339','2','<好好吃酸辣粉>',2,'[{\"changed\": {\"fields\": [\"noodle_img\"]}}]',8,1),(31,'2019-11-09 07:31:48.604835','1','Store object',1,'[{\"added\": {}}]',9,1),(32,'2019-11-09 07:41:59.578881','2','Store object',1,'[{\"added\": {}}]',9,1),(33,'2019-11-09 07:44:10.451904','3','Store object',1,'[{\"added\": {}}]',9,1),(34,'2019-11-09 07:48:53.219912','4','Store object',1,'[{\"added\": {}}]',9,1),(35,'2019-11-09 07:53:24.377464','4','Store object',2,'[]',9,1),(36,'2019-11-09 07:55:05.001739','5','Store object',1,'[{\"added\": {}}]',9,1),(37,'2019-11-09 07:57:01.952035','6','Store object',1,'[{\"added\": {}}]',9,1),(38,'2019-11-09 08:02:29.175036','9','<火辣炸鸡>',1,'[{\"added\": {}}]',8,1),(39,'2019-11-09 08:05:14.111691','10','<巨好吃炸鸡快>',1,'[{\"added\": {}}]',8,1),(40,'2019-11-09 08:11:31.536614','7','Store object',1,'[{\"added\": {}}]',9,1),(41,'2019-11-09 08:12:25.101240','8','Store object',1,'[{\"added\": {}}]',9,1),(42,'2019-11-09 08:14:01.264392','9','Store object',1,'[{\"added\": {}}]',9,1),(43,'2019-11-09 08:18:16.048651','10','Store object',1,'[{\"added\": {}}]',9,1),(44,'2019-11-09 12:58:19.760711','11','Store object',1,'[{\"added\": {}}]',9,1),(45,'2019-11-09 13:02:13.261576','12','Store object',1,'[{\"added\": {}}]',9,1),(46,'2019-11-09 13:03:55.932233','13','Store object',1,'[{\"added\": {}}]',9,1),(47,'2019-11-09 13:05:39.517284','14','Store object',1,'[{\"added\": {}}]',9,1),(48,'2019-11-09 13:07:33.416538','15','Store object',1,'[{\"added\": {}}]',9,1),(49,'2019-11-09 13:09:51.983928','16','Store object',1,'[{\"added\": {}}]',9,1),(50,'2019-11-09 13:12:02.484922','17','Store object',1,'[{\"added\": {}}]',9,1),(51,'2019-11-09 13:14:49.393309','18','Store object',1,'[{\"added\": {}}]',9,1),(52,'2019-11-09 13:17:20.083323','19','Store object',1,'[{\"added\": {}}]',9,1),(53,'2019-11-09 13:18:32.853772','20','Store object',1,'[{\"added\": {}}]',9,1),(54,'2019-11-09 13:20:20.885091','21','Store object',1,'[{\"added\": {}}]',9,1),(55,'2019-11-09 13:22:39.153988','22','Store object',1,'[{\"added\": {}}]',9,1),(56,'2019-11-09 13:24:14.118484','23','Store object',1,'[{\"added\": {}}]',9,1),(57,'2019-11-09 13:25:41.357702','24','Store object',1,'[{\"added\": {}}]',9,1),(58,'2019-11-09 13:27:56.339810','25','Store object',1,'[{\"added\": {}}]',9,1),(59,'2019-11-09 13:31:45.409936','26','Store object',1,'[{\"added\": {}}]',9,1),(60,'2019-11-09 13:33:08.109732','27','Store object',1,'[{\"added\": {}}]',9,1),(61,'2019-11-09 13:34:07.863064','28','Store object',1,'[{\"added\": {}}]',9,1),(62,'2019-11-09 13:35:19.502118','29','Store object',1,'[{\"added\": {}}]',9,1),(63,'2019-11-09 13:36:42.676486','30','Store object',1,'[{\"added\": {}}]',9,1),(64,'2019-11-09 13:49:59.207090','31','Store object',1,'[{\"added\": {}}]',9,1),(65,'2019-11-09 14:23:03.539970','10','<巨好吃炸鸡块>',2,'[{\"changed\": {\"fields\": [\"noodle_name\"]}}]',8,1),(66,'2019-11-09 14:24:08.626373','32','Store object',1,'[{\"added\": {}}]',9,1),(67,'2019-11-09 14:26:17.911059','33','Store object',1,'[{\"added\": {}}]',9,1),(68,'2019-11-09 14:27:37.205846','34','Store object',1,'[{\"added\": {}}]',9,1),(69,'2019-11-14 12:07:56.819887','1','Good object',1,'[{\"added\": {}}]',10,1),(70,'2019-11-14 12:09:05.151952','1','Good object',2,'[{\"changed\": {\"fields\": [\"c_name\", \"shop\"]}}]',10,1),(71,'2019-11-22 12:58:56.011521','2','Good object',1,'[{\"added\": {}}]',10,1),(72,'2019-11-22 14:18:38.020041','3','Good object',1,'[{\"added\": {}}]',10,1),(73,'2019-11-23 04:01:09.797075','4','Good object',1,'[{\"added\": {}}]',10,1),(74,'2019-11-23 04:02:21.214643','4','Good object',2,'[{\"changed\": {\"fields\": [\"c_picture\"]}}]',10,1),(75,'2019-11-23 04:05:47.026493','5','Good object',1,'[{\"added\": {}}]',10,1),(76,'2019-11-23 04:13:21.065487','6','Good object',1,'[{\"added\": {}}]',10,1),(77,'2019-11-23 06:57:30.762561','7','Good object',1,'[{\"added\": {}}]',10,1),(78,'2019-11-23 10:29:00.441448','8','Good object',1,'[{\"added\": {}}]',10,1),(79,'2019-11-23 10:31:45.547600','9','Good object',1,'[{\"added\": {}}]',10,1),(80,'2019-11-23 15:17:31.118006','10','Good object',1,'[{\"added\": {}}]',10,1),(81,'2019-11-23 15:18:35.838152','11','Good object',1,'[{\"added\": {}}]',10,1),(82,'2019-11-23 15:19:42.922516','12','Good object',1,'[{\"added\": {}}]',10,1),(83,'2019-11-23 15:21:04.809999','13','Good object',1,'[{\"added\": {}}]',10,1),(84,'2019-11-24 12:06:18.358406','14','Good object',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'index','store'),(14,'message','message'),(7,'noodles','dish_name'),(8,'noodles','noodles_shop'),(13,'order','order'),(10,'secondary','good'),(6,'sessions','session'),(11,'user','userprofile'),(12,'user','weibouser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-02 06:52:32.009210'),(2,'auth','0001_initial','2019-11-02 06:52:43.714743'),(3,'admin','0001_initial','2019-11-02 06:52:46.838644'),(4,'admin','0002_logentry_remove_auto_add','2019-11-02 06:52:47.209317'),(5,'contenttypes','0002_remove_content_type_name','2019-11-02 06:52:48.813172'),(6,'auth','0002_alter_permission_name_max_length','2019-11-02 06:52:49.808056'),(7,'auth','0003_alter_user_email_max_length','2019-11-02 06:52:51.592148'),(8,'auth','0004_alter_user_username_opts','2019-11-02 06:52:51.671295'),(9,'auth','0005_alter_user_last_login_null','2019-11-02 06:52:52.366211'),(10,'auth','0006_require_contenttypes_0002','2019-11-02 06:52:52.455333'),(11,'auth','0007_alter_validators_add_error_messages','2019-11-02 06:52:52.549368'),(12,'auth','0008_alter_user_username_max_length','2019-11-02 06:52:54.983396'),(13,'noodles','0001_initial','2019-11-02 06:52:59.297195'),(14,'sessions','0001_initial','2019-11-02 06:53:00.455838'),(15,'noodles','0002_auto_20191102_1500','2019-11-02 07:00:43.434957'),(16,'index','0001_initial','2019-11-09 07:22:49.856503'),(17,'secondary','0001_initial','2019-11-14 11:39:17.153041'),(18,'noodles','0003_noodles_shop_bg_img','2019-11-14 14:42:42.838012'),(19,'index','0002_store_bg_img','2019-11-14 14:45:50.537026'),(20,'user','0001_initial','2019-11-24 01:42:53.126256'),(21,'user','0002_auto_20191109_1823','2019-11-24 01:42:54.507941'),(22,'user','0003_auto_20191109_1901','2019-11-24 01:42:54.788879'),(23,'user','0004_userprofile_user_avatar','2019-11-24 01:42:55.446832'),(24,'user','0005_weibouser','2019-11-24 01:42:57.754225'),(25,'order','0001_initial','2019-11-27 10:09:54.962928'),(26,'message','0001_initial','2019-11-29 16:09:01.420118'),(27,'message','0002_auto_20191129_2249','2019-11-29 16:09:02.556930');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('64j235ghr0uscqd3ix4pu7yl9nvxhg2z','NDRjZTU2YzQyZWU1YzM0NzRiY2QxMDE1ZDBmNjU3ODk5OTY0NGM0MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NTQ4NDA5Njc1MTkzM2E1MWJlMmJmZGYzNTE2NWU1N2EwNDM5YTQwIn0=','2019-12-08 12:04:13.834779'),('7bewkkfzjdg3qyowvd3uw4lt2spcw625','NDRjZTU2YzQyZWU1YzM0NzRiY2QxMDE1ZDBmNjU3ODk5OTY0NGM0MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NTQ4NDA5Njc1MTkzM2E1MWJlMmJmZGYzNTE2NWU1N2EwNDM5YTQwIn0=','2019-11-28 11:43:25.431259'),('cnwsuqul18g0g5wb7dsji7g0g89da8a8','NDRjZTU2YzQyZWU1YzM0NzRiY2QxMDE1ZDBmNjU3ODk5OTY0NGM0MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NTQ4NDA5Njc1MTkzM2E1MWJlMmJmZGYzNTE2NWU1N2EwNDM5YTQwIn0=','2019-12-06 12:51:09.293670'),('h33p261gtcp8f986btsvjb36k7u3s5em','NDRjZTU2YzQyZWU1YzM0NzRiY2QxMDE1ZDBmNjU3ODk5OTY0NGM0MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NTQ4NDA5Njc1MTkzM2E1MWJlMmJmZGYzNTE2NWU1N2EwNDM5YTQwIn0=','2019-11-23 07:28:56.456362'),('qb4e7bssw8ej9s178hitwbu7f4drw9kb','NDRjZTU2YzQyZWU1YzM0NzRiY2QxMDE1ZDBmNjU3ODk5OTY0NGM0MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NTQ4NDA5Njc1MTkzM2E1MWJlMmJmZGYzNTE2NWU1N2EwNDM5YTQwIn0=','2019-11-16 06:54:54.980499'),('zl0cqznn4ll7qymckx5pnop0i9k9mr6a','NDRjZTU2YzQyZWU1YzM0NzRiY2QxMDE1ZDBmNjU3ODk5OTY0NGM0MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NTQ4NDA5Njc1MTkzM2E1MWJlMmJmZGYzNTE2NWU1N2EwNDM5YTQwIn0=','2019-11-19 12:05:22.777956'),('zvpu0p95h5tlanqw3lrbrm1umehdna1n','NDRjZTU2YzQyZWU1YzM0NzRiY2QxMDE1ZDBmNjU3ODk5OTY0NGM0MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NTQ4NDA5Njc1MTkzM2E1MWJlMmJmZGYzNTE2NWU1N2EwNDM5YTQwIn0=','2019-11-17 01:48:46.208564');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(30) NOT NULL,
  `c_price` decimal(4,1) NOT NULL,
  `c_sales` int(11) NOT NULL,
  `c_picture` varchar(100) NOT NULL,
  `c_material` varchar(100) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `good_shop_id_e1f24e26_fk_store_id` (`shop_id`),
  CONSTRAINT `good_shop_id_e1f24e26_fk_store_id` FOREIGN KEY (`shop_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES (1,'碗杂面',15.0,30,'static/upload/stores/1a073dc414347a319a0f228cd0a1fjpeg.jpeg','豌豆',1),(2,'香辣鸡腿',13.6,1200,'static/upload/stores/2019-11-09_15-50-09_的屏幕截图.png','鸡腿',25),(3,'老卤面',15.8,1200,'static/upload/stores/t01c44703a9e96eac6a.jpg','老卤汤',1),(4,'牛肉面',12.6,1200,'static/upload/stores/timg.jpeg','牛肉',1),(5,'担担面',16.8,1360,'static/upload/stores/tim5g.jpeg','猪肉',1),(6,'炸酱面',14.8,1432,'static/upload/stores/ti55mg.jpeg','炸酱面',1),(7,'油泼面',14.6,1630,'static/upload/stores/tidsamg.jpeg','油泼辣子',1),(8,'岐山臊子面',18.6,4200,'static/upload/stores/u29816698891941340879fm173app25fJPEG.jpeg','猪肉',1),(9,'韩国火鸡面',14.9,1200,'static/upload/stores/u30844601483752794047fm26gp0.jpg','面粉',1),(10,'熏鱼面',14.5,3640,'static/upload/stores/tidwsamg.jpeg','鱼肉',1),(11,'海鲜面',19.7,3450,'static/upload/stores/bbe4e374d79e469ebc64520854677277_864w_1152h.jpg2o_50sh_1pr_1l_660w_90q_1wh.jpeg','海鲜',1),(12,'葱油虾面',21.9,3410,'static/upload/stores/aec379310a55b319df5d08db4ba98226cefc17f3.jpg','虾仁',1),(13,'武汉热干面',23.6,2640,'static/upload/stores/u16413673023513040750fm173app25fJPEG.jpeg','面粉',1),(14,'香辣鸡腿堡',12.5,1230,'static/upload/stores/2019-11-09_15-39-48_的屏幕截图_V4HoM7x.png','鸡腿',5);
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_shop_id_9d00213d_fk_store_id` (`shop_id`),
  KEY `message_user_id_60e6a50a_fk_user_id` (`user_id`),
  CONSTRAINT `message_shop_id_9d00213d_fk_store_id` FOREIGN KEY (`shop_id`) REFERENCES `store` (`id`),
  CONSTRAINT `message_user_id_60e6a50a_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'<p>上是否</p>','2019-11-29 16:12:39.573515',0,10,1),(2,'<p>士大夫士大夫撒</p>','2019-11-29 16:13:42.053664',0,10,1),(3,'<p>哈哈哈</p>','2019-11-29 16:16:11.438938',0,10,1),(4,'<p>哈哈</p>','2019-11-29 16:20:34.344584',0,10,1),(5,'<p>哈哈</p>','2019-11-29 16:21:06.776403',0,10,1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_name` varchar(30) NOT NULL,
  `o_price` decimal(4,1) NOT NULL,
  `o_count` int(11) NOT NULL,
  `o_number` varchar(50) NOT NULL,
  `o_time` datetime(6) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shop_id_b0a2fc74_fk_store_id` (`shop_id`),
  KEY `order_user_id_e323497c_fk_user_id` (`user_id`),
  CONSTRAINT `order_shop_id_b0a2fc74_fk_store_id` FOREIGN KEY (`shop_id`) REFERENCES `store` (`id`),
  CONSTRAINT `order_user_id_e323497c_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(32) NOT NULL,
  `store_adress` varchar(128) NOT NULL,
  `store_category` varchar(30) NOT NULL,
  `store_sales` int(11) NOT NULL,
  `store_img` varchar(100) NOT NULL,
  `store_status` tinyint(1) NOT NULL,
  `store_paise` decimal(2,1) NOT NULL,
  `store_created_time` datetime(6) NOT NULL,
  `bg_img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'老面馆','城南店','noodles',6300,'static/upload/stores/2019-11-05_23-19-53_的屏幕截图_hHcaFKL.png',1,4.5,'2019-11-09 07:31:48.603899',''),(2,'美味炸鸡','上海路47号','piza',3600,'static/upload/stores/2019-11-09_15-39-48_的屏幕截图.png',1,3.4,'2019-11-09 07:41:59.577324',''),(3,'闲叔便当','南京路55号','rice',3400,'static/upload/stores/2019-11-09_15-34-26_的屏幕截图.png',1,2.6,'2019-11-09 07:44:10.451327',''),(4,'胖哥麻辣香锅','南航一号餐厅','chaffy_dish',5100,'static/upload/stores/2019-11-09_15-45-58_的屏幕截图.png',1,3.5,'2019-11-09 07:53:24.376588',''),(5,'汉霸汉堡','瑞金路店','piza',3447,'static/upload/stores/2019-11-09_15-53-13_的屏幕截图.png',1,4.2,'2019-11-09 07:55:05.000756',''),(6,'悠可密儿','御道街店','piza',4500,'static/upload/stores/2019-11-09_15-50-27_的屏幕截图.png',1,3.8,'2019-11-09 07:57:01.951444',''),(7,'巨好吃炸鸡快','中山南路36号','piza',2800,'static/upload/stores/2019-11-09_16-01-12_的屏幕截图_ksrIOSx.png',1,4.3,'2019-11-09 08:11:31.536006',''),(8,'火辣炸鸡','江北店','piza',2645,'static/upload/stores/2019-11-09_16-01-23_的屏幕截图_vcbOvFb.png',1,3.9,'2019-11-09 08:12:25.100687',''),(9,'巨无霸汉堡','中山北路','piza',4561,'static/upload/stores/2019-11-09_15-59-42_的屏幕截图.png',1,4.2,'2019-11-09 08:14:01.263598',''),(10,'派乐汉堡','秦淮河畔店','piza',5100,'static/upload/stores/2019-11-09_16-00-11_的屏幕截图.png',1,4.6,'2019-11-09 08:18:16.047135',''),(11,'韩国部队锅','东山街道51号','noodles',3400,'static/upload/stores/2019-11-05_23-17-41_的屏幕截图_51Nleen.png',1,3.5,'2019-11-09 12:58:19.759731',''),(12,'尚汤八珍面','瑞金3号店','noodles',3620,'static/upload/stores/2019-11-05_23-13-26_的屏幕截图_2BdrkYJ.png',1,4.8,'2019-11-09 13:02:13.261074',''),(13,'曼铃粥铺','长乐路188号','noodles',3670,'static/upload/stores/16d229c75585ec992a636a6e474592e0ed3b5c4fadcd1-WpJtCz_fw658.jpg',1,4.3,'2019-11-09 13:03:55.931568',''),(14,'外婆家粥铺','光华路店','noodles',3900,'static/upload/stores/80da3fb8764f666e8fee9dbe99336601ea3b6f54139d55-7ofZte_fw658.jpg',1,3.8,'2019-11-09 13:05:39.516621',''),(15,'小李包子店','大秦宫店','noodles',3900,'static/upload/stores/3d029f2ff7e45108f53e7f4cd6519e85debf9780f7a4-Z4XYT1_fw658.jpg',1,3.9,'2019-11-09 13:07:33.416049',''),(16,'功夫炒面','夫子庙36号','noodles',4800,'static/upload/stores/2019-11-05_23-15-24_的屏幕截图_2xWv7U1.png',1,4.5,'2019-11-09 13:09:51.983421',''),(17,'兰州拉面','四牌楼77号','noodles',3940,'static/upload/stores/2019-11-05_23-21-16_的屏幕截图_Vic2JMx.png',1,3.9,'2019-11-09 13:12:02.484062',''),(18,'台湾卤肉饭','玄武大街42号','rice',4500,'static/upload/stores/2b0d8a9a26db2c8200e9b36a512e595dc87207e46113e-gJSUfp_fw658.jpg',1,4.2,'2019-11-09 13:14:49.392555',''),(19,'福笙记便当','下马坊22号','rice',4600,'static/upload/stores/6347a7770ec1d9cd2180c33681f89f1f8a6f854e36cc2-emeQ6l_fw658.jpg',1,4.6,'2019-11-09 13:17:20.082156',''),(20,'遇见蛋包饭','南京路店','rice',3600,'static/upload/stores/28e30b35eca379ea01ff08e3a43afacfa492683d17c5a-GQwKlc_fw658.jpg',1,4.9,'2019-11-09 13:18:32.852946',''),(21,'文艺小便当','后宰门店','rice',3640,'static/upload/stores/0b2d73cbc472058fbb12ad95d1e1d7708c465159418d9-LwSIal_fw658.jpg',1,4.5,'2019-11-09 13:20:20.884190',''),(22,'小主开饭啦','胡同巷子店','rice',6840,'static/upload/stores/7b61025725bbca633f3538d7d6368a30e97b614721293-yYTAY6_fw658.jpg',1,4.8,'2019-11-09 13:22:39.153364',''),(23,'超有爱日式便当','长白街','rice',4811,'static/upload/stores/1d618526382e1e1b5a4416d96b8b00d1750f94103476f-5AKpfT_fw658.jpg',1,4.6,'2019-11-09 13:24:14.117817',''),(24,'饭饭炒饭','老城街店','rice',5600,'static/upload/stores/c5dc79c3e1008a463ef61fbfb45027b4ba48def95ac43-ye1jy4_fw658.jpg',1,4.2,'2019-11-09 13:25:41.357171',''),(25,'优客来汉堡','上海路47号','piza',3687,'static/upload/stores/cb46b93bfbf9d01f6c2fc4916111b6e16fa9944f16a3c8-Peg6gy_fw658.jpg',1,4.6,'2019-11-09 13:27:56.339138',''),(26,'东北大乱顿','南航北门','chaffy_dish',4800,'static/upload/stores/7e2b213e93a68f2fad123c78298053879dd8405729a83-iHuzUg_fw658.jpg',1,4.2,'2019-11-09 13:31:45.408914',''),(27,'人生一串','解放路店','chaffy_dish',4218,'static/upload/stores/86ec55603c671196973baba50bdfedb42cfebe6f336095-OhJe2e_fw658.jpg',1,3.8,'2019-11-09 13:33:08.109203',''),(28,'九宫格火锅','城南北路','chaffy_dish',3450,'static/upload/stores/178fa722be458d551f758729da8010beadfd51ff60b15-5DeKsE_fw658.jpg',1,3.8,'2019-11-09 13:34:07.862360',''),(29,'江西瓦罐养生汤','江西路462号','chaffy_dish',4712,'static/upload/stores/a39c1ed6a7b796f1f640aab0e0991353e083a4839b70c-ykBbL6_fw658.jpg',1,3.8,'2019-11-09 13:35:19.500481',''),(30,'新北鲜锅','新北路11号','chaffy_dish',6300,'static/upload/stores/caaf1958293712e7ec5b1a16b308a667c868f40834bc3b-MB7yIN_fw658.jpg',1,3.9,'2019-11-09 13:36:42.675664',''),(31,'辣八方麻辣香锅','紫荆东路26号','chaffy_dish',3780,'static/upload/stores/32fe4bb771c7c0e609984039515fb8d41fc1358ce36de-MJLKb3_fw658.jpg',1,4.9,'2019-11-09 13:49:59.206530',''),(32,'fpx火锅店','中山南路36号','chaffy_dish',3591,'static/upload/stores/162037f6ef68df440724efb178b3774d06c892e7aebed-Q6TYNH_fw658.jpg',1,4.8,'2019-11-09 14:24:08.625800',''),(33,'三哥烧烤店','珠江路店','snack',4890,'static/upload/stores/14c6fe635c25183ca15c0ddd6b214def207d2824ed13b-YwHUA2_fw658.png',1,4.9,'2019-11-09 14:26:17.910584',''),(34,'Hotties烧烤','春江新城店','snack',6820,'static/upload/stores/efc967cbe4374ae24c5b745f8cd073e62652a7c23f9cd-rPLTM1_fw658.jpg',1,4.1,'2019-11-09 14:27:37.205316','');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `is_member` tinyint(1) NOT NULL,
  `user_nickname` varchar(30) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'4444','','1584',0,'4444','dbc4d84bfcfe2284ba11beffb853a8c4',''),(2,'lolo','','1689',0,'lolo','b59c67bf196a4758191e42f76670ceba',''),(3,'lolop','','1456',0,'lolop','b59c67bf196a4758191e42f76670ceba',''),(4,'1iii','','1200',0,'1iii','698d51a19d8a121ce581499d7b701668',''),(5,'88p','','1885',0,'88p','698d51a19d8a121ce581499d7b701668',''),(6,'dasdsadsapeqowpe','','5810',0,'dasdsadsapeqowpe','6512bd43d9caa6e02c990b0a82652dca',''),(7,'dasasd','','3867',0,'dasasd','96e79218965eb72c92a549dd5a330112',''),(8,'ggggg','','7045',0,'ggggg','7fa8282ad93047a4d6fe6111c93b308a',''),(9,'pipip','','3717',0,'pipip','202cb962ac59075b964b07152d234b70',''),(10,'风','','3382',0,'风','6512bd43d9caa6e02c990b0a82652dca','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_weibo`
--

DROP TABLE IF EXISTS `user_weibo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_weibo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wuid` varchar(70) NOT NULL,
  `access_token` varchar(200) NOT NULL,
  `buser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `buser_id` (`buser_id`),
  KEY `user_weibo_wuid_3b9aea26` (`wuid`),
  CONSTRAINT `user_weibo_buser_id_c2704f31_fk_user_id` FOREIGN KEY (`buser_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_weibo`
--

LOCK TABLES `user_weibo` WRITE;
/*!40000 ALTER TABLE `user_weibo` DISABLE KEYS */;
INSERT INTO `user_weibo` VALUES (1,'5679703134','2.00EP94MG0sHy7887e47f1b830QResm',NULL);
/*!40000 ALTER TABLE `user_weibo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-30  8:53:57
