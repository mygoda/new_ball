-- MySQL dump 10.13  Distrib 5.6.23, for osx10.9 (x86_64)
--
-- Host: localhost    Database: meeting
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `api_verify_phone`
--

DROP TABLE IF EXISTS `api_verify_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_verify_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `send_at` datetime NOT NULL,
  `remarks` varchar(1024) DEFAULT NULL,
  `retry` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_verify_phone`
--

LOCK TABLES `api_verify_phone` WRITE;
/*!40000 ALTER TABLE `api_verify_phone` DISABLE KEYS */;
INSERT INTO `api_verify_phone` VALUES (1,'18707195611','247251','','2015-04-21 07:47:29','',0),(2,'15011056689','137264','','2015-05-11 07:42:33','',0),(3,'18614043303','868740','','2015-05-04 14:22:07','',0),(4,'18810881895','871726','','2015-05-26 01:38:48','',0),(5,'18601155940','126310','','2015-05-18 02:36:03','',0),(6,'18601155930','605792','','2015-04-18 08:40:13','',0),(7,'15313121715','468203','','2015-04-20 09:45:11','',0),(8,'18601151370','608545','','2015-04-20 10:47:17','',0),(9,'15011056688','090288','','2015-04-29 03:37:59','',0),(10,'18672760731','424207','','2015-05-04 14:32:36','',0),(11,'18346552658','424511','','2015-05-12 07:04:23','',0);
/*!40000 ALTER TABLE `api_verify_phone` ENABLE KEYS */;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add content type',3,'add_contenttype'),(8,'Can change content type',3,'change_contenttype'),(9,'Can delete content type',3,'delete_contenttype'),(10,'Can add session',4,'add_session'),(11,'Can change session',4,'change_session'),(12,'Can delete session',4,'delete_session'),(13,'Can add site',5,'add_site'),(14,'Can change site',5,'change_site'),(15,'Can delete site',5,'delete_site'),(16,'Can add 用户',6,'add_user'),(17,'Can change 用户',6,'change_user'),(18,'Can delete 用户',6,'delete_user'),(19,'Can add 账号设置',7,'add_app'),(20,'Can change 账号设置',7,'change_app'),(21,'Can delete 账号设置',7,'delete_app'),(22,'Can add 关键字',8,'add_rule'),(23,'Can change 关键字',8,'change_rule'),(24,'Can delete 关键字',8,'delete_rule'),(25,'Can add 微信关注回复',9,'add_subscribeitem'),(26,'Can change 微信关注回复',9,'change_subscribeitem'),(27,'Can delete 微信关注回复',9,'delete_subscribeitem'),(28,'Can add 微信菜单',10,'add_menuitem'),(29,'Can change 微信菜单',10,'change_menuitem'),(30,'Can delete 微信菜单',10,'delete_menuitem'),(31,'Can add 图片',11,'add_photo'),(32,'Can change 图片',11,'change_photo'),(33,'Can delete 图片',11,'delete_photo'),(34,'Can add 图文消息',12,'add_richtext'),(35,'Can change 图文消息',12,'change_richtext'),(36,'Can delete 图文消息',12,'delete_richtext'),(37,'Can add 代理商',13,'add_agent'),(38,'Can change 代理商',13,'change_agent'),(39,'Can delete 代理商',13,'delete_agent'),(40,'Can add 会议',14,'add_meeting'),(41,'Can change 会议',14,'change_meeting'),(42,'Can delete 会议',14,'delete_meeting'),(43,'Can add 转账银行',15,'add_meetingbank'),(44,'Can change 转账银行',15,'change_meetingbank'),(45,'Can delete 转账银行',15,'delete_meetingbank'),(46,'Can add 门票模板',16,'add_tickettemplate'),(47,'Can change 门票模板',16,'change_tickettemplate'),(48,'Can delete 门票模板',16,'delete_tickettemplate'),(49,'Can add 机构购票',17,'add_agentticketship'),(50,'Can change 机构购票',17,'change_agentticketship'),(51,'Can delete 机构购票',17,'delete_agentticketship'),(52,'Can add 会员门票',18,'add_ticket'),(53,'Can change 会员门票',18,'change_ticket'),(54,'Can delete 会员门票',18,'delete_ticket'),(55,'Can add 日程',19,'add_schedule'),(56,'Can change 日程',19,'change_schedule'),(57,'Can delete 日程',19,'delete_schedule'),(58,'Can add 会员预约',20,'add_userschedule'),(59,'Can change 会员预约',20,'change_userschedule'),(60,'Can delete 会员预约',20,'delete_userschedule'),(61,'Can add 短信',21,'add_message'),(62,'Can change 短信',21,'change_message'),(63,'Can delete 短信',21,'delete_message'),(64,'Can add 系统设置',22,'add_systemsetting'),(65,'Can change 系统设置',22,'change_systemsetting'),(66,'Can delete 系统设置',22,'delete_systemsetting'),(67,'Can add 签到设置',23,'add_checkinsetting'),(68,'Can change 签到设置',23,'change_checkinsetting'),(69,'Can delete 签到设置',23,'delete_checkinsetting'),(70,'Can add 打印机设置',24,'add_printersetting'),(71,'Can change 打印机设置',24,'change_printersetting'),(72,'Can delete 打印机设置',24,'delete_printersetting'),(73,'Can add 验证码',25,'add_verifyphone'),(74,'Can change 验证码',25,'change_verifyphone'),(75,'Can delete 验证码',25,'delete_verifyphone'),(76,'Can add 订单',26,'add_trade'),(77,'Can change 订单',26,'change_trade'),(78,'Can delete 订单',26,'delete_trade'),(79,'Can add 商品',27,'add_product'),(80,'Can change 商品',27,'change_product'),(81,'Can delete 商品',27,'delete_product'),(82,'Can add 订单日志',28,'add_tradelog'),(83,'Can change 订单日志',28,'change_tradelog'),(84,'Can delete 订单日志',28,'delete_tradelog'),(85,'Can add log entry',29,'add_logentry'),(86,'Can change log entry',29,'change_logentry'),(87,'Can delete log entry',29,'delete_logentry'),(88,'Can add migration history',30,'add_migrationhistory'),(89,'Can change migration history',30,'change_migrationhistory'),(90,'Can delete migration history',30,'delete_migrationhistory'),(91,'Can add 错误日志',31,'add_errorlog'),(92,'Can change 错误日志',31,'change_errorlog'),(93,'Can delete 错误日志',31,'delete_errorlog'),(94,'Can add 会议订单',32,'add_meetingtradeship'),(95,'Can change 会议订单',32,'change_meetingtradeship'),(96,'Can delete 会议订单',32,'delete_meetingtradeship'),(97,'Can add 服务设置',33,'add_serversetting'),(98,'Can change 服务设置',33,'change_serversetting'),(99,'Can delete 服务设置',33,'delete_serversetting'),(100,'Can add payment',34,'add_wechatpayment'),(101,'Can change payment',34,'change_wechatpayment'),(102,'Can delete payment',34,'delete_wechatpayment'),(103,'Can add 微信用户token',35,'add_weixinusertoken'),(104,'Can change 微信用户token',35,'change_weixinusertoken'),(105,'Can delete 微信用户token',35,'delete_weixinusertoken'),(112,'Can add 会议调查问卷',38,'add_meetingsurvey'),(113,'Can change 会议调查问卷',38,'change_meetingsurvey'),(114,'Can delete 会议调查问卷',38,'delete_meetingsurvey'),(115,'Can add 课程调查问卷',39,'add_classsurvey'),(116,'Can change 课程调查问卷',39,'change_classsurvey'),(117,'Can delete 课程调查问卷',39,'delete_classsurvey'),(118,'Can add 打印模板',40,'add_printtemplate'),(119,'Can change 打印模板',40,'change_printtemplate'),(120,'Can delete 打印模板',40,'delete_printtemplate'),(121,'Can add 签到记录',41,'add_ticketcheckinhistory'),(122,'Can change 签到记录',41,'change_ticketcheckinhistory'),(123,'Can delete 签到记录',41,'delete_ticketcheckinhistory'),(124,'Can add 会员证书',42,'add_usercertificate'),(125,'Can change 会员证书',42,'change_usercertificate'),(126,'Can delete 会员证书',42,'delete_usercertificate'),(127,'Can add 会议证书',43,'add_certificate'),(128,'Can change 会议证书',43,'change_certificate'),(129,'Can delete 会议证书',43,'delete_certificate');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_74953f86` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-04-16 02:43:43',1,14,'1','第十二届亚洲体适能交流大会',1,''),(2,'2015-04-16 02:45:43',1,15,'1','1',1,''),(3,'2015-04-16 02:45:59',1,13,'1','青橙科技',1,''),(4,'2015-04-16 02:47:33',1,16,'1','4月30日前报名',1,''),(5,'2015-04-16 02:47:58',1,16,'1','4月30日前报名（学员）',2,'已修改 rule 和 name 。'),(6,'2015-04-16 02:48:20',1,16,'2','4月30日前报名（非学员）',1,''),(7,'2015-04-16 02:52:11',1,19,'1','步态蕴含的奥秘',1,''),(8,'2015-04-16 02:53:53',1,19,'2','康复最关键的是……',1,''),(9,'2015-04-16 02:54:07',1,19,'1','步态蕴含的奥秘',2,'已修改 teacher 。'),(10,'2015-04-16 02:55:31',1,19,'3','私教自我康复技术',1,''),(11,'2015-04-16 05:00:42',1,19,'4','\"跳\"离运动伤患',1,''),(12,'2015-04-16 05:01:37',1,19,'4','\"跳\"离运动伤患',2,'已修改 start 和 end 。'),(13,'2015-04-16 05:03:53',1,19,'5','Body FX（遂生健身）',1,''),(14,'2015-04-16 05:05:22',1,19,'6','\"扭碎脂肪\"',1,''),(15,'2015-04-16 05:07:09',1,19,'7','不是所有VIPR训练都叫VIPR',1,''),(16,'2015-04-16 05:08:28',1,19,'8','保加利亚包失传之秘',1,''),(17,'2015-04-16 05:09:26',1,19,'9','更强、更优、更快－T3',1,''),(18,'2015-04-16 05:09:35',1,19,'9','更强、更优、更快－T3',2,'已修改 need_sign_up 和 limit 。'),(19,'2015-04-16 05:11:14',1,19,'10','让客户重生',1,''),(20,'2015-04-16 05:12:16',1,19,'11','用“不稳”创造“更稳”',1,''),(21,'2015-04-16 05:18:20',1,19,'12','业绩都去哪儿了？',1,''),(22,'2015-04-16 05:19:13',1,19,'13','重组健身DNA',1,''),(23,'2015-04-16 05:20:20',1,19,'14','POS寻根之旅',1,''),(24,'2015-04-16 05:21:42',1,19,'15','小团体私教课销售圣经',1,''),(25,'2015-04-16 05:23:50',1,19,'16','《互联网+“健身房”》',1,''),(26,'2015-04-16 05:25:40',1,19,'17','30天，收入提升100%',1,''),(27,'2015-04-16 05:26:54',1,19,'18','“太极”式销售技巧',1,''),(28,'2015-04-16 05:27:51',1,19,'19','寻根之旅总结会',1,''),(29,'2015-04-16 05:28:09',1,19,'19','寻根之旅总结会',2,'已修改 need_sign_up，limit 和 description 。'),(30,'2015-04-16 05:32:17',1,19,'20','穿越时空的KBC壶铃训练－奥力来',1,''),(31,'2015-04-16 05:34:19',1,19,'21','爆发你的旋转力量－TRX RIP功能性训练棒－奥力来',1,''),(32,'2015-04-16 05:36:16',1,19,'22','平衡及核心稳定训练100招',1,''),(33,'2015-04-16 05:37:30',1,19,'23','星级教练方程式A－F',1,''),(34,'2015-04-16 05:39:30',1,19,'24','Ugi-U got it （Ugi超级软式药球训练）－奥力来',1,''),(35,'2015-04-16 05:46:43',1,19,'25','课程像Party，会员爱死你',1,''),(36,'2015-04-16 05:48:37',1,19,'26','水平“漂移”新提升',1,''),(37,'2015-04-16 05:50:27',1,19,'27','用好20亿次的跳动，专业从“心”开始',1,''),(38,'2015-04-16 05:57:41',1,19,'28','触动会员消费的小团体私教课程',1,''),(39,'2015-04-16 06:19:29',1,19,'29','抗衰老医学－生命质量与运动能力最优化',1,''),(40,'2015-04-16 06:20:40',1,19,'30','从细胞和干细胞治疗谈生命4S',1,''),(41,'2015-04-16 06:24:02',1,19,'31','辣妈计划：从分娩后到更年期',1,''),(42,'2015-04-16 06:27:58',1,19,'32','营养也要“功能性”',1,''),(43,'2015-04-16 06:29:08',1,19,'33','极速美体',1,''),(44,'2015-04-16 06:29:52',1,19,'34','运动打造“最强大脑”',1,''),(45,'2015-04-16 06:30:04',1,19,'34','运动打造“最强大脑”',2,'已修改 need_sign_up 和 limit 。'),(46,'2015-04-16 06:32:31',1,11,'1','logo',1,''),(47,'2015-04-16 06:33:37',1,14,'1','第十二届亚洲体适能交流大会',2,'已修改 image 。'),(48,'2015-04-16 08:53:45',1,14,'1','第十二届亚洲体适能交流大会',2,'已修改 image 。'),(49,'2015-04-16 13:31:56',1,16,'1','4月30日前报名（学员）',2,'已修改 price 和 rule 。'),(50,'2015-04-16 13:32:02',1,16,'2','4月30日前报名（非学员）',2,'已修改 price 和 rule 。'),(51,'2015-04-16 13:45:49',1,27,'1','1',3,''),(52,'2015-04-16 15:16:27',1,14,'2','2015第四届ChinaFit健身大会',1,''),(53,'2015-04-16 15:16:54',1,14,'2','2015第四届ChinaFit健身大会',2,'已修改 image 。'),(54,'2015-04-16 15:17:37',1,14,'2','2015第四届ChinaFit健身大会',2,'已修改 image 。'),(55,'2015-04-16 15:19:17',1,14,'2','2015第四届ChinaFit健身大会',2,'已修改 image 。'),(56,'2015-04-16 15:28:41',1,6,'2','zhangnan@qingcheng.it ',1,''),(57,'2015-04-16 15:29:02',1,6,'2','zhangnan@qingcheng.it ',2,'已修改 is_admin 和 is_staff 。'),(58,'2015-04-16 15:29:55',1,6,'3','kent',1,''),(59,'2015-04-16 15:30:01',1,6,'3','kent',2,'已修改 is_admin 和 is_staff 。'),(60,'2015-04-16 15:47:44',1,18,'4','4',2,'已修改 username 和 phone 。'),(61,'2015-04-16 15:48:03',1,18,'4','4',2,'已修改 user 。'),(62,'2015-04-16 15:48:34',1,6,'3','kent',2,'已修改 phone 。'),(63,'2015-04-17 05:52:33',1,14,'3','美国IHRSA全球年会',1,''),(64,'2015-04-17 06:06:41',1,19,'35','留住人才',1,''),(65,'2015-04-17 06:07:12',1,19,'35','留住人才',2,'已修改 end 。'),(66,'2015-04-17 06:08:26',1,19,'36','销售管理秘诀：增加利润并让你保持领先',1,''),(67,'2015-04-17 06:10:55',1,19,'37','如何变得令人惊艳：从第一印象到长期价值',1,''),(68,'2015-04-17 06:11:21',1,19,'38','使用小组私教训练营最大化你的利润',1,''),(69,'2015-04-17 06:11:27',1,19,'38','',2,'已修改 name 。'),(70,'2015-04-17 06:13:42',1,19,'38','使用小组私教训练营最大化你的利润',2,'已修改 name，start，end，space，teacher，need_sign_up，limit 和 description 。'),(71,'2015-04-17 06:15:14',1,19,'39','你的俱乐部有多高价值？如何让它增值？',1,''),(72,'2015-04-17 10:17:57',1,14,'3','美国IHRSA全球年会',2,'已修改 image 。'),(73,'2015-04-17 10:18:01',1,14,'2','2015第四届ChinaFit健身大会',2,'已修改 image 。'),(74,'2015-04-17 10:23:55',1,11,'2','美国IHRSA全球年会',1,''),(75,'2015-04-17 10:24:13',1,14,'3','美国IHRSA全球年会',2,'已修改 image 。'),(76,'2015-04-17 10:26:57',1,14,'3','美国IHRSA全球年会',2,'已修改 description 。'),(77,'2015-04-17 11:16:08',1,6,'1','陈驰远',2,'已修改 username，phone 和 gender 。'),(78,'2015-04-18 04:31:07',1,16,'2','4月30日前报名（非学员）',2,'已修改 check_inventory 和 rule 。'),(79,'2015-04-18 04:32:56',1,16,'1','4月30日前报名（学员）',2,'已修改 rule 和 remarks 。'),(80,'2015-04-18 04:45:30',1,16,'3','门票',1,''),(81,'2015-04-18 04:45:43',1,16,'3','门票',2,'已修改 check_inventory 和 rule 。'),(82,'2015-04-18 07:42:31',1,14,'1','第十二届亚洲体适能交流大会',2,'已修改 description 。'),(83,'2015-04-18 07:48:43',1,14,'1','第十二届亚洲体适能交流大会',2,'已修改 description 。'),(84,'2015-04-18 07:49:24',1,14,'1','第十二届亚洲体适能交流大会',2,'没有字段被修改。'),(85,'2015-04-18 08:01:29',1,14,'3','美国IHRSA全球年会',2,'已修改 open_end 。'),(86,'2015-04-18 08:04:00',1,16,'3','门票',2,'已修改 price 和 rule 。'),(87,'2015-04-18 08:19:48',1,16,'2','非学员门票',2,'已修改 rule 和 name 。'),(88,'2015-04-18 08:19:56',1,16,'1','学员门票',2,'已修改 rule 和 name 。'),(89,'2015-04-18 08:44:05',1,14,'4','567GO携手巍得健身【十城十战】重庆',1,''),(90,'2015-04-18 08:46:30',1,16,'4','',1,''),(91,'2015-04-18 08:48:27',1,16,'5','超值优惠价',1,''),(92,'2015-04-18 08:48:35',1,16,'6','超值优惠价',1,''),(93,'2015-04-18 08:48:46',1,16,'7','超值优惠价',1,''),(94,'2015-04-18 08:55:31',1,14,'4','567GO携手巍得健身【十城十战】重庆',2,'已修改 description 。'),(95,'2015-04-18 08:57:18',1,14,'4','567GO携手巍得健身【十城十战】重庆',2,'已修改 description 。'),(96,'2015-04-18 08:58:29',1,11,'3','十',1,''),(97,'2015-04-18 08:58:49',1,14,'4','567GO携手巍得健身【十城十战】重庆',2,'已修改 image 。'),(98,'2015-04-18 09:00:15',1,14,'4','567GO携手巍得健身【十城十战】重庆',2,'已修改 image 。'),(99,'2015-04-18 09:00:35',1,16,'8','超值优惠价',1,''),(100,'2015-04-18 09:02:19',1,16,'9','超值优惠价',1,''),(101,'2015-04-18 09:02:39',1,16,'10','超值优惠价',1,''),(102,'2015-04-18 09:02:43',1,16,'11','超值优惠价',1,''),(103,'2015-04-18 09:06:06',1,14,'4','567GO携手巍得健身【十城十战】重庆',2,'已修改 description 。'),(104,'2015-04-18 09:06:28',1,14,'4','567GO携手巍得健身【十城十战】重庆',2,'已修改 description 。'),(105,'2015-04-18 09:07:25',1,14,'4','567GO携手巍得健身【十城十战】重庆',2,'已修改 phone 。'),(106,'2015-04-18 09:16:42',1,15,'2','2',1,''),(107,'2015-04-18 09:18:58',1,19,'40','Dance-Aerobic Cardio Colin',1,''),(108,'2015-04-18 09:19:56',1,19,'41','格斗之马伽术入门',1,''),(109,'2015-04-18 09:20:28',1,19,'40','Dance-Aerobic Cardio',2,'已修改 name，end 和 teacher 。'),(110,'2015-04-18 09:20:51',1,19,'41','格斗之马伽术入门',2,'已修改 start 和 end 。'),(111,'2015-04-18 09:22:05',1,19,'42','Dance－Step Cardio',1,''),(112,'2015-04-18 09:23:09',1,19,'43','Dance－Step Break down',1,''),(113,'2015-04-18 09:24:23',1,19,'44','产前产后普拉提',1,''),(114,'2015-04-18 09:25:10',1,19,'45','产前产后的训练计划',1,''),(115,'2015-04-18 09:26:30',1,19,'46','SMART智趣多感官训练',1,''),(116,'2015-04-18 09:27:06',1,19,'47','SMART智趣脑体训练',1,''),(117,'2015-04-18 09:27:51',1,19,'47','SMART智趣脑体训练',2,'已修改 start 和 end 。'),(118,'2015-04-18 09:28:58',1,16,'11','超值优惠价',3,''),(119,'2015-04-18 09:29:03',1,16,'10','超值优惠价',3,''),(120,'2015-04-18 09:29:07',1,16,'9','超值优惠价',3,''),(121,'2015-04-18 09:29:12',1,16,'8','超值优惠价',3,''),(122,'2015-04-18 09:29:16',1,16,'7','超值优惠价',3,''),(123,'2015-04-18 09:29:19',1,16,'6','超值优惠价',3,''),(124,'2015-04-18 09:29:37',1,16,'5','超值优惠价',2,'已修改 rule 。'),(125,'2015-04-18 09:29:59',1,16,'5','超值优惠价',2,'已修改 rule 和 meeting 。'),(126,'2015-04-18 09:31:18',1,16,'5','超值优惠价',2,'已修改 rule 和 end 。'),(127,'2015-04-18 10:30:37',1,16,'4','门票',2,'已修改 rule 和 name 。'),(128,'2015-04-20 09:36:49',1,15,'2','2',2,'已修改 meeting 。'),(129,'2015-04-20 09:45:22',1,15,'2','2',2,'已修改 contact 。'),(130,'2015-04-20 09:57:26',1,16,'12','免费票',1,''),(131,'2015-04-20 09:57:40',1,16,'12','免费票',2,'已修改 rule 和 end 。'),(132,'2015-04-20 10:00:17',1,18,'23','23',1,''),(133,'2015-04-20 10:01:36',1,26,'26','26',2,'已修改 extra 。'),(134,'2015-04-21 07:38:11',1,33,'1','ServerSetting object',1,''),(135,'2015-04-21 08:30:31',1,33,'1','ServerSetting object',2,'已修改 support_transfer_pay 。'),(136,'2015-04-21 08:30:56',1,33,'1','ServerSetting object',2,'已修改 theme 。'),(137,'2015-04-21 09:57:55',1,14,'2','2015第四届ChinaFit健身大会',2,'没有字段被修改。'),(138,'2015-04-21 10:18:12',1,26,'60','60',2,'已修改 extra 。'),(139,'2015-04-21 10:18:15',1,26,'60','60',2,'已修改 extra 。'),(140,'2015-04-21 10:20:27',1,14,'4','567GO   •【十城十战】重庆',2,'已修改 name 。'),(141,'2015-04-21 10:21:28',1,33,'1','ServerSetting object',2,'已修改 support_transfer_pay 。'),(142,'2015-04-21 10:47:47',1,14,'4','567GO•【十城十战】重庆',2,'已修改 name 。'),(143,'2015-04-21 10:50:30',1,14,'1','第十二届亚洲体适能交流大会',2,'已修改 map_url 。'),(144,'2015-04-21 10:51:34',1,14,'1','第十二届亚洲体适能交流大会',2,'已修改 map_url 。'),(145,'2015-04-21 10:51:55',1,14,'1','第十二届亚洲体适能交流大会',2,'没有字段被修改。'),(146,'2015-04-21 10:52:28',1,14,'1','第十二届亚洲体适能交流大会',2,'没有字段被修改。'),(147,'2015-04-22 07:46:12',1,14,'2','2015第四届ChinaFit健身大会',2,'已修改 image 。'),(148,'2015-04-22 07:51:04',1,14,'1','第十二届亚洲体适能交流大会',2,'已修改 map_url 。'),(149,'2015-04-22 07:53:50',1,14,'1','第十二届亚洲体适能交流大会',2,'已修改 map_url 。'),(150,'2015-04-23 07:31:50',1,33,'1','ServerSetting object',2,'已修改 weixin_api_url 。'),(151,'2015-04-23 07:47:47',1,26,'69','69',2,'已修改 purchaser_url 和 extra 。'),(152,'2015-04-23 10:05:30',1,16,'1','学员门票',2,'已修改 price 和 rule 。'),(153,'2015-04-23 10:21:14',1,16,'1','学员门票',2,'已修改 inventory，check_inventory 和 rule 。'),(154,'2015-04-23 10:21:46',1,16,'1','学员门票',2,'已修改 inventory 和 rule 。'),(155,'2015-04-24 01:59:57',1,6,'9','wangxin',1,''),(156,'2015-04-24 02:00:32',1,18,'42','42',1,''),(157,'2015-04-24 02:01:23',1,18,'42','42',2,'没有字段被修改。'),(158,'2015-04-29 03:41:32',1,20,'111','111',1,''),(159,'2015-04-30 06:23:33',1,20,'112','112',1,''),(160,'2015-04-30 06:24:08',1,20,'113','113',1,''),(161,'2015-04-30 06:26:20',1,20,'114','114',1,''),(162,'2015-05-04 14:34:08',1,16,'1','学员门票',2,'已修改 price，rule 和 end 。'),(163,'2015-05-04 14:34:27',1,16,'1','学员门票',2,'已修改 inventory 和 rule 。'),(164,'2015-05-06 06:32:43',1,17,'1','1',1,''),(165,'2015-05-06 06:39:16',1,13,'2','小型健身工作室',1,''),(166,'2015-05-06 06:45:44',1,17,'2','2',1,''),(167,'2015-05-06 06:49:47',1,16,'12','免费票',2,'已修改 rule 和 end 。'),(168,'2015-05-06 06:49:54',1,16,'5','超值优惠价',2,'已修改 rule 。'),(169,'2015-05-06 06:50:09',1,16,'2','非学员门票',2,'已修改 rule 和 end 。'),(170,'2015-05-06 06:52:27',1,16,'2','非学员门票',2,'已修改 rule 。'),(171,'2015-05-06 06:52:53',1,16,'2','非学员门票',2,'已修改 rule 。'),(172,'2015-05-06 06:54:15',1,16,'2','非学员门票',2,'已修改 rule 。'),(173,'2015-05-06 06:54:48',1,17,'3','3',1,''),(174,'2015-05-06 06:59:10',1,16,'13','学员通票',1,''),(175,'2015-05-08 05:35:48',1,26,'106','106',2,'已修改 status，channel 和 extra 。'),(176,'2015-05-11 02:25:33',1,17,'4','4',1,''),(177,'2015-05-11 07:41:46',1,6,'4','王欣欣',3,''),(178,'2015-05-11 07:45:09',1,6,'9','wangxin',3,''),(179,'2015-05-12 05:57:37',1,26,'42','42',3,''),(180,'2015-05-12 05:57:45',1,26,'31','31',3,''),(181,'2015-05-12 05:57:56',1,26,'33','33',3,''),(182,'2015-05-12 05:58:12',1,26,'105','105',3,''),(183,'2015-05-12 05:58:19',1,26,'104','104',3,''),(184,'2015-05-12 05:58:34',1,26,'102','102',3,''),(185,'2015-05-12 05:58:42',1,26,'100','100',3,''),(186,'2015-05-12 05:58:50',1,26,'99','99',3,''),(187,'2015-05-12 07:01:22',1,6,'12','王欣',2,'已修改 is_admin 和 is_superuser 。'),(188,'2015-05-12 07:09:35',1,18,'49','49',2,'已修改 is_exchange 。'),(189,'2015-05-12 07:27:02',1,6,'12','王欣',2,'已修改 is_superuser 。'),(190,'2015-05-12 07:27:13',1,6,'12','王欣',2,'已修改 is_admin 。'),(191,'2015-05-12 07:27:35',1,6,'12','王欣',2,'已修改 is_admin，is_staff 和 is_superuser 。'),(192,'2015-05-12 07:46:36',1,6,'12','王欣',2,'没有字段被修改。'),(193,'2015-05-18 02:27:48',1,14,'3','美国IHRSA全球年会',2,'已修改 open_start 和 open_end 。'),(194,'2015-05-18 02:35:53',1,6,'3','kent',2,'已修改 is_superuser 。'),(195,'2015-05-18 09:41:30',1,16,'14','',1,''),(196,'2015-05-18 09:41:49',1,16,'14','测试票',2,'已修改 rule 和 name 。'),(197,'2015-05-18 09:49:24',1,26,'109','109',2,'已修改 channel 和 extra 。'),(198,'2015-05-26 07:30:14',1,20,'129','129',1,''),(199,'2015-05-26 07:32:16',1,20,'130','130',1,''),(200,'2015-05-26 08:01:21',1,19,'31','辣妈计划：从分娩后到更年期',2,'已修改 limit 。'),(201,'2015-05-26 08:02:01',1,20,'132','132',1,''),(202,'2015-05-30 05:37:51',1,43,'1','结业证书',1,''),(203,'2015-05-30 05:39:34',1,42,'1','1',1,''),(204,'2015-05-30 05:46:10',1,42,'1','1',2,'已修改 ticket 。'),(205,'2015-05-30 06:31:37',1,42,'1','1',2,'已修改 url 。');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'content type','contenttypes','contenttype'),(4,'session','sessions','session'),(5,'site','sites','site'),(6,'用户','users','user'),(7,'账号设置','weixin','app'),(8,'关键字','weixin','rule'),(9,'微信关注回复','weixin','subscribeitem'),(10,'微信菜单','weixin','menuitem'),(11,'图片','weixin','photo'),(12,'图文消息','weixin','richtext'),(13,'代理商','meeting','agent'),(14,'会议','meeting','meeting'),(15,'转账银行','meeting','meetingbank'),(16,'门票模板','meeting','tickettemplate'),(17,'机构购票','meeting','agentticketship'),(18,'会员门票','meeting','ticket'),(19,'日程','meeting','schedule'),(20,'会员预约','meeting','userschedule'),(21,'短信','meeting','message'),(22,'系统设置','meeting','systemsetting'),(23,'签到设置','meeting','checkinsetting'),(24,'打印机设置','meeting','printersetting'),(25,'验证码','api','verifyphone'),(26,'订单','order','trade'),(27,'商品','order','product'),(28,'订单日志','order','tradelog'),(29,'log entry','admin','logentry'),(30,'migration history','south','migrationhistory'),(31,'错误日志','base','errorlog'),(32,'会议订单','meeting','meetingtradeship'),(33,'服务设置','base','serversetting'),(34,'payment','payment','wechatpayment'),(35,'微信用户token','weixin','weixinusertoken'),(38,'会议调查问卷','meeting','meetingsurvey'),(39,'课程调查问卷','meeting','classsurvey'),(40,'打印模板','meeting','printtemplate'),(41,'签到记录','meeting','ticketcheckinhistory'),(42,'会员证书','meeting','usercertificate'),(43,'会议证书','meeting','certificate');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1pewmojmn96nis9z9avsqveyl7cfjfnq','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2015-05-01 07:36:39'),('1y2u4npyi4jup3j9a4oc79niqn989cva','NmZmZGM2YTU5N2I1MzM1NTlkMGUwYTNiOGY5ZGYwYzQyYjMzMTIzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9','2018-04-19 11:17:18'),('22ntc70a1dv3x59qgtdx5dju4kv43rwt','MmVlZjE1YTM3MmNiZmUzYjNmOTQwMjllZTk5YzlhZmU4OGRhOTc2NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2018-05-03 14:22:34'),('3kceaq9d4aibuehrs3i6ftw4yisxlana','ZDNiYTc0YjE2N2RlNDVkMDZiYmUxOTY4MjQyNjNjMTJhNDZhNjc5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjExfQ==','2018-05-07 04:43:31'),('3lx1tfl1eaiavbslzwyxnm7gvke83303','M2YwMGNhMWQyMjAzMTE4MDE0MWI3OTNmY2JlNmJmZDU1Y2U5ZjAwMzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjV9','2015-05-01 11:17:25'),('4prkh7y317liv64yh6ntmtdgp78x2mvy','ZjVmNjhkMDRhNWU1NWMzMzNlMWNlOGI3YThiOWJjZGMxODM1ZDcxZDp7fQ==','2018-05-05 06:38:47'),('5uw5kewz4xdyw1in1bm2327hl687sxpq','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2015-04-30 02:36:20'),('6mo3qge7xs7mj5v9dd923kjc632y45s8','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-05-27 03:00:52'),('9exyh2fmm28n0zl82q8mc18tyea0weo1','ZjVmNjhkMDRhNWU1NWMzMzNlMWNlOGI3YThiOWJjZGMxODM1ZDcxZDp7fQ==','2018-05-05 06:26:42'),('9iijf1n4sjuttblm8lm39a7kpflxx2m3','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-04-17 08:00:52'),('9tu0u2j3rjxeyxepuo9er4rj6kju1zba','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2015-04-30 15:13:18'),('ag5lyv5a6te3r5yu3kiwqn7y72lmb9n5','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2015-04-30 02:38:18'),('ar0ybycbv3up7tdw1ymb1f7ygyi5nfhl','NGM2MWM2YTA1NjIyNmJhYWNkYjQwMTIzMDZmOWZjZDExOWFhODdkYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2018-04-19 10:47:28'),('ckp476iiyqnjhkxmv4nbwy9yt9h57gw3','NmZmZGM2YTU5N2I1MzM1NTlkMGUwYTNiOGY5ZGYwYzQyYjMzMTIzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9','2018-04-19 09:30:30'),('cvf8366tg3p9xg8vv1f2fggjdmd4oinb','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-05-27 06:45:33'),('cw8vfg72q5ieibjem608w2l76co5r58i','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-05-05 06:31:42'),('d3mldryt5555i7pq5dlsbfq09k97pbik','NjFjYzdhNjEzNjhiMjIwMDc5ODYyODFkNTQxZTE4YWI1MTkzN2YzMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEwfQ==','2018-05-03 14:32:48'),('dkomb761bgv7ekxh1mydsxzonocy18qq','ZjVmNjhkMDRhNWU1NWMzMzNlMWNlOGI3YThiOWJjZGMxODM1ZDcxZDp7fQ==','2018-05-28 06:06:20'),('dov7h1jlrw2jlroz6c32dhz0crjhk94i','MmVlZjE1YTM3MmNiZmUzYjNmOTQwMjllZTk5YzlhZmU4OGRhOTc2NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2015-05-02 05:55:33'),('drv9v4kbgagp96lt8uzheufwq2go5hrj','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-05-27 02:10:40'),('f76gzd8rwgn64qod57gp4ph4m3yu7zjn','Nzc0MDAwNWM1NWY1MmVlYTNlNzJkYTE5ZDY0NjYyMjAwZTY5YzM3Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjZ9','2018-04-19 09:45:43'),('jcak549hp31mrd8cfbu6bu74eax3ckq6','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-05-27 02:10:02'),('jljxelec2qycj2sd7mvb28jdqo8v1c86','ZTMyZmYyYTM4OGE2NjA0NzE3Y2Y0YTU3NzZiNzkzYjNlNGQ4YmYxOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjozfQ==','2015-05-01 00:10:58'),('kgfk144gm293fvmurqtourh0richtkza','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-05-28 03:30:47'),('mjf92waj3bt4qjac3z1udnvtppfnay38','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-04-28 03:57:12'),('n4n0dcmvtcur9obu7ww2q4s8ioepccqg','ZDNiYTc0YjE2N2RlNDVkMDZiYmUxOTY4MjQyNjNjMTJhNDZhNjc5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjExfQ==','2018-05-11 07:04:40'),('nggafvpps5lljssmvq2zavo3xj1pmexz','ZTA1MWJhY2Q2OGMwOTYyYmI2MzBhMTg3MzIxM2M3Y2Y1YzcxZjQ1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==','2018-05-10 07:43:30'),('nm4pc1em8exkx41r2a3fz6rohl5il5jp','NmZmZGM2YTU5N2I1MzM1NTlkMGUwYTNiOGY5ZGYwYzQyYjMzMTIzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9','2018-04-20 10:20:59'),('nph8pwgefx4whcx1tdnmypvx5ndttq6v','NTc3NDZkYjU3ZDMxYTE4MThkMGM5M2VjYWJhNTQ4N2U2MGZjNDEzNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9','2018-05-03 14:33:05'),('odpuhzuvd3hbq0ut0afky1mo5wdqb0g3','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2015-04-30 13:52:41'),('p0ita9j3grlijfwampjkhk17q7mfauol','ZjVmNjhkMDRhNWU1NWMzMzNlMWNlOGI3YThiOWJjZGMxODM1ZDcxZDp7fQ==','2018-05-03 14:26:38'),('pu7ywluxkb7coecwkx68inovn4w3vpn5','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-04-19 11:08:54'),('pvvz9m2mewblur3ke4p2x9fj9mppsgdp','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-05-29 03:39:33'),('q39zpmcyjg7nexbfzdjgm6iijjv6ry3u','NmZmZGM2YTU5N2I1MzM1NTlkMGUwYTNiOGY5ZGYwYzQyYjMzMTIzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9','2015-05-01 10:32:35'),('r3lxjvjfcel6fz1r1ypryo96ewymc2r6','NTc3NDZkYjU3ZDMxYTE4MThkMGM5M2VjYWJhNTQ4N2U2MGZjNDEzNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjN9','2018-05-17 02:36:16'),('sde7320rbwzed30lh4b12mpej1ommcxe','MmVlZjE1YTM3MmNiZmUzYjNmOTQwMjllZTk5YzlhZmU4OGRhOTc2NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2018-04-17 08:56:39'),('t1opkxdfpzt36gugvw2mi7qvaxhitpqk','ZjVmNjhkMDRhNWU1NWMzMzNlMWNlOGI3YThiOWJjZGMxODM1ZDcxZDp7fQ==','2018-05-26 02:52:25'),('tz3s95zrhxu2psp0ih5sbk0fl0h947ls','ZjVmNjhkMDRhNWU1NWMzMzNlMWNlOGI3YThiOWJjZGMxODM1ZDcxZDp7fQ==','2018-05-27 02:51:36'),('u6s6fh2uamqaj1zhf41epm7dxxmrbjzo','NmZmZGM2YTU5N2I1MzM1NTlkMGUwYTNiOGY5ZGYwYzQyYjMzMTIzNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5QaG9uZUNoZWNrQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjR9','2015-05-02 03:42:58'),('xnc1pm4tmfjlwbmonisog3qxnaewu5aj','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2015-04-30 13:31:26'),('xxkydw26z5plzfymm4jznt58qkzccuqr','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-05-27 11:29:49'),('y9enyrxtiw7kgaca49s69n9plcn1ueax','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2015-04-30 14:02:08'),('yjjbcix5jozcx4cmk6oi5um8zh4a9jsq','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-05-28 06:28:53'),('zmum95vmjv4gwekswlv306zz7vxbzygq','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2018-05-03 09:27:03'),('zv1sc4t5vr5oq53qd28ee1wld30yljgl','ZDI0NDg2NWFlMTBiYWM3NDJhYWI0MzRmMjNmNmE1NGMwYWRiNDhhOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImFwcGxpY2F0aW9ucy51c2Vycy5iYWNrZW5kcy5FbWFpbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2015-05-02 07:47:13');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_log`
--

