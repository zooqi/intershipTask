SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for depart
-- ----------------------------
DROP TABLE IF EXISTS `depart`;
CREATE TABLE `depart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depart_abbreviation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depart_array_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depart_before_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depart_commision_offic` bit(1) DEFAULT NULL,
  `depart_delete` bit(1) DEFAULT NULL,
  `depart_enable` bit(1) DEFAULT NULL,
  `depart_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depart_main` bit(1) DEFAULT NULL,
  `depart_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of depart
-- ----------------------------
INSERT INTO `depart` VALUES ('1', '财务部', null, null, null, null, null, '9c306cc0-e568-4b07-b2ba-dd0a641a92ba', '', null);
INSERT INTO `depart` VALUES ('2', '桂林财务部', null, null, null, null, null, '075d532b-a57b-48cb-adf8-c7c8b9f7f5e5', '\0', null);
INSERT INTO `depart` VALUES ('3', '南宁财务部', null, null, null, null, null, '4f4b940a-db57-4316-b483-c0319382d6da', '\0', null);

-- ----------------------------
-- Table structure for depart_filiation
-- ----------------------------
DROP TABLE IF EXISTS `depart_filiation`;
CREATE TABLE `depart_filiation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depart_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_depart_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of depart_filiation
-- ----------------------------
INSERT INTO `depart_filiation` VALUES ('1', '9c306cc0-e568-4b07-b2ba-dd0a641a92ba', '075d532b-a57b-48cb-adf8-c7c8b9f7f5e5');
INSERT INTO `depart_filiation` VALUES ('2', '9c306cc0-e568-4b07-b2ba-dd0a641a92ba', '4f4b940a-db57-4316-b483-c0319382d6da');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depart_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_abbreviation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_age` int(11) DEFAULT NULL,
  `user_array_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_before_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_chinese_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_delete` bit(1) DEFAULT NULL,
  `user_education` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_enable` bit(1) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_login_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_sex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '075d532b-a57b-48cb-adf8-c7c8b9f7f5e5', '朱启晖', null, null, null, null, null, null, null, 'f4420e64-a1f7-4b79-8381-2692f3427905', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('2', '4f4b940a-db57-4316-b483-c0319382d6da', '杨明静', null, null, null, null, null, null, null, '58adbc37-4032-475c-a432-f753d29f52e4', null, null, null, null, null, null);
