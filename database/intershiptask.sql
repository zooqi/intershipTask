/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : intershiptask

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-28 13:17:38
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
INSERT INTO `depart` VALUES ('6599fdc3-35ee-48f8-956d-f0121328abeb', '小财务部', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('85258-149kh-95471-hfu1235', '老板室', null, null, null, null, null, '');
INSERT INTO `depart` VALUES ('8787d91a-b22a-4894-9f94-ecc854253782', '小助理', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('a4e98b2a-c241-451f-b391-add0e61cd08a', '助理部', null, '小助理', '', null, '', null);
INSERT INTO `depart` VALUES ('ad44bbe6-000a-48d9-8417-c6f870271c45', '账簿部', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('b29284d6-5a5f-4f9d-9b6f-0c973df1532a', '会计部', null, '', '', null, '', null);
INSERT INTO `depart` VALUES ('bef4cb06-4394-41f3-a09d-b18aa3633425', '大财务部', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('c4c3a698-4128-4790-b2e9-7f23e9ee545e', '赵六部', null, '', '\0', null, '\0', null);
INSERT INTO `depart` VALUES ('d245c69e-e021-4e79-aec9-c756de4dce04', '秘书部', null, '', '\0', null, '\0', null);

-- ----------------------------
-- Table structure for depart_filiation
-- ----------------------------
DROP TABLE IF EXISTS `depart_filiation`;
CREATE TABLE `depart_filiation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depart_id` varchar(255) DEFAULT NULL,
  `sub_depart_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of depart_filiation
-- ----------------------------
INSERT INTO `depart_filiation` VALUES ('3', '85258-149kh-95471-hfu1235', 'b29284d6-5a5f-4f9d-9b6f-0c973df1532a');
INSERT INTO `depart_filiation` VALUES ('4', '85258-149kh-95471-hfu1235', 'a4e98b2a-c241-451f-b391-add0e61cd08a');
INSERT INTO `depart_filiation` VALUES ('5', '85258-149kh-95471-hfu1235', 'd245c69e-e021-4e79-aec9-c756de4dce04');
INSERT INTO `depart_filiation` VALUES ('6', 'a4e98b2a-c241-451f-b391-add0e61cd08a', '8787d91a-b22a-4894-9f94-ecc854253782');
INSERT INTO `depart_filiation` VALUES ('7', 'b29284d6-5a5f-4f9d-9b6f-0c973df1532a', 'bef4cb06-4394-41f3-a09d-b18aa3633425');
INSERT INTO `depart_filiation` VALUES ('8', 'bef4cb06-4394-41f3-a09d-b18aa3633425', '6599fdc3-35ee-48f8-956d-f0121328abeb');
INSERT INTO `depart_filiation` VALUES ('9', '6599fdc3-35ee-48f8-956d-f0121328abeb', 'ad44bbe6-000a-48d9-8417-c6f870271c45');
INSERT INTO `depart_filiation` VALUES ('10', 'ad44bbe6-000a-48d9-8417-c6f870271c45', 'c4c3a698-4128-4790-b2e9-7f23e9ee545e');

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
INSERT INTO `user` VALUES ('242f206a-9c3e-4799-b9b0-2d2c126c63ac', 'ad44bbe6-000a-48d9-8417-c6f870271c45', '王五', '0', null, null, '', null, '   ', null, '', null, '', null, null);
INSERT INTO `user` VALUES ('68144177-41de-498f-a5c6-8dd5a3cca41d', 'a4e98b2a-c241-451f-b391-add0e61cd08a', '张三', '20', null, '', ',,,,', null, null, null, '', null, null, null, null);
INSERT INTO `user` VALUES ('9c601dfb-9067-4e11-8b75-4d27284e011c', 'ad44bbe6-000a-48d9-8417-c6f870271c45', '赵六', '0', null, null, '', null, '   ', null, '', null, '', null, null);
