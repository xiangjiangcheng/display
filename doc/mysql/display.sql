/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50634
Source Host           : 127.0.0.1:3306
Source Database       : display

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-04-03 00:06:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for background
-- ----------------------------
DROP TABLE IF EXISTS `background`;
CREATE TABLE `background` (
  `id` varchar(255) NOT NULL COMMENT '背景图片主键',
  `bgname` varchar(255) DEFAULT NULL COMMENT '背景图片名称',
  `size` int(1) DEFAULT '1' COMMENT '菜单背景的大小："1：方形（330*330）；2：长方形（700*330）"',
  `type` int(1) DEFAULT '1' COMMENT '背景图片类型：“1：菜单的小背景;2：页面的大背景”',
  `dlt` int(1) DEFAULT '0' COMMENT '删除标志：”0：启用；1：删除“',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of background
-- ----------------------------
INSERT INTO `background` VALUES ('1', 'weichuangxin-bg.png', '1', '1', '1', '2017-03-27 16:33:26', '2017-03-31 15:04:12', null);
INSERT INTO `background` VALUES ('10', 'weichuangxin-bg.png', '2', '1', '0', '2017-03-28 14:49:41', '2017-03-31 15:01:59', null);
INSERT INTO `background` VALUES ('11', 'minzhuguanli-bg.png', '1', '1', '0', '2017-03-28 14:49:52', '2017-03-28 14:49:52', null);
INSERT INTO `background` VALUES ('12', 'banzhujianjie-bg.png', '2', '1', '0', '2017-03-28 14:50:05', '2017-03-31 15:01:59', null);
INSERT INTO `background` VALUES ('13', 'dianlizhishiku-bg.png', '1', '1', '0', '2017-03-28 14:50:22', '2017-03-28 14:50:22', null);
INSERT INTO `background` VALUES ('14', 'jixiaokaohe-bg.png', '1', '1', '0', '2017-03-28 14:50:24', '2017-03-28 14:50:24', null);
INSERT INTO `background` VALUES ('15', 'zhigongzhijia-bg.png', '1', '1', '0', '2017-03-28 14:50:49', '2017-03-28 14:50:49', null);
INSERT INTO `background` VALUES ('16', 'jihuazongjie-bg.png', '2', '1', '0', '2017-03-28 14:51:20', '2017-03-31 15:01:59', null);
INSERT INTO `background` VALUES ('17', 'setting-bg.png', '1', '1', '0', '2017-03-28 14:51:25', '2017-03-28 14:51:25', null);
INSERT INTO `background` VALUES ('17033110233559816081', '17033110231943010532.jpg', '1', '1', '0', '2017-03-31 10:23:35', '2017-03-31 10:23:35', null);
INSERT INTO `background` VALUES ('18', 'pingyoupingxian-bg.png', '1', '1', '0', '2017-03-28 14:51:49', '2017-03-28 14:51:49', null);
INSERT INTO `background` VALUES ('19', 'feiyongkaizhi-bg.png', '1', '1', '0', '2017-03-28 14:51:53', '2017-03-28 14:51:53', null);
INSERT INTO `background` VALUES ('2', 'zhidubanfa-bg.png', '1', '1', '0', '2017-03-27 16:33:51', '2017-03-27 16:33:51', null);
INSERT INTO `background` VALUES ('20', 'weizhangtongbao-bg.png', '1', '1', '0', '2017-03-28 14:52:11', '2017-03-28 14:52:11', null);
INSERT INTO `background` VALUES ('21', 'bg1.png', '1', '2', '0', '2017-03-28 14:55:16', '2017-03-28 14:55:16', null);
INSERT INTO `background` VALUES ('22', 'hongse.png', '1', '1', '0', '2017-03-30 11:09:08', '2017-03-30 11:09:08', null);
INSERT INTO `background` VALUES ('23', 'huangse.png', '1', '1', '0', '2017-03-30 11:09:31', '2017-03-30 11:09:31', null);
INSERT INTO `background` VALUES ('24', 'juse.png', '1', '1', '0', '2017-03-30 11:10:16', '2017-03-30 11:10:16', null);
INSERT INTO `background` VALUES ('25', 'juse2.png', '1', '1', '0', '2017-03-30 11:10:33', '2017-03-30 11:10:33', null);
INSERT INTO `background` VALUES ('26', 'juse3.png', '1', '1', '0', '2017-03-30 11:10:42', '2017-03-30 11:10:42', null);
INSERT INTO `background` VALUES ('27', 'juse4.png', '1', '1', '0', '2017-03-30 11:10:49', '2017-03-30 11:10:49', null);
INSERT INTO `background` VALUES ('28', 'juse5.png', '1', '1', '0', '2017-03-30 11:11:07', '2017-03-30 11:11:07', null);
INSERT INTO `background` VALUES ('29', 'lanse1.png', '1', '1', '0', '2017-03-30 11:11:12', '2017-03-30 11:11:12', null);
INSERT INTO `background` VALUES ('3', 'laodongbaohu-bg.png', '1', '1', '0', '2017-03-27 16:38:08', '2017-03-27 16:38:08', null);
INSERT INTO `background` VALUES ('30', 'lanse2.png', '1', '1', '0', '2017-03-30 11:11:22', '2017-03-30 11:11:22', null);
INSERT INTO `background` VALUES ('31', 'lanse3.png', '1', '1', '0', '2017-03-30 11:11:29', '2017-03-30 11:11:29', null);
INSERT INTO `background` VALUES ('32', 'lanse4.png', '1', '1', '0', '2017-03-30 11:11:41', '2017-03-30 11:11:41', null);
INSERT INTO `background` VALUES ('33', 'lanse5.png', '1', '1', '0', '2017-03-30 11:12:03', '2017-03-30 11:12:03', null);
INSERT INTO `background` VALUES ('34', 'lanse6.png', '1', '1', '0', '2017-03-30 11:12:14', '2017-03-30 11:12:14', null);
INSERT INTO `background` VALUES ('35', 'lvse1.png', '1', '1', '0', '2017-03-30 11:12:29', '2017-03-30 11:12:29', null);
INSERT INTO `background` VALUES ('36', 'lvse2.png', '1', '1', '0', '2017-03-30 11:12:37', '2017-03-30 11:12:37', null);
INSERT INTO `background` VALUES ('37', 'lvse3.png', '1', '1', '0', '2017-03-30 11:12:50', '2017-03-30 11:12:50', null);
INSERT INTO `background` VALUES ('38', 'lvse4.png', '1', '1', '0', '2017-03-30 11:13:07', '2017-03-30 11:13:07', null);
INSERT INTO `background` VALUES ('4', 'zhuoyueguanli-bg.png', '1', '1', '0', '2017-03-27 16:38:15', '2017-03-27 16:38:15', null);
INSERT INTO `background` VALUES ('5', 'yuangongdongtai-bg.png', '1', '1', '0', '2017-03-27 16:38:22', '2017-03-27 16:38:22', null);
INSERT INTO `background` VALUES ('6', 'yuangongkaoqin-bg.png', '1', '1', '0', '2017-03-27 16:38:33', '2017-03-27 16:38:33', null);
INSERT INTO `background` VALUES ('7', 'peixunxuanchuan-bg.png', '1', '1', '0', '2017-03-28 14:49:05', '2017-03-28 14:49:05', null);
INSERT INTO `background` VALUES ('8', 'peixunkongjian-bg.png', '1', '1', '0', '2017-03-28 14:49:15', '2017-03-28 14:49:15', null);
INSERT INTO `background` VALUES ('9', 'jianglifenpei-bg.png', '1', '1', '0', '2017-03-28 14:49:27', '2017-03-28 14:49:27', null);

-- ----------------------------
-- Table structure for checking_in
-- ----------------------------
DROP TABLE IF EXISTS `checking_in`;
CREATE TABLE `checking_in` (
  `id` varchar(255) NOT NULL COMMENT '员工考勤表主键',
  `groupid` varchar(255) DEFAULT NULL COMMENT '小组id',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `month` int(11) DEFAULT NULL COMMENT '月份',
  `file_name` varchar(255) DEFAULT NULL COMMENT '员工考勤表的文件名称',
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checking_in
-- ----------------------------

-- ----------------------------
-- Table structure for democracy
-- ----------------------------
DROP TABLE IF EXISTS `democracy`;
CREATE TABLE `democracy` (
  `id` varchar(255) NOT NULL COMMENT '规程制度表主键',
  `groundid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img` varchar(255) DEFAULT NULL COMMENT '头像',
  `content` text COMMENT '富文本编辑器内容',
  `content2` text COMMENT '备用字段，',
  `type` int(1) DEFAULT NULL COMMENT '表明民主管理下面的几个个模块:"1:评议班组长；2：先进公示；3：先进展示;4:五险一金；5违章通报；费用开支"',
  `deadline` int(11) DEFAULT NULL COMMENT '显示期限，以天为单位',
  `dlt` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of democracy
-- ----------------------------

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
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

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', '乐山消防队', null, null, '0', '2017-03-30 16:21:09', '2017-03-30 16:21:09');
INSERT INTO `group` VALUES ('2', '攀攀上山打老虎', null, null, '0', '2017-03-30 16:23:13', '2017-03-30 16:23:13');

-- ----------------------------
-- Table structure for honour
-- ----------------------------
DROP TABLE IF EXISTS `honour`;
CREATE TABLE `honour` (
  `id` varchar(255) NOT NULL COMMENT '卓越管理主键',
  `groupid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `content` text COMMENT '富文本编辑器的内容（含代码）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `dlt` int(1) DEFAULT '0',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of honour
-- ----------------------------

-- ----------------------------
-- Table structure for icon
-- ----------------------------
DROP TABLE IF EXISTS `icon`;
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

-- ----------------------------
-- Records of icon
-- ----------------------------
INSERT INTO `icon` VALUES ('1', 'wuxianyijin-icon.png', '0', null, '2017-03-27 16:34:41', '2017-03-27 16:34:41', '1');
INSERT INTO `icon` VALUES ('10', 'weichuangxin-icon.png', '0', null, '2017-03-28 14:40:46', '2017-03-28 14:40:46', '1');
INSERT INTO `icon` VALUES ('11', 'minzhuguanli-icon.png', '0', null, '2017-03-28 14:41:05', '2017-03-28 14:41:05', '1');
INSERT INTO `icon` VALUES ('12', 'banzhujianjie-icon.png', '0', null, '2017-03-28 14:41:18', '2017-03-28 14:41:18', '1');
INSERT INTO `icon` VALUES ('13', 'dianlizhishiku-icon.png', '0', null, '2017-03-28 14:41:31', '2017-03-28 14:41:31', '1');
INSERT INTO `icon` VALUES ('14', 'jixiaokaohe-icon.png', '0', null, '2017-03-28 14:41:45', '2017-03-28 14:41:45', '1');
INSERT INTO `icon` VALUES ('15', 'zhigongzhijia-icon.png', '0', null, '2017-03-28 14:42:00', '2017-03-28 14:42:00', '1');
INSERT INTO `icon` VALUES ('16', 'jihuazongjie-icon.png', '0', null, '2017-03-28 14:42:28', '2017-03-28 14:42:28', '1');
INSERT INTO `icon` VALUES ('17', 'setting-icon.png', '0', null, '2017-03-28 14:42:33', '2017-03-28 14:42:33', '1');
INSERT INTO `icon` VALUES ('17033110233559814869', '17033110232488716020.jpg', '0', null, '2017-03-31 10:23:35', '2017-03-31 10:23:35', '1');
INSERT INTO `icon` VALUES ('18', 'pingyoupingxian-icon.png', '0', null, '2017-03-28 14:42:48', '2017-03-28 14:42:48', '1');
INSERT INTO `icon` VALUES ('19', 'feiyongkaizhi-icon.png', '0', null, '2017-03-28 14:43:56', '2017-03-28 14:43:56', '1');
INSERT INTO `icon` VALUES ('2', 'laodongbaohu-icon.png', '0', null, '2017-03-27 16:34:58', '2017-03-27 16:34:58', '1');
INSERT INTO `icon` VALUES ('20', 'weizhangtongbao-icon.png', '0', null, '2017-03-28 14:44:12', '2017-03-28 14:44:12', '1');
INSERT INTO `icon` VALUES ('3', 'zhidubanfa-icon.png', '0', null, '2017-03-27 16:38:51', '2017-03-27 16:38:51', '1');
INSERT INTO `icon` VALUES ('4', 'zhuoyueguanli-icon.png', '0', null, '2017-03-27 16:38:58', '2017-03-27 16:38:58', '1');
INSERT INTO `icon` VALUES ('5', 'yuangongdongtai-icon.png', '0', null, '2017-03-27 16:39:07', '2017-03-27 16:39:07', '1');
INSERT INTO `icon` VALUES ('6', 'yuangongkaoqin-icon.png', '0', null, '2017-03-27 16:39:15', '2017-03-27 16:39:15', '1');
INSERT INTO `icon` VALUES ('7', 'peixunxuanchuan-icon.png', '0', null, '2017-03-28 14:39:41', '2017-03-28 14:39:41', '1');
INSERT INTO `icon` VALUES ('8', 'peixunkongjian-icon.png', '0', null, '2017-03-28 14:39:58', '2017-03-28 14:39:58', '1');
INSERT INTO `icon` VALUES ('9', 'jianglifenpei-icon.png', '0', null, '2017-03-28 14:40:21', '2017-03-28 14:40:21', '1');

-- ----------------------------
-- Table structure for menuconfig
-- ----------------------------
DROP TABLE IF EXISTS `menuconfig`;
CREATE TABLE `menuconfig` (
  `id` varchar(255) NOT NULL COMMENT 'id',
  `pid` varchar(255) DEFAULT '#' COMMENT '该菜单的父级菜单，默认为#，如果为#，则说明这就是一级菜单',
  `backgroundid` varchar(255) DEFAULT NULL COMMENT '页面背景颜色',
  `iconid` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `groupid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `title` varchar(255) DEFAULT NULL COMMENT '菜单标题',
  `level` int(1) DEFAULT '1' COMMENT '菜单等级："1：一级菜单，2：二级菜单，3：三级菜单"',
  `orderby` int(11) DEFAULT NULL COMMENT '菜单排序',
  `ishide` int(11) DEFAULT '0' COMMENT '是否隐藏：“0：显示；1：隐藏”',
  `url` varchar(255) DEFAULT '#' COMMENT '菜单跳转对应的url',
  `dlt` int(1) DEFAULT '0' COMMENT '删除标志：”0：启用；1：删除“',
  `remark` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menuconfig
-- ----------------------------
INSERT INTO `menuconfig` VALUES ('1', '#', '1', '1', '1', '微创新', '1', '1', '0', '#', '0', null, '2017-03-27 16:36:10', '2017-03-27 16:36:10');
INSERT INTO `menuconfig` VALUES ('17033110233559810084', '1', '17033110233559816081', '17033110233559814869', null, '测试菜单', '1', null, '0', '#', '0', null, '2017-03-31 10:23:35', '2017-03-31 10:23:35');
INSERT INTO `menuconfig` VALUES ('2', '#', '2', '2', '1', '厂务公开', '1', '2', '0', '#', '0', null, '2017-03-27 16:36:33', '2017-03-27 16:36:33');
INSERT INTO `menuconfig` VALUES ('3', '#', '3', '3', '1', '职工之家', '1', '3', '0', '#', '0', null, '2017-03-27 16:36:46', '2017-03-27 16:36:46');
INSERT INTO `menuconfig` VALUES ('4', '#', '4', '4', '1', '培训空间', '1', '4', '0', '#', '0', null, '2017-03-27 16:37:02', '2017-03-27 16:37:02');
INSERT INTO `menuconfig` VALUES ('5', '#', '5', '5', '1', '民主管理', '1', '5', '0', '#', '0', null, '2017-03-27 16:37:33', '2017-03-27 16:37:33');
INSERT INTO `menuconfig` VALUES ('6', '#', '6', '6', '1', '卓越管理', '1', '6', '0', '#', '0', null, '2017-03-27 16:37:50', '2017-03-27 16:37:50');
INSERT INTO `menuconfig` VALUES ('7', '5', '5', '6', '1', '计划总结', '2', '1', '0', '#', '0', null, '2017-03-28 13:12:28', '2017-03-28 13:12:28');
INSERT INTO `menuconfig` VALUES ('8', '5', '2', '3', '1', '绩效考核', '2', '2', '0', '#', '0', null, '2017-03-28 13:13:07', '2017-03-28 13:13:07');
INSERT INTO `menuconfig` VALUES ('9', '5', '3', '4', '1', '员工考勤', '2', '3', '0', '#', '0', null, '2017-03-28 13:13:52', '2017-03-28 13:13:52');
INSERT INTO `menuconfig` VALUES ('911', '6', '3', '4', '1', '修改测试', '2', '4', '0', '#', '0', null, '2017-03-31 11:05:49', '2017-03-31 11:05:49');

-- ----------------------------
-- Table structure for performance
-- ----------------------------
DROP TABLE IF EXISTS `performance`;
CREATE TABLE `performance` (
  `id` varchar(255) NOT NULL COMMENT '绩效考核表主键',
  `groupid` varchar(255) DEFAULT NULL COMMENT '小组id',
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `file_name` varchar(255) DEFAULT NULL COMMENT '绩效考核的文件名称',
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of performance
-- ----------------------------

-- ----------------------------
-- Table structure for plan_summary
-- ----------------------------
DROP TABLE IF EXISTS `plan_summary`;
CREATE TABLE `plan_summary` (
  `id` varchar(255) NOT NULL COMMENT '计划及总结表主键',
  `groupid` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_summary
-- ----------------------------

-- ----------------------------
-- Table structure for regime
-- ----------------------------
DROP TABLE IF EXISTS `regime`;
CREATE TABLE `regime` (
  `id` varchar(255) NOT NULL COMMENT '规程制度表主键',
  `title` varchar(255) DEFAULT NULL COMMENT '制度名称',
  `content` text COMMENT '内容',
  `groupid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `dlt` int(1) DEFAULT '0',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of regime
-- ----------------------------

-- ----------------------------
-- Table structure for small_innovate
-- ----------------------------
DROP TABLE IF EXISTS `small_innovate`;
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

-- ----------------------------
-- Records of small_innovate
-- ----------------------------

-- ----------------------------
-- Table structure for staff_family
-- ----------------------------
DROP TABLE IF EXISTS `staff_family`;
CREATE TABLE `staff_family` (
  `id` varchar(255) NOT NULL COMMENT '职工之家主键',
  `url` varchar(255) DEFAULT NULL COMMENT '职工之家地址',
  `title` varchar(255) DEFAULT NULL,
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_family
-- ----------------------------

-- ----------------------------
-- Table structure for staff_trends
-- ----------------------------
DROP TABLE IF EXISTS `staff_trends`;
CREATE TABLE `staff_trends` (
  `id` varchar(255) NOT NULL COMMENT '员工动态表主键',
  `staffheadimg` varchar(255) DEFAULT NULL COMMENT '  员工头像（图片名称）',
  `staffname` varchar(255) DEFAULT NULL COMMENT '员工名称',
  `img1` varchar(255) DEFAULT NULL COMMENT '在岗',
  `img2` varchar(255) DEFAULT NULL COMMENT '年休',
  `img3` varchar(255) DEFAULT NULL COMMENT '补休',
  `img4` varchar(255) DEFAULT NULL COMMENT '病假',
  `img5` varchar(255) DEFAULT NULL COMMENT '事假',
  `img6` varchar(255) DEFAULT NULL COMMENT '培训',
  `img7` varchar(255) DEFAULT NULL COMMENT '出差',
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(225) DEFAULT NULL COMMENT '备注',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_trends
-- ----------------------------

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
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

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES ('1', null, '班务公开看过来a', '你大爷的看过来a', '0', null, '2017-03-27 16:35:45', '2017-03-31 12:55:20', '21');

-- ----------------------------
-- Table structure for train_plan
-- ----------------------------
DROP TABLE IF EXISTS `train_plan`;
CREATE TABLE `train_plan` (
  `id` varchar(255) DEFAULT NULL COMMENT '培训计划表主键',
  `groupid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `title` varchar(255) DEFAULT NULL COMMENT '培训计划title',
  `year` int(11) DEFAULT NULL COMMENT '培训年份',
  `month` int(11) DEFAULT NULL COMMENT '  培训月份：1',
  `content` varchar(255) DEFAULT NULL COMMENT '培训内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `dlt` int(1) DEFAULT '0',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of train_plan
-- ----------------------------

-- ----------------------------
-- Table structure for train_study
-- ----------------------------
DROP TABLE IF EXISTS `train_study`;
CREATE TABLE `train_study` (
  `id` varchar(225) NOT NULL COMMENT '上传文件记录表主键',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件名',
  `type` int(11) DEFAULT NULL COMMENT '表明是哪个模块下面的文件（1:学习课件）',
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of train_study
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL COMMENT '用户主键',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL COMMENT '真正的名字',
  `gender` int(1) DEFAULT '1' COMMENT '性别:1:女；2：男',
  `groupid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `dlt` int(1) DEFAULT '0' COMMENT '删除标记：“0：启用；1：删除”',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `type` int(11) DEFAULT '1' COMMENT '用户名类型:1:班组组长；0:管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '大帅比', '123456', '陈一小', '1', '1', '0', '2017-03-30 16:18:10', '2017-03-30 16:18:10', null, '1');
INSERT INTO `user` VALUES ('2', 'root', '123456', 'root', '1', null, '0', '2017-03-30 17:14:07', '2017-03-30 17:14:07', null, '0');
INSERT INTO `user` VALUES ('3', 'test1', '123456', '大米毛', '1', '2', '0', '2017-03-30 16:22:26', '2017-03-30 16:22:26', null, '1');

-- ----------------------------
-- Table structure for work_plan
-- ----------------------------
DROP TABLE IF EXISTS `work_plan`;
CREATE TABLE `work_plan` (
  `id` varchar(255) DEFAULT NULL,
  `groupid` varchar(255) DEFAULT NULL,
  `workplan` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_plan
-- ----------------------------

-- ----------------------------
-- Table structure for work_summary
-- ----------------------------
DROP TABLE IF EXISTS `work_summary`;
CREATE TABLE `work_summary` (
  `id` varchar(255) NOT NULL COMMENT '计划总结表主键',
  `groupid` varchar(255) DEFAULT NULL COMMENT '班组id',
  `workcontent` text,
  `endtime` date DEFAULT NULL COMMENT '完成时间',
  `dlt` int(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_summary
-- ----------------------------
