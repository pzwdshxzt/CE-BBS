/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50626
Source Host           : 182.92.84.28 :3306
Source Database       : bysj

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-03-19 16:54:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `deleteFlag` tinyint(4) DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `username` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', '0', '123', '123');

-- ----------------------------
-- Table structure for `t_exchange`
-- ----------------------------
DROP TABLE IF EXISTS `t_exchange`;
CREATE TABLE `t_exchange` (
  `id` int(11) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `hide` tinyint(4) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `weChat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exchange
-- ----------------------------
INSERT INTO `t_exchange` VALUES ('1', '8@q.com', '0', '32424', '13155', '123313');
INSERT INTO `t_exchange` VALUES ('2', 'ss@qq', '1', '1561', '115616', '1516');

-- ----------------------------
-- Table structure for `t_flate`
-- ----------------------------
DROP TABLE IF EXISTS `t_flate`;
CREATE TABLE `t_flate` (
  `flateId` int(11) NOT NULL AUTO_INCREMENT,
  `deleteFlag` tinyint(4) DEFAULT NULL,
  `flateContent` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `flateName` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `imageUrl` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`flateId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_flate
-- ----------------------------
INSERT INTO `t_flate` VALUES ('26', '0', '健身是对身体有好处的！', '娱乐', '7b291101-15cf-4156-8fcd-0b79b48113b6ff.jpg');
INSERT INTO `t_flate` VALUES ('27', '0', '发现另一个世界！！', '发现', '9cdb5a43-9d08-4e13-9de4-e6af12c8939dindex.jpg');
INSERT INTO `t_flate` VALUES ('28', '0', '游戏有时候是有趣的事情！！', '游戏', '3e60c6c8-cc0e-4985-950d-f0956572e032海贼王壁纸佐罗.jpg');
INSERT INTO `t_flate` VALUES ('29', '1', '年轻人最喜欢的方式！', '社交', '9c584da6-ee96-4798-b531-d79749881090aas.jpg');
INSERT INTO `t_flate` VALUES ('30', '0', '运动有益于健康！！', '运动', 'c8ad5001-098b-4bc7-b1b6-1909b2d16cdbfg.jpg');

-- ----------------------------
-- Table structure for `t_lifeedu`
-- ----------------------------
DROP TABLE IF EXISTS `t_lifeedu`;
CREATE TABLE `t_lifeedu` (
  `id` int(11) NOT NULL,
  `education` varchar(20) DEFAULT NULL,
  `hide` tinyint(4) DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lifeedu
-- ----------------------------
INSERT INTO `t_lifeedu` VALUES ('1', '本科', '0', '南航');
INSERT INTO `t_lifeedu` VALUES ('2', '博士', '0', '南大');

-- ----------------------------
-- Table structure for `t_lifework`
-- ----------------------------
DROP TABLE IF EXISTS `t_lifework`;
CREATE TABLE `t_lifework` (
  `id` int(11) NOT NULL,
  `company` varchar(30) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  `hide` tinyint(4) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lifework
-- ----------------------------
INSERT INTO `t_lifework` VALUES ('1', '百度', '开发部', '0', 'JAVA程序员');
INSERT INTO `t_lifework` VALUES ('2', '乐视', '人力资源部', '0', '主管');

-- ----------------------------
-- Table structure for `t_reply`
-- ----------------------------
DROP TABLE IF EXISTS `t_reply`;
CREATE TABLE `t_reply` (
  `replyId` int(11) NOT NULL AUTO_INCREMENT,
  `deleteFlag` tinyint(4) DEFAULT NULL,
  `replyContent` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `replyTime` datetime DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`replyId`),
  KEY `FKA0E54F5F81459EE4` (`user_id`),
  KEY `FKA0E54F5F7E2C8B90` (`topic_id`),
  CONSTRAINT `FKA0E54F5F7E2C8B90` FOREIGN KEY (`topic_id`) REFERENCES `t_topic` (`topicId`),
  CONSTRAINT `FKA0E54F5F81459EE4` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_reply
-- ----------------------------
INSERT INTO `t_reply` VALUES ('1', '0', '还不错！', '2017-03-13 19:42:51', '1', '1');
INSERT INTO `t_reply` VALUES ('2', '0', '\"dsadd\"', '2017-03-16 12:32:55', '1', '1');
INSERT INTO `t_reply` VALUES ('3', '0', '1211', '2017-03-16 13:09:57', '1', '1');
INSERT INTO `t_reply` VALUES ('4', '0', '1211', '2017-03-16 13:11:08', '1', '1');
INSERT INTO `t_reply` VALUES ('5', '0', '你啊hi哦', '2017-03-16 13:12:44', '1', '1');
INSERT INTO `t_reply` VALUES ('6', '0', '\\f231\\f231\\f231', '2017-03-16 13:40:33', '1', '1');
INSERT INTO `t_reply` VALUES ('7', '0', '为什么不能识别？', '2017-03-16 14:16:19', '1', '1');
INSERT INTO `t_reply` VALUES ('8', '0', '为什么不能识别？', '2017-03-16 14:16:20', '1', '1');
INSERT INTO `t_reply` VALUES ('13', '0', '还不错啊 ', '2017-03-16 16:15:37', '3', '1');
INSERT INTO `t_reply` VALUES ('14', '0', '还不错【表情', '2017-03-16 16:16:25', '3', '1');
INSERT INTO `t_reply` VALUES ('15', '0', '测试！', '2017-03-16 16:18:51', '2', '1');
INSERT INTO `t_reply` VALUES ('16', '0', '你好！', '2017-03-16 16:21:47', '3', '1');
INSERT INTO `t_reply` VALUES ('17', '0', '你好！！！！', '2017-03-16 16:23:14', '3', '1');
INSERT INTO `t_reply` VALUES ('18', '0', '你是！！！', '2017-03-16 16:24:07', '3', '1');
INSERT INTO `t_reply` VALUES ('19', '0', '你是！！！', '2017-03-16 16:24:15', '3', '1');
INSERT INTO `t_reply` VALUES ('20', '0', '真的好啊？', '2017-03-16 16:28:05', '2', '1');
INSERT INTO `t_reply` VALUES ('21', '0', '东塾读书记1', '2017-03-16 16:32:48', '2', '1');
INSERT INTO `t_reply` VALUES ('22', '0', 'model.js', '2017-03-16 16:34:24', '2', '1');
INSERT INTO `t_reply` VALUES ('23', '0', 'model.js', '2017-03-16 16:43:10', '2', '1');
INSERT INTO `t_reply` VALUES ('24', '0', '我好奇啊', '2017-03-16 16:48:06', '1', '1');
INSERT INTO `t_reply` VALUES ('25', '0', '傻逼 ！', '2017-03-16 16:51:18', '2', '1');
INSERT INTO `t_reply` VALUES ('26', '0', '你是', '2017-03-16 17:01:54', '1', '1');
INSERT INTO `t_reply` VALUES ('27', '0', '为什么没啊 啊啊啊啊啊啊 ', '2017-03-16 17:03:03', '1', '1');
INSERT INTO `t_reply` VALUES ('28', '0', '为什么没啊 啊啊啊啊啊啊 ', '2017-03-16 17:09:48', '1', '1');
INSERT INTO `t_reply` VALUES ('29', '0', '哈哈哈', '2017-03-16 17:13:15', '1', '1');
INSERT INTO `t_reply` VALUES ('30', '0', '有病把你', '2017-03-16 17:18:15', '1', '1');
INSERT INTO `t_reply` VALUES ('31', '0', '有病把你', '2017-03-16 17:21:55', '1', '1');
INSERT INTO `t_reply` VALUES ('32', '0', '第三方浪费！！！', '2017-03-16 17:23:27', '1', '1');
INSERT INTO `t_reply` VALUES ('33', '0', '真是垃圾的网站！！', '2017-03-16 17:25:18', '1', '1');
INSERT INTO `t_reply` VALUES ('34', '0', '测试啊 ', '2017-03-16 17:30:35', '2', '1');
INSERT INTO `t_reply` VALUES ('35', '0', '真的啊 啊 ', '2017-03-16 17:31:04', '2', '1');
INSERT INTO `t_reply` VALUES ('36', '0', '你好！！！', '2017-03-16 17:37:15', '2', '1');
INSERT INTO `t_reply` VALUES ('37', '0', '真的是这样的吗？', '2017-03-16 17:52:58', '3', '1');
INSERT INTO `t_reply` VALUES ('38', '0', '你好 ！！', '2017-03-18 14:12:56', '1', '1');
INSERT INTO `t_reply` VALUES ('39', '0', '点点滴滴', '2017-03-18 15:33:44', '1', '1');

-- ----------------------------
-- Table structure for `t_security`
-- ----------------------------
DROP TABLE IF EXISTS `t_security`;
CREATE TABLE `t_security` (
  `id` int(11) NOT NULL,
  `hide` tinyint(4) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `securityEmail` varchar(20) DEFAULT NULL,
  `securityID` varchar(20) DEFAULT NULL,
  `securityTEL` varchar(20) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_security
-- ----------------------------
INSERT INTO `t_security` VALUES ('0', '0', '1', '1', '11', '1111', '1');
INSERT INTO `t_security` VALUES ('1', '0', '1', '2', '1123', '111111', '2');

-- ----------------------------
-- Table structure for `t_topic`
-- ----------------------------
DROP TABLE IF EXISTS `t_topic`;
CREATE TABLE `t_topic` (
  `topicId` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `deleteFlag` tinyint(4) DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `flate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `findFlag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`topicId`),
  KEY `FKA10609A41765C270` (`flate_id`),
  KEY `FKA10609A481459EE4` (`user_id`),
  CONSTRAINT `FKA10609A41765C270` FOREIGN KEY (`flate_id`) REFERENCES `t_flate` (`flateId`),
  CONSTRAINT `FKA10609A481459EE4` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_topic
-- ----------------------------
INSERT INTO `t_topic` VALUES ('1', '2017-03-13 16:25:40', '0', '第三方发的发顺丰到付', '萨顶顶', '1', '26', '1', '1');
INSERT INTO `t_topic` VALUES ('2', '2017-03-15 16:52:46', '0', '这是一个测试！！！！！！！！！！！！！', '测试话题！！！', '1', '26', '2', '1');
INSERT INTO `t_topic` VALUES ('3', '2017-03-16 16:10:55', '0', '爱的方式地方', '我哦我我', '1', '26', '1', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `deleteFlag` tinyint(4) DEFAULT NULL,
  `EXCHANGE_ID` int(11) DEFAULT NULL,
  `LIFEEDU_ID` int(11) DEFAULT NULL,
  `LIFEWORK_ID` int(11) DEFAULT NULL,
  `USERBASE_ID` int(11) DEFAULT NULL,
  `SECURITY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FKCB63CCB6A801B064` (`USERBASE_ID`),
  KEY `FKCB63CCB6F8A49E10` (`LIFEEDU_ID`),
  KEY `FKCB63CCB6E6C7FEC4` (`LIFEWORK_ID`),
  KEY `FKCB63CCB61859B704` (`EXCHANGE_ID`),
  KEY `FKCB63CCB6D5ED59C4` (`SECURITY_ID`),
  CONSTRAINT `FKCB63CCB61859B704` FOREIGN KEY (`EXCHANGE_ID`) REFERENCES `t_exchange` (`id`),
  CONSTRAINT `FKCB63CCB6A801B064` FOREIGN KEY (`USERBASE_ID`) REFERENCES `t_userbase` (`id`),
  CONSTRAINT `FKCB63CCB6D5ED59C4` FOREIGN KEY (`SECURITY_ID`) REFERENCES `t_security` (`id`),
  CONSTRAINT `FKCB63CCB6E6C7FEC4` FOREIGN KEY (`LIFEWORK_ID`) REFERENCES `t_lifework` (`id`),
  CONSTRAINT `FKCB63CCB6F8A49E10` FOREIGN KEY (`LIFEEDU_ID`) REFERENCES `t_lifeedu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '0', '1', '1', '1', '1', '0');
INSERT INTO `t_user` VALUES ('2', '0', '2', '2', '2', '1', '1');
INSERT INTO `t_user` VALUES ('4', '0', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('5', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_userbase`
-- ----------------------------
DROP TABLE IF EXISTS `t_userbase`;
CREATE TABLE `t_userbase` (
  `id` int(11) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `birthDay` datetime DEFAULT NULL,
  `hide` tinyint(4) DEFAULT NULL,
  `imageUrl` varchar(200) DEFAULT NULL,
  `lookNumber` int(11) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userbase
-- ----------------------------
INSERT INTO `t_userbase` VALUES ('1', '北京', '2015-01-01 10:54:06', '0', 'c195a185-be5d-4bc6-9053-e898e8c07c94aas.jpg', '55', '0', 'yjb');
INSERT INTO `t_userbase` VALUES ('2', '南昌', '2017-03-19 11:43:22', '0', '33a757c7-f0fb-4812-8ebd-fd7069b44e97hello4.jpg', '55', '0', 'ccc');

-- ----------------------------
-- Table structure for `t_user_flate`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_flate`;
CREATE TABLE `t_user_flate` (
  `flate_look_id` int(11) NOT NULL,
  `user_look_id` int(11) NOT NULL,
  PRIMARY KEY (`flate_look_id`,`user_look_id`),
  KEY `FK2FF53F4339F2C9CA` (`flate_look_id`),
  KEY `FK2FF53F43F9D37B1C` (`user_look_id`),
  CONSTRAINT `FK2FF53F4339F2C9CA` FOREIGN KEY (`flate_look_id`) REFERENCES `t_flate` (`flateId`),
  CONSTRAINT `FK2FF53F43F9D37B1C` FOREIGN KEY (`user_look_id`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_flate
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user_topic`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_topic`;
CREATE TABLE `t_user_topic` (
  `topic_look_id` int(11) NOT NULL,
  `user_look_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_look_id`,`user_look_id`),
  KEY `FK30BC1C666EAEB110` (`topic_look_id`),
  KEY `FK30BC1C66F9D37B1C` (`user_look_id`),
  CONSTRAINT `FK30BC1C666EAEB110` FOREIGN KEY (`topic_look_id`) REFERENCES `t_topic` (`topicId`),
  CONSTRAINT `FK30BC1C66F9D37B1C` FOREIGN KEY (`user_look_id`) REFERENCES `t_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_topic
-- ----------------------------
