/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : opple

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2023-02-06 15:08:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `card`
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `cardId` char(20) NOT NULL,
  `name` char(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `telephone` char(20) DEFAULT NULL,
  `address` char(50) DEFAULT NULL,
  PRIMARY KEY (`cardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES ('p20004', '徐梅', '2020-05-01', '13905789098', '晋江');
INSERT INTO `card` VALUES ('r100001', '陈聪', '2020-04-30', '12900071124', '泉州');
INSERT INTO `card` VALUES ('r200001', '李于蓝', '2020-03-01', '12415727854', '福州');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `cartTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '35', '15', '1', '0', '2020-04-27 00:00:00');
INSERT INTO `cart` VALUES ('2', '36', '17', '2', '0', '2020-04-27 00:00:00');
INSERT INTO `cart` VALUES ('3', '37', '18', '5', '0', '2020-04-27 00:00:00');
INSERT INTO `cart` VALUES ('4', '36', '0', '1', '0', '2020-05-01 00:00:00');
INSERT INTO `cart` VALUES ('5', '41', '0', '5', '0', '2020-05-01 10:35:38');
INSERT INTO `cart` VALUES ('6', '40', '0', '4', '0', '2020-05-01 09:37:35');
INSERT INTO `cart` VALUES ('7', '41', '75', '1', '0', '2020-05-01 10:53:27');
INSERT INTO `cart` VALUES ('8', '40', '75', '6', '0', '2020-05-11 16:36:41');
INSERT INTO `cart` VALUES ('9', '39', '75', '3', '0', '2020-05-11 16:13:00');
INSERT INTO `cart` VALUES ('10', '36', '60', '1', '0', '2020-05-08 16:50:19');
INSERT INTO `cart` VALUES ('11', '35', '60', '1', '0', '2020-05-08 17:09:07');
INSERT INTO `cart` VALUES ('12', '37', '60', '1', '0', '2020-05-08 17:14:49');
INSERT INTO `cart` VALUES ('13', '35', '75', '36', '0', '2020-05-14 20:11:16');
INSERT INTO `cart` VALUES ('14', '36', '75', '11', '0', '2020-05-12 10:53:11');
INSERT INTO `cart` VALUES ('15', '35', '61', '1', '0', '2020-05-08 21:22:57');
INSERT INTO `cart` VALUES ('16', '36', '61', '1', '0', '2020-05-08 21:23:13');
INSERT INTO `cart` VALUES ('17', '37', '61', '1', '0', '2020-05-08 21:23:51');
INSERT INTO `cart` VALUES ('18', '37', '75', '6', '0', '2020-05-11 16:05:22');
INSERT INTO `cart` VALUES ('19', '38', '75', '1', '0', '2020-05-11 15:20:02');
INSERT INTO `cart` VALUES ('20', '36', '79', '1', '0', '2020-05-13 09:23:49');
INSERT INTO `cart` VALUES ('21', '35', '79', '3', '0', '2020-05-13 09:35:36');
INSERT INTO `cart` VALUES ('22', '35', '82', '2', '0', '2020-05-16 06:52:49');
INSERT INTO `cart` VALUES ('23', '35', '81', '8', '0', '2020-05-14 22:14:28');
INSERT INTO `cart` VALUES ('24', '36', '82', '1', '0', '2020-05-16 06:54:07');
INSERT INTO `cart` VALUES ('25', '35', '0', '7', '0', null);
INSERT INTO `cart` VALUES ('26', '47', '0', '14', '0', null);
INSERT INTO `cart` VALUES ('27', '42', '0', '1', '0', '2022-09-21 12:55:36');
INSERT INTO `cart` VALUES ('28', '46', '0', '1', '0', '2022-09-28 16:18:32');
INSERT INTO `cart` VALUES ('29', '44', '0', '1', '0', '2022-10-04 18:09:41');
INSERT INTO `cart` VALUES ('30', '47', '86', '4', '0', '2022-10-04 20:19:38');
INSERT INTO `cart` VALUES ('38', '35', '86', '1', '0', '2022-10-04 20:02:32');
INSERT INTO `cart` VALUES ('39', '39', '86', '1', '0', '2022-10-05 08:20:21');

-- ----------------------------
-- Table structure for `delivery`
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '送货id',
  `uid` int(8) DEFAULT NULL,
  `oid` int(8) DEFAULT NULL COMMENT '订单号',
  `image` varchar(255) DEFAULT NULL COMMENT '送货完成拍照',
  `deliverydate` datetime DEFAULT NULL COMMENT '送货时间',
  `state` varchar(20) DEFAULT NULL COMMENT '送货状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of delivery
-- ----------------------------

-- ----------------------------
-- Table structure for `install`
-- ----------------------------
DROP TABLE IF EXISTS `install`;
CREATE TABLE `install` (
  `id` int(8) NOT NULL,
  `uid` int(8) DEFAULT NULL,
  `oid` int(8) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `installdate` datetime DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of install
-- ----------------------------

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` varchar(50) NOT NULL,
  `money` double DEFAULT NULL COMMENT '总价格',
  `number` int(8) DEFAULT NULL COMMENT '总件数',
  `receiverAddress` varchar(255) DEFAULT NULL COMMENT '收货人地址',
  `receiverName` varchar(20) DEFAULT NULL COMMENT '收货人姓名',
  `receiverPhone` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `paystate` varchar(20) DEFAULT '0' COMMENT '付款状态',
  `ordertime` datetime DEFAULT NULL COMMENT '下单时间',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('0_2022-09-08 10:40:10', '0', '0', '', null, '', '0', '2022-09-08 10:40:10', '0');
INSERT INTO `order` VALUES ('0_2022-09-08 10:41:16', '221', '6', '', null, '', '0', '2022-09-08 10:41:16', '0');
INSERT INTO `order` VALUES ('0_2022-09-28 13:56:02', '46', '2', '', null, '', '0', '2022-09-28 13:56:02', '0');
INSERT INTO `order` VALUES ('0_2022-09-28 16:02:57', '99', '4', '', null, '', '0', '2022-09-28 16:02:57', '0');
INSERT INTO `order` VALUES ('0_2022-09-28 16:14:32', '133', '5', '', null, '', '1', '2022-09-28 16:14:32', '15');
INSERT INTO `order` VALUES ('0_2022-09-28 16:18:45', '112', '5', '福建泉州', null, '1395867840', '1', '2022-09-28 16:18:45', '15');
INSERT INTO `order` VALUES ('1', '100', '3', '泉州市东美小区', '李明', '15880744103', '1', '2020-02-15 10:33:19', '12');
INSERT INTO `order` VALUES ('2', '158', '2', '泉州市东美小区', '艾拉', '13421511511', '1', '2020-02-04 10:33:49', '15');
INSERT INTO `order` VALUES ('3', '199', '2', '泉州市东美小区', '杰瑞', '15472523677', '1', '2020-02-12 10:35:03', '12');
INSERT INTO `order` VALUES ('4', '1895', '3', '厦门市东岳小区8#1306', '赵鹏程', '13304567887', '0', '2020-02-15 10:36:20', '12');
INSERT INTO `order` VALUES ('5', '2008', '3', '厦门市莲花三区8#1906', '孙明明', '13345450609', '1', '2020-02-11 10:37:59', '15');
INSERT INTO `order` VALUES ('81_2020-05-14 22:06:55', '60', '5', '福建宁德', null, '13875756345', '0', '2020-05-14 22:06:55', '81');
INSERT INTO `order` VALUES ('81_2020-05-14 22:10:54', '48', '4', '福建宁德', null, '13875756345', '0', '2020-05-14 22:10:54', '81');
INSERT INTO `order` VALUES ('81_2020-05-14 22:14:35', '84', '7', '福建宁德', null, '13875756345', '0', '2020-05-14 22:14:35', '81');
INSERT INTO `order` VALUES ('82_2020-05-16 06:52:59', '36', '3', '福建泉州洛江区', null, '13547543352', '0', '2020-05-16 06:52:59', '82');
INSERT INTO `order` VALUES ('82_2020-05-16 06:54:18', '848', '4', '福建泉州洛江区', null, '13547543352', '0', '2020-05-16 06:54:18', '82');
INSERT INTO `order` VALUES ('86_2022-10-04 19:33:47', '68', '2', '福建泉州丰泽区东海街道209号', null, '13867474225', '1', '2022-10-04 19:33:47', '86');
INSERT INTO `order` VALUES ('86_2022-10-04 20:00:34', '34', '1', '福建泉州丰泽区东海街道209号', null, '13867474225', '1', '2022-10-04 20:00:34', '86');
INSERT INTO `order` VALUES ('86_2022-10-04 20:03:39', '46', '2', '福建泉州丰泽区东海街道209号', null, '13867474225', '1', '2022-10-04 20:03:39', '86');
INSERT INTO `order` VALUES ('86_2022-10-05 08:21:01', '137', '5', '福建泉州丰泽区东海街道209号', null, '13867474225', '1', '2022-10-05 08:21:01', '86');

-- ----------------------------
-- Table structure for `orderlist`
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `oid` varchar(50) NOT NULL,
  `pid` int(8) DEFAULT NULL,
  `buynum` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES ('1', '81_2020-05-14 22:14:35', '35', '8');
INSERT INTO `orderlist` VALUES ('2', '82_2020-05-16 06:52:59', '35', '2');
INSERT INTO `orderlist` VALUES ('3', '82_2020-05-16 06:54:18', '35', '2');
INSERT INTO `orderlist` VALUES ('4', '82_2020-05-16 06:54:18', '36', '1');
INSERT INTO `orderlist` VALUES ('5', '0_2022-09-08 10:40:10', '36', '1');
INSERT INTO `orderlist` VALUES ('6', '0_2022-09-08 10:40:10', '40', '4');
INSERT INTO `orderlist` VALUES ('7', '0_2022-09-08 10:40:10', '35', '1');
INSERT INTO `orderlist` VALUES ('8', '0_2022-09-08 10:41:16', '36', '1');
INSERT INTO `orderlist` VALUES ('9', '0_2022-09-08 10:41:16', '40', '4');
INSERT INTO `orderlist` VALUES ('10', '0_2022-09-08 10:41:16', '35', '1');
INSERT INTO `orderlist` VALUES ('11', '0_2022-09-28 13:56:02', '36', '1');
INSERT INTO `orderlist` VALUES ('12', '0_2022-09-28 13:56:02', '35', '1');
INSERT INTO `orderlist` VALUES ('13', '0_2022-09-28 13:56:02', '47', '2');
INSERT INTO `orderlist` VALUES ('14', '0_2022-09-28 13:56:02', '42', '1');
INSERT INTO `orderlist` VALUES ('15', '0_2022-09-28 16:02:57', '36', '1');
INSERT INTO `orderlist` VALUES ('16', '0_2022-09-28 16:02:57', '35', '1');
INSERT INTO `orderlist` VALUES ('17', '0_2022-09-28 16:02:57', '47', '10');
INSERT INTO `orderlist` VALUES ('18', '0_2022-09-28 16:02:57', '42', '1');
INSERT INTO `orderlist` VALUES ('19', '0_2022-09-28 16:14:32', '36', '1');
INSERT INTO `orderlist` VALUES ('20', '0_2022-09-28 16:14:32', '35', '1');
INSERT INTO `orderlist` VALUES ('21', '0_2022-09-28 16:14:32', '47', '11');
INSERT INTO `orderlist` VALUES ('22', '0_2022-09-28 16:14:32', '42', '1');
INSERT INTO `orderlist` VALUES ('23', '0_2022-09-28 16:18:45', '36', '1');
INSERT INTO `orderlist` VALUES ('24', '0_2022-09-28 16:18:45', '35', '1');
INSERT INTO `orderlist` VALUES ('25', '0_2022-09-28 16:18:45', '47', '11');
INSERT INTO `orderlist` VALUES ('26', '0_2022-09-28 16:18:45', '42', '1');
INSERT INTO `orderlist` VALUES ('27', '0_2022-09-28 16:18:45', '46', '1');
INSERT INTO `orderlist` VALUES ('28', '86_2022-10-04 19:33:47', '47', '1');
INSERT INTO `orderlist` VALUES ('29', '86_2022-10-04 20:00:34', '47', '2');
INSERT INTO `orderlist` VALUES ('30', '86_2022-10-04 20:03:39', '47', '3');
INSERT INTO `orderlist` VALUES ('31', '86_2022-10-04 20:03:39', '35', '1');
INSERT INTO `orderlist` VALUES ('32', '86_2022-10-05 08:21:01', '47', '4');
INSERT INTO `orderlist` VALUES ('33', '86_2022-10-05 08:21:01', '35', '1');
INSERT INTO `orderlist` VALUES ('34', '86_2022-10-05 08:21:01', '39', '1');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `productname` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `category` varchar(40) DEFAULT NULL COMMENT '类别()',
  `price` double DEFAULT '100' COMMENT '价格',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `barcode` varchar(255) DEFAULT '' COMMENT '条形码',
  `qrcode` varchar(255) DEFAULT NULL COMMENT '二维码',
  `description` varchar(255) DEFAULT NULL COMMENT '产品详情',
  `protime` date DEFAULT NULL COMMENT '生产时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('35', '猴头菇饼干', '饼干', '12', '2.jpg', '12125', '121', '  123 猴头菇饼干，以鸡蛋、黄油为主料的糕点', '2022-04-26');
INSERT INTO `product` VALUES ('36', '卫龙辣条', '辣条', '5', '3.jpg', '2141251', '112', '卫龙辣条 休闲小零食 办公室宿舍零食 ', '2022-04-16');
INSERT INTO `product` VALUES ('37', '奶酪棒', '奶酪', '12', '4.jpg', '41241', '132', '妙可蓝多高钙奶酪棒3支原味54g*1袋即食儿童零食奶酪棒常温奶酪棒', '2022-04-18');
INSERT INTO `product` VALUES ('39', '辣子鸡', '其他', '23', '5.jpg', '124', '111', '麻辣小零食儿时怀旧四川重庆特产小吃口水鸡熟食开袋即食休闲食品', '2022-04-24');
INSERT INTO `product` VALUES ('42', '山药薄片', '膨化食品', '12', '6.jpg', '41241', '123', '灵光山药薄脆原味整箱小包休闲儿童小吃多味脆片网红零食', '2022-05-18');
INSERT INTO `product` VALUES ('44', '鱼豆腐', '豆干', '22', '7.jpg', '2141251', '123', ' 湖南豆干香辣味鱼豆腐', '2022-06-05');
INSERT INTO `product` VALUES ('46', '蟹黄锅巴', '其他', '13', '8.jpg', '41241', '132', '网红蟹黄锅巴蟹香咸蛋黄锅巴糯米锅巴整箱散装小包装手工休闲零食', '2022-06-01');
INSERT INTO `product` VALUES ('47', '小熊饼干', '饼干', '34', '1.jpg', '41241', '132', '曲奇聪明小熊进口手工饼干休闲零食品糕点', '2022-09-14');
INSERT INTO `product` VALUES ('49', '小熊饼干123', '饼干', '34', '2325346.jpg', '2124124', '1215125', 'fEgegwggeg', '2022-10-05');

-- ----------------------------
-- Table structure for `repair`
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `uid` int(8) DEFAULT NULL COMMENT '维修员编号',
  `pid` int(8) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `repairdate` datetime DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repair
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '123',
  `role` varchar(10) DEFAULT '普通用户' COMMENT '用户角色(管理员、普通用户)',
  `registertime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `cardid` char(20) DEFAULT 'r100001',
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15', 'admin', '123', '管理员', '2020-03-12 08:00:00', 'r100001', null, '福建泉州', '13958678406');
INSERT INTO `user` VALUES ('18', 'test02', '123456', '普通用户', '2019-02-12 20:53:17', 'r100004', null, '福建厦门', '13124155156');
INSERT INTO `user` VALUES ('19', '李于蓝', '123456', '普通用户', '2018-02-12 08:00:00', 'r100005', null, '上海浦东', '15155266379');
INSERT INTO `user` VALUES ('22', '陈聪', '123456', '普通用户', '2020-03-03 08:00:00', 'p20004', null, '山西太原', '18636255169');
INSERT INTO `user` VALUES ('28', '徐梅', '123', '普通用户', '2020-03-05 08:00:00', 'r100007', null, '山西太原', '13121241212');
INSERT INTO `user` VALUES ('29', 'luo03052', 'a1b1c1', '普通用户', '2020-03-05 08:00:00', 'r100008', null, '福建泉州洛江区', '13543673473');
INSERT INTO `user` VALUES ('37', 'test01', '123456', '普通用户', '2020-03-05 08:00:00', 'r100009', null, '福建泉州洛江区', '13112425366');
INSERT INTO `user` VALUES ('47', 'test01', '123456', '普通用户', '2020-03-09 00:39:12', 'r100010', null, '福建泉州洛江区', '18325236267');
INSERT INTO `user` VALUES ('53', 'test01', '123456', '普通用户', '2020-03-09 03:15:04', 'r100011', null, '福建泉州洛江区', '13152262637');
INSERT INTO `user` VALUES ('54', 'quwhaufhaih', '111', '普通用户', '2020-03-31 20:24:03', 'r100001', null, '福建省泉州市丰泽区', '13232637784');
INSERT INTO `user` VALUES ('60', 'wew', '111', '普通用户', '2020-04-27 09:38:36', 'r100001', null, '福建省泉州市丰泽区', '15135262362');
INSERT INTO `user` VALUES ('61', '小明', '123', '普通用户', '2020-04-14 08:00:00', 'r124124', null, '福建省泉州市丰泽区', '13215245654');
INSERT INTO `user` VALUES ('68', '11111', '1111', '普通用户', '2020-04-28 16:42:10', 'r100001', null, '福建省泉州市丰泽区', '13121525648');
INSERT INTO `user` VALUES ('69', 'qweq', '111', '普通用户', '2020-01-02 08:00:00', 'r123141', null, '福建省泉州市丰泽区', '13548946352');
INSERT INTO `user` VALUES ('70', '12124125', '111', '普通用户', '2020-04-28 18:09:53', 'r100001', null, '福建省泉州市丰泽区', '13364548362');
INSERT INTO `user` VALUES ('72', '223', '1', '普通用户', '2020-04-28 08:00:00', 'r100001', null, '福建省泉州市丰泽区', '13235346457');
INSERT INTO `user` VALUES ('73', '124124', '111', '普通用户', '2020-04-28 18:12:49', 'r100001', null, '福建省泉州市丰泽区', '17347736252');
INSERT INTO `user` VALUES ('74', 'q124125', '1', '普通用户', '2020-04-28 18:13:27', 'r100001', null, '福建省泉州市丰泽区', '17462626262');
INSERT INTO `user` VALUES ('75', 'aaa', '123', '普通用户', '2020-04-22 08:00:00', 'r100001', null, '福建省泉州市丰泽区', '13195819555');
INSERT INTO `user` VALUES ('76', 'wdawd', '1', '普通用户', '2020-05-01 10:28:46', 'r100001', null, '福建泉州洛江区', '15226475843');
INSERT INTO `user` VALUES ('78', 'wadwd', '111', '普通用户', '2020-05-01 10:35:01', 'r100001', null, '福建泉州洛江区', '17455252633');
INSERT INTO `user` VALUES ('79', 'jkl', '121', '普通用户', '2020-05-13 09:23:35', 'r100001', null, '福建省泉州市丰泽区', '13232573697');
INSERT INTO `user` VALUES ('80', '夏娜', '1', '普通用户', '2020-05-13 08:00:00', 'r151524', null, '福建泉州洛江区', '17345226267');
INSERT INTO `user` VALUES ('81', 're', '111', '普通用户', '2020-05-13 08:00:00', 'r124115', null, '福建宁德', '13875756345');
INSERT INTO `user` VALUES ('82', '泉语', '111', '普通用户', '2020-05-13 08:00:00', 'r100001', null, '福建泉州洛江区', '13547543352');
INSERT INTO `user` VALUES ('83', '12412', '1234', '普通用户', '2020-05-13 08:00:00', 'r124124', null, '福建泉州', '13867474225');
INSERT INTO `user` VALUES ('84', 'a', '123', '普通用户', '2020-05-30 08:00:00', 'r124124', null, '福建泉州', '13867474225');
INSERT INTO `user` VALUES ('86', 'whh', '123', '普通用户', '2022-10-04 18:06:06', 'r124124', null, '福建泉州丰泽区东海街道209号', '13867474225');
INSERT INTO `user` VALUES ('87', '洪苟e', '123', '送货员', '2022-10-05 08:00:00', 'r124124', null, '福建泉州丰泽区东海街道209号', '13867474225');
INSERT INTO `user` VALUES ('88', 'CXD', '13', '普通用户', '2022-10-05 08:00:00', 'r124124', null, '福建泉州丰泽区东海街道209号', '13867474225');
INSERT INTO `user` VALUES ('89', 'idnand', '123', '普通用户', '2022-10-05 08:23:47', 'r124124', null, '福建泉州丰泽区东海街道209号', '13867474225');
