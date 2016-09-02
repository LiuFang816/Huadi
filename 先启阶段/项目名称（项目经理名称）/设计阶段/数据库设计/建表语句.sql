/*
Navicat MySQL Data Transfer

Source Server         : CRM
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : village

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2016-03-12 10:54:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fund
-- ----------------------------
DROP TABLE IF EXISTS `fund`;
CREATE TABLE `fund` (
  `fund_id` int(11) NOT NULL auto_increment,
  `date` date default NULL,
  `money` varchar(20) default NULL,
  `type` int(1) default NULL,
  PRIMARY KEY  (`fund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for infrastructure
-- ----------------------------
DROP TABLE IF EXISTS `infrastructure`;
CREATE TABLE `infrastructure` (
  `infrastructure_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `position` varchar(255) default NULL,
  `purpose` text,
  `date` date default NULL,
  `money` varchar(255) default NULL,
  `responsible` varchar(255) default NULL,
  PRIMARY KEY  (`infrastructure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for loan
-- ----------------------------
DROP TABLE IF EXISTS `loan`;
CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL auto_increment,
  `status` int(11) default NULL,
  `date` date default NULL,
  `deadline` varchar(20) default NULL,
  `reason` text,
  `bondsman` varchar(20) default NULL,
  `bondsman_id` varchar(20) default NULL,
  `money` varchar(20) default NULL,
  `time` timestamp NULL default CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`loan_id`),
  KEY `FK_loan` (`user_id`),
  CONSTRAINT `FK_loan` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for poor
-- ----------------------------
DROP TABLE IF EXISTS `poor`;
CREATE TABLE `poor` (
  `poor_id` int(11) NOT NULL auto_increment,
  `status` int(11) default NULL,
  `date` date default NULL,
  `money` varchar(20) default NULL,
  `situation` text,
  `time` timestamp NULL default CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`poor_id`),
  KEY `FK_poor` (`user_id`),
  CONSTRAINT `FK_poor` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `property_id` int(11) NOT NULL auto_increment,
  `type` int(1) default NULL,
  `date` date default NULL,
  `name` varchar(20) default NULL,
  `money` varchar(20) default NULL,
  `number` int(10) default NULL,
  `principal` varchar(20) default NULL,
  `purpose` text,
  `status` int(1) default NULL,
  PRIMARY KEY  (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resource_id` int(11) NOT NULL auto_increment,
  `type` int(1) default NULL,
  `name` varchar(20) default NULL,
  `date` date default NULL,
  `area` varchar(20) default NULL,
  `money` varchar(20) default NULL,
  `purpose` text,
  `principal` varchar(20) default NULL,
  `status` int(1) default NULL,
  PRIMARY KEY  (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `user_id` int(11) NOT NULL,
  `session_cur_id` varchar(255) default NULL,
  PRIMARY KEY  (`user_id`),
  CONSTRAINT `FK_session` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for trace
-- ----------------------------
DROP TABLE IF EXISTS `trace`;
CREATE TABLE `trace` (
  `trace_id` int(11) NOT NULL auto_increment,
  `loan_id` int(11) default NULL,
  `poor_id` int(11) default NULL,
  `first_time` timestamp NULL default NULL,
  `second_time` timestamp NULL default NULL,
  `first_reason` varchar(256) default NULL,
  `second_reason` varchar(256) default NULL,
  `first_id` int(11) default '0',
  `second_id` int(11) default '0',
  PRIMARY KEY  (`trace_id`),
  KEY `FK_trace2` (`poor_id`),
  KEY `FK_trace1` (`loan_id`),
  CONSTRAINT `FK_trace1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_trace2` FOREIGN KEY (`poor_id`) REFERENCES `poor` (`poor_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `username` varchar(20) default NULL,
  `password` varchar(255) default NULL,
  `user_level` int(1) default NULL,
  `flag` int(1) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for usermsg
-- ----------------------------
DROP TABLE IF EXISTS `usermsg`;
CREATE TABLE `usermsg` (
  `user_id` int(11) NOT NULL,
  `person_name` varchar(20) default NULL,
  `gender` int(1) default NULL,
  `id` varchar(20) default NULL,
  `phone` varchar(20) default NULL,
  `birthday` varchar(20) default NULL,
  `address` text,
  `picture` varchar(255) default NULL,
  PRIMARY KEY  (`user_id`),
  CONSTRAINT `FK_usermsg` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
