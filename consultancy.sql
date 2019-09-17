-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 26, 2017 at 10:19 AM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `consultancy`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE IF NOT EXISTS `adminlogin` (
  `Id` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`Id`, `Password`) VALUES
('admin', 'carriermakersjk');

-- --------------------------------------------------------

--
-- Table structure for table `admissioncategory`
--

CREATE TABLE IF NOT EXISTS `admissioncategory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(255) NOT NULL,
  `IsShow` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `admissioncategory`
--


-- --------------------------------------------------------

--
-- Table structure for table `admissionform`
--

CREATE TABLE IF NOT EXISTS `admissionform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RegistarionDate` varchar(30) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `MName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `DOB` varchar(30) NOT NULL,
  `Gender` varchar(30) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `State` varchar(50) NOT NULL,
  `PostalCode` varchar(50) NOT NULL,
  `EmailId` varchar(50) NOT NULL,
  `FatherName` varchar(255) NOT NULL,
  `MotherName` varchar(255) NOT NULL,
  `StudenMobile` varchar(30) NOT NULL,
  `FatherMobile` varchar(30) NOT NULL,
  `Photo` longtext NOT NULL,
  `AdmissionInId` int(11) NOT NULL,
  `TenMarkSheet` longtext NOT NULL,
  `TwelveMarkSheet` longtext NOT NULL,
  `IsAnswered` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admissionform`
--


-- --------------------------------------------------------

--
-- Table structure for table `admissions`
--

CREATE TABLE IF NOT EXISTS `admissions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedOn` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Image` longtext NOT NULL,
  `Content` longtext NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `IsShow` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `admissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Description` longtext,
  `Image` longtext NOT NULL,
  `CreatedOn` varchar(100) NOT NULL,
  `IsShow` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `gallery`
--


-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE IF NOT EXISTS `inquiry` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `InquiryDate` varchar(200) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `EmailId` varchar(255) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Message` longtext NOT NULL,
  `IsAnswered` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `inquiry`
--


-- --------------------------------------------------------

--
-- Table structure for table `joboffercategory`
--

CREATE TABLE IF NOT EXISTS `joboffercategory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(255) NOT NULL,
  `IsShow` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `joboffercategory`
--


-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedOn` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Image` longtext NOT NULL,
  `Content` longtext NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `IsShow` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jobs`
--

