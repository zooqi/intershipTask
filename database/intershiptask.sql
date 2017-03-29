/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : intershiptask

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-29 10:29:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for depart
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart` (
  `depart_id` varchar(255) NOT NULL,
  `depart_abbreviation` varchar(255) DEFAULT NULL,
  `depart_array_number` varchar(255) DEFAULT NULL,
  `depart_before_name` varchar(255) DEFAULT NULL,
  `depart_chinese_name` varchar(255) DEFAULT NULL,
  `depart_commision_offic` bit(1) DEFAULT NULL,
  `depart_delete` bit(1) DEFAULT NULL,
  `depart_enable` bit(1) DEFAULT NULL,
  `depart_main` bit(1) DEFAULT NULL,
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES ('111cf-356-3dh-7684f-df55', '老板室', null, null, null, null, null, null, '');
INSERT INTO `depart` VALUES ('46771a30-aeb4-4084-bd79-3fdd40b276b6', '秘书室', '', '', '', '\0', '\0', '\0', null);
INSERT INTO `depart` VALUES ('46955f9f-4630-4cd3-8088-85cb4acf1929', '秘书室', '', '', '', '\0', '\0', '\0', null);
INSERT INTO `depart` VALUES ('e51ae8ca-bbda-4821-95f9-33a502ead61d', '助理室', '', '', '', '\0', '\0', '\0', null);

-- ----------------------------
-- Table structure for depart_filiation
-- ----------------------------
DROP TABLE IF EXISTS `depart_filiation`;
CREATE TABLE `depart_filiation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depart_id` varchar(255) DEFAULT NULL,
  `sub_depart_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart_filiation
-- ----------------------------
INSERT INTO `depart_filiation` VALUES ('1', '111cf-356-3dh-7684f-df55', 'e51ae8ca-bbda-4821-95f9-33a502ead61d');
INSERT INTO `depart_filiation` VALUES ('3', '111cf-356-3dh-7684f-df55', '46771a30-aeb4-4084-bd79-3fdd40b276b6');
INSERT INTO `depart_filiation` VALUES ('4', 'e51ae8ca-bbda-4821-95f9-33a502ead61d', '46955f9f-4630-4cd3-8088-85cb4acf1929');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `depart_id` varchar(255) DEFAULT NULL,
  `user_abbreviation` varchar(255) DEFAULT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_array_number` varchar(255) DEFAULT NULL,
  `user_before_name` varchar(255) DEFAULT NULL,
  `user_chinese_name` varchar(255) DEFAULT NULL,
  `user_delete` bit(1) DEFAULT NULL,
  `user_education` varchar(255) DEFAULT NULL,
  `user_enable` bit(1) DEFAULT NULL,
  `user_login_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_position` varchar(255) DEFAULT NULL,
  `user_sex` varchar(255) DEFAULT NULL,
  `user_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1ca8ed2d-d435-45a5-b0be-963492890350', '111cf-356-3dh-7684f-df55', '张三', '0', null, null, '', null, '   ', null, '', null, '', null, null);
INSERT INTO `user` VALUES ('32012116-61f8-4295-9cb6-6f9d4cd32c08', 'e51ae8ca-bbda-4821-95f9-33a502ead61d', '赵六', '0', null, null, '', null, '   ', null, '', null, '', null, null);
