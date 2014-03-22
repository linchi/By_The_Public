-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 13, 2014 at 03:24 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bythepublic`
--
CREATE DATABASE IF NOT EXISTS `bythepublic` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bythepublic`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `COMMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `POST_ID` bigint(20) NOT NULL,
  `CONTENT` text,
  `COMMENT_SPAM` tinyint(1) DEFAULT NULL,
  `COMMENT_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `POST_ID` (`POST_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`COMMENT_ID`, `POST_ID`, `CONTENT`, `COMMENT_SPAM`, `COMMENT_TIME`, `USER_ID`) VALUES
(1, 2, 'Hi', 0, '2014-03-04 20:42:21', 2),
(2, 3, 'Wht', 0, '2014-03-04 20:42:21', 1),
(3, 1, 'Hello', 0, '2014-03-04 20:42:21', 4),
(4, 4, 'Why', 1, '2014-03-04 20:42:21', 5),
(5, 5, 'Whom', 0, '2014-03-04 20:42:21', 5),
(6, 5, 'Well!!!', 0, '2014-03-04 20:42:21', 5);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `url` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(255) DEFAULT NULL,
  `opt` text,
  `Avg_rating` int(11) DEFAULT NULL,
  `post_spam` tinyint(1) DEFAULT NULL,
  `view_count` int(11) DEFAULT NULL,
  `cust_property` text,
  `cust_property1` text,
  `cust_property2` text,
  `cust_property3` text,
  `cust_property4` text,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `lat`, `lng`, `url`, `time`, `category`, `opt`, `Avg_rating`, `post_spam`, `view_count`, `cust_property`, `cust_property1`, `cust_property2`, `cust_property3`, `cust_property4`) VALUES
(1, 10.220000, 110.220001, 'sample.mp4', '2014-03-04 20:42:20', 'oscars', NULL, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
(2, 16.219999, 120.220001, 'sample.mp4', '2014-03-04 20:42:20', 'oscars1', NULL, 3, 0, 11, NULL, NULL, NULL, NULL, NULL),
(3, 15.220000, 140.220001, 'sample.mp4', '2014-03-04 20:42:20', 'oscars3', NULL, 2, 0, 13, NULL, NULL, NULL, NULL, NULL),
(4, 14.220000, 0.220000, 'sample.mp4', '2014-03-04 20:42:21', 'oscars4', NULL, 4, 0, 44, NULL, NULL, NULL, NULL, NULL),
(5, 12.220000, 130.220001, 'sample.mp4', '2014-03-04 20:42:21', 'oscars', NULL, 5, 0, 54, NULL, NULL, NULL, NULL, NULL),
(6, 11.220000, 12.220000, 'sample.mp4', '2014-03-04 20:42:21', 'oscars', NULL, 5, 0, 112, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_like`
--

CREATE TABLE IF NOT EXISTS `post_like` (
  `POST_ID` bigint(20) NOT NULL DEFAULT '0',
  `USER_ID` bigint(20) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`POST_ID`,`USER_ID`),
  KEY `USER_ID` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_like`
--

INSERT INTO `post_like` (`POST_ID`, `USER_ID`, `time`) VALUES
(1, 2, '0000-00-00 00:00:00'),
(2, 1, '0000-00-00 00:00:00'),
(3, 4, '0000-00-00 00:00:00'),
(4, 4, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `USER_ID` bigint(20) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USER_ID`, `USER_NAME`) VALUES
(1, 'Abhishek'),
(2, 'Aditya'),
(3, 'Manan'),
(4, 'Himanshu'),
(5, 'Saurabh');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`POST_ID`) REFERENCES `post` (`post_id`);

--
-- Constraints for table `post_like`
--
ALTER TABLE `post_like`
  ADD CONSTRAINT `post_like_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`),
  ADD CONSTRAINT `post_like_ibfk_2` FOREIGN KEY (`POST_ID`) REFERENCES `post` (`post_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
