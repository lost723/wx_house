-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 09 月 24 日 17:15
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `we7`
--

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxhouse_bargin`
--

CREATE TABLE IF NOT EXISTS `ims_wxhouse_bargin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxhouse_chips`
--

CREATE TABLE IF NOT EXISTS `ims_wxhouse_chips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `chips` varchar(16) NOT NULL COMMENT '认筹号',
  `time` int(11) NOT NULL COMMENT '生成时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxhouse_chipsok`
--

CREATE TABLE IF NOT EXISTS `ims_wxhouse_chipsok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `rid` int(11) NOT NULL COMMENT '房间id',
  `time` int(11) NOT NULL COMMENT '认购时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxhouse_favourite`
--

CREATE TABLE IF NOT EXISTS `ims_wxhouse_favourite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL COMMENT '房间号',
  `time` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxhouse_house`
--

CREATE TABLE IF NOT EXISTS `ims_wxhouse_house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '楼盘名',
  `des` text NOT NULL COMMENT '简介',
  `tel` varchar(16) NOT NULL COMMENT '电话',
  `address` varchar(128) NOT NULL COMMENT '地址',
  `money` decimal(10,2) NOT NULL COMMENT '定金',
  `dateline` int(11) NOT NULL COMMENT '开盘时间',
  `lat` decimal(18,10) NOT NULL COMMENT 'X坐标',
  `lng` decimal(18,10) NOT NULL COMMENT 'Y坐标',
  `protocal1` text NOT NULL COMMENT '线上选购房协议',
  `protocal2` text NOT NULL COMMENT '买卖合同',
  `protocal3` text NOT NULL COMMENT '单位认购协议',
  `listorder` int(11) NOT NULL COMMENT '排序',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxhouse_housemodel`
--

CREATE TABLE IF NOT EXISTS `ims_wxhouse_housemodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '户型明',
  `areaA` decimal(10,2) NOT NULL COMMENT '面积区间A',
  `areaB` decimal(10,2) NOT NULL COMMENT '面积区间B',
  `roomsize` varchar(25) NOT NULL COMMENT '厅室',
  `operation` varchar(25) NOT NULL COMMENT '朝向',
  `img` text NOT NULL COMMENT '户型图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxhouse_room`
--

CREATE TABLE IF NOT EXISTS `ims_wxhouse_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `hid` int(11) NOT NULL COMMENT '户型号',
  `bid` int(11) NOT NULL COMMENT '楼号',
  `unit` int(11) NOT NULL COMMENT '单元',
  `floor` int(11) NOT NULL COMMENT '楼层',
  `roomno` varchar(25) NOT NULL COMMENT '房间号',
  `status` tinyint(1) NOT NULL COMMENT '房间状态',
  `unitprice` decimal(10,2) NOT NULL COMMENT '单价',
  `area` decimal(10,2) NOT NULL COMMENT '面积',
  `total` decimal(10,2) NOT NULL COMMENT '总价',
  `img` text NOT NULL COMMENT '户型图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxhouse_user`
--

CREATE TABLE IF NOT EXISTS `ims_wxhouse_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码（md5加密)',
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `tel` varchar(16) NOT NULL COMMENT '手机号',
  `idcard` varchar(25) NOT NULL COMMENT '身份证号',
  `bankcard` text NOT NULL COMMENT '银行卡信息',
  `time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
