/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : intershiptask

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-27 18:47:33
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
  `depart_commision_offic` bit(1) DEFAULT NULL,
  `depart_delete` bit(1) DEFAULT NULL,
  `depart_enable` bit(1) DEFAULT NULL,
  `depart_main` bit(1) DEFAULT NULL,
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES ('1b8a9f73-212c-4481-b0c2-eb11b7eabb2e', '助理', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('62383f08-e966-46ee-805d-4ef93718213b', '会计部', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('6f29b93c-06f4-4c44-b86d-fb1a67906afc', '刷机包', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('75882f8c-a448-47a7-833b-8cb68aee3d2c', '后勤部', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('85258-149kh-95471-hfu1235', '老板室', null, null, null, null, null, '');
INSERT INTO `depart` VALUES ('85b86282-f31a-4d90-92c1-4772d5a9c22a', '秘书室', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('8d9ed5b5-b48b-470e-90c4-5aa3460e397f', ' 助理部', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('b04ca567-1a98-4f5e-ae57-e1314edf3a88', '会计部', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('d59578d4-06e2-4f97-9a94-f1414e1cc0ca', '采办部', null, '', '\0', null, '\0', null);

-- ----------------------------
-- Table structure for depart_filiation
-- ----------------------------
DROP TABLE IF EXISTS `depart_filiation`;
CREATE TABLE `depart_filiation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depart_id` varchar(255) DEFAULT NULL,
  `sub_depart_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart_filiation
-- ----------------------------
INSERT INTO `depart_filiation` VALUES ('1', '85258-149kh-95471-hfu1235', '8d9ed5b5-b48b-470e-90c4-5aa3460e397f');
INSERT INTO `depart_filiation` VALUES ('2', '85258-149kh-95471-hfu1235', '85b86282-f31a-4d90-92c1-4772d5a9c22a');

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
INSERT INTO `user` VALUES ('1a445c5d-c015-4d9b-a082-f9940dff042e', '85258-149kh-95471-hfu1235', '张三', '0', null, null, '', null, '本科', null, '', null, '', null, null);
INSERT INTO `user` VALUES ('36d3eef2-4ed6-4d58-a37b-ed1eeeb3cb42', '907ddf70-d374-4ba8-9bb9-cd5fd61a4054', '张三', '0', null, null, '', null, '', null, '', null, '', null, null);
INSERT INTO `user` VALUES ('ad55e8e4-7507-4488-a2b0-dfca100fe865', 'd59578d4-06e2-4f97-9a94-f1414e1cc0ca', '王五', '0', null, null, '', null, '大专', null, '', null, '', null, null);
INSERT INTO `user` VALUES ('d12b6dcc-8681-4d0d-9bff-550060212503', '907ddf70-d374-4ba8-9bb9-cd5fd61a4054', '王五', '20', null, '张三', ',,,,,,,,', null, null, null, '', null, null, null, null);
INSERT INTO `user` VALUES ('f2b9b41c-1ba7-4e3a-94df-df1b7b1cd351', '85258-149kh-95471-hfu1235', '李四', '0', null, null, '', null, '硕士', null, '', null, '', null, null);
