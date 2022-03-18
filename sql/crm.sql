/*
Navicat MySQL Data Transfer

Source Server         : .
Source Server Version : 80027
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 80027
File Encoding         : 65001

Date: 2022-03-18 10:19:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for custo
-- ----------------------------
DROP TABLE IF EXISTS `custo`;
CREATE TABLE `custo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CustoName` varchar(50) NOT NULL COMMENT '客户姓名',
  `CustoComp` varchar(100) NOT NULL COMMENT '客户所在单位',
  `CustoPost` varchar(50) NOT NULL COMMENT '客户职务',
  `CustoMobile` varchar(50) NOT NULL COMMENT '客户手机',
  `CustoPhone` varchar(50) DEFAULT NULL COMMENT '客户电话',
  `CustoAddress` varchar(255) NOT NULL COMMENT '客户地址',
  `CustoCode` varchar(50) NOT NULL COMMENT '邮政编码',
  `CustoEntryName` varchar(100) NOT NULL COMMENT '项目名称',
  `CustoLocation` varchar(255) NOT NULL COMMENT '项目地点',
  `CustoBudget` varchar(50) NOT NULL COMMENT '项目预算',
  `CustoCycle` varchar(50) NOT NULL COMMENT '项目周期',
  `CustoSource` varchar(50) NOT NULL COMMENT '项目来源',
  `CustoStage` int NOT NULL COMMENT '项目目前阶段',
  `CustoSitua` varchar(500) NOT NULL COMMENT '项目情况',
  `CustoPerson` varchar(50) NOT NULL COMMENT '项目负责人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of custo
-- ----------------------------

-- ----------------------------
-- Table structure for employ
-- ----------------------------
DROP TABLE IF EXISTS `employ`;
CREATE TABLE `employ` (
  `id` int NOT NULL AUTO_INCREMENT,
  `EmplName` varchar(50) NOT NULL COMMENT '姓名',
  `EmplPwd` varchar(50) NOT NULL COMMENT '密码',
  `EmplDepa` int NOT NULL COMMENT '部门',
  `EmplRegion` int DEFAULT NULL COMMENT '工程部和销售部分区域',
  `EmplPost` int NOT NULL COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employ
-- ----------------------------
INSERT INTO `employ` VALUES ('1', 'liuz', '123456', '1', '2', '1');
INSERT INTO `employ` VALUES ('2', 'zhangs', '123456', '2', '2', '2');
INSERT INTO `employ` VALUES ('3', 'lis', '879546', '2', '2', '2');
INSERT INTO `employ` VALUES ('4', 'qusl', '123456', '8', '5', '2');
INSERT INTO `employ` VALUES ('5', 'wangw', '123456', '7', '1', '1');
INSERT INTO `employ` VALUES ('7', 'zhaol', '123456', '3', '0', '1');
INSERT INTO `employ` VALUES ('12', 'libai', '654321', '2', '4', '2');
INSERT INTO `employ` VALUES ('14', 'wangs', '123456', '2', '0', '1');
INSERT INTO `employ` VALUES ('15', 'admin', '123456', '2', '1', '2');

-- ----------------------------
-- Table structure for employdetails
-- ----------------------------
DROP TABLE IF EXISTS `employdetails`;
CREATE TABLE `employdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `uphone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机',
  `educ` int NOT NULL COMMENT '学历',
  `mari` int NOT NULL COMMENT '婚姻状况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employdetails
-- ----------------------------
INSERT INTO `employdetails` VALUES ('1', 'liuz', '13876448745', '1', '1');
INSERT INTO `employdetails` VALUES ('2', 'zhangs', '13811111111', '4', '2');

-- ----------------------------
-- Table structure for employlog
-- ----------------------------
DROP TABLE IF EXISTS `employlog`;
CREATE TABLE `employlog` (
  `id` int NOT NULL,
  `todaywork` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '今天工作内容',
  `tomowork` varchar(1000) NOT NULL COMMENT '明日工作计划',
  `datetimes` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employlog
-- ----------------------------
