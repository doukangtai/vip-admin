/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : vip

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 29/11/2020 11:41:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double(11, 2) NULL DEFAULT NULL,
  `is_logout_vip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1代表注销会员卡，0代表未注销会员卡',
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  INDEX `fk_customer_vip_1`(`vid`) USING BTREE,
  CONSTRAINT `fk_customer_vip_1` FOREIGN KEY (`vid`) REFERENCES `vip` (`vid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 1, '吕伟杰', '15550310500', '123456', 100.00, '0');
INSERT INTO `customer` VALUES (2, 3, '陈一路', '15550310501', '123456', 2000.00, '0');
INSERT INTO `customer` VALUES (3, 1, '邓燕', '15550310502', '123456', 1350.00, '0');
INSERT INTO `customer` VALUES (4, 1, '李俊辉', '15550310503', '123456', 1000.00, '0');
INSERT INTO `customer` VALUES (5, 2, '奉小英', '15550310504', '1234567', 0.00, '1');
INSERT INTO `customer` VALUES (6, 3, '陈思', '15550310505', '123456', 3000.00, '0');
INSERT INTO `customer` VALUES (7, 2, '董云芳', '15550310506', '123456', 5000.00, '0');
INSERT INTO `customer` VALUES (8, 1, '张月霞', '15550310507', '123456', 3300.00, '0');
INSERT INTO `customer` VALUES (9, 3, '姚丽', '15550310508', '123456', 5000.00, '0');
INSERT INTO `customer` VALUES (10, 2, '曹秀兰', '15550310509', '123456', 102.00, '0');
INSERT INTO `customer` VALUES (11, 1, '马彩华', '15550310510', '123456', 0.00, '1');
INSERT INTO `customer` VALUES (12, 3, '岳克兰', '15550310511', '123456', 2000.00, '0');
INSERT INTO `customer` VALUES (13, 1, '王梅', '15550310512', '123456', 0.00, '0');
INSERT INTO `customer` VALUES (14, 3, '石生莲', '15550310513', '123456', 20.00, '0');
INSERT INTO `customer` VALUES (15, 1, '魏捷', '15550310514', '123456', 437.60, '0');
INSERT INTO `customer` VALUES (16, 2, '陈礼艳', '15550310515', '123456', 100.00, '0');
INSERT INTO `customer` VALUES (17, 1, '李炯', '15550310516', '123456', 100.00, '0');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0代表员工，1代表老板',
  `is_fire` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1代表被解雇，0代表任职中',
  PRIMARY KEY (`eid`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '王军业', '15550310400', '123456', '山东省淄博市张店区', '1', '0');
INSERT INTO `employee` VALUES (2, '先磊', '15550310401', '123456', '山东省济南市', '0', '0');
INSERT INTO `employee` VALUES (3, '李娅', '15550310402', '123456', '山东省青岛市', '0', '1');
INSERT INTO `employee` VALUES (4, '赵珊', '15550310403', '123456', '山东省青岛市', '0', '0');
INSERT INTO `employee` VALUES (5, '周清兰', '15550310405', '123456', '山东省济南市', '0', '0');
INSERT INTO `employee` VALUES (7, '李丹', '15550310406', '123456', '山东省济南市', '0', '1');
INSERT INTO `employee` VALUES (9, '谢勤', '15550310407', '123456', '山东省济南市章丘区', '0', '1');
INSERT INTO `employee` VALUES (10, '李贵', '15550310408', '123456', '山东省济南市', '0', '1');
INSERT INTO `employee` VALUES (11, '黄学林', '15550310409', '1234567', '山东省济南市章丘区', '0', '1');
INSERT INTO `employee` VALUES (12, '李芝荣', '15550310410', '123456', '山东省济南市', '0', '0');
INSERT INTO `employee` VALUES (13, '龙艳', '15550310411', '123456', '山东省济南市章丘区', '0', '1');
INSERT INTO `employee` VALUES (14, '李国庆', '15550310412', '1234567', '山东省济南市章丘区', '0', '1');
INSERT INTO `employee` VALUES (15, '袁晓红', '15550310413', '1234567', '山东省济南市章丘区', '0', '1');
INSERT INTO `employee` VALUES (16, '李洁', '15550310414', '123456', '山东省济南市', '0', '1');
INSERT INTO `employee` VALUES (17, '赵茂清', '15550310415', '123456', '山东省济南市', '0', '1');
INSERT INTO `employee` VALUES (18, '邹建军', '15550310416', '123456', '山东省青岛市', '0', '0');

-- ----------------------------
-- Table structure for fee
-- ----------------------------
DROP TABLE IF EXISTS `fee`;
CREATE TABLE `fee`  (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fee
-- ----------------------------
INSERT INTO `fee` VALUES (1, '洗剪吹', 40.00);
INSERT INTO `fee` VALUES (2, '时尚冷烫烫发', 198.00);
INSERT INTO `fee` VALUES (3, '精品烫发、染发', 300.00);
INSERT INTO `fee` VALUES (4, '健康发质烫染', 490.00);
INSERT INTO `fee` VALUES (5, '烫染护私人订制套餐', 688.00);
INSERT INTO `fee` VALUES (7, '吹干', 10.00);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NULL DEFAULT NULL,
  `cid` int(11) NULL DEFAULT NULL,
  `fname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fprice` double(11, 2) NULL DEFAULT NULL,
  `vname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vdiscount` double(11, 2) NULL DEFAULT NULL,
  `money` double(11, 2) NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`lid`) USING BTREE,
  INDEX `fk_log_customer_1`(`cid`) USING BTREE,
  INDEX `fk_log_employee_1`(`eid`) USING BTREE,
  CONSTRAINT `fk_log_customer_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_log_employee_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 5, 7, '时尚冷烫烫发', 198.00, '黄金会员', 0.65, 128.70, '2020-11-21 17:03:50');
INSERT INTO `log` VALUES (2, 1, 12, '烫染护私人订制套餐', 688.00, '黄金会员', 0.65, 447.20, '2020-11-21 17:12:26');
INSERT INTO `log` VALUES (3, 4, 12, '烫染护私人订制套餐', 688.00, '黄金会员', 0.65, 447.20, '2020-11-21 17:15:55');
INSERT INTO `log` VALUES (4, 1, 1, '时尚冷烫烫发', 198.00, '钻石会员', 0.50, 99.00, '2020-11-21 17:17:05');
INSERT INTO `log` VALUES (6, 5, 15, '洗剪吹', 40.00, '普通会员', 0.80, 32.00, '2020-11-29 11:13:12');
INSERT INTO `log` VALUES (7, 5, 15, '烫染护私人订制套餐', 688.00, '普通会员', 0.80, 550.40, '2020-11-29 11:13:29');

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip`  (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` double(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES (1, '普通会员', 0.80);
INSERT INTO `vip` VALUES (2, '黄金会员', 0.65);
INSERT INTO `vip` VALUES (3, '钻石会员', 0.55);

SET FOREIGN_KEY_CHECKS = 1;
