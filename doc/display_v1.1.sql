CREATE DATABASE  IF NOT EXISTS `display` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `display`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 10.176.62.225    Database: display
-- ------------------------------------------------------
-- Server version	5.7.3-m13

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
-- Table structure for table `background`
--

DROP TABLE IF EXISTS `background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `background` (
  `id` varchar(255) NOT NULL COMMENT '背景图片主键',
  `bgname` varchar(255) DEFAULT NULL COMMENT '背景图片名称',
  `type` int(1) DEFAULT '1' COMMENT '背景图片类型：“1：菜单的小背景;2：页面的大背景”',
  `dlt` int(1) DEFAULT '0' COMMENT '删除标志：”0：启用；1：删除“',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background`
--

LOCK TABLES `background` WRITE;
/*!40000 ALTER TABLE `background` DISABLE KEYS */;
INSERT INTO `background` VALUES ('1','banzujianjie_bg.png',1,1,'2017-03-27 08:33:26','2017-04-11 10:12:13',NULL),('10','zhidubanfa_bg.png',1,0,'2017-03-30 03:10:42','2017-04-12 01:38:39',NULL),('11','yuangongkaoqin_bg.png',1,0,'2017-03-30 03:10:33','2017-04-12 01:38:46',NULL),('12','yuangongdongtai_bg.png',1,0,'2017-03-30 03:10:16','2017-04-12 01:38:48',NULL),('13','xiaokanban_bg.png',1,0,'2017-03-30 03:09:31','2017-04-12 01:38:59',NULL),('14','jihuazongjie_bg.png',1,0,'2017-03-28 06:50:24','2017-04-11 10:12:46',NULL),('15','jixiaokaohe_bg.png',1,0,'2017-03-28 06:50:49','2017-04-11 10:12:54',NULL),('16','laodongbaohu_bg.png',1,0,'2017-03-28 06:51:20','2017-04-11 10:16:21',NULL),('17','minzuguanli_bg.png',1,0,'2017-03-28 06:51:25','2017-04-11 10:17:18',NULL),('18','peixunxuanchuan_bg.png',1,0,'2017-03-28 06:51:49','2017-04-11 10:17:45',NULL),('19','pingxianpingyou_bg.png',1,0,'2017-03-28 06:51:53','2017-04-11 10:17:53',NULL),('2','shezhi_bg.png',1,0,'2017-03-27 08:33:51','2017-04-11 10:18:02',NULL),('20','weichuangxin_bg.png',1,0,'2017-03-28 06:52:11','2017-04-11 10:18:10',NULL),('21','background1.png',2,0,'2017-03-28 06:55:16','2017-04-12 03:18:42',NULL),('22','wuxianyijin_bg.png',1,0,'2017-03-30 03:09:08','2017-04-11 10:18:25',NULL),('28','zhuoyueguanli_bg.png',1,0,'2017-03-30 03:11:07','2017-04-11 10:19:02',NULL),('3','dianlizhishiku_bg.png',1,0,'2017-03-28 06:49:41','2017-04-11 10:27:22',NULL),('4','peixunkongjian_bg.png',1,0,'2017-03-31 02:23:35','2017-04-11 10:25:16',NULL),('5','peixunkongjina_bg.png',1,0,'2017-04-11 10:07:04','2017-04-11 10:25:18',NULL),('6','feiyongkaizhi_bg.png',1,0,'2017-03-28 06:49:52','2017-04-11 10:27:58',NULL),('7','guojiadianwang_bg.png',1,0,'2017-03-28 06:50:05','2017-04-11 10:28:02',NULL),('8','jianglifenpei_bg.png',1,0,'2017-03-28 06:50:22','2017-04-11 10:28:04',NULL),('9','zhigongzhijia_bg.png',1,0,'2017-03-30 03:10:49','2017-04-12 01:38:36',NULL);
/*!40000 ALTER TABLE `background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` varchar(255) NOT NULL COMMENT '班组id',
  `groupname` varchar(255) DEFAULT NULL COMMENT '班组名称',
  `intro` varchar(255) DEFAULT NULL COMMENT '班组简介：这个字段用来存放ppt的文件名（ppt转成flsh后的文件名）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `dlt` int(1) DEFAULT '0' COMMENT '删除标记：“0：启用；1：删除”',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('1','乐山消防队','乐山',NULL,0,'2017-03-30 08:21:09','2017-04-05 05:32:56'),('17041218263862319234','新增班组测试',NULL,NULL,0,'2017-04-12 10:26:38','2017-04-12 10:26:38'),('2','攀攀上山打老虎','panoan',NULL,0,'2017-03-30 08:23:13','2017-04-05 05:32:48'),('3','NCS','dsfds',NULL,0,'2017-04-05 05:32:43','2017-04-05 05:32:43');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon`
--

DROP TABLE IF EXISTS `icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon` (
  `id` varchar(255) NOT NULL COMMENT '图标主键',
  `iconname` varchar(255) DEFAULT NULL COMMENT '图标名称',
  `dlt` int(1) DEFAULT '0' COMMENT '删除标记：“0：启用；1：删除”',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` int(1) DEFAULT '1' COMMENT '图标类型：“1:菜单的小图标；2：logo：”',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon`
--

LOCK TABLES `icon` WRITE;
/*!40000 ALTER TABLE `icon` DISABLE KEYS */;
INSERT INTO `icon` VALUES ('1','banzujianjie_icon.png',0,NULL,'2017-03-27 08:34:41','2017-04-11 10:20:19',1),('10','dianlizhishiku_icon.png',0,NULL,'2017-03-28 06:40:46','2017-04-11 10:20:25',1),('11','feiyongkaizhi_icon.png',0,NULL,'2017-03-28 06:41:05','2017-04-11 10:20:31',1),('12','jianglifenpei_icon.png',0,NULL,'2017-03-28 06:41:18','2017-04-11 10:20:37',1),('13','jihuazongjie_icon.png',0,NULL,'2017-03-28 06:41:31','2017-04-11 10:20:43',1),('14','jixiaokaohe_icon.png',0,NULL,'2017-03-28 06:41:45','2017-04-11 10:20:49',1),('15','laodongbaohu_icon.png',0,NULL,'2017-03-28 06:42:00','2017-04-11 10:21:21',1),('16','minzuguanli_icon.png',0,NULL,'2017-03-28 06:42:28','2017-04-11 10:21:26',1),('17','peixunkongjian_icon.png',0,NULL,'2017-03-28 06:42:33','2017-04-11 10:21:33',1),('18','weizhangtongbao_icon.png',0,NULL,'2017-03-28 06:42:48','2017-04-11 10:22:06',1),('19','wuxianyijin_icon.png',0,NULL,'2017-03-28 06:43:56','2017-04-11 10:22:12',1),('2','yuangongdongtai_icon.png',0,NULL,'2017-03-27 08:34:58','2017-04-11 10:22:18',1),('20','yuangongkaoqin_icon.png',0,NULL,'2017-03-28 06:44:12','2017-04-11 10:22:23',1),('3','zhidubanfa_icon.png',0,NULL,'2017-03-27 08:38:51','2017-04-11 10:22:30',1),('4','zhigongzhijia_icon.png',0,NULL,'2017-03-27 08:38:58','2017-04-11 10:22:39',1),('5','zhuoyueguanli_icon.png',0,NULL,'2017-03-27 08:39:07','2017-04-11 10:22:42',1),('6','peixunxuanchuan_icon.png',0,NULL,'2017-03-31 02:23:35','2017-04-12 01:35:10',1),('7','weichuangxin_icon.png',0,NULL,'2017-04-11 10:16:21','2017-04-11 10:24:16',1),('8','shezhi_icon.png',0,NULL,'2017-04-11 10:07:13','2017-04-11 10:24:21',1),('9','pingxianpingyou_icon.png',0,NULL,'2017-04-11 09:55:42','2017-04-11 10:24:39',1);
/*!40000 ALTER TABLE `icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuconfig`
--

DROP TABLE IF EXISTS `menuconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuconfig` (
  `id` varchar(255) NOT NULL COMMENT 'id',
  `pid` varchar(255) DEFAULT '#' COMMENT '该菜单的父级菜单，默认为#，如果为#，则说明这就是一级菜单',
  `title` varchar(255) DEFAULT NULL COMMENT '菜单标题(之前是title)',
  `ishide` int(11) DEFAULT '0' COMMENT '是否隐藏：“0：显示；1：隐藏”',
  `url` varchar(255) DEFAULT '' COMMENT '菜单跳转对应的url',
  `backgroundid` varchar(255) DEFAULT NULL COMMENT '页面背景颜色',
  `iconid` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `groupid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `level` int(1) DEFAULT '1' COMMENT '菜单等级："1：一级菜单，2：二级菜单，3：三级菜单"',
  `orderby` int(11) DEFAULT NULL COMMENT '菜单排序',
  `size` int(1) DEFAULT '1' COMMENT '菜单大小："1:一倍；2：两倍"',
  `type` int(1) DEFAULT '1' COMMENT '标识模板类型（0：菜单；1：富文本；2：表格；3：表单；4：ppt；5：链接）',
  `dlt` int(1) DEFAULT '0' COMMENT '删除标志：”0：启用；1：删除“',
  `remark` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuconfig`
--

LOCK TABLES `menuconfig` WRITE;
/*!40000 ALTER TABLE `menuconfig` DISABLE KEYS */;
INSERT INTO `menuconfig` VALUES ('1','#','微创新',0,'','8','8','1',1,3,1,1,0,NULL,'2017-03-27 08:36:10','2017-04-12 09:54:41'),('11','#','用户信息管理',0,'',NULL,'','1',1,NULL,1,1,0,NULL,'2017-04-11 07:01:09','2017-04-12 10:23:54'),('12','11','用户信息',0,'/page/userList',NULL,NULL,'1',1,NULL,1,1,0,NULL,'2017-04-11 07:02:15','2017-04-12 10:23:55'),('122','4','规程制度',0,'/page/ruleManange',NULL,NULL,'1',2,NULL,1,1,0,NULL,'2017-04-12 02:50:21','2017-04-12 10:42:27'),('13','#','班组信息管理',0,'',NULL,NULL,'1',1,NULL,1,1,0,NULL,'2017-04-11 07:03:18','2017-04-12 10:23:56'),('14','13','班组信息管理',0,'/page/groupManange',NULL,NULL,'1',1,NULL,1,1,0,NULL,'2017-04-11 07:04:13','2017-04-12 10:23:57'),('15','13','Ueditor实例',0,'/page/showUeditor',NULL,NULL,'1',1,NULL,1,1,0,NULL,'2017-04-11 07:05:53','2017-04-12 10:23:57'),('16','#','通用配置',0,'',NULL,NULL,'1',1,NULL,1,1,0,NULL,'2017-04-11 07:06:30','2017-04-12 10:23:57'),('17','16','首页配置',0,'/page/indexConfig',NULL,NULL,'1',1,NULL,1,1,0,NULL,'2017-04-11 07:07:58','2017-04-12 10:23:58'),('17041218263868511040','#','微创新',0,'','1','1','17041218263862319234',1,1,2,3,1,NULL,'2017-04-12 10:26:38','2017-04-12 10:30:08'),('17041218263870818092','#','民主管理',0,'','2','2','17041218263862319234',1,2,1,0,1,NULL,'2017-04-12 10:26:38','2017-04-12 10:30:08'),('17041218263871317631','#','卓越管理',0,'','3','3','17041218263862319234',1,3,1,1,1,NULL,'2017-04-12 10:26:38','2017-04-12 10:30:08'),('17041218263874012054','#','职工之家',0,'','4','4','17041218263862319234',1,4,1,5,1,NULL,'2017-04-12 10:26:38','2017-04-12 10:30:08'),('17041218263877718620','#','培训空间',0,'','5','5','17041218263862319234',1,5,2,0,1,NULL,'2017-04-12 10:26:38','2017-04-12 10:30:55'),('17041218263881212349','#','班组简介',0,'','6','6','17041218263862319234',1,6,1,4,1,NULL,'2017-04-12 10:26:38','2017-04-12 10:30:08'),('18','16','模块管理',0,'/page/ModuleManger','10','10','1',1,NULL,1,1,0,NULL,'2017-04-11 07:08:13','2017-04-12 10:24:00'),('2','#','厂务公开',0,'','3','3','1',1,2,2,1,0,NULL,'2017-03-27 08:36:33','2017-04-12 09:53:48'),('3','#','职工之家',0,'','3','3','1',1,1,1,1,0,NULL,'2017-03-27 08:36:46','2017-04-11 10:16:25'),('4','#','培训空间',0,'','4','2','1',1,4,1,1,0,NULL,'2017-03-27 08:37:02','2017-04-11 10:45:14'),('5','#','民主管理',0,'','5','5','1',1,5,1,1,0,NULL,'2017-03-27 08:37:33','2017-04-11 06:17:31'),('6','#','卓越管理',0,'','6','10','1',1,6,2,1,0,NULL,'2017-03-27 08:37:50','2017-04-11 10:34:16'),('7','5','计划总结',0,'','5','6','1',2,1,1,1,0,NULL,'2017-03-28 05:12:28','2017-04-11 06:17:32'),('8','5','绩效考核',0,'','2','3','1',2,2,1,1,0,NULL,'2017-03-28 05:13:07','2017-04-11 06:17:32'),('9','5','员工考勤',0,'','3','4','1',2,3,1,1,0,NULL,'2017-03-28 05:13:52','2017-04-11 06:17:33'),('911','6','班组简介',0,'/page/showRichModel','3','4','1',2,4,2,1,0,NULL,'2017-03-31 03:05:49','2017-04-12 10:11:40');
/*!40000 ALTER TABLE `menuconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_ppt`
--

DROP TABLE IF EXISTS `module_ppt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_ppt` (
  `id` varchar(255) NOT NULL COMMENT '绩效考核表主键',
  `menuid` varchar(255) DEFAULT NULL COMMENT '菜单id',
  `groupid` varchar(255) DEFAULT NULL COMMENT '小组id',
  `file_name` varchar(255) DEFAULT NULL COMMENT '绩效考核的文件名称',
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_ppt`
--

LOCK TABLES `module_ppt` WRITE;
/*!40000 ALTER TABLE `module_ppt` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_ppt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_rich`
--

DROP TABLE IF EXISTS `module_rich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_rich` (
  `id` varchar(255) NOT NULL COMMENT '规程制度表主键',
  `menuid` varchar(255) DEFAULT NULL COMMENT '菜单id',
  `groundid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题（例如规程制度模块：规程制度1；规程制度2；规程制度3）',
  `content` text COMMENT '富文本编辑器内容',
  `type` int(1) DEFAULT NULL COMMENT '表明民主管理下面的几个个模块:"1:评议班组长；2：先进公示；3：先进展示;4:五险一金；5违章通报；费用开支"',
  `deadline` int(11) DEFAULT NULL COMMENT '显示期限，以天为单位',
  `dlt` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_rich`
--

LOCK TABLES `module_rich` WRITE;
/*!40000 ALTER TABLE `module_rich` DISABLE KEYS */;
INSERT INTO `module_rich` VALUES ('1','122',NULL,'华国锋','<p style=\"font-family:Calibri,sans-serif;font-size:11.0pt;line-height:115%;margin-bottom:10.0pt;margin-left:0in;margin-right:0in;margin-top:0in;\"><span style=\"\"><span lang=\"ZH-CN\" style=\"font-family:宋体;\">实现工程项目管理的所有效果。包括前端页面，后台代码等。</span></span></p><p style=\"font-family:Calibri,sans-serif;font-size:11.0pt;line-height:115%;margin-bottom:10.0pt;margin-left:0in;margin-right:0in;margin-top:0in;\"><span style=\"\"><span style=\"\"><img width=\"576\" height=\"461\" src=\"http://10.176.62.59:8080/display/upload/2017/04/12/4dd6810a-9c96-4682-b45d-da8bcddf1ce7.png\" alt=\"\"/></span><span style=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p><p style=\"font-family:Calibri,sans-serif;font-size:11.0pt;line-height:115%;margin-bottom:10.0pt;margin-left:0in;margin-right:0in;margin-top:0in;\">&nbsp;</p><p><br/></p>',NULL,NULL,'0',NULL,NULL,'2017-04-12 09:23:08'),('2','122',NULL,'NCS','感豆腐干风格和规范',NULL,NULL,'0',NULL,NULL,'2017-04-12 07:32:05');
/*!40000 ALTER TABLE `module_rich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_table`
--

DROP TABLE IF EXISTS `module_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_table` (
  `id` varchar(255) NOT NULL COMMENT '计划及总结表主键',
  `menuid` varchar(255) DEFAULT NULL COMMENT '菜单id',
  `groupid` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL COMMENT '用来标识哪一年',
  `month` int(11) DEFAULT NULL COMMENT '月',
  `day` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL COMMENT '用来标识是哪一周',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_table`
--

LOCK TABLES `module_table` WRITE;
/*!40000 ALTER TABLE `module_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `small_innovate`
--

DROP TABLE IF EXISTS `small_innovate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `small_innovate` (
  `id` varchar(255) NOT NULL COMMENT '微创新主键',
  `groupid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `title` varchar(255) DEFAULT NULL COMMENT ' 微创新页面的title，暂时不用',
  `achievementname` varchar(255) DEFAULT NULL COMMENT '成果名称',
  `mainpersons` varchar(255) DEFAULT NULL COMMENT 'main_complete_persons:主要完成人',
  `achievementdetails` text COMMENT '应用情况及利益',
  `achievementsummary` text COMMENT '成果摘要',
  `achievementcost` varchar(255) DEFAULT NULL COMMENT '成果推广费用',
  `pictureids` varchar(255) DEFAULT NULL COMMENT '与本成果有关的所有图片id，id之间用逗号隔开,如"1,2"',
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `small_innovate`
--

LOCK TABLES `small_innovate` WRITE;
/*!40000 ALTER TABLE `small_innovate` DISABLE KEYS */;
/*!40000 ALTER TABLE `small_innovate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title`
--

DROP TABLE IF EXISTS `title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `title` (
  `id` varchar(255) NOT NULL COMMENT '菜单页面的顶部的标题id',
  `groupid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `title1` varchar(255) DEFAULT NULL COMMENT '主标题',
  `title2` varchar(255) DEFAULT NULL COMMENT '副标题',
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `backgroundid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title`
--

LOCK TABLES `title` WRITE;
/*!40000 ALTER TABLE `title` DISABLE KEYS */;
INSERT INTO `title` VALUES ('1',NULL,'班务公开看过来a','你大爷的看过来a',0,NULL,'2017-03-27 08:35:45','2017-03-31 04:55:20','21'),('17041218243953514083','17041218243947910708','班级公务看过来','争创文明班组，争做优秀员工',0,NULL,'2017-04-12 10:24:39','2017-04-12 10:24:39','21'),('17041218263867919313','17041218263862319234','班级公务看过来','争创文明班组，争做优秀员工',0,NULL,'2017-04-12 10:26:38','2017-04-12 10:26:38','21');
/*!40000 ALTER TABLE `title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL COMMENT '用户主键',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL COMMENT '真正的名字',
  `gender` int(1) DEFAULT '1' COMMENT '性别:0:女；1：男',
  `groupid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `dlt` int(1) DEFAULT '0' COMMENT '删除标记：“0：启用；1：删除”',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `type` int(11) DEFAULT '1' COMMENT '用户名类型:1:班组组长；0:管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','qq123','123456','流浪',1,'1',0,'2017-04-03 03:14:24','2017-04-03 07:02:13',NULL,1),('17040314522588017166','qq1234','123456','流浪1',1,'2',0,'2017-04-03 06:52:25','2017-04-03 07:02:18',NULL,1),('17040315052116911745','1234','123456','2343242',1,'2',0,'2017-04-03 07:05:21','2017-04-03 07:05:21',NULL,1),('17041218274122319803','123456','123456','测试',1,'17041218263862319234',0,'2017-04-12 10:27:41','2017-04-12 10:27:41',NULL,1),('2','root','123456','root',1,'1',0,'2017-03-30 09:14:07','2017-04-03 07:02:19',NULL,0),('3','damimao','123456','大米毛',0,'1',0,'2017-04-03 03:14:51','2017-04-03 07:02:19',NULL,1),('4','test','123456','小可爱',1,'1',0,'2017-04-03 03:15:06','2017-04-03 07:02:21',NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-12 18:55:22
