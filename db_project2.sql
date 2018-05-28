/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_project2

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-28 20:58:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_channel
-- ----------------------------
DROP TABLE IF EXISTS `tb_channel`;
CREATE TABLE `tb_channel` (
  `channelId` int(11) NOT NULL AUTO_INCREMENT COMMENT '频道id',
  `channelName` varchar(255) DEFAULT NULL COMMENT '频道名称',
  PRIMARY KEY (`channelId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_channel
-- ----------------------------
INSERT INTO `tb_channel` VALUES ('1', 'NBA');
INSERT INTO `tb_channel` VALUES ('2', 'CBA');

-- ----------------------------
-- Table structure for tb_vote
-- ----------------------------
DROP TABLE IF EXISTS `tb_vote`;
CREATE TABLE `tb_vote` (
  `voteId` int(11) NOT NULL AUTO_INCREMENT,
  `voteName` varchar(255) DEFAULT NULL,
  `channelId` int(11) DEFAULT NULL,
  PRIMARY KEY (`voteId`),
  KEY `fk_vote_channel` (`channelId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_vote
-- ----------------------------
INSERT INTO `tb_vote` VALUES ('6', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('9', '谁是你最喜欢的篮球巨星', '1');
INSERT INTO `tb_vote` VALUES ('10', '谁是你最喜欢的球星', '1');
INSERT INTO `tb_vote` VALUES ('13', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('14', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('15', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('16', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('17', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('18', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('19', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('20', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('21', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('22', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('23', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('24', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('25', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('26', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('27', '2018年哪只队伍将会夺冠', '1');
INSERT INTO `tb_vote` VALUES ('28', '2018年哪只队伍将会夺冠', '1');

-- ----------------------------
-- Table structure for tb_voteoption
-- ----------------------------
DROP TABLE IF EXISTS `tb_voteoption`;
CREATE TABLE `tb_voteoption` (
  `voteOptionId` int(11) NOT NULL AUTO_INCREMENT,
  `voteId` int(11) DEFAULT NULL,
  `voteOptionName` varchar(255) DEFAULT NULL,
  `ticketNum` int(11) DEFAULT '0',
  PRIMARY KEY (`voteOptionId`),
  KEY `fk_voteoption_vote` (`voteId`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_voteoption
-- ----------------------------
INSERT INTO `tb_voteoption` VALUES ('11', '6', '骑士', '50');
INSERT INTO `tb_voteoption` VALUES ('12', '6', '火箭', '5');
INSERT INTO `tb_voteoption` VALUES ('13', '6', '勇士', '1');
INSERT INTO `tb_voteoption` VALUES ('14', '6', '凯尔特人', '4');
INSERT INTO `tb_voteoption` VALUES ('20', '9', '詹姆斯', '0');
INSERT INTO `tb_voteoption` VALUES ('21', '9', '科比', '1');
INSERT INTO `tb_voteoption` VALUES ('22', '9', '库里', '0');
INSERT INTO `tb_voteoption` VALUES ('23', '9', '哈登', '0');
INSERT INTO `tb_voteoption` VALUES ('24', '9', '杜兰特', '0');
INSERT INTO `tb_voteoption` VALUES ('25', '9', '哈登', '0');
INSERT INTO `tb_voteoption` VALUES ('26', '10', '乔丹', '0');
INSERT INTO `tb_voteoption` VALUES ('27', '10', '库里', '0');
INSERT INTO `tb_voteoption` VALUES ('28', '10', '詹姆斯', '0');
INSERT INTO `tb_voteoption` VALUES ('31', '13', '骑士队', '0');
INSERT INTO `tb_voteoption` VALUES ('32', '14', '凯尔特人', '0');
INSERT INTO `tb_voteoption` VALUES ('33', '15', '凯尔特人', '0');
INSERT INTO `tb_voteoption` VALUES ('34', '16', '骑士队', '0');
INSERT INTO `tb_voteoption` VALUES ('35', '17', '凯尔特人', '0');
INSERT INTO `tb_voteoption` VALUES ('36', '18', '骑士队', '0');
INSERT INTO `tb_voteoption` VALUES ('37', '19', '凯尔特人', '0');
INSERT INTO `tb_voteoption` VALUES ('38', '20', '骑士队', '0');
INSERT INTO `tb_voteoption` VALUES ('39', '21', '骑士队', '0');
INSERT INTO `tb_voteoption` VALUES ('40', '22', '凯尔特人', '0');
INSERT INTO `tb_voteoption` VALUES ('41', '23', '凯尔特人', '0');
INSERT INTO `tb_voteoption` VALUES ('42', '24', '骑士队', '0');
INSERT INTO `tb_voteoption` VALUES ('43', '25', '骑士队', '0');
INSERT INTO `tb_voteoption` VALUES ('44', '26', '骑士队', '0');
INSERT INTO `tb_voteoption` VALUES ('45', '27', '凯尔特人', '0');
INSERT INTO `tb_voteoption` VALUES ('46', '28', '骑士队', '0');
INSERT INTO `tb_voteoption` VALUES ('47', '28', '火箭', '0');
