/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50512
Source Host           : localhost:3306
Source Database       : going

Target Server Type    : MYSQL
Target Server Version : 50512
File Encoding         : 65001

Date: 2016-06-23 23:35:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountName` varchar(30) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `methods` varchar(30) DEFAULT NULL,
  `actionTime` varchar(30) DEFAULT NULL,
  `userIP` varchar(30) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_res_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_res_user`;
CREATE TABLE `sys_res_user` (
  `resId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_res_user
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `resUrl` varchar(200) DEFAULT NULL,
  `level` int(4) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `ishide` int(3) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `state` varchar(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL COMMENT '账号',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(105) DEFAULT NULL COMMENT '电子邮箱',
  `state` varchar(6) DEFAULT NULL COMMENT '封锁状态',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `createtime` varchar(30) DEFAULT NULL,
  `isdelete` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '123456', '591518884@qq.com', '0', '123456', '2016-01-01 00:00:00', null);

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