DROP TABLE IF EXISTS `error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `message` varchar(256) DEFAULT NULL,
  `sentry_id` varchar(128) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `error_log_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_86a090f1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log`
--

LOCK TABLES `error_log` WRITE;
/*!40000 ALTER TABLE `error_log` DISABLE KEYS */;
INSERT INTO `error_log` VALUES (1,NULL,'用户不存在，请先注册','8ffd55a42603428a8541715323afd441','2015-04-17 10:30:07'),(2,NULL,'用户不存在，请先注册','a041168255774ff2b7d371caf6c5e5db','2015-04-17 10:30:08'),(3,NULL,'用户不存在，请先注册','d1e2165eda374eda8c7df19067414d3a','2015-04-17 10:30:11'),(4,NULL,'用户不存在，请先注册','06ebf17fc39b4cfdbbfd010cd559dc73','2015-04-17 10:30:14'),(5,NULL,'用户不存在，请先注册','25a46ca02cb7428b98585b7b7f1e81f6','2015-04-17 10:30:19'),(6,NULL,'用户不存在，请先注册','7ae11c969bea4fc18b763f39d0aca402','2015-04-17 10:30:21'),(7,NULL,'用户不存在，请先注册','5b6b9eddaaa24c7096e8b46a758c3d73','2015-04-17 10:31:45'),(8,NULL,'用户不存在，请先注册','e0ec5b1fbd5b4c6bb53272ba4b15ad6e','2015-04-17 11:15:37'),(9,3,'您选择的这门课与你的俱乐部有多高价值？如何让它增值？有冲突','0cc4b48ed1ce407a9819bbce869a9344','2015-04-17 11:26:47'),(10,3,'您选择的这门课与你的俱乐部有多高价值？如何让它增值？有冲突','62a79b7b68d84e11b73bb82529cd230a','2015-04-17 11:26:52'),(11,3,'您选择的这门课与步态蕴含的奥秘有冲突','60f0e7195a42401289f801a18542dcb5','2015-04-17 11:26:59'),(12,3,'您选择的这门课与步态蕴含的奥秘有冲突','776cd3e971a54e918cda3fc945ad611b','2015-04-17 11:27:09'),(16,NULL,'验证码错误','807a49daa12049cb98097606034cf134','2015-04-18 08:35:49'),(17,3,'Trade matching query does not exist.','cdf652e91ad94c74bb65841033663daa','2015-04-18 08:41:26'),(18,3,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','e6552677e87640c3b23ae1d17a765074','2015-04-18 08:55:17'),(19,3,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','79b7c645b4044a72a2fb6ce4a0f04930','2015-04-18 08:55:21'),(20,3,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','80f135e08f4b44ec8584ea1d3a9b718c','2015-04-18 08:57:37'),(21,3,'您选择的这门课与穿越时空的KBC壶铃训练－奥力来有冲突','453889d462ea4f08831d56e2eed8ea30','2015-04-18 08:57:45'),(22,3,'您选择的这门课与产前产后普拉提有冲突','62c4df00e99c4fc8aa15211344b08b3c','2015-04-18 09:25:49'),(23,1,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','7b5b58b6758a41c3a22b8b6b669d38cf','2015-04-18 11:15:35'),(24,1,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','66a8ad3a9fa64dcb8d50d963ab8ce59e','2015-04-18 11:15:41'),(25,1,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','cab1905dd4834fc6991df48615dbac9d','2015-04-20 08:21:02'),(26,NULL,'用户不存在，请先注册','6c33eb6d1c1d461ea5fa2645adb2f92d','2015-04-20 09:43:25'),(27,NULL,'用户不存在，请先注册','9180dd4d3850454a9bdfc05ba9fb2386','2015-04-20 09:43:29'),(28,2,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','90711593ff7b44fb99219170e07d8df1','2015-04-20 10:04:56'),(29,2,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','180e89a3b3c0443ea40f710d19415e6f','2015-04-20 10:05:03'),(30,2,'您选择的这门课与Dance－Step Cardio有冲突','99bf86bc48444af8bef0b8f8b880f6c6','2015-04-20 10:05:25'),(31,6,'您选择的这门课与水平“漂移”新提升有冲突','ef9356381f874896b0545bf35af68eef','2015-04-20 10:20:34'),(32,6,'您选择的这门课与水平“漂移”新提升有冲突','ddf2632b541d467aa59e4d313a8fa185','2015-04-20 10:20:56'),(34,7,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','1fe4517c78124c81980c853be40557bf','2015-04-20 10:46:01'),(35,7,'Trade matching query does not exist.','703d3c8b30784204949c1457ea8eb8e9','2015-04-20 10:46:48'),(36,7,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','885a71324911401e956e607b0932228c','2015-04-20 11:03:20'),(37,1,'Cannot resolve keyword u\'dasfa\' into field. Choices are: address, city, created_at, description, id, image, map_url, meetingbank, meetingtradeship, name, open_end, open_start, phone, register_end, register_start, schedule, tickettemplate, weixin','76364a4eaaa14f0f9c07609143cf1971','2015-04-20 12:39:37'),(38,7,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','36ef25321ebc4e519e8f3f334584dd67','2015-04-21 07:41:51'),(39,NULL,'用户不存在，请先注册','2079b1dedf8d4604b18f6e1ee7afbc77','2015-04-21 07:47:46'),(40,1,'您选择的这门课与销售管理秘诀：增加利润并让你保持领先有冲突','7123adc15fcc4985b9212ae6b4612c16','2015-04-21 09:54:51'),(41,1,'您选择的这门课与不是所有VIPR训练都叫VIPR有冲突','270f9aec8da546a892aa44205e3e49e9','2015-04-21 09:55:22'),(42,1,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','418c78d22db449db955cf73055a89e1f','2015-04-22 03:03:35'),(43,1,'您选择的这门课与使用小组私教训练营最大化你的利润有冲突','559b13817db74c86b95e9d68f5c3c494','2015-04-22 03:03:40'),(44,1,'Cannot resolve keyword u\'is_show\' into field. Choices are: created_at, current_sign_up, description, end, id, limit, meeting, name, need_sign_up, space, start, teacher, userschedule','2ed8060cde784863ba332b7c38d532a4','2015-04-24 09:05:56'),(50,NULL,'Cannot resolve keyword u\"(\'\\\\u0023_memberAccess.allowStaticMethodAccess\\\\u003dtrue\')(bla)(bla)\" into field. Choices are: created_at, current_sign_up, description, end, id, limit, meeting, name, need_sign_up, space, start, teacher, userschedule','3f3ffbbda8a84a70a57d51cb6596a701','2015-04-27 07:32:31'),(51,NULL,'Cannot resolve keyword u\"redirect:%{new java.lang.String(\'http://xxxxxxxxxxxxx\')}\" into field. Choices are: created_at, current_sign_up, description, end, id, limit, meeting, name, need_sign_up, space, start, teacher, userschedule','858d188e00a546fbbf1fdd421187648f','2015-04-27 07:32:33'),(52,NULL,'Cannot resolve keyword u\'redirect:http://xxxxxxxxxxxxx\' into field. Choices are: created_at, current_sign_up, description, end, id, limit, meeting, name, need_sign_up, space, start, teacher, userschedule','726b2ad5a09c438a92701d6377cef1a1','2015-04-27 07:32:34'),(53,NULL,'Cannot resolve keyword u\'debug\' into field. Choices are: created_at, current_sign_up, description, end, id, limit, meeting, name, need_sign_up, space, start, teacher, userschedule','7fa12f9da27f43e68d0d03d6f67e77a7','2015-04-27 07:33:18'),(54,NULL,'Cannot resolve keyword u\'is_show\' into field. Choices are: created_at, current_sign_up, description, end, id, limit, meeting, name, need_sign_up, space, start, teacher, userschedule','ef574950f253499cb153742ba0c31a28','2015-04-27 08:49:07'),(55,NULL,'Cannot resolve keyword u\'is_show\' into field. Choices are: created_at, current_sign_up, description, end, id, limit, meeting, name, need_sign_up, space, start, teacher, userschedule','86808b27cdfe4343bea1a89a8eb8f1e9','2015-04-27 08:49:15'),(57,NULL,'用户不存在，请先注册','53f9aa599d554460afd76a4ae27df98c','2015-05-06 06:11:44'),(58,NULL,'验证码错误','597700650e6b456b9551be0f7428e897','2015-05-19 07:26:16'),(59,1,'您选择的这门课与步态蕴含的奥秘有冲突','a901cd807afe4f29b748c6f0a42cde0f','2015-05-26 07:46:43'),(60,1,'超过预约人数上限','dd33488bc017499cbfdcf1c87c373beb','2015-05-26 08:04:15'),(61,1,'\'Schedule\' object has no attribute \'current_sign_up\'','73e36b5ce82d44c396dc19248117059d','2015-05-27 06:56:20'),(62,1,'\'Schedule\' object has no attribute \'current_sign_up\'','dfce2b5fd6e34e55a2fb90025d7b7f3d','2015-05-28 02:24:44');
/*!40000 ALTER TABLE `error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_agent`
--

DROP TABLE IF EXISTS `meeting_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_agent`
--

LOCK TABLES `meeting_agent` WRITE;
/*!40000 ALTER TABLE `meeting_agent` DISABLE KEYS */;
INSERT INTO `meeting_agent` VALUES (1,'青橙科技','9d9b5f806c'),(2,'小型健身工作室','7c9eed5195');
/*!40000 ALTER TABLE `meeting_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_agent_ticket_ship`
--

DROP TABLE IF EXISTS `meeting_agent_ticket_ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_agent_ticket_ship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL,
  `ticket_tpl_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_agent_ticket_ship_44625c0c` (`agent_id`),
  KEY `meeting_agent_ticket_ship_c2d410e1` (`ticket_tpl_id`),
  CONSTRAINT `agent_id_refs_id_9fed01e8` FOREIGN KEY (`agent_id`) REFERENCES `meeting_agent` (`id`),
  CONSTRAINT `ticket_tpl_id_refs_id_d79043ad` FOREIGN KEY (`ticket_tpl_id`) REFERENCES `meeting_ticket_template` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_agent_ticket_ship`
--

LOCK TABLES `meeting_agent_ticket_ship` WRITE;
/*!40000 ALTER TABLE `meeting_agent_ticket_ship` DISABLE KEYS */;
INSERT INTO `meeting_agent_ticket_ship` VALUES (1,1,1,'2015-05-06 06:32:28'),(2,2,1,'2015-05-06 06:45:30'),(3,2,2,'2015-05-06 06:54:40'),(4,1,5,'2015-05-11 02:25:23');
/*!40000 ALTER TABLE `meeting_agent_ticket_ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_certificate`
--

DROP TABLE IF EXISTS `meeting_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `condition` varchar(2056) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_certificate_7842a746` (`meeting_id`),
  CONSTRAINT `meeting_id_refs_id_80d47179` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meeting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_certificate`
