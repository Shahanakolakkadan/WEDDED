-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: wedded
-- ------------------------------------------------------
-- Server version	5.7.41-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add booking',7,'add_booking'),(26,'Can change booking',7,'change_booking'),(27,'Can delete booking',7,'delete_booking'),(28,'Can view booking',7,'view_booking'),(29,'Can add login',8,'add_login'),(30,'Can change login',8,'change_login'),(31,'Can delete login',8,'delete_login'),(32,'Can view login',8,'view_login'),(33,'Can add package',9,'add_package'),(34,'Can change package',9,'change_package'),(35,'Can delete package',9,'delete_package'),(36,'Can view package',9,'view_package'),(37,'Can add previous work',10,'add_previouswork'),(38,'Can change previous work',10,'change_previouswork'),(39,'Can delete previous work',10,'delete_previouswork'),(40,'Can view previous work',10,'view_previouswork'),(41,'Can add review',11,'add_review'),(42,'Can change review',11,'change_review'),(43,'Can delete review',11,'delete_review'),(44,'Can view review',11,'view_review'),(45,'Can add service',12,'add_service'),(46,'Can change service',12,'change_service'),(47,'Can delete service',12,'delete_service'),(48,'Can view service',12,'view_service'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add vendor',14,'add_vendor'),(54,'Can change vendor',14,'change_vendor'),(55,'Can delete vendor',14,'delete_vendor'),(56,'Can view vendor',14,'view_vendor');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_date` date NOT NULL,
  `booking_time` time(6) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `function_date` date NOT NULL,
  `Details` varchar(1000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2023-04-12','15:02:11.259026','shahana','987654321','sha@gmail.com','2023-04-16','asdas',1,1,''),(2,'2023-04-12','15:05:43.099608','shahana','987654321','sha@gmail.com','2023-04-16','asdas',1,1,''),(3,'2023-04-12','15:07:04.518739','shahana','9876543212','sha@gmail.com','2023-04-16','asdas',1,1,''),(4,'2023-04-12','15:15:04.973677','shahana','1235','shahana@gmail.com','2023-02-03','eyjfcj',1,1,''),(5,'2023-04-13','14:16:18.383431','rasmina','8289980342','rasmina@gmail.com','2023-04-03','esadg',1,1,''),(6,'2023-04-13','14:18:00.686380','rasmina','8289980342','rasmina@gmail.com','2023-04-03','esadg',1,1,''),(7,'2023-04-13','14:19:46.879797','rasmina','8289980342','rasmina@gmail.com','2023-04-03','esadg',1,1,''),(8,'2023-04-13','14:22:51.384264','shibil','93534','shibil@gmail.com','2023-05-06','sezdld',1,1,''),(9,'2023-04-13','14:32:53.465943','athira','932234','athirac@gmail.com','2023-02-09','i would like to book you for mehandi on my bigday, am expecting a reply from you as soon as possible',1,1,''),(10,'2023-04-13','14:38:12.035509','miya','9664778276','miya@gmail.com','2023-05-23','Im Miya i nbhgioejo',1,1,''),(11,'2023-06-05','15:32:49.214415','Rasmina','9061758778','qwerty@gmail.com','2023-10-01','Wedding',1,1,'Booked'),(12,'2023-06-05','15:50:43.645988','LIYA','9061758778','liyamol@gmail.com','2024-01-01','Just my wedding',1,1,'Booked'),(13,'2023-06-05','15:51:34.402125','LIYA','9895736764','liyamol@gmail.com','2024-01-01','Just my wedding',1,1,'Booked'),(14,'2023-06-05','15:52:14.781953','LIYA','9895736764','liyamol@gmail.com','2024-01-01','Just my wedding',1,4,'pending'),(15,'2023-06-05','15:53:34.346211','chuang','9895736764','chuang@gmail.com','2024-12-01','complete wedding functions',1,4,'Booked'),(16,'2023-06-05','15:54:20.206392','chuang','9895736764','chuang@gmail.com','2024-12-01','complete wedding functions',1,4,'Booked');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'booking','booking'),(5,'contenttypes','contenttype'),(8,'login','login'),(9,'package','package'),(10,'previous_work','previouswork'),(11,'review','review'),(12,'service','service'),(6,'sessions','session'),(13,'user_register','user'),(14,'vendor_register','vendor');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-12 07:35:48.357423'),(2,'auth','0001_initial','2023-04-12 07:35:48.610724'),(3,'admin','0001_initial','2023-04-12 07:35:48.674126'),(4,'admin','0002_logentry_remove_auto_add','2023-04-12 07:35:48.674126'),(5,'admin','0003_logentry_add_action_flag_choices','2023-04-12 07:35:48.674126'),(6,'contenttypes','0002_remove_content_type_name','2023-04-12 07:35:48.725168'),(7,'auth','0002_alter_permission_name_max_length','2023-04-12 07:35:48.737171'),(8,'auth','0003_alter_user_email_max_length','2023-04-12 07:35:48.737171'),(9,'auth','0004_alter_user_username_opts','2023-04-12 07:35:48.756168'),(10,'auth','0005_alter_user_last_login_null','2023-04-12 07:35:48.769173'),(11,'auth','0006_require_contenttypes_0002','2023-04-12 07:35:48.769173'),(12,'auth','0007_alter_validators_add_error_messages','2023-04-12 07:35:48.785297'),(13,'auth','0008_alter_user_username_max_length','2023-04-12 07:35:48.801627'),(14,'auth','0009_alter_user_last_name_max_length','2023-04-12 07:35:48.801627'),(15,'auth','0010_alter_group_name_max_length','2023-04-12 07:35:48.816632'),(16,'auth','0011_update_proxy_permissions','2023-04-12 07:35:48.832366'),(17,'auth','0012_alter_user_first_name_max_length','2023-04-12 07:35:48.837381'),(18,'booking','0001_initial','2023-04-12 07:35:48.848386'),(19,'login','0001_initial','2023-04-12 07:35:48.864160'),(20,'package','0001_initial','2023-04-12 07:35:48.879962'),(21,'previous_work','0001_initial','2023-04-12 07:35:48.911746'),(22,'review','0001_initial','2023-04-12 07:35:48.927429'),(23,'service','0001_initial','2023-04-12 07:35:48.959292'),(24,'sessions','0001_initial','2023-04-12 07:35:48.977764'),(25,'user_register','0001_initial','2023-04-12 07:35:49.007204'),(26,'vendor_register','0001_initial','2023-04-12 07:35:49.039165');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'shahana','12345','user',1),(2,'jasna','12345','vendor',2),(3,'rasmina','123456','user',3),(4,'jagath','12345','vendor',3),(5,'a','a','user',4),(6,'b','b','vendor',4);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(45) NOT NULL,
  `description` varchar(4500) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `previous_work`
--

DROP TABLE IF EXISTS `previous_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `previous_work` (
  `previous_id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(500) NOT NULL,
  `file_type` varchar(45) NOT NULL,
  `package_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`previous_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `previous_work`
--

LOCK TABLES `previous_work` WRITE;
/*!40000 ALTER TABLE `previous_work` DISABLE KEYS */;
INSERT INTO `previous_work` VALUES (1,'4bb0c631dbd5fbd1dc5776297fcdcc4e.jpg','pdf',1,4),(2,'','pdf',1,3),(3,'3a1faaeb334aa5eeb67229f2f06b62cc.jpg','pdf',1,3),(4,'64de4277baedec8ba050588084982423.jpg','',1,4),(5,'e891456a3eb66b31ccefafd7c703a041.jpg','pdf',1,3);
/*!40000 ALTER TABLE `previous_work` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `review_date` date NOT NULL,
  `description` varchar(250) NOT NULL,
  `rating` varchar(25) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'2023-07-12','good','4',1,4);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `about` varchar(4500) NOT NULL,
  `services` varchar(1000) NOT NULL,
  `category` varchar(60) NOT NULL,
  `location` varchar(150) NOT NULL,
  `district` varchar(150) NOT NULL,
  `package` varchar(150) NOT NULL,
  `business_name` varchar(40) NOT NULL,
  `any_link` varchar(500) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,1,'Self taught henna artist working based on malappuram. A hard working and dedicated artist mainly focused on bridal henna works','Bridal henna, Party henna','Bridal_Mehndi','Kakkad','Malappuram','','Zoella','https://instagram.com/_.zoellaa._?igshid=YjNmNGQ3MDY=',1000),(2,1,'Photographer works at Trissur.We deals with wedding photography, model shooting and event photography. Capture the best for you.','wedding photography,model shoot, event photography','Photography','Trissur','Kerala','Standard','Sha weddings','https://instagram.com/sha_weddings?igshid=YmMyMTA2M2Y=',25000),(3,1,'International certified makeup artist. Airbrush expert.','Bridal makeup, Air brush ','Bridal_Makeup','kannur','Malappuram','Premium','Glamupstudio','https://instagram.com/theglamupstudio?igshid=YjNmNGQ3MDY=',30000),(4,3,'Event Management, Wedding Planning found by 11 young friends','Event Management, Wedding Planning','Event_Management','Kochi','Ernakulam','Premium','Eventia Event Manager','https://instagram.com/eventiaevents?igshid=YmMyMTA2M2Y=',100000),(5,4,'sazk','ssk','Bridal_Mehndi','xzl','zkldx','Standard','zowl','zlsx',1234),(6,4,'sfsdfa','decorationslightssound','Event_Management','kozhikode','kozhikode','Premium','regal','asdmam',1000000),(7,4,'asd','design,sds,','Bridal_Mehndi','asd','asd','Standard','focus','dasd',20000);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortlist`
--

DROP TABLE IF EXISTS `shortlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shortlist` (
  `shrt_id` int(11) NOT NULL AUTO_INCREMENT,
  `ser_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`shrt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortlist`
--

LOCK TABLES `shortlist` WRITE;
/*!40000 ALTER TABLE `shortlist` DISABLE KEYS */;
INSERT INTO `shortlist` VALUES (1,1,4);
/*!40000 ALTER TABLE `shortlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `wedding_date` date NOT NULL,
  `role` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `password_1` varchar(30) NOT NULL,
  `password_2` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'rasmina','rasmina','K',82935462,'rasmina@gmail.com','2023-02-02','','','malappuram','','123456','123456'),(4,'athmaja','Athmaja','menon',876432319,'athmaja@gmail.com','2023-05-05','','','trissur','','1357','1357');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(45) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `city` varchar(45) NOT NULL,
  `password_1` varchar(30) NOT NULL,
  `password_2` varchar(30) NOT NULL,
  `district` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (3,'jagath',17894320,'jagath@gmail.com','Kozhikode','12345','12345','Kottayam','Kerala'),(4,'kiran',34765403,'kiran@gmail.com','Malappuram','12345','12345','Ernakulam','Kerala');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-18 16:23:42
