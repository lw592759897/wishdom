/*
Navicat MySQL Data Transfer

Source Server         : localmysql
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : easy

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2013-09-22 01:23:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `content`
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `CONID` int(20) NOT NULL AUTO_INCREMENT,
  `CONTENTID` varchar(50) NOT NULL DEFAULT '',
  `CONTENT` text,
  `CONTENTTYPE` varchar(50) DEFAULT NULL,
  `CONTENTOPT` varchar(50) NOT NULL DEFAULT 'USED',
  `CONTENTDATE` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CONID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', 'DemoProductContent', '<div class=\"jqzoom\" id=\"spec-n1\"><img title=\"Lighthouse.jpg\" src=\"/wishdom/upload/62991379697256021.jpg\" jqimg=\"/wishdom/images/pic-info-demo.png\" height=\"347\" width=\"540\" /></div><span class=\"up\" id=\"spec-left\"></span><div class=\"commodity-img-list\" id=\"spec-list\"><ul class=\"clearfix list-paddingleft-2\" id=\"list-h\"><li><img title=\"Koala.jpg\" src=\"/wishdom/upload/76051379697282733.jpg\" /></li><li><img src=\"/wishdom/images/pic06.jpg\" /></li><li><img src=\"/wishdom/images/pic-info-demo.png\" /></li><li><img src=\"/wishdom/images/pic-info-demo.png\" /></li><li><img src=\"/wishdom/images/pic-info-demo.png\" /></li><li><img src=\"/wishdom/images/pic-info-demo.png\" /></li><li><img src=\"/wishdom/images/pic-info-demo.png\" /></li><li><img src=\"/wishdom/images/pic-info-demo.png\" /></li><li><img src=\"/wishdom/images/pic-info-demo.png\" /></li></ul></div><span class=\"down\" id=\"spec-right\"></span>', 'PRDCONTENT', 'DEMOCONTENT', '2013-09-21 02:22:09');
INSERT INTO `content` VALUES ('2', 'DemoProductContent', '请加入产品描述', 'PRDDESCONTENT', 'DEMODESCONTENT', '2013-09-21 09:17:09');
INSERT INTO `content` VALUES ('3', 'DemoCommissionContent', '<div class=\"text-art\"><span class=\"text-art-img1\"><img src=\"images/pic03.png\"/></span><div class=\"text-art-text1\"><h4>钟表</h4><p>描述描述描述描述描述描述描述描述</p></div></div><div class=\"text-art\"><span class=\"text-art-img2\"><img src=\"images/pic04.png\"/></span><div class=\"text-art-text2\"><h4>贵金属</h4><p>描述描述描述描述描述描述描述描述</p></div></div><div class=\"text-art\"><span class=\"text-art-img3\"><img src=\"images/pic05.png\"/></span><div class=\"text-art-text3\"><h4>景泰蓝</h4><p>描述描述描述描述描述描述描述描述</p></div></div>', 'COMMISSIONCONTENT', 'DEMOCOMMISSIONCONTENT', '2013-09-21 10:14:44');
INSERT INTO `content` VALUES ('4', 'DemoCompany', '<span class=\"span-news-img\"><img src=\"images/pic06.png\"/></span><div class=\"news-info-right\" id=\"news-info-right\"><div class=\"box-scroll\" id=\"box-scroll\"><p>很多中小企业对公司简介不晓得如何写，不是写的太少就是写的太多，总是不能好好掌握，明天我们在这里好好说说关于公司简介的书写办法。公司简介是什么，就是对公司，对企业的引见。</p><p>这种引见不是一句话带过，也不是长篇大论，是复杂简明的引见公司的一段文字，让他人初步理解公司的根本状况。饶网站筹划收录了一些比拟不错的公司简介范文，希望经过这些范文可以让您明白公司简介应该怎样写。新饶网站筹划公司简介范文新饶网站筹划股份无限公司成立于</p></div><div class=\"scroll-l\" id=\"scroll-l\"><div class=\"scroll-btn\" id=\"scroll-btn\"></div></div></div>', 'COMPANYCONTENT', 'DEMOCOMPANY', '2013-09-21 10:36:54');
INSERT INTO `content` VALUES ('5', 'DemoCultural', '<span class=\"span-news-img\"><img src=\"images/pic06.png\"/></span><div class=\"news-info-right\" id=\"news-info-right\"><div class=\"box-scroll\" id=\"box-scroll\"><p>很多中小企业对公司简介不晓得如何写，不是写的太少就是写的太多，总是不能好好掌握，明天我们在这里好好说说关于公司简介的书写办法。公司简介是什么，就是对公司，对企业的引见。</p><p>这种引见不是一句话带过，也不是长篇大论，是复杂简明的引见公司的一段文字，让他人初步理解公司的根本状况。饶网站筹划收录了一些比拟不错的公司简介范文，希望经过这些范文可以让您明白公司简介应该怎样写。新饶网站筹划公司简介范文新饶网站筹划股份无限公司成立于</p></div><div class=\"scroll-l\" id=\"scroll-l\"><div class=\"scroll-btn\" id=\"scroll-btn\"></div></div></div>', 'CULTURALCONTENT', 'DEMOCULTURAL', '2013-09-21 18:19:16');
INSERT INTO `content` VALUES ('6', 'DemoHomebigpicture', '<div class=\"window\"><div class=\"box-pic\"><a href=\"#\"><img src=\"images/pic-index1.jpg\"/></a><a href=\"#\"><img src=\"images/pic-index1.jpg\"/></a><a href=\"#\"><img src=\"images/pic-index1.jpg\"/></a><a href=\"#\"><img src=\"images/pic-index1.jpg\"/></a><a href=\"#\"><img src=\"images/pic-index1.jpg\"/></a><a href=\"#\"><img src=\"images/pic-index1.jpg\"/></a><a href=\"#\"><img src=\"images/pic-index1.jpg\"/></a><a href=\"#\"><img src=\"images/pic-index1.jpg\"/></a><a href=\"#\"><img src=\"images/pic-index1.jpg\"/></a><a href=\"#\"><img src=\"images/pic-index1.jpg\"/></a></div></div><div class=\"num-div\"><a href=\"#\"rel=\"1\"></a><a href=\"#\"rel=\"2\"></a><a href=\"#\"rel=\"3\"></a><a href=\"#\"rel=\"4\"></a><a href=\"#\"rel=\"5\"></a><a href=\"#\"rel=\"6\"></a><a href=\"#\"rel=\"7\"></a><a href=\"#\"rel=\"8\"></a><a href=\"#\"rel=\"9\"></a><a href=\"#\"rel=\"10\"></a></div>', 'HOMEBIGPICTURECONTENT', 'DEMOHOMEBIGPICTURE', '2013-09-21 18:19:18');
INSERT INTO `content` VALUES ('7', 'DemoMaindspic', '<ul class=\"list-master clearfix\"><li><a href=\"#\"><img src=\"images/pic01.jpg\" width=\"240\" height=\"290\"/></a><h4><a href=\"#\">中国工艺美术大师</a></h4><h5><a href=\"#\">米振雄</a></h5></li><li><a href=\"#\"><img src=\"images/pic01.jpg\" width=\"240\" height=\"290\"/></a><h4><a href=\"#\">中国工艺美术大师</a></h4><h5><a href=\"#\">米振雄</a></h5></li><li><a href=\"#\"><img src=\"images/pic01.jpg\" width=\"240\" height=\"290\"/></a><h4><a href=\"#\">中国工艺美术大师</a></h4><h5><a href=\"#\">米振雄</a></h5></li><li><a href=\"#\"><img src=\"images/pic01.jpg\" width=\"240\" height=\"290\"/></a><h4><a href=\"#\">中国工艺美术大师</a></h4><h5><a href=\"#\">米振雄</a></h5></li><li><a href=\"#\"><img src=\"images/pic01.jpg\" width=\"240\" height=\"290\"/></a><h4><a href=\"#\">中国工艺美术大师</a></h4><h5><a href=\"#\">米振雄</a></h5></li></ul>', 'MAINDSPICCONTENT', 'DEMOMAINDSPIC', '2013-09-21 18:19:25');
INSERT INTO `content` VALUES ('8', 'DemoMaingjContent', '<div class=\"box-list-about\"><ul class=\"list-about-masrter clearfix\"><li><a href=\"#\" class=\"a-img-master\"></a><h5><a href=\"#\">标题标题标题标题</a><span>2013-01-01</span></h5><p>关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠<a href=\"#\" class=\"more\">More</a></p><h4><img src=\"images/pic-about1.png\"/></h4></li><li><a href=\"#\" class=\"a-img-master\"></a><h5><a href=\"#\">标题标题标题标题</a><span>2013-01-01</span></h5><p>关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠<a href=\"#\" class=\"more\">More</a></p><h4><img src=\"images/pic-about2.png\"/></h4></li><li><a href=\"#\" class=\"a-img-master\"></a><h5><a href=\"#\">标题标题标题标题</a><span>2013-01-01</span></h5><p>关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠<a href=\"#\" class=\"more\">More</a></p><h4><img src=\"images/pic-about3.png\"/></h4></li></ul></div>', 'MAINGJCONTENT', 'DEMOMAINGJCONTENT', '2013-09-21 18:38:42');
INSERT INTO `content` VALUES ('9', 'DemoMainYspdzContent', '<div class=\"box-customize clearfix\"><div class=\"pic-customize\"><a href=\"#\"><img src=\"images/img-customize1.png\"/></a><h4><a href=\"#\" title=\"贵金属\"><img src=\"images/title-customize1.png\"/></a></h4></div><div class=\"pic-customize\"><a href=\"#\"><img src=\"images/img-customize2.png\"/></a><h4><a href=\"#\" title=\"钟表\"><img src=\"images/title-customize2.png\"/></a></h4></div><div class=\"pic-customize\"><a href=\"#\"><img src=\"images/img-customize3.png\"/></a><h4><a href=\"#\" title=\"景泰蓝\"><img src=\"images/title-customize3.png\"/></a></h4></div></div>', 'MAINYSPDZCONTENT', 'DEMOMAINYSPDZCONTENT', '2013-09-21 18:52:51');
INSERT INTO `content` VALUES ('10', 'DemoMasterContent', '<div id=\"ei_menu\" class=\"ei_menu\"><ul><li><a href=\"#\"><span class=\"ei_preview\"><img src=\"images/master-name1.png\"/></span><span class=\"ei_image\"></span></a><div class=\"ei_descr\"><img src=\"images/pic02.jpg\"/></div></li><li><a href=\"#\"><span class=\"ei_preview\"><img src=\"images/master-name2.png\"/></span><span class=\"ei_image\"></span></a><div class=\"ei_descr\"><img src=\"images/pic02.jpg\"/></div></li><li><a href=\"#\"><span class=\"ei_preview\"><img src=\"images/master-name2.png\"/></span><span class=\"ei_image\"></span></a><div class=\"ei_descr\"><img src=\"images/pic02.jpg\"/></div></li><li><a href=\"#\"><span class=\"ei_preview\"><img src=\"images/master-name2.png\"/></span><span class=\"ei_image\"></span></a><div class=\"ei_descr\"><img src=\"images/pic02.jpg\"/></div></li></ul></div>', 'MASTERCONTENT', 'DEMOMASTERCONTENT', '2013-09-21 18:59:24');
INSERT INTO `content` VALUES ('11', 'DemoMainMakeContent', '<ul class=\"list-carft clearfix\"><li><a href=\"#\"><img src=\"images/img-carft1.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft2.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft3.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft4.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft5.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft6.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft7.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft8.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft9.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft10.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft11.png\"/></a></li><li><a href=\"#\"><img src=\"images/img-carft12.png\"/></a></li></ul>', 'MAINMAKECONTENT', 'DEMOMAINMAKECONTENT', '2013-09-21 19:03:34');

-- ----------------------------
-- Table structure for `make_product`
-- ----------------------------
DROP TABLE IF EXISTS `make_product`;
CREATE TABLE `make_product` (
  `MAKEPRODUCTID` int(15) NOT NULL AUTO_INCREMENT,
  `MAKEPRODUCTSEQ` int(10) DEFAULT NULL,
  `MAKEPRODUCTDES` varchar(100) DEFAULT NULL,
  `MAKEPRODUCTIMGURL` varchar(100) DEFAULT NULL,
  `MAKEPRODUCTINNERIMG` varchar(100) DEFAULT NULL,
  `MAKEPRODUCTINNERCONTENT` text,
  PRIMARY KEY (`MAKEPRODUCTID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of make_product
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `NEWSID` int(20) NOT NULL AUTO_INCREMENT,
  `NEWSTITLE` varchar(100) NOT NULL,
  `NEWSKEYWORDS` varchar(100) DEFAULT NULL,
  `NEWSSHOW` varchar(2) DEFAULT 'Y' COMMENT 'N:不显示，Y:显示',
  `NEWSHEADSHOW` varchar(2) DEFAULT 'N',
  `PERNEWSID` int(20) DEFAULT NULL,
  `NEXTNEWSID` int(20) DEFAULT NULL,
  `NEWSDATE` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`NEWSID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `PRODUCTID` varchar(20) NOT NULL COMMENT '产品id',
  `PRODUCTNAME` varchar(50) NOT NULL COMMENT '产品名称',
  `PRODUCTSHOW` varchar(2) NOT NULL DEFAULT 'N' COMMENT 'Y:显示 N:不显示',
  `PRODUCTCATALOG` varchar(20) DEFAULT NULL COMMENT '产品分类',
  `PRODUCTDES` varchar(50) DEFAULT NULL COMMENT '产品规格',
  `PRODUCTIMG` varchar(100) DEFAULT NULL,
  `PRODUCTSHOWHEAD` varchar(2) DEFAULT 'N' COMMENT 'Y:显示在前 N:按时间显示',
  `PRODUCTDATE` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `PRODUCTNUMBER` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PRODUCTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for `userlogin`
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `USERLOGIN_ID` varchar(50) NOT NULL,
  `USERLOGIN_NAME` varchar(50) DEFAULT NULL,
  `USERLOGIN_PASSWORD` varchar(50) DEFAULT NULL,
  `USERLOGIN_TYPE` varchar(2) DEFAULT NULL,
  `CREATEDATE` date DEFAULT NULL,
  PRIMARY KEY (`USERLOGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------