--

LOCK TABLES `meeting_certificate` WRITE;
/*!40000 ALTER TABLE `meeting_certificate` DISABLE KEYS */;
INSERT INTO `meeting_certificate` VALUES (1,'结业证书','必须满足一下条件才能获取证书',1);
/*!40000 ALTER TABLE `meeting_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_check_in_setting`
--

DROP TABLE IF EXISTS `meeting_check_in_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_check_in_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manual_enable` tinyint(1) NOT NULL,
  `self_service_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_check_in_setting`
--

LOCK TABLES `meeting_check_in_setting` WRITE;
/*!40000 ALTER TABLE `meeting_check_in_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_check_in_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_class_survey`
--

DROP TABLE IF EXISTS `meeting_class_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_class_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_schedule_id` int(11) DEFAULT NULL,
  `data` longtext,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_class_survey_7ee87165` (`user_schedule_id`),
  CONSTRAINT `user_schedule_id_refs_id_8581c406` FOREIGN KEY (`user_schedule_id`) REFERENCES `meeting_user_schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_class_survey`
--

LOCK TABLES `meeting_class_survey` WRITE;
/*!40000 ALTER TABLE `meeting_class_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_class_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_meeting`
--

DROP TABLE IF EXISTS `meeting_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `open_start` datetime DEFAULT NULL,
  `open_end` datetime DEFAULT NULL,
  `register_start` datetime DEFAULT NULL,
  `register_end` datetime DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `phone` varchar(1024) DEFAULT NULL,
  `weixin` varchar(128) DEFAULT NULL,
  `image` varchar(128) DEFAULT NULL,
  `description` mediumtext,
  `created_at` datetime NOT NULL,
  `map_url` varchar(256) DEFAULT NULL,
  `survey_tpl` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_meeting`
--

LOCK TABLES `meeting_meeting` WRITE;
/*!40000 ALTER TABLE `meeting_meeting` DISABLE KEYS */;
INSERT INTO `meeting_meeting` VALUES (1,'第十二届亚洲体适能交流大会','2015-05-30 02:38:26','2015-05-31 02:38:26','2015-04-16 02:38:26','2015-04-30 02:38:26','北京','什剎海体育运动学校','010-67123689','“AASFP_Academy\"','http://zoneke-img.b0.upaiyun.com/ac54857719152cc0a3b9860769e3c1af.jpg','<p class=\"hangingindent\" style=\"font-family: Arial; font-size: 11px; white-space: normal; background-color: rgb(255, 255, 255);\">自2004年起，亚洲体适能交流大会（AFEEX）为来自亚洲和世界各地的体适能专业人士提供了一个共享体适能文化的平台。它融合了各种全新的理念，不断将亚洲体适能行业推向更高水平。AFEEX从世界各地邀请了国际一流的体适能专家，它是亚洲体适能界最令人期待的盛会!</p><p class=\"hangingindent\" style=\"font-family: Arial; font-size: 11px; white-space: normal; background-color: rgb(255, 255, 255);\">现在，第十二届AFEEX将于2015年5月30日- 31日（星期六 – 星期日）在北京什刹海体育运动学校举行！</p><p class=\"hangingindent\" style=\"font-family: Arial; font-size: 11px; white-space: normal; background-color: rgb(255, 255, 255);\">长期以来，AFEEX一直致力于培养国际化的体适能专业人士，并鼓励他们不断为学员们提供高质量的体适能培训，以适应这个快速变化的行业。这里不仅是体适能专业人士学习最新行业资讯、获取持续教育学分（CEUs）的大好机会，更是亚洲的教练们与其他同行、俱乐部管理人士、大学师生等聚会和建立人际网络的体适能盛宴!</p><p class=\"hangingindent\" style=\"font-family: Arial; font-size: 11px; white-space: normal; background-color: rgb(255, 255, 255);\">鼓励体适能专业教练在行业中保持领先，并为公众提供高质量的体适能训练，AFEEX始终以倡导人人拥有健康积极的生活方式为己任。同时，我们的目标是把AFEEX带到亚洲各地不同的城市——现在就来参加，成为这个亚洲的国际体适能活动中的一分子吧!</p><p class=\"txt_blk_11\" style=\"font-family: Arial; font-size: 11px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/><img src=\"/media/1429343306.070.000554675630624afeex_bg_2015_c.jpg\" title=\"1429343306.070.000554675630624afeex_bg_2015_c.jpg\"/><br/><img src=\"http://www.afeex.org/bj15c/images/aboutus_11.jpg\" width=\"255\" height=\"12\"/></p><p><br/></p>','2015-04-16 02:38:26','http://amap.com/039iYa',0),(2,'2015第四届ChinaFit健身大会','2015-05-01 01:00:00','2015-05-06 11:00:00','2015-04-16 15:14:25','2015-04-30 15:14:25','上海','上海1933','021-19331933','chinafit','http://zoneke-img.b0.upaiyun.com/c282db790971f217e4115e56aac1905e.png','<p style=\"font-size: 12px; line-height: 20.3999996185303px; font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, sans-serif; color: rgb(51, 51, 51); white-space: normal;\"><span style=\"font-size: medium; line-height: 27.2000007629395px;\">中国健身行业最大规模的年度交流盛会盛夏绽放——2015（第四届）ChinaFit健身大会！</span></p><p style=\"font-size: 12px; line-height: 20.3999996185303px; font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, sans-serif; color: rgb(51, 51, 51); white-space: normal;\"><span style=\"font-size: medium; line-height: 27.2000007629395px;\">&nbsp; &nbsp; &nbsp; &nbsp; 2015年7月7日-8日， 中国健身行业年度盛典ChinaFit健身大会将在APEC领导人会议承办场馆——国家会议中心再次举办！由于获得了全中国乃至世界健身从业者的广泛支持，ChinaFit健身大会已经在成功举办三届。</span></p><p style=\"font-size: 12px; line-height: 20.3999996185303px; font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, sans-serif; color: rgb(51, 51, 51); white-space: normal;\"><span style=\"font-size: medium; line-height: 27.2000007629395px;\">&nbsp; &nbsp; &nbsp; &nbsp; 在两天的大会中同时开始26间教室， 为超过5000名实名注册学员教授课程。与此同时，大会展览区迎来了超过10000名观众到场。感恩您的支持与参与，我们将继续坚持为中国健身行业打造真正属于自己的、国际级的年度盛会！</span></p><p><br/></p>','2015-04-16 15:14:25','',0),(3,'美国IHRSA全球年会','2015-07-29 00:00:00','2015-07-31 10:00:00','2015-04-17 05:49:02','2015-04-17 05:49:02','成都','总府路133号','20142014','IHRSAchina','http://zoneke-img.b0.upaiyun.com/f20296b6419f0bc2b11c6cc826ba7da8.jpg','<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, sans-serif; font-size: medium; line-height: 27.2000007629395px;\">1.自2007年，CHINAFIT健身网连续8年组织中国健身代表团团参加美国IHRSA健身大会，是中国健身产业人士获取世界最新趋势的最佳平台；</span><br style=\"font-size: 12px; line-height: 20.3999996185303px; font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, sans-serif; color: rgb(51, 51, 51); white-space: normal;\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, sans-serif; font-size: medium; line-height: 27.2000007629395px;\">&nbsp;&nbsp;&nbsp; 2.自2011年，CHINAFIT健身网联合IHRSA，联合主办CHINAFIT/IHRSA中国管理论坛：2011青岛，2012上海，2013南京；</span><br style=\"font-size: 12px; line-height: 20.3999996185303px; font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, sans-serif; color: rgb(51, 51, 51); white-space: normal;\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, sans-serif; font-size: medium; line-height: 27.2000007629395px;\">&nbsp;&nbsp;&nbsp; 3.自2014年，CHINAFIT将在美国IHRSA健身大会，首次推出中文同声传译课程；</span></p><p style=\"text-align: center;\"><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, sans-serif; font-size: medium; line-height: 27.2000007629395px;\"><img title=\"chinafit\" alt=\"chinafit\" src=\"http://www.chinafit.com/ad_img/20140113165102444.jpg\" data-bd-imgshare-binded=\"1\" style=\"line-height: 20.3999996185303px; border: 0px;\"/></span></p>','2015-04-17 05:49:02','',0),(4,'567GO•【十城十战】重庆','2015-05-15 16:00:00','2015-05-16 15:00:00','2015-04-18 08:35:31','2015-05-16 08:35:31','重庆','海派健身龙湖店','Pina 18910077801；Kevin 18910077800','567GO','http://zoneke-img.b0.upaiyun.com/1c5e0b75fcc3870687c3a34300f93b34.jpg','<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 25.6000003814697px; widows: 1; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;\"><span style=\"line-height: 25.6000003814697px; margin: 0px; padding: 0px; max-width: 100%; color: rgb(255, 0, 0); box-sizing: border-box !important; word-wrap: break-word !important;\"><strong style=\"margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;\">重庆开战</strong></span><span style=\"line-height: 25.6000003814697px;\">，现在就为你揭晓即将带给你无限速度与激情的强大导师阵容及课程咯！</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 25.6000003814697px; widows: 1; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important; text-align: center;\"><span style=\"line-height: 25.6000003814697px;\">See you again...</span></p><p style=\"text-align: center;\"><img src=\"/media/1429347956.690.5977260135074.pic.jpg\" style=\"float:none;\" title=\"1429347956.690.5977260135074.pic.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/media/1429347956.750.5949538079875.pic.jpg\" style=\"float:none;\" title=\"1429347956.750.5949538079875.pic.jpg\"/></p><p style=\"text-align: center;\"><img src=\"/media/1429347956.80.5346327222546.pic.jpg\" style=\"float:none;\" title=\"1429347956.80.5346327222546.pic.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 25.6000003814697px; widows: 1; background-color: rgb(255, 255, 255); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;\"><br/></p>','2015-04-18 08:35:31','',0);
/*!40000 ALTER TABLE `meeting_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_meeting_bank`
--

DROP TABLE IF EXISTS `meeting_meeting_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_meeting_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `bank` varchar(128) DEFAULT NULL,
  `card_number` varchar(64) DEFAULT NULL,
  `contact` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_meeting_bank_7842a746` (`meeting_id`),
  CONSTRAINT `meeting_id_refs_id_09164969` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meeting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_meeting_bank`
--

LOCK TABLES `meeting_meeting_bank` WRITE;
/*!40000 ALTER TABLE `meeting_meeting_bank` DISABLE KEYS */;
INSERT INTO `meeting_meeting_bank` VALUES (1,1,'工商银行北京崇文门外大街支行','0200000509024211611','北京高尼国际体育发展有限公司'),(2,1,'中国建设银行','4367 4200 1393 0570 894','567go');
/*!40000 ALTER TABLE `meeting_meeting_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_meeting_survey`
--

DROP TABLE IF EXISTS `meeting_meeting_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_meeting_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `data` longtext,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_meeting_survey_6340c63c` (`user_id`),
  KEY `meeting_meeting_survey_7842a746` (`meeting_id`),
  CONSTRAINT `meeting_id_refs_id_ce7ce782` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meeting` (`id`),
  CONSTRAINT `user_id_refs_id_a1c975c1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_meeting_survey`
--

LOCK TABLES `meeting_meeting_survey` WRITE;
/*!40000 ALTER TABLE `meeting_meeting_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_meeting_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_message`
--

DROP TABLE IF EXISTS `meeting_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(32) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `number` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `is_successful` tinyint(1) NOT NULL,
  `response` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_message`
--

LOCK TABLES `meeting_message` WRITE;
/*!40000 ALTER TABLE `meeting_message` DISABLE KEYS */;
INSERT INTO `meeting_message` VALUES (1,'18707195611','【课程预约】147364是您本次身份校验码，切勿告知他人。',1,'2015-04-17 10:29:45',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18707195611</desmobile><msgid>E0309315041718294500</msgid></message></response>\r\n'),(2,'15011056689','【课程预约】768304是您本次身份校验码，切勿告知他人。',1,'2015-04-17 10:29:52',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>C1627215041718295200</msgid></message></response>\r\n'),(3,'15011056689','【课程预约】王欣欣您好，为您成功报名“第十二届亚洲体适能交流大会”，门票详情http://mm.qingchengfit.cn/meetings/1/',2,'2015-04-17 10:31:46',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>D6829915041718314600</msgid></message><message><desmobile>15011056689</desmobile><msgid>D6829915041718314601</msgid></message></response>\r\n'),(4,'18614043303','【课程预约】018050是您本次身份校验码，切勿告知他人。',1,'2015-04-17 11:15:15',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D3249215041719151400</msgid></message></response>\r\n'),(5,'18810881895','【课程预约】王筱您好，为您成功报名“第十二届亚洲体适能交流大会”，门票详情http://mm.qingchengfit.cn/meetings/1/#/tickets',2,'2015-04-17 11:15:50',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18810881895</desmobile><msgid>C9665415041719155000</msgid></message><message><desmobile>18810881895</desmobile><msgid>C9665415041719155001</msgid></message></response>\r\n'),(6,'18810881895','【课程预约】385297是您本次身份校验码，切勿告知他人。',1,'2015-04-17 11:17:14',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18810881895</desmobile><msgid>D3543015041719171400</msgid></message></response>\r\n'),(7,'18601155940','【课程预约】kent您好，陈驰远为您成功报名“第十二届亚洲体适能交流大会”，门票详情http://mm.qingchengfit.cn/meetings/1/#/tickets',2,'2015-04-17 11:18:25',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E8472815041719182500</msgid></message><message><desmobile>18601155940</desmobile><msgid>E8472815041719182501</msgid></message></response>\r\n'),(8,'18601155940','【课程预约】273031是您本次身份校验码，切勿告知他人。',1,'2015-04-17 11:24:14',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D4736015041719241400</msgid></message></response>\r\n'),(9,'18810881895','【课程预约】王筱您好，陈驰远为您成功报名“第十二届亚洲体适能交流大会”，门票详情http://mm.qingchengfit.cn/meetings/1/#/tickets',2,'2015-04-17 11:28:47',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18810881895</desmobile><msgid>E0131615041719284700</msgid></message><message><desmobile>18810881895</desmobile><msgid>E0131615041719284701</msgid></message></response>\r\n'),(10,'15011056689','【课程预约】707917是您本次身份校验码，切勿告知他人。',1,'2015-04-18 03:42:44',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>D9587715041811424400</msgid></message></response>\r\n'),(11,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.15元。详情http://163.fm/7TDzA2d',1,'2015-04-18 05:54:15',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C9295015041813541500</msgid></message></response>\r\n'),(12,'18614043303','【课程预约】664404是您本次身份校验码，切勿告知他人。',1,'2015-04-18 05:55:18',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C9442415041813551800</msgid></message></response>\r\n'),(13,'18601155940','【课程预约】762053是您本次身份校验码，切勿告知他人。',1,'2015-04-18 08:02:14',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C6981815041816021400</msgid></message></response>\r\n'),(14,'18601155940','【课程预约】kent您好，订单支付成功，总金额3.0元。详情http://163.fm/WxGbYjg',1,'2015-04-18 08:12:14',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E7091415041816121400</msgid></message></response>\r\n'),(15,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.33元。详情http://163.fm/7TDzA2d',1,'2015-04-18 08:25:31',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D8786615041816253100</msgid></message></response>\r\n'),(16,'18601155930','【课程预约】605792是您本次身份校验码，切勿告知他人。',1,'2015-04-18 08:40:13',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155930</desmobile><msgid>D0808915041816401300</msgid></message></response>\r\n'),(17,'18601155940','【课程预约】687405是您本次身份校验码，切勿告知他人。',1,'2015-04-18 08:40:47',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D0886815041816404700</msgid></message></response>\r\n'),(18,'18601155940','【课程预约】529056是您本次身份校验码，切勿告知他人。',1,'2015-04-18 08:50:40',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E2976315041816504000</msgid></message></response>\r\n'),(19,'18601155940','【课程预约】kent您好，订单支付成功，总金额0.15元。详情http://163.fm/7TDzA2d',1,'2015-04-18 08:52:20',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D2431915041816522000</msgid></message></response>\r\n'),(20,'18601155940','【课程预约】kent您好，kent为您成功报名“第十二届亚洲体适能交流大会”，门票详情http://163.fm/7TDzA2d',1,'2015-04-18 08:54:23',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D2701415041816542300</msgid></message></response>\r\n'),(21,'18614043303','【课程预约】063585是您本次身份校验码，切勿告知他人。',1,'2015-04-18 08:56:24',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C4100515041816562400</msgid></message></response>\r\n'),(22,'18614043303','【课程预约】陈驰远您好，陈驰远为您成功报名“第十二届亚洲体适能交流大会”，门票详情http://163.fm/7TDzA2d',1,'2015-04-18 09:05:53',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E5560415041817055300</msgid></message></response>\r\n'),(23,'18601155940','【课程预约】929738是您本次身份校验码，切勿告知他人。',1,'2015-04-18 09:14:45',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E7216115041817144500</msgid></message></response>\r\n'),(24,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.36元。详情http://163.fm/7TDzA2d',1,'2015-04-18 11:05:18',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D2488115041819051700</msgid></message></response>\r\n'),(25,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.18元。详情http://163.fm/7TDzA2d',1,'2015-04-18 11:09:39',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C6380815041819093800</msgid></message></response>\r\n'),(26,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.15元。详情http://163.fm/TuWkRjF',1,'2015-04-20 08:20:31',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C7986015042016203100</msgid></message></response>\r\n'),(27,'18614043303','【课程预约】订单号mm43918600上传了付款凭证，订单金额0.15元，联系人：陈驰远，手机号18614043303，请及时处理。',1,'2015-04-20 08:59:33',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D9928715042016593300</msgid></message></response>\r\n'),(28,'18601155940','【课程预约】订单号mm43918600上传了付款凭证，订单金额0.15元，联系人：陈驰远，手机号18614043303，请及时处理。',1,'2015-04-20 08:59:33',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D9928915042016593300</msgid></message></response>\r\n'),(29,'15011056689','【课程预约】724996是您本次身份校验码，切勿告知他人。',1,'2015-04-20 09:30:19',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>D5970215042017301900</msgid></message></response>\r\n'),(30,'18614043303','【课程预约】订单号mm87778913上传了付款凭证，订单金额0.15元，联系人：王欣欣，手机号15011056689，请及时处理。',1,'2015-04-20 09:31:55',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E7457715042017315500</msgid></message></response>\r\n'),(31,'18601155940','【课程预约】订单号mm87778913上传了付款凭证，订单金额0.15元，联系人：王欣欣，手机号15011056689，请及时处理。',1,'2015-04-20 09:31:55',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C1185415042017315500</msgid></message></response>\r\n'),(32,'18614043303','【课程预约】订单号mm20887687上传了付款凭证，订单金额0.18元，联系人：kent，手机号18601155940，请及时处理。',1,'2015-04-20 09:32:16',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D6309315042017321600</msgid></message></response>\r\n'),(33,'18601155940','【课程预约】订单号mm20887687上传了付款凭证，订单金额0.18元，联系人：kent，手机号18601155940，请及时处理。',1,'2015-04-20 09:32:16',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C1260515042017321600</msgid></message></response>\r\n'),(34,'18614043303','【课程预约】订单号mm87778913上传了付款凭证，订单金额0.15元，联系人：王欣欣，手机号15011056689，请及时处理。',1,'2015-04-20 09:32:56',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C1363015042017325600</msgid></message></response>\r\n'),(35,'18601155940','【课程预约】订单号mm87778913上传了付款凭证，订单金额0.15元，联系人：王欣欣，手机号15011056689，请及时处理。',1,'2015-04-20 09:32:56',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D6451715042017325600</msgid></message></response>\r\n'),(36,'15313121715','【课程预约】079682是您本次身份校验码，切勿告知他人。',1,'2015-04-20 09:43:02',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15313121715</desmobile><msgid>D7832515042017430200</msgid></message></response>\r\n'),(37,'18601155940','【课程预约】kent您好，订单支付成功，总金额0.18元。详情http://163.fm/TuWkRjF',1,'2015-04-20 09:43:11',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C3306515042017431100</msgid></message></response>\r\n'),(38,'18614043303','【课程预约】订单号mm91427612上传了付款凭证，订单金额0.18元，联系人：zhangnan@qingcheng.it ，手机号，请及时处理。',2,'2015-04-20 09:43:57',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C3465715042017435700</msgid></message><message><desmobile>18614043303</desmobile><msgid>C3465715042017435701</msgid></message></response>\r\n'),(39,'18601155940','【课程预约】订单号mm91427612上传了付款凭证，订单金额0.18元，联系人：zhangnan@qingcheng.it ，手机号，请及时处理。',2,'2015-04-20 09:43:57',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C3465615042017435700</msgid></message><message><desmobile>18601155940</desmobile><msgid>C3465615042017435701</msgid></message></response>\r\n'),(40,'15313121715','【课程预约】468203是您本次身份校验码，切勿告知他人。',1,'2015-04-20 09:45:11',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15313121715</desmobile><msgid>E9817715042017451100</msgid></message></response>\r\n'),(41,'18601151370','【课程预约】张二您好，zhangnan@qingcheng.it 为您成功报名“第十二届亚洲体适能交流大会”，门票详情http://163.fm/TuWkRjF',2,'2015-04-20 09:53:44',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601151370</desmobile><msgid>C5324515042017534400</msgid></message><message><desmobile>18601151370</desmobile><msgid>C5324515042017534401</msgid></message></response>\r\n'),(42,'15313121715','【课程预约】tuotuo您好，订单支付成功，总金额0.0元。详情http://163.fm/Rlce2uO',1,'2015-04-20 09:57:52',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15313121715</desmobile><msgid>C6126015042017575200</msgid></message></response>\r\n'),(43,'15313121715','【课程预约】tuotuo您好，订单支付成功，总金额0.0元。详情http://163.fm/Rlce2uO',1,'2015-04-20 09:58:23',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15313121715</desmobile><msgid>D0365715042017582300</msgid></message></response>\r\n'),(44,'18601155940','【课程预约】kent您好，订单支付成功，总金额0.0元。详情http://163.fm/Rlce2uO',1,'2015-04-20 10:00:37',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D0745615042018003700</msgid></message></response>\r\n'),(45,'18601151370','【课程预约】叶不修您好，zhangnan@qingcheng.it 为您成功报名“2015第四届ChinaFit健身大会”，门票详情http://163.fm/Rlce2uO',2,'2015-04-20 10:04:00',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601151370</desmobile><msgid>E3194415042018040000</msgid></message><message><desmobile>18601151370</desmobile><msgid>E3194415042018040001</msgid></message></response>\r\n'),(46,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm87778913上传了付款凭证，订单金额0.15元，联系人：王欣欣，手机号15011056689，请及时处理。',2,'2015-04-20 10:07:32',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C8122415042018073200</msgid></message><message><desmobile>18614043303</desmobile><msgid>C8122415042018073201</msgid></message></response>\r\n'),(47,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm87778913上传了付款凭证，订单金额0.15元，联系人：王欣欣，手机号15011056689，请及时处理。',2,'2015-04-20 10:07:32',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E3989015042018073200</msgid></message><message><desmobile>18601155940</desmobile><msgid>E3989015042018073201</msgid></message></response>\r\n'),(48,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm12508336上传了付款凭证，订单金额0.18元，联系人：王欣欣，手机号15011056689，请及时处理。',2,'2015-04-20 10:07:49',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C8190115042018074900</msgid></message><message><desmobile>18614043303</desmobile><msgid>C8190115042018074901</msgid></message></response>\r\n'),(49,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm12508336上传了付款凭证，订单金额0.18元，联系人：王欣欣，手机号15011056689，请及时处理。',2,'2015-04-20 10:07:49',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C8190415042018074900</msgid></message><message><desmobile>18601155940</desmobile><msgid>C8190415042018074901</msgid></message></response>\r\n'),(50,'15011056689','【课程预约】王欣欣您好，订单支付成功，总金额0.0元。详情http://163.fm/Rlce2uO',1,'2015-04-20 10:08:52',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>C8414415042018085200</msgid></message></response>\r\n'),(51,'15313121715','【课程预约】tuo您好，tuotuo为您成功报名“2015第四届ChinaFit健身大会”，门票详情http://163.fm/Rlce2uO',2,'2015-04-20 10:19:35',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15313121715</desmobile><msgid>C0475615042018193500</msgid></message><message><desmobile>15313121715</desmobile><msgid>C0475615042018193501</msgid></message></response>\r\n'),(52,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm66374657上传了付款凭证，订单金额0.15元，联系人：tuotuo，手机号15313121715，请及时处理。',2,'2015-04-20 10:25:05',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C1207615042018250500</msgid></message><message><desmobile>18614043303</desmobile><msgid>C1207615042018250501</msgid></message></response>\r\n'),(53,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm66374657上传了付款凭证，订单金额0.15元，联系人：tuotuo，手机号15313121715，请及时处理。',2,'2015-04-20 10:25:05',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C1207715042018250500</msgid></message><message><desmobile>18601155940</desmobile><msgid>C1207715042018250501</msgid></message></response>\r\n'),(54,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm91427612上传了付款凭证，订单金额0.18元，联系人：zhangnan@qingcheng.it ，手机号，请及时处理。',2,'2015-04-20 10:31:17',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C2228915042018311700</msgid></message><message><desmobile>18614043303</desmobile><msgid>C2228915042018311701</msgid></message></response>\r\n'),(55,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm91427612上传了付款凭证，订单金额0.18元，联系人：zhangnan@qingcheng.it ，手机号，请及时处理。',2,'2015-04-20 10:31:17',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C2229315042018311700</msgid></message><message><desmobile>18601155940</desmobile><msgid>C2229315042018311701</msgid></message></response>\r\n'),(56,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm13414171上传了付款凭证，订单金额0.15元，联系人：tuotuo，手机号15313121715，请及时处理。',2,'2015-04-20 10:32:45',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C2459815042018324500</msgid></message><message><desmobile>18614043303</desmobile><msgid>C2459815042018324501</msgid></message></response>\r\n'),(57,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm13414171上传了付款凭证，订单金额0.15元，联系人：tuotuo，手机号15313121715，请及时处理。',2,'2015-04-20 10:32:45',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D6060215042018324500</msgid></message><message><desmobile>18601155940</desmobile><msgid>D6060215042018324501</msgid></message></response>\r\n'),(58,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm49995832上传了付款凭证，订单金额0.18元，联系人：王欣欣，手机号15011056689，请及时处理。',2,'2015-04-20 10:33:28',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D6146615042018332800</msgid></message><message><desmobile>18614043303</desmobile><msgid>D6146615042018332801</msgid></message></response>\r\n'),(59,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm49995832上传了付款凭证，订单金额0.18元，联系人：王欣欣，手机号15011056689，请及时处理。',2,'2015-04-20 10:33:29',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D6146715042018332800</msgid></message><message><desmobile>18601155940</desmobile><msgid>D6146715042018332801</msgid></message></response>\r\n'),(60,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm23268002上传了付款凭证，订单金额0.18元，联系人：陈驰远，手机号18614043303，请及时处理。',2,'2015-04-20 10:33:45',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C2601415042018334500</msgid></message><message><desmobile>18614043303</desmobile><msgid>C2601415042018334501</msgid></message></response>\r\n'),(61,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm23268002上传了付款凭证，订单金额0.18元，联系人：陈驰远，手机号18614043303，请及时处理。',2,'2015-04-20 10:33:45',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C2601615042018334500</msgid></message><message><desmobile>18601155940</desmobile><msgid>C2601615042018334501</msgid></message></response>\r\n'),(62,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm18377630上传了付款凭证，订单金额0.15元，联系人：zhangnan@qingcheng.it ，手机号，请及时处理。',2,'2015-04-20 10:33:46',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E8103615042018334600</msgid></message><message><desmobile>18614043303</desmobile><msgid>E8103615042018334601</msgid></message></response>\r\n'),(63,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm18377630上传了付款凭证，订单金额0.15元，联系人：zhangnan@qingcheng.it ，手机号，请及时处理。',2,'2015-04-20 10:33:46',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D6188515042018334600</msgid></message><message><desmobile>18601155940</desmobile><msgid>D6188515042018334601</msgid></message></response>\r\n'),(64,'18601151370','【课程预约】162281是您本次身份校验码，切勿告知他人。',1,'2015-04-20 10:37:51',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601151370</desmobile><msgid>E8917315042018375100</msgid></message></response>\r\n'),(65,'15011056689','【课程预约】王欣欣您好，订单支付成功，总金额0.18元。详情http://163.fm/TuWkRjF',1,'2015-04-20 10:40:36',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>D7198315042018403600</msgid></message></response>\r\n'),(66,'15313121715','【课程预约】tuotuo您好，订单支付成功，总金额0.15元。详情http://163.fm/TuWkRjF',1,'2015-04-20 10:41:21',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15313121715</desmobile><msgid>D7307715042018412100</msgid></message></response>\r\n'),(67,'15011056689','【课程预约】wxx您好，王欣欣为您成功报名“第十二届亚洲体适能交流大会”，门票详情http://163.fm/TuWkRjF',1,'2015-04-20 10:41:58',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>E9798415042018415800</msgid></message></response>\r\n'),(68,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm86686137上传了付款凭证，订单金额0.18元，联系人：张二，手机号18601151370，请及时处理。',2,'2015-04-20 10:43:55',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C4598615042018435500</msgid></message><message><desmobile>18614043303</desmobile><msgid>C4598615042018435501</msgid></message></response>\r\n'),(69,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm86686137上传了付款凭证，订单金额0.18元，联系人：张二，手机号18601151370，请及时处理。',2,'2015-04-20 10:43:55',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C4598915042018435500</msgid></message><message><desmobile>18601155940</desmobile><msgid>C4598915042018435501</msgid></message></response>\r\n'),(70,'18601151370','【课程预约】409941是您本次身份校验码，切勿告知他人。',1,'2015-04-20 10:44:14',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601151370</desmobile><msgid>C4645615042018441400</msgid></message></response>\r\n'),(71,'18601151370','【课程预约】608545是您本次身份校验码，切勿告知他人。',1,'2015-04-20 10:47:17',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601151370</desmobile><msgid>D8217515042018471700</msgid></message></response>\r\n'),(72,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm06478048上传了付款凭证，订单金额0.54元，联系人：张二，手机号18601151370，请及时处理。',2,'2015-04-20 10:48:50',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D8448215042018485000</msgid></message><message><desmobile>18614043303</desmobile><msgid>D8448215042018485001</msgid></message></response>\r\n'),(73,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm06478048上传了付款凭证，订单金额0.54元，联系人：张二，手机号18601151370，请及时处理。',2,'2015-04-20 10:48:50',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E0866515042018485000</msgid></message><message><desmobile>18601155940</desmobile><msgid>E0866515042018485001</msgid></message></response>\r\n'),(74,'15011056689','【课程预约】王欣欣您好，订单支付成功，总金额0.18元。详情http://163.fm/TuWkRjF',1,'2015-04-20 10:56:08',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>E1946615042018560800</msgid></message></response>\r\n'),(75,'15011056689','【课程预约】王欣欣您好，订单支付成功，总金额0.15元。详情http://163.fm/TuWkRjF',1,'2015-04-20 10:57:01',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>D9484015042018570100</msgid></message></response>\r\n'),(76,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm06478048上传了付款凭证，订单金额0.54元，联系人：张二，手机号18601151370，请及时处理。',2,'2015-04-20 11:02:39',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D0172815042019023900</msgid></message><message><desmobile>18614043303</desmobile><msgid>D0172815042019023901</msgid></message></response>\r\n'),(77,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm06478048上传了付款凭证，订单金额0.54元，联系人：张二，手机号18601151370，请及时处理。',2,'2015-04-20 11:02:39',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D0172715042019023900</msgid></message><message><desmobile>18601155940</desmobile><msgid>D0172715042019023901</msgid></message></response>\r\n'),(78,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm05019115上传了付款凭证，订单金额0.18元，联系人：kent，手机号18601155940，请及时处理。',2,'2015-04-20 11:04:54',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E3412415042019045400</msgid></message><message><desmobile>18614043303</desmobile><msgid>E3412415042019045401</msgid></message></response>\r\n'),(79,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm05019115上传了付款凭证，订单金额0.18元，联系人：kent，手机号18601155940，请及时处理。',2,'2015-04-20 11:04:54',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E3412715042019045400</msgid></message><message><desmobile>18601155940</desmobile><msgid>E3412715042019045401</msgid></message></response>\r\n'),(80,'18601155940','【课程预约】kent您好，订单支付成功，总金额0.18元。详情http://163.fm/TuWkRjF',1,'2015-04-20 11:06:43',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E3664715042019064300</msgid></message></response>\r\n'),(81,'18614043303','【课程预约】567GO携手巍得健身【十城十战】重庆订单号mm68669095上传了付款凭证，订单金额600.0元，联系人：tuotuo，手机号15313121715，请及时处理。',2,'2015-04-20 11:08:17',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D0840415042019081700</msgid></message><message><desmobile>18614043303</desmobile><msgid>D0840415042019081701</msgid></message></response>\r\n'),(82,'18601155940','【课程预约】567GO携手巍得健身【十城十战】重庆订单号mm68669095上传了付款凭证，订单金额600.0元，联系人：tuotuo，手机号15313121715，请及时处理。',2,'2015-04-20 11:08:17',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D0840815042019081700</msgid></message><message><desmobile>18601155940</desmobile><msgid>D0840815042019081701</msgid></message></response>\r\n'),(83,'15313121715','【课程预约】tuotuo您好，订单支付成功，总金额600.0元。详情http://163.fm/6qvoDfj',1,'2015-04-20 11:09:35',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15313121715</desmobile><msgid>E4214615042019093400</msgid></message></response>\r\n'),(84,'18601155940','【课程预约】kent您好，订单支付成功，总金额0.0元。详情http://163.fm/Rlce2uO',1,'2015-04-20 11:16:38',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E5308415042019163800</msgid></message></response>\r\n'),(85,'15011056689','【课程预约】030412是您本次身份校验码，切勿告知他人。',1,'2015-04-20 11:17:07',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>E5371815042019170700</msgid></message></response>\r\n'),(86,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.15元。详情http://163.fm/TuWkRjF',1,'2015-04-20 11:26:10',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E6506515042019261000</msgid></message></response>\r\n'),(87,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm25006110上传了付款凭证，订单金额0.36元，联系人：tuotuo，手机号15313121715，请及时处理。',2,'2015-04-21 03:57:29',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D0871215042111572900</msgid></message><message><desmobile>18614043303</desmobile><msgid>D0871215042111572901</msgid></message></response>\r\n'),(88,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm25006110上传了付款凭证，订单金额0.36元，联系人：tuotuo，手机号15313121715，请及时处理。',2,'2015-04-21 03:57:29',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D0871515042111572900</msgid></message><message><desmobile>18601155940</desmobile><msgid>D0871515042111572901</msgid></message></response>\r\n'),(89,'18601151370','【课程预约】张二您好，订单支付成功，总金额0.15元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-04-21 07:40:01',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601151370</desmobile><msgid>E8980515042115400100</msgid></message></response>\r\n'),(90,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm59313696上传了付款凭证，订单金额0.18元，联系人：张二，手机号18601151370，请及时处理。',2,'2015-04-21 07:41:27',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D2555215042115412700</msgid></message><message><desmobile>18614043303</desmobile><msgid>D2555215042115412701</msgid></message></response>\r\n'),(91,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm59313696上传了付款凭证，订单金额0.18元，联系人：张二，手机号18601151370，请及时处理。',2,'2015-04-21 07:41:27',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C9150015042115412700</msgid></message><message><desmobile>18601155940</desmobile><msgid>C9150015042115412701</msgid></message></response>\r\n'),(92,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm23837671上传了付款凭证，订单金额0.15元，联系人：tuotuo，手机号15313121715，请及时处理。',2,'2015-04-21 07:42:21',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E9337715042115422100</msgid></message><message><desmobile>18614043303</desmobile><msgid>E9337715042115422101</msgid></message></response>\r\n'),(93,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm23837671上传了付款凭证，订单金额0.15元，联系人：tuotuo，手机号15313121715，请及时处理。',2,'2015-04-21 07:42:21',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E9337615042115422100</msgid></message><message><desmobile>18601155940</desmobile><msgid>E9337615042115422101</msgid></message></response>\r\n'),(94,'18707195611','【课程预约】247251是您本次身份校验码，切勿告知他人。',1,'2015-04-21 07:47:29',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18707195611</desmobile><msgid>D3743415042115472900</msgid></message></response>\r\n'),(95,'15011056689','【课程预约】808642是您本次身份校验码，切勿告知他人。',1,'2015-04-21 10:20:48',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>D4034215042118204800</msgid></message></response>\r\n'),(96,'18614043303','【课程预约】567GO   •【十城十战】重庆订单号mm50429829上传了付款凭证，订单金额300.0元，联系人：王欣欣，手机号15011056689，请及时处理。',2,'2015-04-21 10:21:51',0,''),(97,'18601155940','【课程预约】567GO   •【十城十战】重庆订单号mm50429829上传了付款凭证，订单金额300.0元，联系人：王欣欣，手机号15011056689，请及时处理。',2,'2015-04-21 10:21:51',0,''),(98,'15011056689','【课程预约】王欣欣您好，订单支付成功，总金额300.0元。请完善参会人信息并预约课程，详情http://163.fm/6qvoDfj',1,'2015-04-21 10:21:58',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>C0961815042118215800</msgid></message></response>\r\n'),(99,'15011056689','【课程预约】wx您好，王欣欣为您成功报名“567GO   •【十城十战】重庆”，请完善参会人信息并预约课程，门票详情http://163.fm/6qvoDfj',2,'2015-04-21 10:22:52',0,''),(100,'18614043303','【课程预约】567GO•【十城十战】重庆订单号mm50919732上传了付款凭证，订单金额300.0元，联系人：王欣欣，手机号15011056689，请及时处理。',2,'2015-04-21 13:33:43',0,''),(101,'18601155940','【课程预约】567GO•【十城十战】重庆订单号mm50919732上传了付款凭证，订单金额300.0元，联系人：王欣欣，手机号15011056689，请及时处理。',2,'2015-04-21 13:33:43',0,''),(102,'15011056689','【课程预约】王欣欣您好，订单支付成功，总金额0.15元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-04-22 01:12:10',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>D1416515042209121000</msgid></message></response>\r\n'),(103,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.15元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-04-22 02:54:56',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C8313815042210545600</msgid></message></response>\r\n'),(104,'18500151305','【课程预约】黄少天您好，张二为您成功报名“第十二届亚洲体适能交流大会”，请完善参会人信息并预约课程，门票详情http://163.fm/TuWkRjF',2,'2015-04-22 07:48:00',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18500151305</desmobile><msgid>E6461415042215480000</msgid></message><message><desmobile>18500151305</desmobile><msgid>E6461415042215480001</msgid></message></response>\r\n'),(105,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.15元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-04-23 08:03:30',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C2738315042316033000</msgid></message></response>\r\n'),(106,'15011056689','【课程预约】王新您好，王欣欣为您成功报名“第十二届亚洲体适能交流大会”，请完善参会人信息并预约课程，门票详情http://163.fm/TuWkRjF',2,'2015-04-23 09:26:17',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>D2671515042317261700</msgid></message><message><desmobile>15011056689</desmobile><msgid>D2671515042317261701</msgid></message></response>\r\n'),(107,'18614043303','【课程预约】陈驰远您好，订单号mm28661874因门票学员门票不足，出票失败。请联系主办方更改或退款，联系方式：010-67123689',1,'2015-04-23 10:21:55',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E6208815042318215500</msgid></message></response>\r\n'),(108,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.05元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-04-23 10:21:55',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E6140515042318213200</msgid></message></response>\r\n'),(109,'18601151370','【课程预约】张二您好，订单支付成功，总金额0.0元。请完善参会人信息并预约课程，详情http://163.fm/Rlce2uO',1,'2015-04-28 06:02:13',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601151370</desmobile><msgid>D8341415042814021300</msgid></message></response>\r\n'),(110,'15011056688','【课程预约】090288是您本次身份校验码，切勿告知他人。',1,'2015-04-29 03:38:01',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056688</desmobile><msgid>D8238015042911375900</msgid></message></response>\r\n'),(111,'15011056689','【课程预约】009488是您本次身份校验码，切勿告知他人。',1,'2015-04-29 03:39:56',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>E5448015042911395500</msgid></message></response>\r\n'),(112,'18614043303','【课程预约】868740是您本次身份校验码，切勿告知他人。',1,'2015-05-04 14:22:07',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C3773515050422220700</msgid></message></response>\r\n'),(113,'18672760731','【课程预约】424207是您本次身份校验码，切勿告知他人。',1,'2015-05-04 14:32:36',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18672760731</desmobile><msgid>D1992215050422323600</msgid></message></response>\r\n'),(114,'18601155940','【课程预约】626441是您本次身份校验码，切勿告知他人。',1,'2015-05-04 14:32:51',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D2011315050422325100</msgid></message></response>\r\n'),(115,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm04999188上传了付款凭证，订单金额0.01元，联系人：陈驰远测试，手机号18672760731，请及时处理。',2,'2015-05-04 14:34:48',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E1010015050422344800</msgid></message><message><desmobile>18614043303</desmobile><msgid>E1010015050422344801</msgid></message></response>\r\n'),(116,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm04999188上传了付款凭证，订单金额0.01元，联系人：陈驰远测试，手机号18672760731，请及时处理。',2,'2015-05-04 14:34:48',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E1010115050422344800</msgid></message><message><desmobile>18601155940</desmobile><msgid>E1010115050422344801</msgid></message></response>\r\n'),(117,'18672760731','【课程预约】陈驰远测试您好，订单号mm04999188付款凭证已上传成功，等待工作人员处理，联系方式：010-67123689',1,'2015-05-04 14:34:48',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18672760731</desmobile><msgid>E1010315050422344800</msgid></message></response>\r\n'),(118,'18672760731','【课程预约】陈驰远测试您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-04 14:35:06',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18672760731</desmobile><msgid>E1061815050422350600</msgid></message></response>\r\n'),(119,'18672760731','【课程预约】陈驰远测试您好，陈驰远测试为您成功报名“第十二届亚洲体适能交流大会”，请完善参会人信息并预约课程，门票详情http://163.fm/TuWkRjF',2,'2015-05-04 14:35:59',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18672760731</desmobile><msgid>C5236815050422355800</msgid></message><message><desmobile>18672760731</desmobile><msgid>C5236815050422355801</msgid></message></response>\r\n'),(120,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-06 06:11:12',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C3364815050614111200</msgid></message></response>\r\n'),(121,'18346552658','【课程预约】166607是您本次身份校验码，切勿告知他人。',1,'2015-05-06 06:11:28',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18346552658</desmobile><msgid>E1432515050614112800</msgid></message></response>\r\n'),(122,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-06 06:16:42',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D0546315050614164200</msgid></message></response>\r\n'),(123,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-06 06:25:12',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E3766515050614251200</msgid></message></response>\r\n'),(124,'18346552658','【课程预约】许涛您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-06 06:25:40',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18346552658</desmobile><msgid>E3866815050614254000</msgid></message></response>\r\n'),(125,'18346552658','【课程预约】许您好，许涛为您成功报名“第十二届亚洲体适能交流大会”，请完善参会人信息并预约课程，门票详情http://163.fm/TuWkRjF',2,'2015-05-06 06:26:11',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18346552658</desmobile><msgid>D2697815050614261100</msgid></message><message><desmobile>18346552658</desmobile><msgid>D2697815050614261101</msgid></message></response>\r\n'),(126,'18346552658','【课程预约】629250是您本次身份校验码，切勿告知他人。',1,'2015-05-06 06:27:13',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18346552658</desmobile><msgid>D2974915050614271300</msgid></message></response>\r\n'),(127,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-06 06:31:17',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C6781615050614311700</msgid></message></response>\r\n'),(128,'18346552658','【课程预约】365121是您本次身份校验码，切勿告知他人。',1,'2015-05-06 06:39:29',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18346552658</desmobile><msgid>E6579215050614392900</msgid></message></response>\r\n'),(129,'18672760731','【课程预约】陈驰远测试您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-06 06:44:10',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18672760731</desmobile><msgid>D5601715050614441000</msgid></message></response>\r\n'),(130,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-08 01:24:10',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C3807515050809241000</msgid></message></response>\r\n'),(131,'18346552658','【课程预约】111519是您本次身份校验码，切勿告知他人。',1,'2015-05-08 04:43:19',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18346552658</desmobile><msgid>D9589315050812431900</msgid></message></response>\r\n'),(132,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm52111631上传了付款凭证，订单金额0.18元，联系人：陈驰远，手机号18614043303，请及时处理。',2,'2015-05-08 05:26:44',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D6144715050813264400</msgid></message><message><desmobile>18614043303</desmobile><msgid>D6144715050813264401</msgid></message></response>\r\n'),(133,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm52111631上传了付款凭证，订单金额0.18元，联系人：陈驰远，手机号18614043303，请及时处理。',2,'2015-05-08 05:26:44',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>D6145115050813264400</msgid></message><message><desmobile>18601155940</desmobile><msgid>D6145115050813264401</msgid></message></response>\r\n'),(134,'18614043303','【课程预约】陈驰远您好，订单号mm52111631付款凭证已上传成功，等待工作人员处理，联系方式：010-67123689',1,'2015-05-08 05:26:44',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C6164815050813264400</msgid></message></response>\r\n'),(135,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm22406418上传了付款凭证，订单金额0.18元，联系人：陈驰远，手机号18614043303，请及时处理。',2,'2015-05-08 05:34:29',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D8129815050813342900</msgid></message><message><desmobile>18614043303</desmobile><msgid>D8129815050813342901</msgid></message></response>\r\n'),(136,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm22406418上传了付款凭证，订单金额0.18元，联系人：陈驰远，手机号18614043303，请及时处理。',2,'2015-05-08 05:34:29',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E5018015050813342900</msgid></message><message><desmobile>18601155940</desmobile><msgid>E5018015050813342901</msgid></message></response>\r\n'),(137,'18614043303','【课程预约】陈驰远您好，订单号mm22406418付款凭证已上传成功，等待工作人员处理，联系方式：010-67123689',1,'2015-05-08 05:34:29',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D8130815050813342900</msgid></message></response>\r\n'),(138,'15011056689','【课程预约】137264是您本次身份校验码，切勿告知他人。',1,'2015-05-11 07:42:33',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>D0269215051115423300</msgid></message></response>\r\n'),(139,'18346552658','【课程预约】424511是您本次身份校验码，切勿告知他人。',1,'2015-05-12 07:04:23',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18346552658</desmobile><msgid>E4780115051215042300</msgid></message></response>\r\n'),(140,'18601155940','【课程预约】126310是您本次身份校验码，切勿告知他人。',1,'2015-05-18 02:36:03',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>C6642615051810360300</msgid></message></response>\r\n'),(141,'18614043303','【课程预约】第十二届亚洲体适能交流大会订单号mm23140370上传了付款凭证，订单金额0.01元，联系人：王欣，手机号15011056689，请及时处理。',2,'2015-05-18 09:42:30',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>C7776215051817423000</msgid></message><message><desmobile>18614043303</desmobile><msgid>C7776215051817423001</msgid></message></response>\r\n'),(142,'18601155940','【课程预约】第十二届亚洲体适能交流大会订单号mm23140370上传了付款凭证，订单金额0.01元，联系人：王欣，手机号15011056689，请及时处理。',2,'2015-05-18 09:42:30',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18601155940</desmobile><msgid>E1456915051817423000</msgid></message><message><desmobile>18601155940</desmobile><msgid>E1456915051817423001</msgid></message></response>\r\n'),(143,'15011056689','【课程预约】第十二届亚洲体适能交流大会订单号mm23140370上传了付款凭证，订单金额0.01元，联系人：王欣，手机号15011056689，请及时处理。',2,'2015-05-18 09:42:30',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>C7776615051817423000</msgid></message><message><desmobile>15011056689</desmobile><msgid>C7776615051817423001</msgid></message></response>\r\n'),(144,'15011056689','【课程预约】王欣您好，订单号mm23140370付款凭证已上传成功，等待工作人员处理，联系方式：010-67123689',1,'2015-05-18 09:42:31',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>C7777115051817423100</msgid></message></response>\r\n'),(145,'15011056689','【课程预约】王欣您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-18 09:49:30',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>E2543415051817493000</msgid></message></response>\r\n'),(146,'15011056689','【课程预约】wx您好，王欣为您成功报名“第十二届亚洲体适能交流大会”，请完善参会人信息并预约课程，门票详情http://163.fm/TuWkRjF',2,'2015-05-18 09:50:16',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>15011056689</desmobile><msgid>D1624215051817501600</msgid></message><message><desmobile>15011056689</desmobile><msgid>D1624215051817501601</msgid></message></response>\r\n'),(147,'18810881895','【课程预约】600795是您本次身份校验码，切勿告知他人。',1,'2015-05-19 07:25:53',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18810881895</desmobile><msgid>E6603315051915255300</msgid></message></response>\r\n'),(148,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.03元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-25 06:52:48',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>E4843815052514523900</msgid></message></response>\r\n'),(149,'18810881895','【课程预约】871726是您本次身份校验码，切勿告知他人。',1,'2015-05-26 01:38:48',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18810881895</desmobile><msgid>E3481615052609384800</msgid></message></response>\r\n'),(150,'18672760731','【课程预约】陈驰远测试您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-26 06:47:59',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18672760731</desmobile><msgid>D4844615052614475900</msgid></message></response>\r\n'),(151,'18614043303','【课程预约】陈驰远您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-26 07:09:03',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18614043303</desmobile><msgid>D8218515052615090300</msgid></message></response>\r\n'),(152,'18672760731','【课程预约】陈驰远测试您好，订单支付成功，总金额0.01元。请完善参会人信息并预约课程，详情http://163.fm/TuWkRjF',1,'2015-05-26 08:06:52',1,'<?xml version=\"1.0\" encoding=\"gbk\" ?><response><code>03</code><message><desmobile>18672760731</desmobile><msgid>D8849215052616065200</msgid></message></response>\r\n');
/*!40000 ALTER TABLE `meeting_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_print_template`
--

DROP TABLE IF EXISTS `meeting_print_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_print_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `template` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_print_template`
--

LOCK TABLES `meeting_print_template` WRITE;
/*!40000 ALTER TABLE `meeting_print_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_print_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_printer_setting`
--

DROP TABLE IF EXISTS `meeting_printer_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_printer_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `print_user` tinyint(1) NOT NULL,
  `print_schedule` tinyint(1) NOT NULL,
  `meeting_id` int(11),
  PRIMARY KEY (`id`),
  KEY `meeting_printer_setting_7842a746` (`meeting_id`),
  CONSTRAINT `meeting_id_refs_id_b7c7cfff` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meeting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_printer_setting`
--

LOCK TABLES `meeting_printer_setting` WRITE;
/*!40000 ALTER TABLE `meeting_printer_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_printer_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_schedule`
--

DROP TABLE IF EXISTS `meeting_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `space` varchar(128) DEFAULT NULL,
  `teacher` varchar(128) DEFAULT NULL,
  `need_sign_up` tinyint(1) NOT NULL,
  `limit` int(10) unsigned DEFAULT NULL,
  `description` mediumtext,
  `created_at` datetime NOT NULL,
  `current_sign_up` int(10) unsigned,
  `survey_tpl` smallint(6) NOT NULL,
  `can_sign_up` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_schedule_7842a746` (`meeting_id`),
  CONSTRAINT `meeting_id_refs_id_4b4e4c03` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meeting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_schedule`
--

LOCK TABLES `meeting_schedule` WRITE;
/*!40000 ALTER TABLE `meeting_schedule` DISABLE KEYS */;
INSERT INTO `meeting_schedule` VALUES (1,1,'步态蕴含的奥秘','2015-05-30 01:20:00','2015-05-30 02:40:00','康复后训练','Sondra Karman',1,100,'这个80分钟的工作坊将告诉你行走模式（步态）背后的秘密，正确的步态可以帮助你的客户预防损伤、促进术后恢复。准确募集骨盆底肌和躯干稳定肌是保持正确体态、维护日常步行和运动中流畅动作的关键。课程中讲授的训练方法可以强化骨盆底肌，增加躯干稳定肌和主动肌的募集程度，这都是一个正确步态所必需的。','2015-04-16 02:49:06',0,0,1),(2,1,'康复最关键的是……','2015-05-30 03:00:00','2015-05-30 04:20:00','康复后训练','Brabara Klein',1,100,'当物理治疗遇上体适能，你会学到如何将一个康复工具整合到自己的日常生活中。深层肌肉是改善姿态和提高运动表现的根基，快来跟Barbara一起探索深层肌肉！','2015-04-16 02:52:11',0,0,1),(3,1,'私教自我康复技术','2015-05-30 05:40:00','2015-05-30 07:00:00','康复后训练','Terence Chau',1,100,'','2015-04-16 02:54:07',0,0,1),(4,1,'\"跳\"离运动伤患','2015-05-30 07:20:00','2015-05-30 08:40:00','康复后训练','Indy Ho',1,100,'','2015-04-16 04:43:26',0,0,1),(5,1,'Body FX（遂生健身）','2015-05-30 01:20:00','2015-05-30 02:40:00','遂生健身－私教百宝箱','Richard Scrivener',1,100,'','2015-04-16 05:01:40',0,0,1),(6,1,'\"扭碎脂肪\"','2015-05-30 03:00:00','2015-05-30 04:20:00','遂生健身－私教百宝箱','Takila',1,100,'','2015-04-16 05:03:53',0,0,1),(7,1,'不是所有VIPR训练都叫VIPR','2015-05-30 05:40:00','2015-05-30 08:40:00','遂生健身－私教百宝箱','Matthew Truscott',1,100,'','2015-04-16 05:05:22',0,0,1),(8,1,'保加利亚包失传之秘','2015-05-31 01:20:00','2015-05-31 04:20:00','遂生健身－私教百宝箱','Tommy Matthews',1,100,'','2015-04-16 05:07:09',0,0,1),(9,1,'更强、更优、更快－T3','2015-05-31 05:40:00','2015-05-31 08:40:00','遂生健身－私教百宝箱','Richard Scrivener',1,100,'','2015-04-16 05:08:28',0,0,1),(10,1,'让客户重生','2015-05-31 01:20:00','2015-05-31 04:20:00','康复后训练','Jonathan Ross',1,100,'','2015-04-16 05:09:42',0,0,1),(11,1,'用“不稳”创造“更稳”','2015-05-31 05:40:00','2015-05-31 08:40:00','康复后训练','Sondra Karman',1,100,'','2015-04-16 05:11:16',0,0,1),(12,1,'业绩都去哪儿了？','2015-05-30 01:20:00','2015-05-30 02:40:00','会所管理课室','苏文政',1,120,'如何通过俱乐部资源最大化提升业绩？课程将围绕FM用兵之法、发挥PT特长、续课率提升、成本控制、减少负债等方面展开。','2015-04-16 05:12:59',0,0,1),(13,1,'重组健身DNA','2015-05-30 03:00:00','2015-05-30 04:20:00','会所管理课室','Marco Ferdinandi',1,120,'','2015-04-16 05:18:20',0,0,1),(14,1,'POS寻根之旅','2015-05-30 05:40:00','2015-05-30 07:00:00','会所管理课室','苏文政',1,120,'通过PT-RX&POS快速提高新会员（NMU）入会率，增加俱乐部收入。','2015-04-16 05:19:13',0,0,1),(15,1,'小团体私教课销售圣经','2015-05-30 07:20:00','2015-05-30 08:40:00','会所管理课室','Erica Tillinghast',1,120,'','2015-04-16 05:20:20',0,0,1),(16,1,'《互联网+“健身房”》','2015-05-30 04:30:00','2015-05-30 05:30:00','会所管理教室','Kent',1,100,'互联网已经无所不在，但是在健身行业，我们离互联网还很远。让我们一起来探讨怎样利用互联网来维护健身房的会员、让互联网帮我们增长会员、挖掘会员更大的价值。','2015-04-16 05:21:42',0,0,1),(17,1,'30天，收入提升100%','2015-05-31 01:20:00','2015-05-31 02:40:00','会所管理教室','苏文政',1,120,'建立数据化系统管理团队，PT-RX&POS应用实战。 ','2015-04-16 05:24:04',0,0,1),(18,1,'“太极”式销售技巧','2015-05-31 03:00:00','2015-05-31 04:20:00','会所管理教室','Marco Ferdinandi',1,120,'','2015-04-16 05:25:40',0,0,1),(19,1,'寻根之旅总结会','2015-05-31 05:40:00','2015-05-31 08:40:00','会所管理教室','苏文政',1,120,'研讨会：学员可提前准备相关问题，现场答疑解惑。 ','2015-04-16 05:26:54',0,0,1),(20,1,'穿越时空的KBC壶铃训练－奥力来','2015-05-30 01:20:00','2015-05-30 04:20:00','功能训练教室1','宫臣',1,100,'','2015-04-16 05:29:17',0,0,1),(21,1,'爆发你的旋转力量－TRX RIP功能性训练棒－奥力来','2015-05-30 05:40:00','2015-05-30 08:40:00','功能训练教室1','黄旭晖',1,100,'','2015-04-16 05:32:17',0,0,1),(22,1,'平衡及核心稳定训练100招','2015-05-31 01:20:00','2015-05-31 02:40:00','功能训练教室1','Indy Ho',1,100,'','2015-04-16 05:34:19',0,0,1),(23,1,'星级教练方程式A－F','2015-05-31 03:00:00','2015-05-31 04:20:00','功能训练教室1','杜德智',1,100,'','2015-04-16 05:36:16',0,0,1),(24,1,'Ugi-U got it （Ugi超级软式药球训练）－奥力来','2015-05-31 05:40:00','2015-05-31 08:40:00','功能训练教室1','王苗苗',1,100,'','2015-04-16 05:37:30',0,0,1),(25,1,'课程像Party，会员爱死你','2015-05-30 01:20:00','2015-05-30 04:20:00','小团体训练教室','Jonathan Ross',1,100,'','2015-04-16 05:39:30',0,0,1),(26,1,'水平“漂移”新提升','2015-05-30 05:40:00','2015-05-30 08:40:00','小团体训练课室','Jonathan Ross',1,100,'','2015-04-16 05:46:48',0,0,1),(27,1,'用好20亿次的跳动，专业从“心”开始','2015-05-31 01:20:00','2015-05-31 04:20:00','小团体训练课室','Takila',1,100,'','2015-04-16 05:48:37',0,0,1),(28,1,'触动会员消费的小团体私教课程','2015-05-31 05:40:00','2015-05-31 08:40:00','小团体训练教室','Erica Tillinghast',1,100,'','2015-04-16 05:50:27',0,0,1),(29,1,'抗衰老医学－生命质量与运动能力最优化','2015-05-30 01:20:00','2015-05-30 02:40:00','E','郭戈',1,100,'','2015-04-16 05:57:41',0,0,1),(30,1,'从细胞和干细胞治疗谈生命4S','2015-05-30 03:00:00','2015-05-30 04:20:00','E','高锦',1,100,'','2015-04-16 06:19:29',0,0,1),(31,1,'辣妈计划：从分娩后到更年期','2015-05-30 05:40:00','2015-05-30 08:40:00','E','Sharon Wong',1,1,'','2015-04-16 06:20:40',0,0,1),(32,1,'营养也要“功能性”','2015-05-31 01:20:00','2015-05-31 02:40:00','E','阳莙禾',1,100,'','2015-04-16 06:24:02',0,0,1),(33,1,'极速美体','2015-05-31 03:00:00','2015-05-31 04:20:00','E','Brabara Klein',1,100,'','2015-04-16 06:27:58',0,0,1),(34,1,'运动打造“最强大脑”','2015-05-31 05:40:00','2015-05-31 08:40:00','E','Jonathan Ross',1,100,'','2015-04-16 06:29:08',0,0,1),(35,3,'留住人才','2015-03-02 00:00:00','2015-03-02 01:00:00','第一教室','Brent Darden, TELOS 健身中心总经理与投资人与IHRSA 董事会主席',1,150,'留住人才：建立并绑定你的团队','2015-04-17 05:52:42',0,0,1),(36,3,'销售管理秘诀：增加利润并让你保持领先','2015-03-02 01:00:00','2015-03-02 02:00:00','第二教室','Alan Leach，爱尔兰 West Wood 俱乐部大区经理',1,100,'销售管理秘诀：增加利润并让你保持领先','2015-04-17 06:07:15',0,0,1),(37,3,'如何变得令人惊艳：从第一印象到长期价值','2015-03-02 03:00:00','2015-03-02 04:00:00','第一教室','畅销书作家Sally Hogshead',1,150,'如何变得令人惊艳：从第一印象到长期价值','2015-04-17 06:08:28',0,0,1),(38,3,'使用小组私教训练营最大化你的利润','2015-03-02 06:00:00','2015-03-02 08:00:00','第二教室','Mindy Mylrea, 国际健身冠军<br>Bruce MyIrea, Savvier Fitness销售总监',1,100,'使用小组私教训练营最大化你的利润','2015-04-17 06:11:00',0,0,1),(39,3,'你的俱乐部有多高价值？如何让它增值？','2015-03-02 06:30:00','2015-04-17 08:40:00','第一教室','David Hardy, Franvest Capital Partners公司总裁，加拿大健身行业协会主席',1,150,'你的俱乐部有多高价值？如何让它增值？','2015-04-17 06:13:46',0,0,1),(40,4,'Dance-Aerobic Cardio','2015-05-16 01:30:00','2015-05-16 03:00:00','ROOM A','Colin',0,0,'','2015-04-18 09:17:35',0,0,1),(41,4,'格斗之马伽术入门','2015-05-16 03:00:00','2015-05-16 04:30:00','ROOM A','Jason',0,0,'','2015-04-18 09:18:58',0,0,1),(42,4,'Dance－Step Cardio','2015-05-16 06:00:00','2015-05-16 07:30:00','ROOM A','Jerry',0,0,'','2015-04-18 09:20:58',0,0,1),(43,4,'Dance－Step Break down','2015-05-16 07:30:00','2015-05-16 09:00:00','ROOM A','Jerry',0,0,'','2015-04-18 09:22:05',0,0,1),(44,4,'产前产后普拉提','2015-05-16 01:30:00','2015-05-16 03:00:00','ROOM B','Yang',0,0,'','2015-04-18 09:23:36',0,0,1),(45,4,'产前产后的训练计划','2015-05-16 03:00:00','2015-05-16 04:30:00','ROOM B','Yang',0,0,'','2015-04-18 09:24:23',0,0,1),(46,4,'SMART智趣多感官训练','2015-05-16 06:00:00','2015-05-16 07:30:00','ROOM B','Eve，Janson',0,0,'','2015-04-18 09:25:10',0,0,1),(47,4,'SMART智趣脑体训练','2015-05-16 07:30:00','2015-05-16 09:00:00','ROOM B','Eve，Janson',0,0,'','2015-04-18 09:26:30',0,0,1);
/*!40000 ALTER TABLE `meeting_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_system_setting`
--

DROP TABLE IF EXISTS `meeting_system_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_system_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `address` varchar(1024) DEFAULT NULL,
  `phone` varchar(256) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `website` varchar(256) DEFAULT NULL,
  `weixin` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_system_setting`
--

LOCK TABLES `meeting_system_setting` WRITE;
/*!40000 ALTER TABLE `meeting_system_setting` DISABLE KEYS */;
INSERT INTO `meeting_system_setting` VALUES (1,'','','','','','','','');
/*!40000 ALTER TABLE `meeting_system_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_ticket_checkin_history`
--

DROP TABLE IF EXISTS `meeting_ticket_checkin_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_ticket_checkin_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `check_in_at` datetime DEFAULT NULL,
  `check_in_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_ticket_checkin_history_ad2d0cde` (`ticket_id`),
  KEY `meeting_ticket_checkin_history_9fa555ff` (`check_in_by_id`),
  CONSTRAINT `check_in_by_id_refs_id_64759dd5` FOREIGN KEY (`check_in_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `ticket_id_refs_id_fa0fdd0e` FOREIGN KEY (`ticket_id`) REFERENCES `meeting_user_ticket_ship` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_ticket_checkin_history`
--

LOCK TABLES `meeting_ticket_checkin_history` WRITE;
/*!40000 ALTER TABLE `meeting_ticket_checkin_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_ticket_checkin_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_ticket_template`
--

DROP TABLE IF EXISTS `meeting_ticket_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_ticket_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `inventory` int(11) DEFAULT NULL,
  `check_inventory` tinyint(1) NOT NULL,
  `rule` longtext,
  `meeting_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `remarks` varchar(8192) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_ticket_template_7842a746` (`meeting_id`),
  CONSTRAINT `meeting_id_refs_id_956ca26e` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meeting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_ticket_template`
--

LOCK TABLES `meeting_ticket_template` WRITE;
/*!40000 ALTER TABLE `meeting_ticket_template` DISABLE KEYS */;
INSERT INTO `meeting_ticket_template` VALUES (1,0.01,86,1,'[]',1,'学员门票','2015-04-16 02:46:51','2015-05-30 02:46:51','hjijkjkkjkkj'),(2,0.18,195,1,'[]',1,'非学员门票','2015-04-16 02:48:00','2015-05-31 02:48:00',''),(3,3,100,1,'[]',3,'门票','2015-04-18 04:44:54','2015-04-30 04:44:54','门票含所有课程'),(4,300,200,0,'[]',NULL,'门票','2015-04-18 08:44:19','2015-04-30 16:00:00','凡2015年4月30日前报名付款，可享受超值优惠价300元／人。'),(5,300,200,0,'[]',4,'超值优惠价','2015-04-18 08:44:19','2015-04-30 15:59:59','凡2015年4月30日前报名付款，可享受超值优惠价300元／人。'),(12,0,100,0,'[]',2,'免费票','2015-04-20 09:57:06','2015-05-31 09:57:06',''),(13,10,10,0,'[]',1,'学员通票','2015-05-06 06:58:41','2015-05-31 06:58:41',''),(14,0.01,10,0,'[]',1,'测试票','2015-05-18 09:41:15','2015-05-31 09:41:15','');
/*!40000 ALTER TABLE `meeting_ticket_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_trade_ship`
--

DROP TABLE IF EXISTS `meeting_trade_ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_trade_ship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `trade_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_trade_ship_7842a746` (`meeting_id`),
  KEY `meeting_trade_ship_44625c0c` (`agent_id`),
  KEY `meeting_trade_ship_591ae0b5` (`trade_id`),
  KEY `meeting_trade_ship_0c98d849` (`created_by_id`),
  CONSTRAINT `agent_id_refs_id_bc80aaf6` FOREIGN KEY (`agent_id`) REFERENCES `meeting_agent` (`id`),
  CONSTRAINT `created_by_id_refs_id_89da8d97` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `meeting_id_refs_id_d6f96649` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meeting` (`id`),
  CONSTRAINT `trade_id_refs_id_fb915078` FOREIGN KEY (`trade_id`) REFERENCES `order_trade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_trade_ship`
--

LOCK TABLES `meeting_trade_ship` WRITE;
/*!40000 ALTER TABLE `meeting_trade_ship` DISABLE KEYS */;
INSERT INTO `meeting_trade_ship` VALUES (2,3,NULL,15,'2015-04-18 08:04:07',3),(3,3,NULL,16,'2015-04-18 08:05:46',3),(4,1,NULL,17,'2015-04-18 08:20:05',1),(6,1,NULL,19,'2015-04-18 08:51:48',3),(7,4,NULL,20,'2015-04-18 09:41:55',3),(8,4,NULL,21,'2015-04-18 09:42:12',3),(9,1,NULL,22,'2015-04-18 09:49:53',1),(10,1,NULL,23,'2015-04-18 11:04:56',1),(11,1,NULL,24,'2015-04-18 11:09:29',1),(13,1,NULL,26,'2015-04-20 08:20:22',1),(14,1,NULL,27,'2015-04-20 09:28:58',1),(16,1,NULL,29,'2015-04-20 09:31:05',3),(17,4,NULL,30,'2015-04-20 09:38:49',3),(19,1,NULL,32,'2015-04-20 09:43:35',2),(23,1,NULL,36,'2015-04-20 09:52:17',3),(25,2,NULL,38,'2015-04-20 09:57:49',6),(26,2,NULL,39,'2015-04-20 09:58:14',6),(27,1,NULL,40,'2015-04-20 10:00:18',3),(28,2,NULL,41,'2015-04-20 10:00:35',3),(31,3,NULL,44,'2015-04-20 10:23:24',6),(33,1,NULL,46,'2015-04-20 10:28:29',6),(36,1,NULL,49,'2015-04-20 10:48:06',7),(38,1,NULL,51,'2015-04-20 11:04:27',3),(39,4,NULL,52,'2015-04-20 11:07:26',6),(40,1,NULL,53,'2015-04-20 11:15:41',3),(41,2,NULL,54,'2015-04-20 11:16:37',3),(42,1,NULL,55,'2015-04-20 11:19:12',3),(43,3,NULL,56,'2015-04-20 11:25:37',3),(44,1,NULL,57,'2015-04-21 03:56:31',6),(45,1,NULL,58,'2015-04-21 07:39:43',7),(46,1,NULL,59,'2015-04-21 07:40:57',7),(47,1,NULL,60,'2015-04-21 07:41:54',6),(48,1,NULL,61,'2015-04-21 07:54:00',3),(49,1,NULL,62,'2015-04-21 08:30:39',1),(53,1,NULL,66,'2015-04-22 02:54:44',1),(54,1,NULL,67,'2015-04-22 05:43:03',3),(55,1,NULL,68,'2015-04-22 05:43:12',3),(56,1,NULL,69,'2015-04-23 07:32:25',1),(57,1,NULL,70,'2015-04-23 10:21:36',1),(58,2,NULL,71,'2015-04-28 06:02:11',7),(60,1,NULL,73,'2015-05-04 14:34:31',10),(61,1,NULL,74,'2015-05-06 06:01:09',1),(62,1,NULL,75,'2015-05-06 06:10:28',1),(63,1,NULL,76,'2015-05-06 06:15:39',1),(64,1,NULL,77,'2015-05-06 06:20:37',1),(65,1,NULL,78,'2015-05-06 06:24:47',1),(66,1,NULL,79,'2015-05-06 06:25:28',11),(68,1,NULL,81,'2015-05-06 06:30:49',1),(69,1,1,82,'2015-05-06 06:44:01',10),(70,1,2,83,'2015-05-06 06:46:35',1),(71,1,NULL,84,'2015-05-07 07:40:55',1),(72,1,NULL,85,'2015-05-07 08:28:27',1),(73,1,NULL,86,'2015-05-07 08:30:08',1),(74,1,NULL,87,'2015-05-07 10:59:19',1),(75,1,NULL,88,'2015-05-07 13:00:04',1),(76,1,NULL,89,'2015-05-07 13:00:29',1),(77,1,NULL,90,'2015-05-07 13:25:28',1),(78,1,NULL,91,'2015-05-08 00:49:04',1),(79,1,NULL,92,'2015-05-08 00:51:33',1),(80,1,NULL,93,'2015-05-08 01:04:45',1),(81,1,NULL,94,'2015-05-08 01:51:52',1),(82,1,NULL,95,'2015-05-08 01:56:06',1),(83,1,NULL,96,'2015-05-08 02:00:38',1),(84,1,NULL,97,'2015-05-08 02:01:10',1),(85,1,NULL,98,'2015-05-08 02:11:48',1),(88,1,NULL,101,'2015-05-08 02:22:32',1),(90,1,NULL,103,'2015-05-08 04:43:49',11),(93,1,NULL,106,'2015-05-08 05:34:18',1),(94,1,NULL,107,'2015-05-08 05:39:11',1),(95,1,NULL,108,'2015-05-18 09:40:49',12),(96,1,NULL,109,'2015-05-18 09:41:57',12),(97,1,2,110,'2015-05-25 06:52:21',1),(98,1,NULL,111,'2015-05-26 01:39:24',5),(99,1,2,112,'2015-05-26 06:47:47',10),(100,1,2,113,'2015-05-26 06:52:47',1),(101,1,2,114,'2015-05-26 07:08:31',1),(102,1,2,115,'2015-05-26 08:06:38',10);
/*!40000 ALTER TABLE `meeting_trade_ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_user_certificate`
--

DROP TABLE IF EXISTS `meeting_user_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_user_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `certificate_id` int(11),
  `created_at` datetime NOT NULL,
  `url` varchar(256),
  `ticket_id` int(11),
  PRIMARY KEY (`id`),
  KEY `meeting_user_certificate_7842a746` (`meeting_id`),
  KEY `meeting_user_certificate_f61cf6a0` (`certificate_id`),
  KEY `meeting_user_certificate_ad2d0cde` (`ticket_id`),
  CONSTRAINT `certificate_id_refs_id_cf32b547` FOREIGN KEY (`certificate_id`) REFERENCES `meeting_certificate` (`id`),
  CONSTRAINT `meeting_id_refs_id_bc6ca3a3` FOREIGN KEY (`meeting_id`) REFERENCES `meeting_meeting` (`id`),
  CONSTRAINT `ticket_id_refs_id_40339074` FOREIGN KEY (`ticket_id`) REFERENCES `meeting_user_ticket_ship` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_user_certificate`
--

LOCK TABLES `meeting_user_certificate` WRITE;
/*!40000 ALTER TABLE `meeting_user_certificate` DISABLE KEYS */;
INSERT INTO `meeting_user_certificate` VALUES (1,1,1,'2015-05-30 05:39:11','http://zoneke-img.b0.upaiyun.com/9858b457b94bbf379dba505d88dcc0b9.jpg',10),(2,1,1,'2015-05-30 06:17:40','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',9),(3,1,1,'2015-05-30 06:21:02','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',11),(4,1,1,'2015-05-30 06:21:04','http://zoneke-img.b0.upaiyun.com/eff992cc8ec6cdade0341a20b44a98e0.jpg',12),(5,1,1,'2015-05-30 06:21:06','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',13),(6,1,1,'2015-05-30 06:21:08','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',14),(7,1,1,'2015-05-30 06:21:10','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',15),(8,1,1,'2015-05-30 06:21:12','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',16),(9,1,1,'2015-05-30 06:21:14','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',17),(10,1,1,'2015-05-30 06:21:15','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',19),(11,1,1,'2015-05-30 06:21:18','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',20),(12,1,1,'2015-05-30 06:21:21','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',21),(13,1,1,'2015-05-30 06:21:22','http://zoneke-img.b0.upaiyun.com/53a903a1a3414baa1beb1b64d540cd85.jpg',22),(14,1,1,'2015-05-30 06:21:24','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',23),(15,1,1,'2015-05-30 06:21:26','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',24),(16,1,1,'2015-05-30 06:21:28','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',29),(17,1,1,'2015-05-30 06:21:30','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',32),(18,1,1,'2015-05-30 06:21:32','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',33),(19,1,1,'2015-05-30 06:21:34','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',34),(20,1,1,'2015-05-30 06:21:35','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',35),(21,1,1,'2015-05-30 06:21:37','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',36),(22,1,1,'2015-05-30 06:21:39','http://zoneke-img.b0.upaiyun.com/b7a902e43ebd2bb5a21c8943bf649733.jpg',37),(23,1,1,'2015-05-30 06:21:41','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',40),(24,1,1,'2015-05-30 06:21:42','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',41),(25,1,1,'2015-05-30 06:21:44','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',43),(26,1,1,'2015-05-30 06:21:46','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',44),(27,1,1,'2015-05-30 06:21:48','http://zoneke-img.b0.upaiyun.com/4f6c1672daa0834124cdcca6f81e35dd.jpg',45),(28,1,1,'2015-05-30 06:21:50','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',46),(29,1,1,'2015-05-30 06:21:52','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',47),(30,1,1,'2015-05-30 06:21:54','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',48),(31,1,1,'2015-05-30 06:21:56','http://zoneke-img.b0.upaiyun.com/9db1e88d67225ae9534cc0b1691312b6.jpg',49),(32,1,1,'2015-05-30 06:21:58','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',50),(33,1,1,'2015-05-30 06:22:01','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',51),(34,1,1,'2015-05-30 06:22:02','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',52),(35,1,1,'2015-05-30 06:22:04','http://zoneke-img.b0.upaiyun.com/02cfb7b0c93672573e332859ec80d0a7.jpg',53),(36,1,1,'2015-05-30 06:22:06','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',54),(37,1,1,'2015-05-30 06:22:08','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',55),(38,1,1,'2015-05-30 06:22:10','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',56),(39,1,1,'2015-05-30 06:22:12','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',57),(40,1,1,'2015-05-30 06:22:13','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',58),(41,1,1,'2015-05-30 06:22:15','http://zoneke-img.b0.upaiyun.com/6d122fa6ec60d67c694345498afd9c37.jpg',59);
/*!40000 ALTER TABLE `meeting_user_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_user_schedule`
--

DROP TABLE IF EXISTS `meeting_user_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_user_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meeting_user_schedule_ticket_id_101dea5be6f4af5b_uniq` (`ticket_id`,`schedule_id`),
  KEY `meeting_user_schedule_ad2d0cde` (`ticket_id`),
  KEY `meeting_user_schedule_945133b8` (`schedule_id`),
  CONSTRAINT `schedule_id_refs_id_21f89a59` FOREIGN KEY (`schedule_id`) REFERENCES `meeting_schedule` (`id`),
  CONSTRAINT `ticket_id_refs_id_2dbc839e` FOREIGN KEY (`ticket_id`) REFERENCES `meeting_user_ticket_ship` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_user_schedule`
--

LOCK TABLES `meeting_user_schedule` WRITE;
/*!40000 ALTER TABLE `meeting_user_schedule` DISABLE KEYS */;
INSERT INTO `meeting_user_schedule` VALUES (33,12,38,'2015-04-18 08:55:24'),(34,12,16,'2015-04-18 08:55:31'),(35,12,15,'2015-04-18 08:55:34'),(36,12,28,'2015-04-18 08:55:35'),(40,12,25,'2015-04-18 08:58:36'),(41,12,35,'2015-04-18 09:25:13'),(42,12,37,'2015-04-18 09:25:17'),(46,12,44,'2015-04-18 09:25:48'),(49,10,38,'2015-04-18 11:15:34'),(66,22,35,'2015-04-20 10:20:21'),(69,22,31,'2015-04-20 10:21:00'),(90,10,7,'2015-04-21 09:55:21'),(92,10,35,'2015-04-21 09:56:38'),(123,45,35,'2015-05-04 14:36:08'),(127,53,35,'2015-05-18 09:51:08'),(128,53,40,'2015-05-18 09:51:10'),(129,58,1,'2015-05-26 07:29:08'),(131,10,2,'2015-05-26 07:46:50');
/*!40000 ALTER TABLE `meeting_user_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_user_ticket_ship`
--

DROP TABLE IF EXISTS `meeting_user_ticket_ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_user_ticket_ship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ticket_tpl_id` int(11) NOT NULL,
  `trade_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_exchange` tinyint(1) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `gender` smallint(6) NOT NULL,
  `city` varchar(128) DEFAULT NULL,
  `company` varchar(256) DEFAULT NULL,
  `position` varchar(128) DEFAULT NULL,
  `student_no` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `meeting_user_ticket_ship_6340c63c` (`user_id`),
  KEY `meeting_user_ticket_ship_c2d410e1` (`ticket_tpl_id`),
  KEY `meeting_user_ticket_ship_591ae0b5` (`trade_id`),
  KEY `meeting_user_ticket_ship_44625c0c` (`agent_id`),
  CONSTRAINT `agent_id_refs_id_c25b58d6` FOREIGN KEY (`agent_id`) REFERENCES `meeting_agent` (`id`),
  CONSTRAINT `ticket_tpl_id_refs_id_0db8ec07` FOREIGN KEY (`ticket_tpl_id`) REFERENCES `meeting_ticket_template` (`id`),
  CONSTRAINT `trade_id_refs_id_6d0f1bc8` FOREIGN KEY (`trade_id`) REFERENCES `order_trade` (`id`),
  CONSTRAINT `user_id_refs_id_43efa2f3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_user_ticket_ship`
--

LOCK TABLES `meeting_user_ticket_ship` WRITE;
/*!40000 ALTER TABLE `meeting_user_ticket_ship` DISABLE KEYS */;
INSERT INTO `meeting_user_ticket_ship` VALUES (9,'a000900aed',NULL,3,15,NULL,'2015-04-18 08:12:14',0,'','',1,'','','',''),(10,'00872c679e',1,1,17,NULL,'2015-04-18 08:25:31',0,'陈驰远','18614043303',0,'北京','青橙','无',''),(11,'a70a37e182',NULL,2,17,NULL,'2015-04-18 08:25:31',0,'','',1,'','','',''),(12,'935ab96259',3,1,19,NULL,'2015-04-18 08:52:20',0,'黄而慧','18601155940',0,'北京','青橙','',''),(13,'d5b7a4e991',NULL,2,23,NULL,'2015-04-18 11:05:17',0,'','',1,'','','',''),(14,'7b0d2decfe',NULL,2,23,NULL,'2015-04-18 11:05:17',0,'','',1,'','','',''),(15,'93cd4018b1',NULL,2,24,NULL,'2015-04-18 11:09:39',0,'','',1,'','','',''),(16,'2903b8d467',NULL,1,26,NULL,'2015-04-20 08:20:31',0,'','',1,'','','',''),(17,'06e75a1b03',NULL,2,29,NULL,'2015-04-20 09:43:10',0,'','',1,'','','',''),(19,'85d0e08e90',NULL,12,38,NULL,'2015-04-20 09:57:52',0,'','',1,'','','',''),(20,'314619528b',NULL,12,38,NULL,'2015-04-20 09:57:52',0,'','',1,'','','',''),(21,'f0c9651445',NULL,12,38,NULL,'2015-04-20 09:57:52',0,'','',1,'','','',''),(22,'efff59e152',6,12,39,NULL,'2015-04-20 09:58:23',0,'tuo','15313121715',1,'北京','','',''),(23,'517731b346',7,1,15,NULL,'2015-04-20 09:59:57',1,'','',1,'','','',''),(24,'f3bc98894d',NULL,12,41,NULL,'2015-04-20 10:00:37',0,'','',1,'','','',''),(29,'81c68cee17',NULL,1,46,NULL,'2015-04-20 10:41:21',0,'','',1,'','','',''),(32,'9a54971fef',NULL,2,51,NULL,'2015-04-20 11:06:42',0,'','',1,'','','',''),(33,'136f3f8700',NULL,5,52,NULL,'2015-04-20 11:09:34',0,'','',1,'','','',''),(34,'0d9773a5b9',NULL,5,52,NULL,'2015-04-20 11:09:34',0,'','',1,'','','',''),(35,'80b2eeded1',NULL,12,54,NULL,'2015-04-20 11:16:38',0,'','',1,'','','',''),(36,'1b2b3cd36b',NULL,1,22,NULL,'2015-04-20 11:26:10',0,'','',1,'','','',''),(37,'0119488e2c',8,1,58,NULL,'2015-04-21 07:40:01',0,'黄少天','18500151305',1,'帝都','蓝雨训练营','卖萌',''),(40,'db820d3094',NULL,1,66,NULL,'2015-04-22 02:54:56',0,'','',1,'','','',''),(41,'4b8e28441f',NULL,1,69,NULL,'2015-04-23 08:03:30',0,'','',1,'','','',''),(43,'992c3a3b8e',NULL,12,71,NULL,'2015-04-28 06:02:13',0,'','',1,'','','',''),(44,'4e2f9d629d',NULL,12,71,NULL,'2015-04-28 06:02:13',0,'','',1,'','','',''),(45,'d84902474b',10,1,73,NULL,'2015-05-04 14:35:06',0,'陈驰远测试','18672760731',0,'北京','青橙','xxxx',''),(46,'e070be5ff2',NULL,1,75,NULL,'2015-05-06 06:11:12',0,'','',1,'','','',''),(47,'0b2122fb83',NULL,1,76,NULL,'2015-05-06 06:16:42',0,'','',1,'','','',''),(48,'f475fcb4fc',NULL,1,78,NULL,'2015-05-06 06:25:12',0,'','',1,'','','',''),(49,'9ce65791b3',11,1,79,NULL,'2015-05-06 06:25:40',1,'许','18346552658',1,'合肥','合','小意思',''),(50,'a659da4b05',NULL,1,81,NULL,'2015-05-06 06:31:16',0,'','',1,'','','',''),(51,'d21b2e7c4c',NULL,1,82,1,'2015-05-06 06:44:10',0,'','',1,'','','',''),(52,'16321b3923',NULL,1,93,NULL,'2015-05-08 01:24:09',0,'','',1,'','','',''),(53,'2e7a0bdea7',12,14,109,NULL,'2015-05-18 09:49:30',0,'wx','15011056689',1,'','','',''),(54,'edaf980871',NULL,1,110,2,'2015-05-25 06:52:48',0,'','',1,'','','',''),(55,'238b3a56ad',NULL,1,110,2,'2015-05-25 06:52:48',0,'','',1,'','','',''),(56,'9278017de4',NULL,1,110,2,'2015-05-25 06:52:48',0,'','',1,'','','',''),(57,'ca319e99b5',NULL,1,112,2,'2015-05-26 06:47:59',0,'','',1,'','','',''),(58,'9e94e6d85b',NULL,1,114,2,'2015-05-26 07:09:03',0,'','',1,'','','',''),(59,'ab7c844429',NULL,1,115,2,'2015-05-26 08:06:52',0,'','',1,'','','','');
/*!40000 ALTER TABLE `meeting_user_ticket_ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_591ae0b5` (`trade_id`),
  KEY `order_product_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_b68ab139` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `trade_id_refs_id_32b683c3` FOREIGN KEY (`trade_id`) REFERENCES `order_trade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (19,15,'门票',3,1,'',16,3),(20,16,'门票',3,2,'',16,3),(21,17,'学员门票',0.15,1,'',16,1),(22,17,'非学员门票',0.18,1,'',16,2),(24,19,'学员门票',0.15,1,'',16,1),(25,20,'超值优惠价',300,1,'',16,5),(26,21,'超值优惠价',300,1,'',16,5),(27,22,'学员门票',0.15,1,'',16,1),(28,23,'非学员门票',0.18,2,'',16,2),(29,24,'非学员门票',0.18,1,'',16,2),(31,26,'学员门票',0.15,1,'',16,1),(32,27,'非学员门票',0.18,1,'',16,2),(34,29,'非学员门票',0.18,1,'',16,2),(35,30,'超值优惠价',300,1,'',16,5),(37,32,'非学员门票',0.18,1,'',16,2),(41,36,'非学员门票',0.18,1,'',16,2),(43,38,'免费票',0,3,'',16,12),(44,39,'免费票',0,1,'',16,12),(45,40,'非学员门票',0.18,1,'',16,2),(46,41,'免费票',0,1,'',16,12),(49,44,'门票',3,1,'',16,3),(51,46,'学员门票',0.15,1,'',16,1),(54,49,'非学员门票',0.18,3,'',16,2),(56,51,'非学员门票',0.18,1,'',16,2),(57,52,'超值优惠价',300,2,'',16,5),(58,53,'非学员门票',0.18,1,'',16,2),(59,54,'免费票',0,1,'',16,12),(60,55,'非学员门票',0.18,1,'',16,2),(61,56,'门票',3,1,'',16,3),(62,57,'非学员门票',0.18,2,'',16,2),(63,58,'学员门票',0.15,1,'',16,1),(64,59,'非学员门票',0.18,1,'',16,2),(65,60,'学员门票',0.15,1,'',16,1),(66,61,'学员门票',0.15,1,'',16,1),(67,62,'非学员门票',0.18,1,'',16,2),(71,66,'学员门票',0.15,1,'',16,1),(72,67,'学员门票',0.15,1,'',16,1),(73,67,'非学员门票',0.18,1,'',16,2),(74,68,'非学员门票',0.18,1,'',16,2),(75,69,'学员门票',0.15,1,'',16,1),(76,70,'学员门票',0.05,1,'',16,1),(77,71,'免费票',0,2,'',16,12),(79,73,'学员门票',0.01,1,'',16,1),(80,74,'学员门票',0.01,1,'',16,1),(81,75,'学员门票',0.01,1,'',16,1),(82,76,'学员门票',0.01,1,'',16,1),(83,77,'学员门票',0.01,1,'',16,1),(84,78,'学员门票',0.01,1,'',16,1),(85,79,'学员门票',0.01,1,'',16,1),(87,81,'学员门票',0.01,1,'',16,1),(88,82,'学员门票',0.01,1,'',16,1),(89,83,'学员门票',0.01,1,'',16,1),(90,84,'学员门票',0.01,3,'',16,1),(91,85,'学员通票',10,1,'',16,13),(92,86,'学员门票',0.01,1,'',16,1),(93,87,'非学员门票',0.18,1,'',16,2),(94,88,'学员门票',0.01,1,'',16,1),(95,89,'学员门票',0.01,2,'',16,1),(96,90,'学员门票',0.01,3,'',16,1),(97,91,'学员门票',0.01,1,'',16,1),(98,92,'学员门票',0.01,1,'',16,1),(99,93,'学员门票',0.01,1,'',16,1),(100,94,'非学员门票',0.18,1,'',16,2),(101,95,'学员门票',0.01,1,'',16,1),(102,95,'非学员门票',0.18,1,'',16,2),(103,96,'学员门票',0.01,1,'',16,1),(104,97,'学员门票',0.01,1,'',16,1),(105,98,'学员门票',0.01,1,'',16,1),(108,101,'学员门票',0.01,1,'',16,1),(110,103,'学员门票',0.01,1,'',16,1),(113,106,'非学员门票',0.18,1,'',16,2),(114,107,'学员通票',10,1,'',16,13),(115,108,'学员通票',10,1,'',16,13),(116,109,'测试票',0.01,1,'',16,14),(117,110,'学员门票',0.01,3,'',16,1),(118,111,'测试票',0.01,1,'',16,14),(119,112,'学员门票',0.01,1,'',16,1),(120,113,'学员门票',0.01,1,'',16,1),(121,114,'学员门票',0.01,1,'',16,1),(122,115,'学员门票',0.01,1,'',16,1);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_trade`
--

DROP TABLE IF EXISTS `order_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `out_trade_no` varchar(128) DEFAULT NULL,
  `channel` smallint(6) NOT NULL,
  `client_ip` varchar(64) DEFAULT NULL,
  `currency` varchar(24) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `body` varchar(2048) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `transaction_no` varchar(64) DEFAULT NULL,
  `pay_success_url` varchar(1024) DEFAULT NULL,
  `pay_fail_url` varchar(1024) DEFAULT NULL,
  `purchaser_url` varchar(1024) DEFAULT NULL,
  `remarks` varchar(2048) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `extra` longtext,
  `certificate` varchar(1024) DEFAULT NULL,
  `received` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_trade_6340c63c` (`user_id`),
  KEY `order_trade_0c98d849` (`created_by_id`),
  CONSTRAINT `created_by_id_refs_id_5fc74eff` FOREIGN KEY (`created_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_id_refs_id_5fc74eff` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_trade`
--

LOCK TABLES `order_trade` WRITE;
/*!40000 ALTER TABLE `order_trade` DISABLE KEYS */;
INSERT INTO `order_trade` VALUES (15,3,2,'mm77648053',2,'','CNY','商品购买','',3,'1007440094201504180073140279','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','http://www.qingchengfit.cn/payments/settlement/?payment_id=47','','2015-04-18 08:04:07',NULL,'{}','',0),(16,3,1,'mm53898493',0,'','CNY','','',0,'','','','','','2015-04-18 08:05:46',NULL,'{}','',0),(17,1,2,'mm59099902',2,'','CNY','商品购买','',0.33,'1002170094201504180073214518','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','http://www.qingchengfit.cn/payments/settlement/?payment_id=48','','2015-04-18 08:20:05',NULL,'{}','',0),(19,3,2,'mm31527499',2,'','CNY','商品购买','',0.15,'1007440094201504180073288424','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','http://www.qingchengfit.cn/payments/settlement/?payment_id=49','','2015-04-18 08:51:48',NULL,'{}','',0),(20,3,1,'mm58368908',0,'','CNY','','',0,'','','','','','2015-04-18 09:41:55',NULL,'{}','',0),(21,3,1,'mm19998109',0,'','CNY','','',0,'','','','','','2015-04-18 09:42:12',NULL,'{}','',0),(22,1,2,'mm43918600',2,'','CNY','商品购买','',0.15,'1002170094201504200077767038','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://www.qingchengfit.cn/payments/settlement/?payment_id=102','','2015-04-18 09:49:53',NULL,'{}','http://zoneke-img.b0.upaiyun.com/ac68490dd3609d77b0ad628eddabb9b4.jpg',0),(23,1,2,'mm84976150',2,'','CNY','商品购买','',0.36,'1002170094201504180073585493','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','http://www.qingchengfit.cn/payments/settlement/?payment_id=55','','2015-04-18 11:04:56',NULL,'{}','',0),(24,1,2,'mm84706921',2,'','CNY','商品购买','',0.18,'1002170094201504180073591364','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','http://www.qingchengfit.cn/payments/settlement/?payment_id=57','','2015-04-18 11:09:29',NULL,'{}','',0),(26,1,2,'mm08280443',2,'','CNY','商品购买','',0.15,'1002170094201504200077353682','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','http://www.qingchengfit.cn/payments/settlement/?payment_id=94','','2015-04-20 08:20:22',NULL,'{}','',0),(27,1,1,'mm85298293',5,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-04-20 09:28:58',NULL,'{}','',0),(29,3,2,'mm20887687',5,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','','','2015-04-20 09:31:05',NULL,'{}','http://zoneke-img.b0.upaiyun.com/0d6c03d19b8904ada57f7c7796a2a995.jpg',0),(30,3,1,'mm86592740',2,'','CNY','商品购买','',300,'','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','http://www.qingchengfit.cn/payments/settlement/?payment_id=96','','2015-04-20 09:38:49',NULL,'{}','',0),(32,2,4,'mm91427612',5,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-04-20 09:43:35',NULL,'{}','http://zoneke-img.b0.upaiyun.com/49adcfef40916a89b3595d0affe9682d.jpg',0),(36,3,1,'mm54586762',5,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','','','2015-04-20 09:52:17',NULL,'{}','',0),(38,6,2,'mm50793724',2,'','CNY','商品购买','',0,'','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','','','2015-04-20 09:57:49',NULL,'{}','',0),(39,6,2,'mm07654435',5,'','CNY','商品购买','',0,'','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','','','2015-04-20 09:58:14',NULL,'{}','',0),(40,3,1,'mm01678247',0,'','CNY','','',0,'','','','','','2015-04-20 10:00:18',NULL,'{}','',0),(41,3,2,'mm10879061',5,'','CNY','商品购买','',0,'','http://mm.qingchengfit.cn/meetings/1/','http://mm.qingchengfit.cn/meetings/1/','','','2015-04-20 10:00:34',NULL,'{}','',0),(44,6,1,'mm97223894',5,'','CNY','商品购买','',3,'','http://mm.qingchengfit.cn/meetings/3/#/tickets','http://mm.qingchengfit.cn/meetings/3/#/tickets','','','2015-04-20 10:23:24',NULL,'{}','',0),(46,6,2,'mm13414171',5,'','CNY','商品购买','',0.15,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-04-20 10:28:29',1,'{}','http://zoneke-img.b0.upaiyun.com/6c3f67724af5ef8f714c6a6fcd1d96e0.jpg',0),(49,7,4,'mm06478048',5,'','CNY','商品购买','',0.54,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-04-20 10:48:06',NULL,'{}','http://zoneke-img.b0.upaiyun.com/d874eb395d9099d685fb6953de04d430.jpg',0),(51,3,2,'mm05019115',5,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-04-20 11:04:27',1,'{}','http://zoneke-img.b0.upaiyun.com/11e66f941bc505899378a523a9eb2986.jpg',0),(52,6,2,'mm68669095',5,'','CNY','商品购买','',600,'','http://mm.qingchengfit.cn/meetings/4/#/tickets','http://mm.qingchengfit.cn/meetings/4/#/tickets','','','2015-04-20 11:07:26',1,'{}','http://zoneke-img.b0.upaiyun.com/afe6df4c4775c5d8d0d2e4e4558175ea.jpg',0),(53,3,1,'mm48829398',5,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-04-20 11:15:41',NULL,'{}','',0),(54,3,2,'mm55293010',2,'','CNY','商品购买','',0,'','http://mm.qingchengfit.cn/meetings/2/#/tickets','http://mm.qingchengfit.cn/meetings/2/#/tickets','','','2015-04-20 11:16:37',NULL,'{}','',0),(55,3,1,'mm05299786',0,'','CNY','','',0,'','','','','','2015-04-20 11:19:12',NULL,'{}','',0),(56,3,1,'mm49359883',5,'','CNY','商品购买','',3,'','http://mm.qingchengfit.cn/meetings/3/#/tickets','http://mm.qingchengfit.cn/meetings/3/#/tickets','','','2015-04-20 11:25:37',NULL,'{}','',0),(57,6,4,'mm25006110',5,'','CNY','商品购买','',0.36,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-04-21 03:56:31',NULL,'{}','http://zoneke-img.b0.upaiyun.com/9423e6ca368ec2f99455a97ec9ab358c.jpg',0),(58,7,2,'mm22450921',2,'','CNY','商品购买','',0.15,'1008960094201504210079541250','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://www.qingchengfit.cn/payments/settlement/?payment_id=116','','2015-04-21 07:39:43',NULL,'{}','',0),(59,7,4,'mm59313696',5,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-04-21 07:40:57',NULL,'{}','http://zoneke-img.b0.upaiyun.com/33f73fe2fab1c7979caa0023b1ccdb54.jpg',0),(60,6,4,'mm23837671',5,'','CNY','商品购买','',0.15,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-04-21 07:41:54',NULL,'{}','http://zoneke-img.b0.upaiyun.com/14f0be9e62370c16227decd9b2d6b460.jpg',0),(61,3,1,'mm76363664',0,'','CNY','','',0,'','','','','','2015-04-21 07:54:00',NULL,'{}','',0),(62,1,1,'mm52828040',2,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://www.qingchengfit.cn/payments/settlement/?payment_id=147','','2015-04-21 08:30:39',NULL,'{}','',0),(66,1,2,'mm01841713',2,'','CNY','商品购买','',0.15,'1002170094201504220081138140','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://www.qingchengfit.cn/payments/settlement/?payment_id=128','','2015-04-22 02:54:44',NULL,'{}','',0),(67,3,1,'mm88707993',0,'','CNY','','',0,'','','','','','2015-04-22 05:43:03',NULL,'{}','',0),(68,3,1,'mm99051638',5,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-04-22 05:43:12',NULL,'{}','',0),(69,1,2,'mm74565137',2,'','CNY','商品购买','',0.15,'1002170122201504230084202534','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=2','','2015-04-23 07:32:25',NULL,'{}',NULL,0),(70,1,2,'mm28661874',2,'','CNY','商品购买','',0.05,'1002170122201504230084525875','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=10','','2015-04-23 10:21:36',NULL,'{}','',0),(71,7,2,'mm53196651',2,'','CNY','商品购买','',0,'','http://mm.qingchengfit.cn/meetings/2/#/tickets','http://mm.qingchengfit.cn/meetings/2/#/tickets','','','2015-04-28 06:02:11',NULL,'{}','',0),(73,10,2,'mm04999188',5,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-05-04 14:34:31',1,'{}','http://zoneke-img.b0.upaiyun.com/5d2d86af105859e148e17f67f607d526.jpg',0),(74,1,1,'mm85315957',2,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=58','','2015-05-06 06:01:09',NULL,'{}','',0),(75,1,2,'mm75636537',2,'','CNY','商品购买','',0.01,'1001240122201505060112252234','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=59','','2015-05-06 06:10:28',NULL,'{}','',0),(76,1,2,'mm35917985',2,'','CNY','商品购买','',0.01,'1001240122201505060112255043','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=60','','2015-05-06 06:15:39',NULL,'{}','',0),(77,1,1,'mm83191367',2,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=61','','2015-05-06 06:20:37',NULL,'{}','',0),(78,1,2,'mm50736626',2,'','CNY','商品购买','',0.01,'1001240122201505060112265517','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=62','','2015-05-06 06:24:47',NULL,'{}','',0),(79,11,2,'mm80269478',2,'','CNY','商品购买','',0.01,'1001240122201505060112276038','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=63','','2015-05-06 06:25:28',NULL,'{}','',0),(81,1,2,'mm66270919',2,'','CNY','商品购买','',0.01,'1001240122201505060112272549','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=64','','2015-05-06 06:30:49',NULL,'{}','',0),(82,10,2,'mm37642940',2,'','CNY','商品购买','',0.01,'1002170122201505060112303098','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=65','','2015-05-06 06:44:01',NULL,'{}','',0),(83,1,1,'mm68880212',5,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-05-06 06:46:35',NULL,'{}','',0),(84,1,1,'mm08373897',5,'','CNY','','',0,'','','','','','2015-05-07 07:40:55',NULL,'{}','',0),(85,1,1,'mm04817280',5,'','CNY','','',0,'','','','','','2015-05-07 08:28:27',NULL,'{}','',0),(86,1,1,'mm73186748',2,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=67','','2015-05-07 08:30:08',NULL,'{}','',0),(87,1,1,'mm90763295',2,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=69','','2015-05-07 10:59:19',NULL,'{}','',0),(88,1,1,'mm83995837',5,'','CNY','','',0,'','','','','','2015-05-07 13:00:04',NULL,'{}','',0),(89,1,1,'mm90680309',2,'','CNY','商品购买','',0.02,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=70','','2015-05-07 13:00:29',NULL,'{}','',0),(90,1,1,'mm93644380',2,'','CNY','商品购买','',0.03,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=71','','2015-05-07 13:25:28',NULL,'{}','',0),(91,1,1,'mm98633698',5,'','CNY','','',0,'','','','','','2015-05-08 00:49:04',NULL,'{}','',0),(92,1,1,'mm25346792',5,'','CNY','','',0,'','','','','','2015-05-08 00:51:33',NULL,'{}','',0),(93,1,2,'mm61572456',2,'','CNY','商品购买','',0.01,'1001240122201505080115879302','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=72','','2015-05-08 01:04:45',NULL,'{}','',0),(94,1,1,'mm20095101',5,'','CNY','','',0,'','','','','','2015-05-08 01:51:52',NULL,'{}','',0),(95,1,1,'mm90665161',5,'','CNY','','',0,'','','','','','2015-05-08 01:56:06',NULL,'{}','',0),(96,1,1,'mm82517421',2,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=73','','2015-05-08 02:00:38',NULL,'{}','',0),(97,1,1,'mm12297754',5,'','CNY','','',0,'','','','','','2015-05-08 02:01:10',NULL,'{}','',0),(98,1,1,'mm97492900',5,'','CNY','','',0,'','','','','','2015-05-08 02:11:48',NULL,'{}','',0),(101,1,1,'mm00983134',2,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=74','','2015-05-08 02:22:32',NULL,'{}','',0),(103,11,1,'mm58171543',5,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=75','','2015-05-08 04:43:49',NULL,'{}','',0),(106,1,2,'mm22406418',5,'','CNY','商品购买','',0.18,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-05-08 05:34:18',NULL,'{}','http://zoneke-img.b0.upaiyun.com/4d37466f84788d5855610b6c8ab19817.jpg',0),(107,1,1,'mm33072514',5,'','CNY','商品购买','',10,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-05-08 05:39:11',NULL,'{}','',0),(108,12,1,'mm26954879',2,'','CNY','商品购买','',10,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=83','','2015-05-18 09:40:49',NULL,'{}','',0),(109,12,2,'mm23140370',5,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=84','','2015-05-18 09:41:57',1,'{}','http://zoneke-img.b0.upaiyun.com/af0ec28272316d9f1e20227904704707.jpg',0),(110,1,2,'mm02634596',5,'','CNY','商品购买','',0.03,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-05-25 06:52:21',1,'{}','',0),(111,5,1,'mm74871913',5,'','CNY','','',0,'','','','','','2015-05-26 01:39:24',NULL,'{}','',0),(112,10,2,'mm33271292',2,'','CNY','商品购买','',0.01,'1002170122201505260167800861','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=88','','2015-05-26 06:47:47',NULL,'{}','',0),(113,1,1,'mm42832630',2,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=89','','2015-05-26 06:52:47',NULL,'{}','',0),(114,1,2,'mm12172085',5,'','CNY','商品购买','',0.01,'','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','','','2015-05-26 07:08:31',1,'{}','',0),(115,10,2,'mm89270735',2,'','CNY','商品购买','',0.01,'1002170122201505260168049566','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://mm.qingchengfit.cn/meetings/1/#/tickets','http://teacher.qingchengfit.cn/payments/settlement/?payment_id=90','','2015-05-26 08:06:38',NULL,'{}','',0);
/*!40000 ALTER TABLE `order_trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_trade_log`
--

DROP TABLE IF EXISTS `order_trade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_trade_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `content` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_trade_log_591ae0b5` (`trade_id`),
  CONSTRAINT `trade_id_refs_id_52374c22` FOREIGN KEY (`trade_id`) REFERENCES `order_trade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_trade_log`
--

LOCK TABLES `order_trade_log` WRITE;
/*!40000 ALTER TABLE `order_trade_log` DISABLE KEYS */;
INSERT INTO `order_trade_log` VALUES (15,15,'2015-04-18 08:12:14','<xml><appid><![CDATA[wxc6a77068671948fa]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[300]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1229776802]]></mch_id>\n<nonce_str><![CDATA[SooBYudyZwwkyaS]]></nonce_str>\n<openid><![CDATA[op3Tjs3oy6ezVFRCCoNdOUysk7sg]]></openid>\n<out_trade_no><![CDATA[mm77648053]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[EAD555835D524A47EBD0E41B72A097F1]]></sign>\n<time_end><![CDATA[20150418161213]]></time_end>\n<total_fee>300</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1007440094201504180073140279]]></transaction_id>\n</xml>'),(16,17,'2015-04-18 08:25:31','<xml><appid><![CDATA[wxc6a77068671948fa]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[33]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1229776802]]></mch_id>\n<nonce_str><![CDATA[xhL77VndxZACvVM]]></nonce_str>\n<openid><![CDATA[op3Tjs5-Amn_uvWOnXMCJctWGp-E]]></openid>\n<out_trade_no><![CDATA[mm59099902]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[601ABA80CC748D78B2E2C01AC36D2D4D]]></sign>\n<time_end><![CDATA[20150418162529]]></time_end>\n<total_fee>33</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170094201504180073214518]]></transaction_id>\n</xml>'),(17,19,'2015-04-18 08:52:20','<xml><appid><![CDATA[wxc6a77068671948fa]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[15]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1229776802]]></mch_id>\n<nonce_str><![CDATA[eqrZBANcmvdRQzL]]></nonce_str>\n<openid><![CDATA[op3Tjs3oy6ezVFRCCoNdOUysk7sg]]></openid>\n<out_trade_no><![CDATA[mm31527499]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[21E3688EEB76F31E5C1A3A97169AF572]]></sign>\n<time_end><![CDATA[20150418165219]]></time_end>\n<total_fee>15</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1007440094201504180073288424]]></transaction_id>\n</xml>'),(18,23,'2015-04-18 11:05:17','<xml><appid><![CDATA[wxc6a77068671948fa]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[36]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1229776802]]></mch_id>\n<nonce_str><![CDATA[9ESMW8agmqCCXQu]]></nonce_str>\n<openid><![CDATA[op3Tjs5-Amn_uvWOnXMCJctWGp-E]]></openid>\n<out_trade_no><![CDATA[mm84976150]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[6BE92BD57A215A26C1B3B9B39F9DEFB4]]></sign>\n<time_end><![CDATA[20150418190517]]></time_end>\n<total_fee>36</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170094201504180073585493]]></transaction_id>\n</xml>'),(19,24,'2015-04-18 11:09:39','<xml><appid><![CDATA[wxc6a77068671948fa]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[18]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1229776802]]></mch_id>\n<nonce_str><![CDATA[UDGplt98RLxuXfl]]></nonce_str>\n<openid><![CDATA[op3Tjs5-Amn_uvWOnXMCJctWGp-E]]></openid>\n<out_trade_no><![CDATA[mm84706921]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[95BC5C126175DD04F7FF468D77D82DF9]]></sign>\n<time_end><![CDATA[20150418190938]]></time_end>\n<total_fee>18</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170094201504180073591364]]></transaction_id>\n</xml>'),(20,26,'2015-04-20 08:20:30','<xml><appid><![CDATA[wxc6a77068671948fa]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[15]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1229776802]]></mch_id>\n<nonce_str><![CDATA[le86kMwy1VnvYOK]]></nonce_str>\n<openid><![CDATA[op3Tjs5-Amn_uvWOnXMCJctWGp-E]]></openid>\n<out_trade_no><![CDATA[mm08280443]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[A61D62D15B79823C8A5E28AFA3CDC9F5]]></sign>\n<time_end><![CDATA[20150420162030]]></time_end>\n<total_fee>15</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170094201504200077353682]]></transaction_id>\n</xml>'),(23,22,'2015-04-20 11:26:10','<xml><appid><![CDATA[wxc6a77068671948fa]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[15]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1229776802]]></mch_id>\n<nonce_str><![CDATA[ZLRxvOiqkK6dq5N]]></nonce_str>\n<openid><![CDATA[op3Tjs5-Amn_uvWOnXMCJctWGp-E]]></openid>\n<out_trade_no><![CDATA[mm43918600]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[4FFC576D11F901E8365BB44DA7503819]]></sign>\n<time_end><![CDATA[20150420192609]]></time_end>\n<total_fee>15</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170094201504200077767038]]></transaction_id>\n</xml>'),(24,58,'2015-04-21 07:40:01','<xml><appid><![CDATA[wxc6a77068671948fa]]></appid>\n<bank_type><![CDATA[COMM_DEBIT]]></bank_type>\n<cash_fee><![CDATA[15]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1229776802]]></mch_id>\n<nonce_str><![CDATA[ba8uURhftlH2Dzm]]></nonce_str>\n<openid><![CDATA[op3Tjs1ozvudyaLN9VJUNq7qQt80]]></openid>\n<out_trade_no><![CDATA[mm22450921]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[6EA439BE24C047C378AB8409F20F42A0]]></sign>\n<time_end><![CDATA[20150421153959]]></time_end>\n<total_fee>15</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1008960094201504210079541250]]></transaction_id>\n</xml>'),(26,66,'2015-04-22 02:54:56','<xml><appid><![CDATA[wxc6a77068671948fa]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[15]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1229776802]]></mch_id>\n<nonce_str><![CDATA[pLHXLZxIMCukrxM]]></nonce_str>\n<openid><![CDATA[op3Tjs5-Amn_uvWOnXMCJctWGp-E]]></openid>\n<out_trade_no><![CDATA[mm01841713]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[B08371558AFCFECC0A1D461065604EAE]]></sign>\n<time_end><![CDATA[20150422105455]]></time_end>\n<total_fee>15</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170094201504220081138140]]></transaction_id>\n</xml>'),(27,69,'2015-04-23 08:03:30','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[15]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[cK8KvNZfINEfpjF]]></nonce_str>\n<openid><![CDATA[oYheos3gzXzcQ2I9kcRDiGpw-V74]]></openid>\n<out_trade_no><![CDATA[mm74565137]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[20A634E2F0F10E2A0454CA2AC57021EB]]></sign>\n<time_end><![CDATA[20150423160330]]></time_end>\n<total_fee>15</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170122201504230084202534]]></transaction_id>\n</xml>'),(28,70,'2015-04-23 10:21:55','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[5]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[vlbjY5l9VSAhoU8]]></nonce_str>\n<openid><![CDATA[oYheos3gzXzcQ2I9kcRDiGpw-V74]]></openid>\n<out_trade_no><![CDATA[mm28661874]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[3DE1BE8439F7BA3E5DE48EB346766163]]></sign>\n<time_end><![CDATA[20150423182154]]></time_end>\n<total_fee>5</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170122201504230084525875]]></transaction_id>\n</xml>'),(29,75,'2015-05-06 06:11:12','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[1]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[PfsETjzsO9nvle0]]></nonce_str>\n<openid><![CDATA[oYheos4misMI9KCvfVKlmdfwU-_g]]></openid>\n<out_trade_no><![CDATA[mm75636537]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[CF5487B54A29B042BE1676A7F4E5DBDA]]></sign>\n<time_end><![CDATA[20150506141111]]></time_end>\n<total_fee>1</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1001240122201505060112252234]]></transaction_id>\n</xml>'),(30,76,'2015-05-06 06:16:42','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[1]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[Ll5MD3wkDjwvvIS]]></nonce_str>\n<openid><![CDATA[oYheos4misMI9KCvfVKlmdfwU-_g]]></openid>\n<out_trade_no><![CDATA[mm35917985]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[E99C869A26096FB9BB2697A382B9B7F5]]></sign>\n<time_end><![CDATA[20150506141641]]></time_end>\n<total_fee>1</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1001240122201505060112255043]]></transaction_id>\n</xml>'),(31,78,'2015-05-06 06:25:12','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[1]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[eR5QfQprFGxXHHp]]></nonce_str>\n<openid><![CDATA[oYheos4misMI9KCvfVKlmdfwU-_g]]></openid>\n<out_trade_no><![CDATA[mm50736626]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[8426AED28E06877C66F6B16C799244C1]]></sign>\n<time_end><![CDATA[20150506142510]]></time_end>\n<total_fee>1</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1001240122201505060112265517]]></transaction_id>\n</xml>'),(32,79,'2015-05-06 06:25:40','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[1]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[r4TunIxDXS46iOB]]></nonce_str>\n<openid><![CDATA[oYheos4misMI9KCvfVKlmdfwU-_g]]></openid>\n<out_trade_no><![CDATA[mm80269478]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[5D6078A6FD16FAD7E7E21B481E5D9DA6]]></sign>\n<time_end><![CDATA[20150506142539]]></time_end>\n<total_fee>1</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1001240122201505060112276038]]></transaction_id>\n</xml>'),(33,81,'2015-05-06 06:31:16','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[1]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[ZNMxX7gXd0h79gX]]></nonce_str>\n<openid><![CDATA[oYheos4misMI9KCvfVKlmdfwU-_g]]></openid>\n<out_trade_no><![CDATA[mm66270919]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[C99D40F7EECBD3288D1F976809EEA02F]]></sign>\n<time_end><![CDATA[20150506143116]]></time_end>\n<total_fee>1</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1001240122201505060112272549]]></transaction_id>\n</xml>'),(34,82,'2015-05-06 06:44:10','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[1]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[Rk27VTGZNp1D78x]]></nonce_str>\n<openid><![CDATA[oYheos3gzXzcQ2I9kcRDiGpw-V74]]></openid>\n<out_trade_no><![CDATA[mm37642940]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[88E662F9012C9DB5DBA497EA683C82A7]]></sign>\n<time_end><![CDATA[20150506144409]]></time_end>\n<total_fee>1</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170122201505060112303098]]></transaction_id>\n</xml>'),(35,93,'2015-05-08 01:24:09','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[1]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[tUO40ScZmxLRl98]]></nonce_str>\n<openid><![CDATA[oYheos4misMI9KCvfVKlmdfwU-_g]]></openid>\n<out_trade_no><![CDATA[mm61572456]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[884E778A0452CD149842376334842FD5]]></sign>\n<time_end><![CDATA[20150508092409]]></time_end>\n<total_fee>1</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1001240122201505080115879302]]></transaction_id>\n</xml>'),(36,112,'2015-05-26 06:47:59','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[1]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[ICTRnddH70viseM]]></nonce_str>\n<openid><![CDATA[oYheos3gzXzcQ2I9kcRDiGpw-V74]]></openid>\n<out_trade_no><![CDATA[mm33271292]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[1C9A82F6740C8F8A39440C3F260F5324]]></sign>\n<time_end><![CDATA[20150526144757]]></time_end>\n<total_fee>1</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170122201505260167800861]]></transaction_id>\n</xml>'),(37,115,'2015-05-26 08:06:52','<xml><appid><![CDATA[wxed9674b51457274a]]></appid>\n<bank_type><![CDATA[CFT]]></bank_type>\n<cash_fee><![CDATA[1]]></cash_fee>\n<fee_type><![CDATA[CNY]]></fee_type>\n<is_subscribe><![CDATA[Y]]></is_subscribe>\n<mch_id><![CDATA[1234757402]]></mch_id>\n<nonce_str><![CDATA[HnucpTVSjpfOhSz]]></nonce_str>\n<openid><![CDATA[oYheos3gzXzcQ2I9kcRDiGpw-V74]]></openid>\n<out_trade_no><![CDATA[mm89270735]]></out_trade_no>\n<result_code><![CDATA[SUCCESS]]></result_code>\n<return_code><![CDATA[SUCCESS]]></return_code>\n<sign><![CDATA[698218DDAB91B96D37D3E8A6C2103B13]]></sign>\n<time_end><![CDATA[20150526160651]]></time_end>\n<total_fee>1</total_fee>\n<trade_type><![CDATA[JSAPI]]></trade_type>\n<transaction_id><![CDATA[1002170122201505260168049566]]></transaction_id>\n</xml>');
/*!40000 ALTER TABLE `order_trade_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_wechat_payment`
--

DROP TABLE IF EXISTS `payment_wechat_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_wechat_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `out_trade_no` varchar(128) DEFAULT NULL,
  `notify_url` varchar(1024) DEFAULT NULL,
  `pay_success_url` varchar(1024) DEFAULT NULL,
  `pay_fail_url` varchar(1024) DEFAULT NULL,
  `prepay_id` varchar(128) DEFAULT NULL,
  `body` varchar(1024) DEFAULT NULL,
  `detail` varchar(8192) DEFAULT NULL,
  `total_fee` int(10) unsigned DEFAULT NULL,
  `json_data` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `extra` longtext NOT NULL,
  `response` varchar(8192) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_wechat_payment_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_03bc9c22` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_wechat_payment`
--

LOCK TABLES `payment_wechat_payment` WRITE;
/*!40000 ALTER TABLE `payment_wechat_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_wechat_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_setting`
--

DROP TABLE IF EXISTS `server_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(2048) DEFAULT NULL,
  `support_wechat_pay` tinyint(1) NOT NULL,
  `support_transfer_pay` tinyint(1) NOT NULL,
  `weixin_api_url` varchar(128) DEFAULT NULL,
  `sms_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_setting`
--

LOCK TABLES `server_setting` WRITE;
/*!40000 ALTER TABLE `server_setting` DISABLE KEYS */;
INSERT INTO `server_setting` VALUES (1,'/static/meeting_v1/css/index.base.css',1,1,'http://teacher.qingchengfit.cn/payments/',1);
/*!40000 ALTER TABLE `server_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (33,'users','0001_initial','2015-05-28 11:28:25'),(34,'users','0002_auto__add_field_user_student_no','2015-05-28 11:28:25'),(35,'weixin','0001_initial','2015-05-28 11:28:25'),(36,'weixin','0002_auto__add_weixinusertoken__add_field_app_mch_id__add_field_app_mch_sec','2015-05-28 11:28:25'),(37,'weixin','0003_auto__del_weixinusertoken__del_field_app_mch_secret__del_field_app_tok','2015-05-28 11:28:25'),(38,'weixin','0004_auto__add_weixinusertoken__add_field_app_mch_id__add_field_app_mch_sec','2015-05-28 11:28:25'),(39,'weixin','0005_auto__chg_field_weixinusertoken_user','2015-05-28 11:28:25'),(40,'weixin','0006_auto__del_weixinusertoken__del_field_app_mch_secret__del_field_app_tok','2015-05-28 11:28:25'),(41,'weixin','0007_auto__add_weixinusertoken__add_field_app_mch_id__add_field_app_mch_sec','2015-05-28 11:28:25'),(42,'weixin','0008_auto__del_weixinusertoken__del_field_app_mch_secret__del_field_app_tok','2015-05-28 11:28:25'),(43,'weixin','0009_auto__add_weixinusertoken__add_field_app_mch_id__add_field_app_mch_sec','2015-05-28 11:28:25'),(44,'base','0001_initial','2015-05-28 11:28:25'),(45,'base','0002_auto__del_errorlog','2015-05-28 11:28:25'),(46,'base','0003_auto__add_errorlog','2015-05-28 11:28:25'),(47,'base','0004_auto__add_serversetting','2015-05-28 11:28:25'),(48,'base','0005_auto__add_field_serversetting_support_wechat_pay__add_field_serversett','2015-05-28 11:28:25'),(49,'base','0006_auto__add_field_serversetting_weixin_api_url__add_field_serversetting_','2015-05-28 11:28:25'),(50,'base','0007_auto__del_field_serversetting_sms_enable','2015-05-28 11:28:25'),(51,'base','0008_auto__add_field_serversetting_sms_enable','2015-05-28 11:28:25'),(52,'meeting','0001_initial','2015-05-28 11:28:25'),(53,'meeting','0002_auto__chg_field_ticket_user','2015-05-28 11:28:25'),(54,'meeting','0003_auto__add_printersetting__add_systemsetting__add_checkinsetting','2015-05-28 11:28:25'),(55,'meeting','0004_auto__add_field_meeting_created_at','2015-05-28 11:28:25'),(56,'meeting','0005_auto__add_field_meeting_image','2015-05-28 11:28:25'),(57,'meeting','0006_auto__chg_field_tickettemplate_remarks','2015-05-28 11:28:25'),(58,'meeting','0007_auto__add_unique_userschedule_ticket_schedule__add_field_schedule_curr','2015-05-28 11:28:25'),(59,'meeting','0008_auto__add_meetingtradeship','2015-05-28 11:28:25'),(60,'meeting','0009_auto__del_field_schedule_need_sign_up','2015-05-28 11:28:25'),(61,'meeting','0010_auto__add_field_schedule_need_sign_up','2015-05-28 11:28:25'),(62,'meeting','0011_auto__del_field_schedule_need_sign_up','2015-05-28 11:28:25'),(63,'meeting','0012_auto__add_field_schedule_need_sign_up','2015-05-28 11:28:25'),(64,'meeting','0013_auto__del_field_schedule_current_sign_up','2015-05-28 11:28:25'),(65,'meeting','0014_auto__add_field_schedule_current_sign_up','2015-05-28 11:28:25'),(66,'meeting','0015_auto__add_field_meeting_map_url','2015-05-28 11:28:25'),(67,'meeting','0016_auto__chg_field_meeting_description__add_field_ticket_student_no','2015-05-28 11:28:25'),(68,'meeting','0017_auto__del_field_ticket_student_no','2015-05-28 11:28:25'),(69,'meeting','0018_auto__add_field_ticket_student_no','2015-05-28 11:28:25'),(70,'meeting','0019_auto__add_printtemplate__add_field_meeting_print_tpl__add_field_ticket','2015-05-28 11:28:25'),(71,'meeting','0020_auto__del_printtemplate__del_field_meeting_print_tpl__del_field_ticket','2015-05-28 11:28:25'),(72,'meeting','0021_auto__add_printtemplate__add_field_meeting_print_tpl__add_field_ticket','2015-05-28 11:28:25'),(73,'meeting','0022_auto__del_printtemplate__del_field_meeting_print_tpl__del_field_ticket','2015-05-28 11:28:25'),(74,'meeting','0023_auto__add_meetingtemplateship__add_printtemplate__add_field_meeting_pr','2015-05-28 11:28:25'),(75,'meeting','0024_auto__del_meetingtemplateship__del_printtemplate__del_field_meeting_pr','2015-05-28 11:28:25'),(76,'meeting','0025_auto__add_meetingtemplateship__add_printtemplate__add_field_meeting_pr','2015-05-28 11:28:25'),(77,'meeting','0026_auto__del_meetingtemplateship','2015-05-28 11:28:25'),(78,'meeting','0027_auto__del_field_printersetting_print_label__del_field_printersetting_p','2015-05-28 11:28:25'),(79,'meeting','0028_auto__add_field_printersetting_meeting','2015-05-28 11:28:25'),(80,'meeting','0029_auto__add_ticketcheckinhistory','2015-05-28 11:28:25'),(81,'meeting','0030_auto__del_ticketcheckinhistory','2015-05-28 11:28:25'),(82,'meeting','0031_auto__add_ticketcheckinhistory','2015-05-28 11:28:25'),(83,'meeting','0032_auto__del_field_ticket_check_in_by__del_field_ticket_is_check_in__del_','2015-05-28 11:28:25'),(84,'meeting','0033_auto__del_field_meeting_print_tpl','2015-05-28 11:28:25'),(85,'meeting','0034_auto__add_field_meeting_print_tpl','2015-05-28 11:28:25'),(86,'meeting','0035_auto__del_field_schedule_current_sign_up__add_field_schedule_can_sign_','2015-05-28 11:28:25'),(87,'order','0001_initial','2015-05-28 11:28:25'),(88,'order','0002_auto__add_field_trade_amount__chg_field_trade_extra','2015-05-28 11:28:25'),(89,'order','0003_auto__add_field_trade_certificate','2015-05-28 11:28:25'),(90,'order','0004_auto__del_field_trade_certificate','2015-05-28 11:28:25'),(91,'order','0005_auto__add_field_trade_certificate','2015-05-28 11:28:25'),(92,'order','0006_auto__add_field_trade_received','2015-05-28 11:28:25'),(93,'payment','0001_initial','2015-05-28 11:28:25'),(94,'django_extensions','0001_empty','2015-05-28 11:28:25'),(95,'meeting','0036_auto__del_field_schedule_can_sign_up','2015-05-28 11:28:38'),(96,'meeting','0037_auto__add_field_schedule_can_sign_up','2015-05-28 11:28:49'),(97,'meeting','0038_auto__del_ticketcheckinhistory__del_printtemplate__add_meetingsurvey__','2015-05-29 06:07:05'),(98,'meeting','0039_auto__add_ticketcheckinhistory__add_printtemplate__add_field_meeting_p','2015-05-29 06:33:51'),(99,'meeting','0040_auto__add_usercertificate__chg_field_classsurvey_data__del_field_meeti','2015-05-30 03:29:29'),(100,'meeting','0041_auto__add_certificate','2015-05-30 03:32:00'),(101,'meeting','0042_auto__add_field_usercertificate_url__chg_field_usercertificate_certifi','2015-05-30 03:34:19'),(102,'meeting','0043_auto__add_field_certificate_meeting','2015-05-30 05:29:15'),(103,'meeting','0044_auto__del_field_usercertificate_user__add_field_usercertificate_ticket','2015-05-30 05:45:09');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `gender` smallint(6) NOT NULL,
  `city` varchar(128) DEFAULT NULL,
  `company` varchar(256) DEFAULT NULL,
  `position` varchar(128) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `student_no` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('pbkdf2_sha256$12000$v9C3Cwu3P2Sk$sUN3NwsK+1cjY5rDBZ5ojZEvJhCWjJ6c9WxSIAQC3fA=','2015-05-30 03:39:33',1,1,'chenchiyuan03@gmail.com','陈驰远','','18614043303',0,'','','',1,1,1,NULL,''),('pbkdf2_sha256$12000$dAqXqKUSAZrA$3CvCktyQxVDSrG4TuH9AnRRSdpihR8xmnmTwfSlyARw=','2015-04-16 15:29:35',0,2,'','zhangnan@qingcheng.it ','','',1,'','','',1,1,1,NULL,''),('pbkdf2_sha256$12000$blJ0obKzVPFm$V7oVYIeg8OdesTIpwj4DgsyGke5qWyckfHFyR0EyDCk=','2015-05-18 02:36:16',1,3,'','kent','','18601155940',1,'','','',1,1,1,NULL,''),('','2015-05-26 01:39:07',0,5,'','王筱',NULL,'18810881895',0,'北京','青橙','c do',1,0,0,NULL,''),('','2015-04-20 09:45:43',0,6,'','tuotuo',NULL,'15313121715',1,'北京','QC','',1,0,0,NULL,''),('','2015-04-20 10:47:28',0,7,'','张二',NULL,'18601151370',1,'北京','倾城','召唤师',1,0,0,NULL,''),('','2015-04-22 07:48:00',0,8,'','黄少天',NULL,'18500151305',1,'帝都','蓝雨训练营','卖萌',1,0,0,NULL,''),('','2015-05-04 14:32:48',0,10,'','陈驰远测试',NULL,'18672760731',1,'','','',1,0,0,NULL,''),('','2015-05-12 07:04:40',0,11,'','许涛',NULL,'18346552658',1,'','','',1,0,0,NULL,''),('','2015-05-11 07:43:30',1,12,'','王欣','','15011056689',1,'','','',1,1,1,NULL,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `user_groups_6340c63c` (`user_id`),
  KEY `user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_7407a5cb` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_720a3f16` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `user_user_permissions_6340c63c` (`user_id`),
  KEY `user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_88d28ac5` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_ccc54e03` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_permissions`
--

LOCK TABLES `user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_app`
--

DROP TABLE IF EXISTS `weixin_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `app_url` varchar(256) DEFAULT NULL,
  `app_token` varchar(64) DEFAULT NULL,
  `app_key` varchar(64) DEFAULT NULL,
  `app_id` varchar(64) DEFAULT NULL,
  `mch_id` varchar(64) DEFAULT NULL,
  `mch_secret` varchar(128) DEFAULT NULL,
  `access_token` varchar(256) DEFAULT NULL,
  `token_expires_in` datetime DEFAULT NULL,
  `jsapi_ticket` varchar(256) DEFAULT NULL,
  `ticket_expires_in` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_app`
--

LOCK TABLES `weixin_app` WRITE;
/*!40000 ALTER TABLE `weixin_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `weixin_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_menu`
--

DROP TABLE IF EXISTS `weixin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main` varchar(64) NOT NULL,
  `secondary` varchar(64) DEFAULT NULL,
  `app_id` int(11) NOT NULL,
  `rule_id` int(11) DEFAULT NULL,
  `link` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `weixin_menu_60fc113e` (`app_id`),
  KEY `weixin_menu_fb21b565` (`rule_id`),
  CONSTRAINT `app_id_refs_id_fa6b1a20` FOREIGN KEY (`app_id`) REFERENCES `weixin_app` (`id`),
  CONSTRAINT `rule_id_refs_id_1c50ba71` FOREIGN KEY (`rule_id`) REFERENCES `weixin_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_menu`
--

LOCK TABLES `weixin_menu` WRITE;
/*!40000 ALTER TABLE `weixin_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `weixin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_photo`
--

DROP TABLE IF EXISTS `weixin_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `md5` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `md5` (`md5`),
  KEY `weixin_photo_4da47e07` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_photo`
--

LOCK TABLES `weixin_photo` WRITE;
/*!40000 ALTER TABLE `weixin_photo` DISABLE KEYS */;
INSERT INTO `weixin_photo` VALUES (1,'ac54857719152cc0a3b9860769e3c1af','logo','ac54857719152cc0a3b9860769e3c1af.jpg'),(2,'f20296b6419f0bc2b11c6cc826ba7da8','美国IHRSA全球年会','f20296b6419f0bc2b11c6cc826ba7da8.jpg'),(3,'1c5e0b75fcc3870687c3a34300f93b34','十','1c5e0b75fcc3870687c3a34300f93b34.jpg');
/*!40000 ALTER TABLE `weixin_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_richtext`
--

DROP TABLE IF EXISTS `weixin_richtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_richtext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `photo_id` int(11) NOT NULL,
  `link` varchar(1024) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `html` longtext,
  PRIMARY KEY (`id`),
  KEY `weixin_richtext_9246ed76` (`title`),
  KEY `weixin_richtext_bc609657` (`photo_id`),
  CONSTRAINT `photo_id_refs_id_5b9d28ce` FOREIGN KEY (`photo_id`) REFERENCES `weixin_photo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_richtext`
--

LOCK TABLES `weixin_richtext` WRITE;
/*!40000 ALTER TABLE `weixin_richtext` DISABLE KEYS */;
/*!40000 ALTER TABLE `weixin_richtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_richtext_rules`
--

DROP TABLE IF EXISTS `weixin_richtext_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_richtext_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `richtext_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `richtext_id` (`richtext_id`,`rule_id`),
  KEY `weixin_richtext_rules_73031604` (`richtext_id`),
  KEY `weixin_richtext_rules_fb21b565` (`rule_id`),
  CONSTRAINT `richtext_id_refs_id_743f4013` FOREIGN KEY (`richtext_id`) REFERENCES `weixin_richtext` (`id`),
  CONSTRAINT `rule_id_refs_id_55c050b1` FOREIGN KEY (`rule_id`) REFERENCES `weixin_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_richtext_rules`
--

LOCK TABLES `weixin_richtext_rules` WRITE;
/*!40000 ALTER TABLE `weixin_richtext_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `weixin_richtext_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_rule`
--

DROP TABLE IF EXISTS `weixin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(64) NOT NULL,
  `response` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_rule`
--

LOCK TABLES `weixin_rule` WRITE;
/*!40000 ALTER TABLE `weixin_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `weixin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_subscribe`
--

DROP TABLE IF EXISTS `weixin_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `weixin_subscribe_60fc113e` (`app_id`),
  KEY `weixin_subscribe_fb21b565` (`rule_id`),
  CONSTRAINT `app_id_refs_id_b6e1df48` FOREIGN KEY (`app_id`) REFERENCES `weixin_app` (`id`),
  CONSTRAINT `rule_id_refs_id_65648a30` FOREIGN KEY (`rule_id`) REFERENCES `weixin_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_subscribe`
--

LOCK TABLES `weixin_subscribe` WRITE;
/*!40000 ALTER TABLE `weixin_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `weixin_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixin_user_token`
--

DROP TABLE IF EXISTS `weixin_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `openid` varchar(128) DEFAULT NULL,
  `access_token` varchar(256) DEFAULT NULL,
  `refresh_token` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `expires_in` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `openid` (`openid`),
  CONSTRAINT `user_id_refs_id_0c7234ce` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixin_user_token`
--

LOCK TABLES `weixin_user_token` WRITE;
/*!40000 ALTER TABLE `weixin_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `weixin_user_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-30 14:35:52
