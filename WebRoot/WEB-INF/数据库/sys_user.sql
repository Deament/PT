/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50512
Source Host           : localhost:3306
Source Database       : going

Target Server Type    : MYSQL
Target Server Version : 50512
File Encoding         : 65001

Date: 2016-06-21 07:26:20
*/

SET FOREIGN_KEY_CHECKS=0;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
