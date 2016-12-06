-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 01, 2016 at 11:35 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_kotra`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE IF NOT EXISTS `movies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `moviesname` text NOT NULL,
  `description` text NOT NULL,
  `filename` text NOT NULL,
  `image` text NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` bigint(11) NOT NULL DEFAULT '0',
  `settingname` text NOT NULL,
  `settingvalue` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `siteid` varchar(30) NOT NULL,
  `slogan` text NOT NULL,
  `logo` text NOT NULL,
  `symbol` text NOT NULL,
  `currency` varchar(20) NOT NULL,
  `contactemail` text NOT NULL,
  `contactemail2` text NOT NULL,
  `sitename` varchar(100) NOT NULL,
  `siteurl` text NOT NULL,
  `language` varchar(20) NOT NULL,
  `pagetopic` text NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `googleanalytics` text NOT NULL,
  `skinid` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `exchange_point` double NOT NULL,
  `paypal_emailmerchant` varchar(255) NOT NULL,
  `paypal_standard_currency` varchar(50) NOT NULL,
  `paypal_standard_transaction` varchar(50) NOT NULL,
  `paypal_standard_test` int(11) NOT NULL COMMENT '0: for test, 1: for real',
  `eway_api_key` varchar(255) NOT NULL,
  `eway_api_password` varchar(50) NOT NULL,
  `eway_api_currency` varchar(6) NOT NULL,
  `eway_api_transaction` varchar(50) NOT NULL,
  `eway_api_test` int(11) NOT NULL COMMENT '0: for test, 1: for real',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `siteid`, `slogan`, `logo`, `symbol`, `currency`, `contactemail`, `contactemail2`, `sitename`, `siteurl`, `language`, `pagetopic`, `description`, `keywords`, `googleanalytics`, `skinid`, `status`, `exchange_point`, `paypal_emailmerchant`, `paypal_standard_currency`, `paypal_standard_transaction`, `paypal_standard_test`, `eway_api_key`, `eway_api_password`, `eway_api_currency`, `eway_api_transaction`, `eway_api_test`) VALUES
(1, 'default', 'Because Your Dream', 'upload/logo.png', 'upload/symbol.png', '', 'demen88@gmail.com', '', 'Shimmer Silver', 'http://www.shimmersilver.com', 'vn, en', '', '', '', '', 'default', 'Active', 1000, 'ZLtynpaNAJM=', '', '', 0, 'ZLtynpaNAJM=', 'ZLtynpaNAJM=', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `usertypeid` varchar(20) NOT NULL,
  `username` text,
  `password` text,
  `fullname` text NOT NULL,
  `email` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `imagepath` text NOT NULL,
  `phone` text NOT NULL,
  `activedate` datetime NOT NULL,
  `updateddate` datetime NOT NULL,
  `deleteddate` datetime NOT NULL,
  `activeby` varchar(50) NOT NULL,
  `updatedby` varchar(50) NOT NULL,
  `deletedby` varchar(50) NOT NULL,
  `userip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `userid`, `usertypeid`, `username`, `password`, `fullname`, `email`, `status`, `imagepath`, `phone`, `activedate`, `updateddate`, `deleteddate`, `activeby`, `updatedby`, `deletedby`, `userip`) VALUES
(1, 'admin', 'admin', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'Dung Pham', 'demen88@gmail.com', 'active', '', '09060090969991', '2016-11-01 11:30:27', '2016-11-01 11:30:27', '0000-00-00 00:00:00', 'admin', 'admin', '', '192.168.1.150'),
(5, 'kimngan', 'moderator', 'kimngan', '827ccb0eea8a706c4c34a16891f84e7b', 'Ly Kim Ngan', 'kimngan@gmail.com', 'active', 'upload/kimngan.jpg', '090 678 5593', '2016-07-07 16:42:33', '2016-07-12 17:18:44', '0000-00-00 00:00:00', 'admin', 'admin', '', '192.168.1.64');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE IF NOT EXISTS `usertype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usertypeid` varchar(20) NOT NULL,
  `usertypename` text,
  `usertypeparent` varchar(20) NOT NULL,
  `permission` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `usertypeid`, `usertypename`, `usertypeparent`, `permission`) VALUES
(1, 'admin', 'Admin', '0', ''),
(2, 'moderator', 'Moderator', '0', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
