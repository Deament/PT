/*
Navicat MySQL Data Transfer

Source Server         : yy
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : deament

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2015-11-11 17:06:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `rbac_auth`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth`;
CREATE TABLE `rbac_auth` (
  `auth_id` int(11) NOT NULL,
  `auth_name` char(50) default NULL,
  `auth_type` int(11) default NULL,
  PRIMARY KEY  (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_auth_function`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth_function`;
CREATE TABLE `rbac_auth_function` (
  `id` int(11) NOT NULL,
  `function_id` int(11) default NULL,
  `auth_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Relationship_8` (`auth_id`),
  KEY `FK_Relationship_9` (`function_id`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`function_id`) REFERENCES `rbac_function` (`function_id`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`auth_id`) REFERENCES `rbac_auth` (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_auth_function
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_auth_menu`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_auth_menu`;
CREATE TABLE `rbac_auth_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) default NULL,
  `auth_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Relationship_10` (`auth_id`),
  KEY `FK_Relationship_11` (`menu_id`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`menu_id`) REFERENCES `rbac_menu` (`menu_id`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`auth_id`) REFERENCES `rbac_auth` (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_auth_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_function`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_function`;
CREATE TABLE `rbac_function` (
  `function_id` int(11) NOT NULL,
  `function_name` char(50) default NULL,
  `function_code` char(100) default NULL,
  `function_url` char(100) default NULL,
  PRIMARY KEY  (`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_function
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_group`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_group`;
CREATE TABLE `rbac_group` (
  `group_id` int(11) NOT NULL,
  `group_name` char(50) default NULL,
  `group_parentid` int(11) default NULL,
  PRIMARY KEY  (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_group
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_menu`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_menu`;
CREATE TABLE `rbac_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` char(50) default NULL,
  `menu_url` char(100) default NULL,
  `menu_parentid` int(11) default NULL,
  PRIMARY KEY  (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_role`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role`;
CREATE TABLE `rbac_role` (
  `role_id` int(11) NOT NULL,
  `role_name` char(50) default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_role
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_role_auth`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role_auth`;
CREATE TABLE `rbac_role_auth` (
  `id` int(11) NOT NULL,
  `role_id` int(11) default NULL,
  `auth_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Relationship_5` (`role_id`),
  KEY `FK_Relationship_6` (`auth_id`),
  CONSTRAINT `FK_Relationship_6` FOREIGN KEY (`auth_id`) REFERENCES `rbac_auth` (`auth_id`),
  CONSTRAINT `FK_Relationship_5` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_role_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_role_group`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role_group`;
CREATE TABLE `rbac_role_group` (
  `id` int(11) NOT NULL,
  `role_id` int(11) default NULL,
  `group_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Relationship_15` (`group_id`),
  KEY `FK_Relationship_16` (`role_id`),
  CONSTRAINT `FK_Relationship_16` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`role_id`),
  CONSTRAINT `FK_Relationship_15` FOREIGN KEY (`group_id`) REFERENCES `rbac_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_role_group
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_user`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user`;
CREATE TABLE `rbac_user` (
  `user_id` int(11) NOT NULL,
  `user_name` char(50) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_user
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user_group`;
CREATE TABLE `rbac_user_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) default NULL,
  `group_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Relationship_13` (`group_id`),
  KEY `FK_Relationship_14` (`user_id`),
  CONSTRAINT `FK_Relationship_14` FOREIGN KEY (`user_id`) REFERENCES `rbac_user` (`user_id`),
  CONSTRAINT `FK_Relationship_13` FOREIGN KEY (`group_id`) REFERENCES `rbac_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_user_role`;
CREATE TABLE `rbac_user_role` (
  `id` int(11) NOT NULL,
  `role_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_Relationship_2` (`user_id`),
  KEY `FK_Relationship_3` (`role_id`),
  CONSTRAINT `FK_Relationship_3` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`role_id`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`user_id`) REFERENCES `rbac_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_user_role
-- ----------------------------
