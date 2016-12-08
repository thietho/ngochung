-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 08, 2016 at 04:50 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_ngochung`
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
  `sitemapid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `moviesname`, `description`, `filename`, `image`, `status`, `sitemapid`) VALUES
(7, 'dfse', 'wefwe', 'upload/movies/temp1481035892566/47Ronin.mp4', 'upload/movies/7/4.jpg', 'active', 0),
(8, 'dsgsef', 'sfwe', 'upload/movies/temp1481036037779/catch me.mp4', 'upload/movies/8/8.jpg', 'active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `summary` text NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL,
  `sitemapid` bigint(20) NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `summary`, `description`, `image`, `sitemapid`, `createdate`) VALUES
(1, 'Khuyen mai thang 12', 'sdgs aesrdfasf w wefaw', '&lt;p&gt;rwsfew wefwe&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://localhost:81/kotra/admin/fileserver/file_default/file/upload/news/undefined/layout-kotra-2.png&quot; /&gt;&lt;/p&gt;', 'upload/news/1/noi-com-dien-cuckoo-18-lit-cr1062-hong-e7T61W.png', 23, '0000-00-00 00:00:00'),
(2, 'Noel', 's aEWFawe', '&lt;p&gt;sdfwe&lt;/p&gt;', 'upload/news/2/6001020.jpg', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productname` text NOT NULL,
  `price` double NOT NULL,
  `pricediscount` double NOT NULL,
  `discountpercent` double NOT NULL,
  `summary` text NOT NULL,
  `description` text NOT NULL,
  `viewcout` bigint(20) NOT NULL,
  `image` text NOT NULL,
  `imagedetail` text NOT NULL,
  `sitemapid` bigint(20) NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `productname`, `price`, `pricediscount`, `discountpercent`, `summary`, `description`, `viewcout`, `image`, `imagedetail`, `sitemapid`, `createdate`) VALUES
(1, 'GIGABYTE GTX 1060 G1 GAMING', 8100000, 7371000, 9, 'eyJ0aXRsZSI6WyJDaGlwIFx1MDExMVx1MWVkMyBob1x1MWVhMSIsIlRpXHUxZWJmbiB0clx1MDBlY25oIHNcdTFlYTNuIHh1XHUxZWE1dCIsIlNcdTFlZDEgbmhcdTAwZTJuIENVREEiLCJYdW5nIG5oXHUxZWNicCIsIlh1bmcgbmhcdTFlY2JwIEJvb3N0IiwiQlx1MWVkOSBuaFx1MWVkYiIsIkdpYW8gdGlcdTFlYmZwIGJcdTFlZDkgbmhcdTFlZGIiLCJTXHUxZWQxIGNcdTFlZDVuZyBrXHUxZWJmdCBuXHUxZWQxaSIsIktcdTAwZWRjaCB0aFx1MDFiMFx1MWVkYmMiLCJCXHUxZWQ5IG5ndVx1MWVkM24gXHUwMTExXHUxZWMxIHh1XHUxZWE1dCJdLCJ2YWx1ZSI6WyJHZUZvcmNlIEdUWCAxMDYwIChQYXNjYWwpIiwiMTYgbm0gRmluRkVUIiwiMTkyMCIsIjE2MjAgTUh6IChPQylcLzE1OTQgTUh6IChHYW1pbmcpIiwiMTg0NyBNSHogKE9DKVwvMTgxMCBNSHogKEdhbWluZykiLCI2IEdCIEdERFI1LTggR0h6IiwiMTkyIGJpdCIsIjEgRFZJLUQsIDEgSERNSSAyLjBiLCAzIERpc3BsYXlQb3J0IDEuNCIsIjI3OCB4IDExNCB4IDQwIiwiNDAwIFcgKDEgXHUwMTExXHUxZWE3dSBjXHUxZWE1cCBuZ3VcdTFlZDNuIDggcGluKSJdfQ==', '&lt;p&gt;&lt;img src=&quot;http://localhost:81/kotra/admin/fileserver/file_default/file/upload/product/1/20160712192336_big.png&quot; /&gt;&lt;img src=&quot;http://localhost:81/kotra/admin/fileserver/file_default/file/upload/product/1/20160712192325_big.png&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://localhost:81/kotra/admin/fileserver/file_default/file/upload/product/1/20160712192347_big.png&quot; /&gt;&lt;/p&gt;', 34, 'upload/product/1/503x236.png', 'upload/product/1/20160712192318_big.png', 18, '0000-00-00 00:00:00'),
(2, 'Smart TV màn hình cong 4K SUHD 78 inch KS9000', 189900000, 170910000, 10, 'eyJ0aXRsZSI6WyJEXHUwMGYybmciLCJLXHUwMGVkY2ggdGhcdTAxYjBcdTFlZGJjIG1cdTAwZTBuIGhcdTAwZWNuaCIsIlx1MDExMFx1MWVkOSBwaFx1MDBlMm4gZ2lcdTFlYTNpIiwiVWx0cmEgQmxhY2siLCJIXHUxZWQ3IHRyXHUxZWUzIDEwIGJpdCJdLCJ2YWx1ZSI6WyI5IiwiNzggaW5jaCIsIjMsODQwIFx1MDBkNyAyLDE2MCIsIkNcdTAwZjMiLCJDXHUwMGYzIl19', '&lt;p&gt;&lt;img src=&quot;http://localhost:81/kotra/admin/fileserver/file_default/file/upload/product/2/vn_UA78KS9000KXXV_002_Back_black_10059593090521.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://localhost:81/kotra/admin/fileserver/file_default/file/upload/product/2/vn_UA78KS9000KXXV_015_Black_black_10059394074024.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://localhost:81/kotra/admin/fileserver/file_default/file/upload/product/2/vn_UA78KS9000KXXV_016_Black_black.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img src=&quot;http://localhost:81/kotra/admin/fileserver/file_default/file/upload/product/2/vn_UA78KS9000KXXV_018_Black_black.jpg&quot; /&gt;&lt;/p&gt;', 2, 'upload/product/2/vn_UA78KS9000KXXV_022_Black_black.jpg', 'upload/product/2/vn_UA78KS9000KXXV_022_Black_black.jpg', 19, '0000-00-00 00:00:00'),
(4, 'Dầu gội cho thú cưng 3 trong 1 Forcans 550ml', 300000, 189000, 37, 'eyJ0aXRsZSI6WyJUaFx1MWVjMyB0XHUwMGVkY2giLCJIXHUxZWExbiBzXHUxZWVkIGRcdTFlZTVuZyIsIlh1XHUxZWE1dCB4XHUxZWU5Il0sInZhbHVlIjpbIjU1MG1sIiwiSW4gdHJcdTAwZWFuIGJhbyBiXHUwMGVjIiwiSFx1MDBlMG4gUXVcdTFlZDFjIl19', '&lt;h2 class=&quot;product-description__title&quot; style=&quot;margin: 0px 0px 17px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;Giới thiệu sản phẩm Dầu gội cho th&amp;uacute; cưng 3 trong 1 Forcans 550ml&lt;/h2&gt;\r\n\r\n&lt;div class=&quot;product-description__webyclip-thumbnails&quot; style=&quot;margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;\r\n&lt;div class=&quot;webyclip-thumbnails&quot; id=&quot;webyclip_thumbnails&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;L&amp;agrave;m sạch, giữ ẩm v&amp;agrave; cung cấp dưỡng chất chỉ trong một lần.&lt;/strong&gt;&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;p&gt;&lt;a data-flickr-embed=&quot;true&quot; href=&quot;https://www.flickr.com/photos/141654120@N04/29849286895/in/dateposted-public/?boost=3&quot; style=&quot;margin: 0px; padding: 0px; text-decoration: none; color: rgb(25, 156, 183); background: 0px 0px; font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot; title=&quot;chó 3 trong 1&quot;&gt;&lt;img alt=&quot;chó 3 trong 1&quot; class=&quot;productlazyimage&quot; data-original=&quot;https://c8.staticflickr.com/9/8347/29849286895_f588c1f411_b.jpg&quot; height=&quot;540&quot; src=&quot;https://c8.staticflickr.com/9/8347/29849286895_f588c1f411_b.jpg&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border: 0px; max-width: 100%; display: inline;&quot; width=&quot;700&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- C&amp;ocirc;ng dụng:&lt;/strong&gt;&amp;nbsp;Với một lần tắm, th&amp;uacute; cưng nh&amp;agrave; bạn đ&amp;atilde; c&amp;oacute; một bộ l&amp;ocirc;ng sạch, đủ độ ẩm v&amp;agrave; dưỡng chất. Ngo&amp;agrave;i ra, micromulsion v&amp;agrave; th&amp;agrave;nh phần chất l&amp;agrave;m sạch dịu nhẹ c&amp;oacute; nguồn gốc từ tr&amp;aacute;i dừa gi&amp;uacute;p chăm s&amp;oacute;c cho bộ l&amp;ocirc;ng bị hư tổn th&amp;ecirc;m d&amp;agrave;y v&amp;agrave; mềm mại.&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- C&amp;aacute;ch sử dụng:&lt;/strong&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;D&amp;ugrave;ng cho ch&amp;oacute; v&amp;agrave; m&amp;egrave;o. Chải l&amp;ocirc;ng trước khi tắm. B&amp;ocirc;i một lượng vừa phải sản phẩm sau khi đ&amp;atilde; thấm ướt l&amp;ocirc;ng bằng nước ấm, xoa đều v&amp;agrave; tạo bọt. Sau đ&amp;oacute; d&amp;ugrave;ng nước ấm tắm lại thật sạch cho th&amp;uacute; cưng.&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- Th&amp;agrave;nh phần ch&amp;iacute;nh:&lt;/strong&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;&amp;nbsp; Polyquaternium-10, &amp;nbsp; Cocamidopropyl &amp;nbsp; Betaine, Glycerine, &amp;nbsp;Aloe &amp;nbsp;Vera &amp;nbsp;Gel, &amp;nbsp;Hydrolyzed &amp;nbsp;Collagen PG-Propyl Methylsilanediol, Bis (C13~C15 Alkoxy) PG-Amodimethicone, Tocopherol Acetate.&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- Bảo quản:&lt;/strong&gt;&amp;nbsp;đậy nắp v&amp;agrave; dựng đứng, bảo quản nơi kh&amp;ocirc; tho&amp;aacute;ng v&amp;agrave; tr&amp;aacute;nh &amp;aacute;nh nắng trực tiếp.&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- Hạn sử dụng:&lt;/strong&gt;&amp;nbsp;3 năm.&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700; font-family: arial, &amp;quot;helvetica neue&amp;quot;, helvetica, sans-serif, zawgyi-one;&quot;&gt;- Xuất xứ:&lt;/strong&gt;&amp;nbsp;FORCANS Inc, Anseong-si Gyeonggi-do,&amp;nbsp;H&amp;agrave;n Quốc&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;&lt;a data-flickr-embed=&quot;true&quot; href=&quot;https://www.flickr.com/photos/141654120@N04/28217967181/in/album-72157670350680181/?boost=3&quot; style=&quot;margin: 0px; padding: 0px; text-decoration: none; color: rgb(25, 156, 183); background: 0px 0px;&quot; title=&quot;3 in 1 1&quot;&gt;&lt;img alt=&quot;3 in 1 1&quot; class=&quot;productlazyimage&quot; data-original=&quot;https://c6.staticflickr.com/9/8849/28217967181_8a0d0a4f39_o.jpg&quot; height=&quot;2310&quot; src=&quot;https://c6.staticflickr.com/9/8849/28217967181_8a0d0a4f39_o.jpg&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border: 0px; max-width: 100%; display: inline;&quot; width=&quot;800&quot; /&gt;&lt;/a&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;&lt;a data-flickr-embed=&quot;true&quot; href=&quot;https://www.flickr.com/photos/141654120@N04/28192532492/in/album-72157670350680181/?boost=3&quot; style=&quot;margin: 0px; padding: 0px; text-decoration: none; color: rgb(25, 156, 183); background: 0px 0px;&quot; title=&quot;3 in 1 2&quot;&gt;&lt;img alt=&quot;3 in 1 2&quot; class=&quot;productlazyimage&quot; data-original=&quot;https://c5.staticflickr.com/9/8681/28192532492_512792f1f0_o.jpg&quot; height=&quot;2369&quot; src=&quot;https://c5.staticflickr.com/9/8681/28192532492_512792f1f0_o.jpg&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border: 0px; max-width: 100%; display: inline;&quot; width=&quot;800&quot; /&gt;&lt;/a&gt;&lt;/div&gt;', 0, 'upload/product/4/daugoichothucung.png', 'upload/product/4/daugoichothucung.png', 20, '0000-00-00 00:00:00'),
(5, 'Nồi cơm điện Hàn Quốc Cuckoo CR-1062P (Hồng tím)', 3400000, 2720000, 20, 'eyJ0aXRsZSI6WyJEYW5oIGNobyIsIk5ndVx1MWVkM24iLCJLXHUwMGVkY2ggdGhcdTAxYjBcdTFlZGJjIiwiTVx1MDBlMHUiLCJNXHUxZWFidSBtXHUwMGUzIiwiVHJcdTFlY2RuZyBsXHUwMWIwXHUxZWUzbmcgKEtHKSIsIkxvXHUxZWExaSBuXHUxZWQzaSBjXHUwMWExbSBcdTAxMTFpXHUxZWM3biIsIlRoXHUxZWRkaSBnaWFuIGJcdTFlYTNvIGhcdTAwZTBuaCIsIkxvXHUxZWExaSBoXHUwMGVjbmggYlx1MWVhM28gaFx1MDBlMG5oIl0sInZhbHVlIjpbIjEwIG5nXHUwMWIwXHUxZWRkaSIsIjIyMFcsIDYwSHoiLCIzMTAqMjcyKjI1OW1tIiwiSFx1MWVkM25nIiwiQ1ItMTA2MlAiLCIzLjkiLCJOXHUxZWQzaSBjXHUwMWExbSBcdTAxMTFpXHUxZWM3biBuXHUxZWFmcCByXHUxZWRkaSIsIjEyIHRoXHUwMGUxbmciLCJCXHUxZWIxbmcgUGhpXHUxZWJmdSBiXHUxZWEzbyBoXHUwMGUwbmggdlx1MDBlMCBIXHUwMGYzYSBcdTAxMTFcdTAxYTFuIl19', '&lt;div class=&quot;product-description__wrap prd-descriptionWrapper&quot; id=&quot;productDetails&quot; style=&quot;margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(244, 243, 243);&quot;&gt;\r\n&lt;div class=&quot;product-description__block&quot; style=&quot;margin: 0px; padding: 5px 15px 18px; border-top: 2px solid rgb(30, 52, 70); background: rgb(255, 255, 255);&quot;&gt;&lt;a data-flickr-embed=&quot;true&quot; href=&quot;https://www.flickr.com/photos/141654120@N04/28453374690/in/dateposted-public/?boost=3&quot; style=&quot;margin: 0px; padding: 0px; text-decoration: underline; color: rgb(25, 156, 183); background: 0px 0px; outline: 0px;&quot; title=&quot;CR-1062P&quot;&gt;&lt;img alt=&quot;CR-1062P&quot; class=&quot;productlazyimage&quot; data-original=&quot;https://c3.staticflickr.com/9/8557/28453374690_14a6a7d65c_o.jpg&quot; height=&quot;384&quot; src=&quot;https://c3.staticflickr.com/9/8557/28453374690_14a6a7d65c_o.jpg&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border: 0px; max-width: 100%; display: inline;&quot; width=&quot;730&quot; /&gt;&lt;/a&gt;\r\n&lt;div class=&quot;clear&quot; style=&quot;margin: 0px 0px 10px; padding: 0px; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;product-description__block&quot; style=&quot;margin: 15px 0px 0px; padding: 5px 15px 18px; border-top: 2px solid rgb(30, 52, 70); background: rgb(255, 255, 255); color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;\r\n&lt;h2 class=&quot;product-description__title&quot; style=&quot;margin: 0px 0px 17px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem;&quot;&gt;Th&amp;ocirc;ng tin sản phẩm Nồi cơm điện H&amp;agrave;n Quốc Cuckoo CR-1062P (Hồng t&amp;iacute;m)&lt;/h2&gt;\r\n\r\n&lt;div class=&quot;product-description__inbox toclear&quot; style=&quot;margin: 0px 0px 14px; padding: 0px;&quot;&gt;&lt;span class=&quot;product-subheader__element&quot; style=&quot;margin: 0px 0px 9px; padding: 0px 5px 0px 0px; font-size: 13px; font-weight: 700; display: table-cell; width: 200px;&quot;&gt;Bộ sản phẩm bao gồm:&lt;/span&gt;\r\n\r\n&lt;div class=&quot;inbox__wrap&quot; style=&quot;margin: 0px; padding: 0px; display: table-cell;&quot;&gt;\r\n&lt;ul class=&quot;ui-listBulleted&quot; style=&quot;margin: 0px 0px 0px 13px; padding: 0px; list-style: disc;&quot;&gt;\r\n	&lt;li class=&quot;inbox__item&quot; style=&quot;margin: 0px 5px 0px 0px; padding: 0px; list-style: none; display: inline-block;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;- 1 bộ sản phẩm - 1 phiếu bảo h&amp;agrave;nh&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;product-subheader__element&quot; style=&quot;margin: 0px 0px 9px; padding: 0px; font-size: 13px; font-weight: 700;&quot;&gt;Đặc điểm ch&amp;iacute;nh:&lt;/div&gt;\r\n\r\n&lt;table class=&quot;specification-table&quot; style=&quot;margin: 0px; padding: 0px; border-spacing: 0px; border-collapse: collapse; width: 877px; background: rgb(250, 250, 250); border-top: 4px solid rgb(242, 242, 242);&quot;&gt;\r\n	&lt;tbody style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;specification-table__property&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; min-width: 100px; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;SKU&lt;/td&gt;\r\n			&lt;td class=&quot;specification-table__value&quot; id=&quot;pdtsku&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;CU256HAAA145O6VNAMZ-1614486&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Mẫu m&amp;atilde;&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;CR-1062P&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;K&amp;iacute;ch thước sản phẩm (D x R x C cm)&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;31x27.2x25.9&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Trọng lượng (KG)&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;3.9&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Sản xuất tại&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;H&amp;agrave;n Quốc&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Loại nồi cơm điện&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Nồi cơm điện nắp rời&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Thời gian bảo h&amp;agrave;nh&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;12 th&amp;aacute;ng&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Loại h&amp;igrave;nh bảo h&amp;agrave;nh&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Bằng Phiếu bảo h&amp;agrave;nh v&amp;agrave; H&amp;oacute;a đơn&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;', 0, 'upload/product/5/noi-com-dien-cuckoo-18-lit-cr1062-hong-e7T61W.png', 'upload/product/5/noi-com-dien-cuckoo-18-lit-cr1062-hong-e7T61W.png', 19, '0000-00-00 00:00:00'),
(6, 'Trà Sâm Mật Ong Hàn Quốc Nokchawon 580g', 272000, 189000, 30.514705882352942, 'eyJ0aXRsZSI6WyJUaFx1MDBlMG5oIHBoXHUxZWE3biBjXHUxZWE1dSB0XHUxZWExbyIsIktoXHUxZWQxaSBsXHUwMWIwXHUxZWUzbmcgdFx1MWVjYm5oIiwiQ1x1MDBmNG5nIGRcdTFlZTVuZyIsIlx1MDExMFx1MWVkMWkgdFx1MDFiMFx1MWVlM25nIHNcdTFlZWQgZFx1MWVlNW5nIiwiQ1x1MDBlMWNoIGRcdTAwZjluZyIsIkJcdTFlYTNvIHF1XHUxZWEzbiIsIkhTRCIsIk5oXHUwMGUwIHNcdTFlYTNuIHh1XHUxZWE1dCJdLCJ2YWx1ZSI6WyJTXHUwMGUybSBoXHUwMGUwbiBxdVx1MWVkMWMgOS4wNCUsIG1cdTFlYWR0IG9uZyA0LjUyJSwgeHlybyBcdTAxMTFcdTAxYjBcdTFlZGRuZyBmcnVjdG9zZSwgblx1MDFiMFx1MWVkYmMgdGluaCBraGlcdTFlYmZ0LCBjYXJhZ2VlbmFuLCBzb2RpdW0gY2FyYm94eW1ldGh5bCBjZWxsdWxvc2UuLiIsIjU4MGciLCJHaVx1MDBmYXAgY3VuZyBjXHUxZWE1cCBuXHUwMTAzbmcgbFx1MDFiMFx1MWVlM25nLCBiXHUxZWQzaSBiXHUxZWQ1IGNcdTAxYTEgdGhcdTFlYzMiLCJEXHUwMGY5bmcgdFx1MWVkMXQgY2hvIG1cdTFlY2RpIG5nXHUwMWIwXHUxZWRkaSIsIkhcdTAwZjJhIDMtNCBtdVx1MWVkN25nIChraG9cdTFlYTNuZyAyMC0zMGcpIHRyXHUwMGUwIHNcdTAwZTJtIG1cdTFlYWR0IG9uZyB2XHUwMGUwbyB0cm9uZyAxIGx5IG5cdTAxYjBcdTFlZGJjIGtob1x1MWVhM25nIDgwbWwgblx1MDFiMFx1MWVkYmMgblx1MDBmM25nIGhvXHUxZWI3YyBsXHUxZWExbmgsIGtodVx1MWVhNXkgXHUwMTExXHUxZWMxdSB0clx1MDFiMFx1MWVkYmMga2hpIGRcdTAwZjluZyIsIk5cdTAxYTFpIGtoXHUwMGY0IHJcdTAwZTFvIHRob1x1MDBlMW5nIG1cdTAwZTF0LCB0clx1MDBlMW5oIFx1MDBlMW5oIHNcdTAwZTFuZyB0clx1MWVmMWMgdGlcdTFlYmZwLCBuXHUwMWExaSBjXHUwMGYzIG5oaVx1MWVjN3QgXHUwMTExXHUxZWQ5IGNhbyB2XHUwMGUwIFx1MWVhOW0gdGhcdTFlYTVwLiIsIjI0IHRoXHUwMGUxbmcuIiwiTk9LQ0hBV09OIENPLkx0ZCwgU2VvdWwsIEhcdTAwZTBuIFF1XHUxZWQxYyJdfQ==', '&lt;div class=&quot;product-description__wrap prd-descriptionWrapper&quot; id=&quot;productDetails&quot; style=&quot;margin: 0px 0px 15px; padding: 0px; color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(244, 243, 243);&quot;&gt;\r\n&lt;div class=&quot;product-description__block&quot; style=&quot;margin: 0px; padding: 5px 15px 18px; border-top: 2px solid rgb(30, 52, 70); background: rgb(255, 255, 255);&quot;&gt;\r\n&lt;h2 class=&quot;product-description__title&quot; style=&quot;margin: 0px 0px 17px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem;&quot;&gt;Giới thiệu sản phẩm Tr&amp;agrave; S&amp;acirc;m Mật Ong H&amp;agrave;n Quốc Nokchawon 580g&lt;/h2&gt;\r\n\r\n&lt;div class=&quot;product-description__webyclip-thumbnails&quot; style=&quot;margin: 0px 0px 15px; padding: 0px;&quot;&gt;\r\n&lt;div class=&quot;webyclip-thumbnails&quot; id=&quot;webyclip_thumbnails&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- Th&amp;agrave;nh phần cấu tạo:&lt;/strong&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;S&amp;acirc;m h&amp;agrave;n quốc 9.04%, mật ong 4.52%, xyro đường fructose, nước tinh khiết, carageenan, sodium carboxymethyl cellulose..&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- Khối lượng tịnh:&lt;/strong&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;580g.&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- C&amp;ocirc;ng dụng:&lt;/strong&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;Gi&amp;uacute;p cung cấp năng lượng, bồi bổ cơ thể.&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- Đối tượng sử dụng:&lt;/strong&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;D&amp;ugrave;ng tốt cho mọi người.&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- C&amp;aacute;ch d&amp;ugrave;ng:&lt;/strong&gt;&amp;nbsp;H&amp;ograve;a 3-4 muỗng (khoảng 20-30g) tr&amp;agrave; s&amp;acirc;m mật ong v&amp;agrave;o trong 1 ly nước khoảng 80ml nước n&amp;oacute;ng hoặc lạnh, khuấy đều trước khi d&amp;ugrave;ng.&amp;nbsp;&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- Bảo quản:&lt;/strong&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;Nơi kh&amp;ocirc; r&amp;aacute;o tho&amp;aacute;ng m&amp;aacute;t, tr&amp;aacute;nh &amp;aacute;nh s&amp;aacute;ng trực tiếp, nơi c&amp;oacute; nhiệt độ cao v&amp;agrave; ẩm thấp.&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- HSD:&lt;/strong&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;24 th&amp;aacute;ng.&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;- Nh&amp;agrave; sản xuất:&lt;/strong&gt;&lt;span&gt;&amp;nbsp;&lt;/span&gt;NOKCHAWON CO.Ltd, Seoul, H&amp;agrave;n Quốc&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px 0px 10px; padding: 0px;&quot;&gt;&amp;nbsp;\r\n&lt;div style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;img alt=&quot;image&quot; class=&quot;productlazyimage&quot; data-original=&quot;http://i410.photobucket.com/albums/pp185/kscd02/Nokchawon/sam%20mat%20ong%20580/TragraveMtOngSacircmHagravenQucfix_zpsrt2sxsom.jpg~original&quot; src=&quot;http://i410.photobucket.com/albums/pp185/kscd02/Nokchawon/sam%20mat%20ong%20580/TragraveMtOngSacircmHagravenQucfix_zpsrt2sxsom.jpg~original&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border: 0px; max-width: 100%; display: inline;&quot; /&gt;&lt;/div&gt;\r\n&amp;nbsp;\r\n\r\n&lt;div style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;em style=&quot;margin: 0px; padding: 0px; font-style: normal;&quot;&gt;&lt;strong style=&quot;margin: 0px; padding: 0px; font-weight: 700;&quot;&gt;Tr&amp;agrave; s&amp;acirc;m mật ong H&amp;agrave;n Quốc Nokchawon đựng trong lọ thủy tinh chuy&amp;ecirc;n dụng n&amp;ecirc;n sử dụng rất tiện lợi v&amp;agrave; bảo quản an to&amp;agrave;n một c&amp;aacute;ch l&amp;acirc;u d&amp;agrave;i. Chỉ mất &amp;iacute;t ph&amp;uacute;t th&amp;ocirc;i, bạn đ&amp;atilde; c&amp;oacute; thể x&amp;oacute;a bay mọi mệt mỏi v&amp;agrave; tập trung tinh thần cao độ quay trở lại c&amp;ocirc;ng việc.&lt;/strong&gt;&lt;/em&gt;&lt;/div&gt;\r\n\r\n&lt;div style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;img alt=&quot;image&quot; class=&quot;productlazyimage&quot; data-original=&quot;http://i410.photobucket.com/albums/pp185/kscd02/Nokchawon/sam%20mat%20ong%20580/1464856109807_2633720_zpsaecuqqou.jpg~original&quot; src=&quot;http://i410.photobucket.com/albums/pp185/kscd02/Nokchawon/sam%20mat%20ong%20580/1464856109807_2633720_zpsaecuqqou.jpg~original&quot; style=&quot;margin: 0px; padding: 0px; vertical-align: middle; border: 0px; max-width: 100%; display: inline;&quot; /&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;clear&quot; style=&quot;margin: 0px 0px 10px; padding: 0px; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;product-description__block&quot; style=&quot;margin: 15px 0px 0px; padding: 5px 15px 18px; border-top: 2px solid rgb(30, 52, 70); background: rgb(255, 255, 255); color: rgb(64, 64, 64); font-family: Helvetica, Arial, sans-serif; font-size: 12px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;&quot;&gt;\r\n&lt;h2 class=&quot;product-description__title&quot; style=&quot;margin: 0px 0px 17px; padding: 0px; font-weight: 700; font-size: 16px; line-height: 2.4rem;&quot;&gt;Th&amp;ocirc;ng tin sản phẩm Tr&amp;agrave; S&amp;acirc;m Mật Ong H&amp;agrave;n Quốc Nokchawon 580g&lt;/h2&gt;\r\n\r\n&lt;div class=&quot;product-description__inbox toclear&quot; style=&quot;margin: 0px 0px 14px; padding: 0px;&quot;&gt;&lt;span class=&quot;product-subheader__element&quot; style=&quot;margin: 0px 0px 9px; padding: 0px 5px 0px 0px; font-size: 13px; font-weight: 700; display: table-cell; width: 200px;&quot;&gt;Bộ sản phẩm bao gồm:&lt;/span&gt;\r\n\r\n&lt;div class=&quot;inbox__wrap&quot; style=&quot;margin: 0px; padding: 0px; display: table-cell;&quot;&gt;\r\n&lt;ul class=&quot;ui-listBulleted&quot; style=&quot;margin: 0px 0px 0px 13px; padding: 0px; list-style: disc;&quot;&gt;\r\n	&lt;li class=&quot;inbox__item&quot; style=&quot;margin: 0px 5px 0px 0px; padding: 0px; list-style: none; display: inline-block;&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px;&quot;&gt;1 hủ sản phẩm&lt;/span&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;div class=&quot;product-subheader__element&quot; style=&quot;margin: 0px 0px 9px; padding: 0px; font-size: 13px; font-weight: 700;&quot;&gt;Đặc điểm ch&amp;iacute;nh:&lt;/div&gt;\r\n\r\n&lt;table class=&quot;specification-table&quot; style=&quot;margin: 0px; padding: 0px; border-spacing: 0px; border-collapse: collapse; width: 877px; background: rgb(250, 250, 250); border-top: 4px solid rgb(242, 242, 242);&quot;&gt;\r\n	&lt;tbody style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;specification-table__property&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; min-width: 100px; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;SKU&lt;/td&gt;\r\n			&lt;td class=&quot;specification-table__value&quot; id=&quot;pdtsku&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;NO215HBAYF1ZVNAMZ-727887&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Mẫu m&amp;atilde;&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Tr&amp;agrave; S&amp;acirc;m Mật Ong H&amp;agrave;n Quốc&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;K&amp;iacute;ch thước sản phẩm (D x R x C cm)&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;8x8x12.5&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Trọng lượng (KG)&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;0.9&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Sản xuất tại&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;H&amp;agrave;n Quốc&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr style=&quot;margin: 0px; padding: 0px;&quot;&gt;\r\n			&lt;td class=&quot;bold&quot; style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Loại h&amp;igrave;nh bảo h&amp;agrave;nh&lt;/td&gt;\r\n			&lt;td style=&quot;margin: 0px; padding: 0px 15px; vertical-align: top; line-height: 24px; border: 1px solid rgb(242, 242, 242);&quot;&gt;Kh&amp;ocirc;ng hỗ trợ bảo h&amp;agrave;nh&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n&lt;/div&gt;', 0, 'upload/product/6/6001020.jpg', 'upload/product/6/6001020.jpg', 17, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `settingname` text NOT NULL,
  `settingvalue` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `settingname`, `settingvalue`) VALUES
(1, 'banner', '[upload/banner/2014-Happy-Teacher-Day-(Cover)-(1).jpg][upload/banner/Con Ma 1024.jpg][upload/banner/47_ronin_to_hop_cua_nhung_dieu_an_tuong_6416.jpg]');

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
-- Table structure for table `sitemap`
--

CREATE TABLE IF NOT EXISTS `sitemap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sitemapid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sitemapname` text COLLATE utf8_unicode_ci NOT NULL,
  `sitemapparent` bigint(20) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `sitemap`
--

INSERT INTO `sitemap` (`id`, `sitemapid`, `sitemapname`, `sitemapparent`, `module`, `pos`) VALUES
(1, 'trangchu', 'Trang Chủ', 0, 'homepage', 0),
(2, 'gioithieu', 'Gioi thieu', 0, 'module/infomation', 1),
(4, 'hotro', 'Ho tro', 0, 'module/infomation', 2),
(6, 'lien-he', 'Liên hệ', 0, 'module/contact', 3),
(7, 'dichvuanh', 'Dịch vụ ảnh', 0, '', 4),
(8, 'chup-hinh-the', 'Chụp hình thẻ', 7, 'module/infomation', 3),
(9, 'phuc-hoi-anh-cu', 'Phục hồi ảnh củ', 7, 'module/infomation', 2),
(10, 'in-anh-kho-lon-nho', 'In ảnh khổ lớn nhỏ', 7, 'module/infomation', 0),
(11, 'in-anh-tren-ly-moc-khoa', 'In ảnh trên ly, móc khóa', 7, 'module/infomation', 1),
(12, 'dich-vu-khac', 'Dịch vụ khác', 13, 'module/infomation', 3),
(13, 'thiet-ke-album-xy-ly-anh', 'Thiết kế album &amp; xử lý ảnh', 0, '', 5),
(14, 'thiet-ke-album-cuoi', 'Thiết kế album cưới', 13, 'module/infomation', 1),
(15, 'xu-ly-anh', 'Xử lý ảnh', 13, 'module/infomation', 0),
(16, 'vat-tu-nganh-anh-sua-may-anh', 'Vật tư ngành ảnh, sửa máy ảnh', 0, '', 6),
(17, 'khung-anh-album-dung-anh', 'Khung ảnh, album đựng ảnh', 13, 'module/product', 2),
(18, 'usb-the-nho', 'USB, Thẻ nhớ', 16, 'module/product', 2),
(19, 'bao-da-may-anh', 'Bao da máy ảnh', 16, 'module/product', 3),
(20, 'pin-may-sac', 'Pin máy sạc', 16, 'module/product', 0),
(21, 'mua-ban-sua-chua-may-anhmay-quay', 'Mua bán, sửa chữa máy ảnh,máy quay', 16, 'module/product', 1),
(22, 'ho-tro-truc-tuyen', 'HỖ TRỢ TRỰC TUYẾN', 0, 'module/infomation', 8),
(23, 'thong-tin-huu-ich', 'THÔNG TIN HỮU ÍCH', 0, 'module/news', 7),
(24, 'may-frontier-590', 'Máy Frontier 590', 1, 'module/infomation', 0),
(25, 'may-lps-pro24', 'MÁY LPS PRO24', 1, 'module/infomation', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sitemap_info`
--

CREATE TABLE IF NOT EXISTS `sitemap_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sitemapid` bigint(100) NOT NULL,
  `infoname` text COLLATE utf8_unicode_ci NOT NULL,
  `infovalue` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `sitemap_info`
--

INSERT INTO `sitemap_info` (`id`, `sitemapid`, `infoname`, `infovalue`) VALUES
(1, 2, 'summary', 'sefwew'),
(2, 2, 'image', 'upload/sitemap/2/3.jpg'),
(3, 2, 'description', '&lt;p&gt;sdf wewew&lt;/p&gt;'),
(4, 15, 'summary', 'dsfqas'),
(5, 15, 'image', 'upload/sitemap/15/47_ronin_to_hop_cua_nhung_dieu_an_tuong_6416.jpg'),
(6, 15, 'description', '&lt;p&gt;sadfasda&lt;img src=&quot;http://localhost:81/ngochung/admin/../fileserver/file_default/file/upload/sitemap/15/250x2503.jpg&quot; /&gt;&lt;/p&gt;'),
(7, 24, 'summary', ''),
(8, 24, 'image', 'upload/sitemap/24/frontier5901.jpg'),
(9, 24, 'description', '&lt;p&gt;M&amp;aacute;y in cao cấp nhất của Fujifilm c&amp;oacute; t&amp;iacute;nh năng xử l&amp;yacute; khối lượng dấu ch&amp;acirc;n nhỏ v&amp;agrave; sản xuất l&amp;ecirc;n đến 2.400 bản in/giờ từ c&amp;aacute;c phương tiện truyền th&amp;ocirc;ng kỹ thuật số.Với khả năng xử l&amp;yacute; k&amp;iacute;ch cỡ giấy từ 3.5&amp;quot;- 12&amp;quot;.C&amp;aacute;c frontier 590 l&amp;agrave; một lựa chọn l&amp;yacute; tưởng cho ng&amp;agrave;y h&amp;ocirc;m nay bận rộn nhất của c&amp;aacute;c trung t&amp;acirc;m ảnh kỹ thuật số.&lt;/p&gt;'),
(10, 25, 'summary', 'Công nghệ In Laser khổ lớn'),
(11, 25, 'image', 'upload/sitemap/25/lps-24pro.jpg'),
(12, 25, 'description', '');

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
