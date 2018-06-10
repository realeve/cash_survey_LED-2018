/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : weixin

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-05-17 23:47:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cbpm_vote_prov_count
-- ----------------------------
DROP TABLE IF EXISTS `cbpm_vote_prov_count`;
CREATE TABLE `cbpm_vote_prov_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prov_name` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prov_name` (`prov_name`,`city_name`,`area_name`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
