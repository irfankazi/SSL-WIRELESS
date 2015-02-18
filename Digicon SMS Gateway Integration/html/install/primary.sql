-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2014 at 03:31 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `besma`
--

-- --------------------------------------------------------

--
-- Table structure for table `accgroups`
--

CREATE TABLE IF NOT EXISTS `accgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `accgroups`
--

INSERT INTO `accgroups` (`id`, `groupname`) VALUES
(1, 'SoftVillageBD Group');

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `groupid` int(10) DEFAULT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `lname` text COLLATE utf8_unicode_ci NOT NULL,
  `company` text COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `address1` text COLLATE utf8_unicode_ci NOT NULL,
  `address2` text COLLATE utf8_unicode_ci,
  `state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `city` text COLLATE utf8_unicode_ci NOT NULL,
  `postcode` text COLLATE utf8_unicode_ci NOT NULL,
  `country` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datecreated` date NOT NULL,
  `email_limit` int(50) NOT NULL DEFAULT '0',
  `sms_limit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `lastlogin` datetime DEFAULT NULL,
  `email_perm` int(1) NOT NULL DEFAULT '1',
  `sms_perm` int(1) NOT NULL DEFAULT '1',
  `online` int(1) DEFAULT '0',
  `status` enum('Active','Inactive','Closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `pwresetkey` text COLLATE utf8_unicode_ci NOT NULL,
  `pwresetexpiry` int(10) NOT NULL,
  `emailnotify` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  PRIMARY KEY (`id`),
  KEY `firstname_lastname` (`name`(32),`lname`(32)),
  KEY `email` (`email`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `adminperms`
--

CREATE TABLE IF NOT EXISTS `adminperms` (
  `roleid` int(1) NOT NULL,
  `permid` int(1) NOT NULL,
  KEY `roleid_permid` (`roleid`,`permid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adminperms`
--

INSERT INTO `adminperms` (`roleid`, `permid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52);

-- --------------------------------------------------------

--
-- Table structure for table `adminroles`
--

CREATE TABLE IF NOT EXISTS `adminroles` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `adminroles`
--

INSERT INTO `adminroles` (`id`, `name`) VALUES
(1, 'Full Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `username` text NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `email` text NOT NULL,
  `image` text,
  `roleid` int(2) NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `pwresetkey` text,
  `pwresetexpiry` int(12) DEFAULT NULL,
  `emailnotify` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `online` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `fname`, `lname`, `username`, `password`, `status`, `email`, `image`, `roleid`, `lastlogin`, `pwresetkey`, `pwresetexpiry`, `emailnotify`, `online`) VALUES
(1, 'SoftVillage', 'BD', 'admin', 'bce978ee2ec277cf7c63c4044cc3fbdc', 'Active', 'support@softvillagebd.com', '../assets/admin/profile.jpg', 1, '2014-12-16 17:50:34', NULL, NULL, 'Yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `appconfig`
--

CREATE TABLE IF NOT EXISTS `appconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `appconfig`
--

INSERT INTO `appconfig` (`id`, `setting`, `value`) VALUES
(1, 'CompanyName', 'BESMA'),
(2, 'Email', 'support@softvillagebd.com'),
(3, 'sysUrl', 'http://localhost/besma'),
(4, 'caddress', '&lt;h3&gt;&lt;b&gt;Softvillagebd LTD&lt;/b&gt;&lt;/h3&gt; House # 77 Block # 4&lt;br&gt; Road # 22,Gulshan-2&lt;br&gt; Gulshan-2&lt;br&gt; Dhaka - 1212&lt;br&gt; Bangladesh&lt;br&gt;'),
(5, 'appStage', 'Development'),
(6, 'SoftwareVersion', '1.0.3'),
(7, 'WebsiteTitle', 'Bulk Email and SMS Management Application'),
(8, 'defaultcountry', 'USA'),
(9, 'defaultcurrency', 'USD'),
(10, 'defaultcurrencysymbol', '$'),
(11, 'logo', '../assets/uploads/logo.png'),
(12, 'admintheme', 'besma'),
(13, 'theme', 'besma'),
(14, 'footerTxt', 'Copyright &copy; BESMA 2014 All Rights Reserved'),
(15, 'BrandName', 'BESMA'),
(16, 'clientlanguage', 'English'),
(17, 'adminlanguage', 'English'),
(18, 'defaultcountrycode', 'BD'),
(19, 'email_perm', '1'),
(20, 'sms_perm', '1');

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE IF NOT EXISTS `email_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_providers`
--

CREATE TABLE IF NOT EXISTS `email_providers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `host_name` text,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `port` text,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `email_providers`
--

INSERT INTO `email_providers` (`id`, `name`, `host_name`, `username`, `password`, `port`, `status`) VALUES
(1, 'PHPMailer', 'smtp.gmail.com', 'Your SMTP User Name', 'Your SMTP Password', '587', 1),
(2, 'SendGrid', 'https://api.sendgrid.com/', 'Your User Name', 'Your Pasword', '587', 1),
(3, 'MailGun', 'smtp.mailgun.org', 'Your email', 'Your password', '587', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tplname` varchar(128) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `send` tinyint(1) DEFAULT '1',
  `core` enum('Yes','No') DEFAULT 'Yes',
  `hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`language_id`),
  KEY `tplname` (`tplname`(32))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `tplname`, `language_id`, `subject`, `message`, `send`, `core`, `hidden`) VALUES
(1, 'Customer SignUp', 1, 'Welcome to {{business_name}}', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <div width="125" height="23" style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"  {{business_name}} ></div>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n       				   Hi {{name}},<br>\r\n        			   <br>\r\n       					Thanks for signing up to {{business_name}}! This message is an automated reply to your registration request. Login to your account to set up your all details by using the details below:\r\n						<br>\r\n        				<a target="_blank" style="color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none" href="{{sys_url}}">{{sys_url}}</a>.<br>\r\n                                    Email: {{username}}<br>\r\n                                    Password: {{password}} \r\n						<br>\r\n						Regards,<br>\r\n						The Team at {{business_name}}<br>\r\n						<br>\r\n					</td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left">&nbsp;</td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center">&nbsp;</td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>\r\n', 1, 'Yes', 0),
(2, 'Ticket For Customer', 1, 'New Ticket From {{business_name}}', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <div width="125" height="23" style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"  {{business_name}} ></div>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n                 Hi {{name}},<br>\r\n                 <br>\r\n                Thank you for stay with us! This is a Support Ticket For Yours.. Login to your account to view  your support tickets details:\r\n            <br>\r\n                <a target="_blank" style="color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none" href="{{sys_url}}">{{sys_url}}</a>.<br>\r\n                Ticket ID: {{ticket_id}}<br>\r\n                Ticket Subject: {{ticket_subject}}<br>\r\n                Message: {{message}}<br>\r\n                Created By: {{create_by}} \r\n            <br>\r\n            Regards,<br>\r\n            The Team at {{business_name}}<br>\r\n            <br>\r\n          </td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left">Â </td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center">Â </td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright Â© {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>\r\n', 1, 'Yes', 0),
(3, 'Add New Administration', 1, 'Welcome To {{business_name}} Administration', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <p  style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"  {{business_name}} ></p>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n       				   Hi {{name}},<br>\r\n        			   <br>\r\n       					Welcome to {{business_name}} Administration!  This message is an automated reply to your administration registration request. Login to your account to set up your all details by using the details below:\r\n						<br>\r\n        				<a target="_blank" style="color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none" href=" {{sys_url}}/admin"> {{sys_url}}/admin</a>.<br>\r\n                                    Email: {{username}}<br>\r\n                                    Password: {{password}} \r\n						<br>\r\n						On behalf of the {{business_name}},<br>\r\n						The Team at {{business_name}}<br>\r\n						<br>\r\n					</td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left">&nbsp;</td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center">&nbsp;</td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>\r\n', 1, 'Yes', 0),
(4, 'Admin Password Reset', 1, '{{business_name}} New Password', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <p  style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"  \r\n                            {{business_name}} ></p>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n                 Hi {{name}},<br>\r\n                 <br>\r\n                Password Reset Successfuly!   This message is an automated reply to your password reset request. Login to your account to set up your all details by using the details below:\r\n            <br>\r\n                <a target="_blank" style="color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none" href=" {{sys_url}}"> {{sys_url}}</a>.<br>\r\n                                    User Name: {{username}}<br>\r\n                                    Password: {{password}} \r\n            <br>\r\n            On behalf of the {{business_name}},<br>\r\n            The Team at {{business_name}}<br>\r\n            <br>\r\n          </td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left">&nbsp;</td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center">&nbsp;</td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>\r\n', 1, 'Yes', 0),
(5, 'Forgot Admin Password', 1, '{{business_name}} password change request', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <p  style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"  \r\n                            {{business_name}} ></p>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n       				   Hi {{name}},<br>\r\n        			   <br>\r\n       					Password Reset Successfuly!   This message is an automated reply to your password reset request. Click this linke to reset your password:\r\n						<br>\r\n        				<a target="_blank" style="color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none" href=" {{forgotpw_link}} "> {{forgotpw_link}} </a>.<br>\r\nNotes: Until your password has been changed, your current password will remain valid. The Forgot Password Link will be available for a limited time only.\r\n\r\n						<br>\r\n						On behalf of the {{business_name}},<br>\r\n						The Team at {{business_name}}<br>\r\n						<br>\r\n					</td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left">&nbsp;</td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center">&nbsp;</td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>\r\n', 1, 'Yes', 0);
INSERT INTO `email_templates` (`id`, `tplname`, `language_id`, `subject`, `message`, `send`, `core`, `hidden`) VALUES
(6, 'Ticket Reply', 1, 'Reply to Ticket [TID-{{ticket_id}}]', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <div width="125" height="23" style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"  {{business_name}} ></div>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n                 Hi {{name}},<br>\r\n                 <br>\r\n                Thank you for stay with us! This is a Support Ticket Reply. Login to your account to view  your support ticket reply details:\r\n            <br>\r\n                <a target="_blank" style="color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none" href="{{sys_url}}">{{sys_url}}</a>.<br>\r\n                Ticket ID: {{ticket_id}}<br>\r\n                Ticket Subject: {{ticket_subject}}<br>\r\n                Message: {{message}}<br>\r\n                Replyed By: {{reply_by}} <br><br>\r\n                Should you have any questions in regards to this support ticket or any other tickets related issue, please feel free to contact the Support department by creating a new ticket from your Client Portal \r\n            <br><br>\r\n            Regards,<br>\r\n            The Team at {{business_name}}<br>\r\n            <br>\r\n          </td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left">&nbsp;</td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center">&nbsp;</td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>\r\n', 1, 'Yes', 0),
(7, 'Forgot Client Password', 1, '{{business_name}} password change request', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <p  style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"  \r\n                            {{business_name}} ></p>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n       				   Hi {{name}},<br>\r\n        			   <br>\r\n       					Password Reset Successfuly!   This message is an automated reply to your password reset request. Click this linke to reset your password:\r\n						<br>\r\n        				<a target="_blank" style="color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none" href=" {{forgotpw_link}} "> {{forgotpw_link}} </a>.<br>\r\nNotes: Until your password has been changed, your current password will remain valid. The Forgot Password Link will be available for a limited time only.\r\n\r\n						<br>\r\n						On behalf of the {{business_name}},<br>\r\n						The Team at {{business_name}}<br>\r\n						<br>\r\n					</td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left">&nbsp;</td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center">&nbsp;</td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>\r\n', 1, 'Yes', 0),
(8, 'Client Password Reset', 1, '{{business_name}} New Password', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <p  style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"  \r\n                            {{business_name}} ></p>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n                 Hi {{name}},<br>\r\n                 <br>\r\n                Password Reset Successfuly!   This message is an automated reply to your password reset request. Login to your account to set up your all details by using the details below:\r\n            <br>\r\n                <a target="_blank" style="color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none" href=" {{sys_url}}"> {{sys_url}}</a>.<br>\r\n                                    Email: {{username}}<br>\r\n                                    Password: {{password}} \r\n            <br>\r\n            On behalf of the {{business_name}},<br>\r\n            The Team at {{business_name}}<br>\r\n            <br>\r\n          </td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left">&nbsp;</td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center">&nbsp;</td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>\r\n', 1, 'Yes', 0),
(9, 'Ticket For Admin', 1, 'New Ticket From {{business_name}} Client', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <div width="125" height="23" style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"  {{business_name}} ></div>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n                 Hi {{name}},<br>{{department_name}},<br>\r\n                 <br>\r\n            \r\n                Ticket ID: {{ticket_id}}<br>\r\n                Ticket Subject: {{ticket_subject}}<br>\r\n                Message: {{message}}<br>\r\n                Created By: {{create_by}} <br><br>\r\n                Waiting for your quick response.\r\n            <br><br>\r\n            Thank you. \r\n            <br>\r\n            Regards,<br>\r\n            {{name}}<br>\r\n{{business_name}} Client. \r\n            <br>\r\n          </td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left">&nbsp;</td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center">&nbsp;</td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>\r\n', 1, 'Yes', 0),
(10, 'Client Ticket Reply', 1, 'Reply to Ticket [TID-{{ticket_id}}]', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <div width="125" height="23" style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"  {{business_name}} ></div>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n                 Hi {{name}},<br>{{department_name}},<br>\r\n                 <br>\r\n                 This is a Support Ticket Reply From Cleint.\r\n            <br>\r\n                Ticket ID: {{ticket_id}}<br>\r\n                Ticket Subject: {{ticket_subject}}<br>\r\n                Message: {{message}}<br>\r\n                Replyed By: {{reply_by}}  <br><br>\r\n                Waiting for your quick response.\r\n            <br><br>\r\n            Thank you. \r\n            <br>\r\n            Regards,<br>\r\n            {{name}}<br>\r\n{{business_name}} Client. \r\n            <br>\r\n          </td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left">&nbsp;</td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center">&nbsp;</td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright &copy; {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>\r\n', 1, 'Yes', 0),
(11, 'Bulk Email Send', 1, 'Email From {{business_name}}', '{{message_body}}\r\n', 1, 'Yes', 0);
INSERT INTO `email_templates` (`id`, `tplname`, `language_id`, `subject`, `message`, `send`, `core`, `hidden`) VALUES
(12, 'Customer Invoice Created', 1, '{{business_name}} Invoice', '<div style="margin:0;padding:0"> \r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#439cc8">\r\n  <tbody><tr>\r\n    <td align="center">\r\n            <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n              <tbody><tr>\r\n                <td height="95" bgcolor="#439cc8" style="background:#439cc8;text-align:left">\r\n                <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                      <tbody><tr>\r\n                        <td width="672" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td style="text-align:left">                        \r\n                        <table cellspacing="0" cellpadding="0" width="672" border="0">\r\n                          <tbody><tr>\r\n                            <td width="37" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left">\r\n                            </td>\r\n                            <td width="523" height="24" style="text-align:left">\r\n                            <div width="125" height="23" style="display:block;color:#ffffff;font-size:20px;font-family:Arial,Helvetica,sans-serif;max-width:557px;min-height:auto"   >{{business_name}}</div>\r\n                            </td>\r\n                            <td width="44" style="text-align:left"></td>\r\n                            <td width="30" style="text-align:left"></td>\r\n                            <td width="38" height="24" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n                          </tr>\r\n                        </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr><td width="672" height="33" style="font-size:33px;line-height:33px;height:33px;text-align:left"></td></tr>\r\n                    </tbody></table>\r\n                \r\n                </td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n    </tr>\r\n </tbody></table>  \r\n  \r\n <table cellspacing="0" cellpadding="0" width="100%" bgcolor="#439cc8"><tbody><tr><td height="5" style="background:#439cc8;height:5px;font-size:5px;line-height:5px"></td></tr></tbody></table>\r\n       \r\n <table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#e9eff0">\r\n  <tbody><tr>\r\n    <td align="center">\r\n      <table cellspacing="0" cellpadding="0" width="671" border="0" bgcolor="#e9eff0" style="background:#e9eff0">\r\n        <tbody><tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n          <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="596" border="0" bgcolor="#ffffff">\r\n            <tbody><tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n              <td width="556" style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0" style="font-family:helvetica,arial,sans-seif;color:#666666;font-size:16px;line-height:22px">\r\n                <tbody><tr>\r\n                  <td style="text-align:left"></td>\r\n                </tr>\r\n                <tr>\r\n                  <td style="text-align:left"><table cellspacing="0" cellpadding="0" width="556" border="0">\r\n                    <tbody><tr><td style="font-family:helvetica,arial,sans-serif;font-size:30px;line-height:40px;font-weight:normal;color:#253c44;text-align:left"></td></tr>\r\n                    <tr><td width="556" height="20" style="font-size:20px;line-height:20px;height:20px;text-align:left"></td></tr>\r\n                    <tr>\r\n                      <td style="text-align:left">\r\n       				   Hi {{name}},<br>\r\n        			   <br>\r\n       					Thank you for stay with us! This message is an automated reply to your invoice request. Login to your account to view your invoice details.<br /><br />\r\n						<br>\r\n        				<a target="_blank" style="color:#ff6600;font-weight:bold;font-family:helvetica,arial,sans-seif;text-decoration:none" href="{{sys_url}}">{{sys_url}}</a>.<br>\r\n                                    Invoice ID: {{invoice_id}} <br>\r\n                                    Invoice Amount: {{invoice_amount}}\r\n						<br>\r\n            Should you have any questions in regards to this invoice or any other billing related issue, please feel free to contact the Billing department by creating a new ticket from your Client Portal.\r\n            <br><br>\r\n						Regards,<br>\r\n						The Team at {{business_name}}<br>\r\n						<br>\r\n					</td>\r\n                    </tr>\r\n                    <tr>\r\n                      <td width="556" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"> </td>\r\n                    </tr>\r\n                  </tbody></table></td>\r\n                </tr>\r\n              </tbody></table></td>\r\n              <td width="20" height="26" style="font-size:26px;line-height:26px;height:26px;text-align:left"></td>\r\n            </tr>\r\n            <tr>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="556" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n              <td width="20" height="2" bgcolor="#d9dfe1" style="background-color:#d9dfe1;font-size:2px;line-height:2px;height:2px;text-align:left"></td>\r\n            </tr>\r\n          </tbody></table></td>\r\n          <td width="37" height="40" style="font-size:40px;line-height:40px;height:40px;text-align:left"></td>\r\n        </tr>\r\n        <tr>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="596" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="37" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n        </tr>\r\n      </tbody></table>\r\n  </td></tr>\r\n</tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#273f47"><tbody><tr><td align="center"> </td></tr></tbody></table>\r\n<table cellspacing="0" cellpadding="0" width="100%" border="0" bgcolor="#364a51">\r\n  <tbody><tr>\r\n    <td align="center">\r\n       <table cellspacing="0" cellpadding="0" width="672" border="0" bgcolor="#364a51">\r\n              <tbody><tr>\r\n              <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="569" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n          <td width="38" height="30" style="font-size:30px;line-height:30px;height:30px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left">\r\n                </td>\r\n                <td valign="top" style="font-family:helvetica,arial,sans-seif;font-size:12px;line-height:16px;color:#949fa3;text-align:left">Copyright © {{business_name}}, All rights reserved.<br><br><br></td>\r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n              <tr>\r\n              <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              <td width="569" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>              \r\n                <td width="38" height="40" style="font-size:40px;line-height:40px;text-align:left"></td>\r\n              </tr>\r\n            </tbody></table>\r\n     </td>\r\n  </tr>\r\n</tbody></table><div class="yj6qo"></div><div class="adL">\r\n     \r\n</div></div>', 1, 'Yes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_transaction`
--

CREATE TABLE IF NOT EXISTS `email_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `amount` int(10) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `int_country_codes`
--

CREATE TABLE IF NOT EXISTS `int_country_codes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(200) DEFAULT NULL,
  `iso_code` varchar(100) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `tariff` float(5,2) DEFAULT '3.00',
  `active` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=212 ;

--
-- Dumping data for table `int_country_codes`
--

INSERT INTO `int_country_codes` (`Id`, `country_name`, `iso_code`, `country_code`, `tariff`, `active`) VALUES
(1, 'Afghanistan', 'AF / AFG', '93', 3.00, 0),
(2, 'Albania', 'AL / ALB', '355', 3.00, 0),
(3, 'Algeria', 'DZ / DZA', '213', 3.00, 0),
(4, 'Andorra', 'AD / AND', '376', 3.00, 0),
(5, 'Angola', 'AO / AGO', '244', 3.00, 0),
(6, 'Antarctica', 'AQ / ATA', '672', 3.00, 0),
(7, 'Argentina', 'AR / ARG', '54', 3.00, 0),
(8, 'Armenia', 'AM / ARM', '374', 3.00, 0),
(9, 'Aruba', 'AW / ABW', '297', 3.00, 0),
(10, 'Australia', 'AU / AUS', '61', 3.00, 0),
(11, 'Austria', 'AT / AUT', '43', 3.00, 0),
(12, 'Azerbaijan', 'AZ / AZE', '994', 3.00, 0),
(13, 'Bahrain', 'BH / BHR', '973', 3.00, 0),
(14, 'Bangladesh', 'BD / BGD', '880', 0.80, 1),
(15, 'Belarus', 'BY / BLR', '375', 3.00, 0),
(16, 'Belgium', 'BE / BEL', '32', 3.00, 0),
(17, 'Belize', 'BZ / BLZ', '501', 3.00, 0),
(18, 'Benin', 'BJ / BEN', '229', 3.00, 0),
(19, 'Bhutan', 'BT / BTN', '975', 3.00, 0),
(20, 'Bolivia', 'BO / BOL', '591', 3.00, 0),
(21, 'Bosnia and Herzegovina', 'BA / BIH', '387', 3.00, 0),
(22, 'Botswana', 'BW / BWA', '267', 3.00, 0),
(23, 'Brazil', 'BR / BRA', '55', 3.00, 0),
(24, 'Brunei', 'BN / BRN', '673', 3.00, 0),
(25, 'Bulgaria', 'BG / BGR', '359', 3.00, 0),
(26, 'Burkina Faso', 'BF / BFA', '226', 3.00, 0),
(27, 'Burma (Myanmar)', 'MM / MMR', '95', 3.00, 0),
(28, 'Burundi', 'BI / BDI', '257', 3.00, 0),
(29, 'Cambodia', 'KH / KHM', '855', 3.00, 0),
(30, 'Cameroon', 'CM / CMR', '237', 3.00, 0),
(31, 'Canada', 'CA / CAN', '1', 3.00, 0),
(32, 'Cape Verde', 'CV / CPV', '238', 3.00, 0),
(33, 'Central African Republic', 'CF / CAF', '236', 3.00, 0),
(34, 'Chad', 'TD / TCD', '235', 3.00, 0),
(35, 'Chile', 'CL / CHL', '56', 3.00, 0),
(36, 'China', 'CN / CHN', '86', 3.00, 0),
(37, 'Christmas Island', 'CX / CXR', '61', 3.00, 0),
(38, 'Cocos (Keeling) Islands', 'CC / CCK', '61', 3.00, 0),
(39, 'Colombia', 'CO / COL', '57', 3.00, 0),
(40, 'Comoros', 'KM / COM', '269', 3.00, 0),
(41, 'Cook Islands', 'CK / COK', '682', 3.00, 0),
(42, 'Costa Rica', 'CR / CRC', '506', 3.00, 0),
(43, 'Croatia', 'HR / HRV', '385', 3.00, 0),
(44, 'Cuba', 'CU / CUB', '53', 3.00, 0),
(45, 'Cyprus', 'CY / CYP', '357', 3.00, 0),
(46, 'Czech Republic', 'CZ / CZE', '420', 3.00, 0),
(47, 'Congo', 'CD / COD', '243', 3.00, 0),
(48, 'Denmark', 'DK / DNK', '45', 3.00, 0),
(49, 'Djibouti', 'DJ / DJI', '253', 3.00, 0),
(50, 'Ecuador', 'EC / ECU', '593', 3.00, 0),
(51, 'Egypt', 'EG / EGY', '20', 3.00, 0),
(52, 'El Salvador', 'SV / SLV', '503', 3.00, 0),
(53, 'Equatorial Guinea', 'GQ / GNQ', '240', 3.00, 0),
(54, 'Eritrea', 'ER / ERI', '291', 3.00, 0),
(55, 'Estonia', 'EE / EST', '372', 3.00, 0),
(56, 'Ethiopia', 'ET / ETH', '251', 3.00, 0),
(57, 'Falkland Islands', 'FK / FLK', '500', 3.00, 0),
(58, 'Faroe Islands', 'FO / FRO', '298', 3.00, 0),
(59, 'Fiji', 'FJ / FJI', '679', 3.00, 0),
(60, 'Finland', 'FI / FIN', '358', 3.00, 0),
(61, 'France', 'FR / FRA', '33', 3.00, 0),
(62, 'French Polynesia', 'PF / PYF', '689', 3.00, 0),
(63, 'Gabon', 'GA / GAB', '241', 3.00, 0),
(64, 'Gambia', 'GM / GMB', '220', 3.00, 0),
(65, 'Gaza Strip', '/', '970', 3.00, 0),
(66, 'Georgia', 'GE / GEO', '995', 3.00, 0),
(67, 'Germany', 'DE / DEU', '49', 3.00, 0),
(68, 'Ghana', 'GH / GHA', '233', 3.00, 0),
(69, 'Gibraltar', 'GI / GIB', '350', 3.00, 0),
(70, 'Greece', 'GR / GRC', '30', 3.00, 0),
(71, 'Greenland', 'GL / GRL', '299', 3.00, 0),
(72, 'Guatemala', 'GT / GTM', '502', 3.00, 0),
(73, 'Guinea', 'GN / GIN', '224', 3.00, 0),
(74, 'Guinea-Bissau', 'GW / GNB', '245', 3.00, 0),
(75, 'Guyana', 'GY / GUY', '592', 3.00, 0),
(76, 'Haiti', 'HT / HTI', '509', 3.00, 0),
(77, 'Holy See (Vatican City)', 'VA / VAT', '39', 3.00, 0),
(78, 'Honduras', 'HN / HND', '504', 3.00, 0),
(79, 'Hong Kong', 'HK / HKG', '852', 3.00, 0),
(80, 'Hungary', 'HU / HUN', '36', 3.00, 0),
(81, 'Iceland', 'IS / IS', '354', 3.00, 0),
(82, 'India', 'IN / IND', '91', 3.00, 0),
(83, 'Indonesia', 'ID / IDN', '62', 3.00, 0),
(84, 'Iran', 'IR / IRN', '98', 3.00, 0),
(85, 'Iraq', 'IQ / IRQ', '964', 3.00, 0),
(86, 'Ireland', 'IE / IRL', '353', 3.00, 0),
(87, 'Isle of Man', 'IM / IMN', '44', 3.00, 0),
(88, 'Israel', 'IL / ISR', '972', 3.00, 0),
(89, 'Italy', 'IT / ITA', '39', 3.00, 0),
(90, 'Ivory Coast', 'CI / CIV', '225', 3.00, 0),
(91, 'Japan', 'JP / JPN', '81', 3.00, 0),
(92, 'Jordan', 'JO / JOR', '962', 3.00, 0),
(93, 'Kazakhstan', 'KZ / KAZ', '7', 3.00, 0),
(94, 'Kenya', 'KE / KEN', '254', 3.00, 0),
(95, 'Kiribati', 'KI / KIR', '686', 3.00, 0),
(96, 'Kosovo', '/', '381', 3.00, 0),
(97, 'Kuwait', 'KW / KWT', '965', 3.00, 0),
(98, 'Kyrgyzstan', 'KG / KGZ', '996', 3.00, 0),
(99, 'Laos', 'LA / LAO', '856', 3.00, 0),
(100, 'Latvia', 'LV / LVA', '371', 3.00, 0),
(101, 'Lebanon', 'LB / LBN', '961', 3.00, 0),
(102, 'Lesotho', 'LS / LSO', '266', 3.00, 0),
(103, 'Liberia', 'LR / LBR', '231', 3.00, 0),
(104, 'Libya', 'LY / LBY', '218', 3.00, 0),
(105, 'Liechtenstein', 'LI / LIE', '423', 3.00, 0),
(106, 'Lithuania', 'LT / LTU', '370', 3.00, 0),
(107, 'Luxembourg', 'LU / LUX', '352', 3.00, 0),
(108, 'Macau', 'MO / MAC', '853', 3.00, 0),
(109, 'Macedonia', 'MK / MKD', '389', 3.00, 0),
(110, 'Madagascar', 'MG / MDG', '261', 3.00, 0),
(111, 'Malawi', 'MW / MWI', '265', 3.00, 0),
(112, 'Malaysia', 'MY / MYS', '60', 3.00, 0),
(113, 'Maldives', 'MV / MDV', '960', 3.00, 0),
(114, 'Mali', 'ML / MLI', '223', 3.00, 0),
(115, 'Malta', 'MT / MLT', '356', 3.00, 0),
(116, 'Marshall Islands', 'MH / MHL', '692', 3.00, 0),
(117, 'Mauritania', 'MR / MRT', '222', 3.00, 0),
(118, 'Mauritius', 'MU / MUS', '230', 3.00, 0),
(119, 'Mayotte', 'YT / MYT', '262', 3.00, 0),
(120, 'Mexico', 'MX / MEX', '52', 3.00, 0),
(121, 'Micronesia', 'FM / FSM', '691', 3.00, 0),
(122, 'Moldova', 'MD / MDA', '373', 3.00, 0),
(123, 'Monaco', 'MC / MCO', '377', 3.00, 0),
(124, 'Mongolia', 'MN / MNG', '976', 3.00, 0),
(125, 'Montenegro', 'ME / MNE', '382', 3.00, 0),
(126, 'Morocco', 'MA / MAR', '212', 3.00, 0),
(127, 'Mozambique', 'MZ / MOZ', '258', 3.00, 0),
(128, 'Namibia', 'NA / NAM', '264', 3.00, 0),
(129, 'Nauru', 'NR / NRU', '674', 3.00, 0),
(130, 'Nepal', 'NP / NPL', '977', 3.00, 0),
(131, 'Netherlands', 'NL / NLD', '31', 3.00, 0),
(132, 'Netherlands Antilles', 'AN / ANT', '599', 3.00, 0),
(133, 'New Caledonia', 'NC / NCL', '687', 3.00, 0),
(134, 'New Zealand', 'NZ / NZL', '64', 3.00, 0),
(135, 'Nicaragua', 'NI / NIC', '505', 3.00, 0),
(136, 'Niger', 'NE / NER', '227', 3.00, 0),
(137, 'Nigeria', 'NG / NGA', '234', 3.00, 0),
(138, 'Niue', 'NU / NIU', '683', 3.00, 0),
(139, 'Norfolk Island', '/ NFK', '672', 3.00, 0),
(140, 'North Korea', 'KP / PRK', '850', 3.00, 0),
(141, 'Norway', 'NO / NOR', '47', 3.00, 0),
(142, 'Oman', 'OM / OMN', '968', 3.00, 0),
(143, 'Pakistan', 'PK / PAK', '92', 3.00, 0),
(144, 'Palau', 'PW / PLW', '680', 3.00, 0),
(145, 'Panama', 'PA / PAN', '507', 3.00, 0),
(146, 'Papua New Guinea', 'PG / PNG', '675', 3.00, 0),
(147, 'Paraguay', 'PY / PRY', '595', 3.00, 0),
(148, 'Peru', 'PE / PER', '51', 3.00, 0),
(149, 'Philippines', 'PH / PHL', '63', 3.00, 0),
(150, 'Pitcairn Islands', 'PN / PCN', '870', 3.00, 0),
(151, 'Poland', 'PL / POL', '48', 3.00, 0),
(152, 'Portugal', 'PT / PRT', '351', 3.00, 0),
(153, 'Puerto Rico', 'PR / PRI', '1', 3.00, 0),
(154, 'Qatar', 'QA / QAT', '974', 3.00, 0),
(155, 'Republic of the Congo', 'CG / COG', '242', 3.00, 0),
(156, 'Romania', 'RO / ROU', '40', 3.00, 0),
(157, 'Russia', 'RU / RUS', '7', 3.00, 0),
(158, 'Rwanda', 'RW / RWA', '250', 3.00, 0),
(159, 'Saint Barthelemy', 'BL / BLM', '590', 3.00, 0),
(160, 'Saint Helena', 'SH / SHN', '290', 3.00, 0),
(161, 'Saint Pierre and Miquelon', 'PM / SPM', '508', 3.00, 0),
(162, 'Samoa', 'WS / WSM', '685', 3.00, 0),
(163, 'San Marino', 'SM / SMR', '378', 3.00, 0),
(164, 'Sao Tome and Principe', 'ST / STP', '239', 3.00, 0),
(165, 'Saudi Arabia', 'SA / SAU', '966', 3.00, 0),
(166, 'Senegal', 'SN / SEN', '221', 3.00, 0),
(167, 'Serbia', 'RS / SRB', '381', 3.00, 0),
(168, 'Seychelles', 'SC / SYC', '248', 3.00, 0),
(169, 'Sierra Leone', 'SL / SLE', '232', 3.00, 0),
(170, 'Singapore', 'SG / SGP', '65', 3.00, 0),
(171, 'Slovakia', 'SK / SVK', '421', 3.00, 0),
(172, 'Slovenia', 'SI / SVN', '386', 3.00, 0),
(173, 'Solomon Islands', 'SB / SLB', '677', 3.00, 0),
(174, 'Somalia', 'SO / SOM', '252', 3.00, 0),
(175, 'South Africa', 'ZA / ZAF', '27', 3.00, 0),
(176, 'South Korea', 'KR / KOR', '82', 3.00, 0),
(177, 'Spain', 'ES / ESP', '34', 3.00, 0),
(178, 'Sri Lanka', 'LK / LKA', '94', 3.00, 0),
(179, 'Sudan', 'SD / SDN', '249', 3.00, 0),
(180, 'Suriname', 'SR / SUR', '597', 3.00, 0),
(181, 'Swaziland', 'SZ / SWZ', '268', 3.00, 0),
(182, 'Sweden', 'SE / SWE', '46', 3.00, 0),
(183, 'Switzerland', 'CH / CHE', '41', 3.00, 0),
(184, 'Syria', 'SY / SYR', '963', 3.00, 0),
(185, 'Taiwan', 'TW / TWN', '886', 3.00, 0),
(186, 'Tajikistan', 'TJ / TJK', '992', 3.00, 0),
(187, 'Tanzania', 'TZ / TZA', '255', 3.00, 0),
(188, 'Thailand', 'TH / THA', '66', 3.00, 0),
(189, 'Timor-Leste', 'TL / TLS', '670', 3.00, 0),
(190, 'Togo', 'TG / TGO', '228', 3.00, 0),
(191, 'Tokelau', 'TK / TKL', '690', 3.00, 0),
(192, 'Tonga', 'TO / TON', '676', 3.00, 0),
(193, 'Tunisia', 'TN / TUN', '216', 3.00, 0),
(194, 'Turkey', 'TR / TUR', '90', 3.00, 0),
(195, 'Turkmenistan', 'TM / TKM', '993', 3.00, 0),
(196, 'Tuvalu', 'TV / TUV', '688', 3.00, 0),
(197, 'Uganda', 'UG / UGA', '256', 3.00, 0),
(198, 'Ukraine', 'UA / UKR', '380', 3.00, 0),
(199, 'United Arab Emirates', 'AE / ARE', '971', 3.00, 0),
(200, 'United Kingdom', 'GB / GBR', '44', 3.00, 0),
(201, 'United States', 'US / USA', '1', 3.00, 0),
(202, 'Uruguay', 'UY / URY', '598', 3.00, 0),
(203, 'Uzbekistan', 'UZ / UZB', '998', 3.00, 0),
(204, 'Vanuatu', 'VU / VUT', '678', 3.00, 0),
(205, 'Venezuela', 'VE / VEN', '58', 3.00, 0),
(206, 'Vietnam', 'VN / VNM', '84', 3.00, 0),
(207, 'Wallis and Futuna', 'WF / WLF', '681', 3.00, 0),
(208, 'West Bank', '/', '970', 3.00, 0),
(209, 'Yemen', 'YE / YEM', '967', 3.00, 0),
(210, 'Zambia', 'ZM / ZMB', '260', 3.00, 0),
(211, 'Zimbabwe', 'ZW / ZWE', '263', 3.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoiceitems`
--

CREATE TABLE IF NOT EXISTS `invoiceitems` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) NOT NULL,
  `item` text NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `qty` int(10) DEFAULT NULL,
  `tamount` decimal(10,2) NOT NULL,
  `invoiceid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `created` date DEFAULT NULL,
  `datepaid` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('Unpaid','Paid','Partially Paid','Cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Unpaid',
  `paymentmethod` text COLLATE utf8_unicode_ci NOT NULL,
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(5,2) DEFAULT '0.00',
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE IF NOT EXISTS `payment_gateways` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `settings` text NOT NULL,
  `extra_value` text,
  `status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `value`, `settings`, `extra_value`, `status`) VALUES
(1, 'Paypal', 'demo@paypal.com', 'paypal', '', 'active'),
(2, 'Stripe', 'pk_test_ARblMczqDw61NusMMs7o1RVK', 'stripe', 'sk_test_BQokikJOvBiI2HlWgH4olfQ2', 'active'),
(3, 'Bank', 'Make a Payment to Our Bank Account &lt;br&gt;Bank Name: Bank Name &lt;br&gt;Account Name: Account Holder Name &lt;br&gt;Account Number: Account Number &lt;br&gt;', 'manualpayment', '', 'active'),
(4, 'Authorize.net', 'YOUR_API_LOGIN_ID', 'authorize_net', 'YOUR_TRANSACTION_KEY', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateway`
--

CREATE TABLE IF NOT EXISTS `sms_gateway` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `api_link` text,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `api_id` text,
  `credit` varchar(5) NOT NULL DEFAULT '1',
  `schedule` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `sms_gateway`
--

INSERT INTO `sms_gateway` (`id`, `name`, `api_link`, `username`, `password`, `api_id`, `credit`, `schedule`, `status`) VALUES
(1, 'Twilio', '', 'Account SID', 'Auth Token', '', '2', 'No', 'Active'),
(2, 'Clickatell', 'http://api.clickatell.com', 'Enter Clickatell API Name', 'Enter Clickatell API Password', 'Enter Clickatell API ID', '1', 'No', 'Active'),
(3, 'SMSKaufen', 'http://www.smskaufen.com/sms/gateway/sms.php', 'API User Name', 'SMS API Key', '', '1', 'No', 'Active'),
(4, 'Route SMS', 'Enter your Gateway link', 'user', 'password', '', '0.5', 'No', 'Active'),
(5, 'SMSGlobal', 'http://www.smsglobal.com/http-api.php', 'username', 'password', '', '1', 'Yes', 'Active'),
(6, 'Nexmo', 'http://rest.nexmo.com/sms/xml', 'xxxxx', 'xxxxx', NULL, '1', 'No', 'Active'),
(7, 'Kapow', 'http://www.kapow.co.uk/scripts/sendsms.php', 'username', 'password', '', '1', 'No', 'Active'),
(8, 'TelAPI', '', 'Account SID', 'Auth Token', '', '1', 'No', 'Active'),
(9, 'NibsSMS', 'http://nibssms.com/portal/apiclient', 'User Name', 'API Key', '18', '1', 'Yes', 'Active'),
(10, 'InfoBip', 'http://api.infobip.com/api/v3/sendsms/plain', 'username', 'password', '', '1', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `sms_history`
--

CREATE TABLE IF NOT EXISTS `sms_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `sender` varchar(25) NOT NULL,
  `receiver` varchar(25) NOT NULL,
  `amount` int(5) NOT NULL,
  `sms` text NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `report` text,
  `reqlogtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_plan_feature`
--

CREATE TABLE IF NOT EXISTS `sms_plan_feature` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `fvalue` varchar(50) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_price_plan`
--

CREATE TABLE IF NOT EXISTS `sms_price_plan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `popular` int(2) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_transaction`
--

CREATE TABLE IF NOT EXISTS `sms_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `amount` int(10) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `supportdepartments`
--

CREATE TABLE IF NOT EXISTS `supportdepartments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL,
  `show` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(64))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `supportdepartments`
--

INSERT INTO `supportdepartments` (`id`, `name`, `email`, `order`, `show`) VALUES
(1, 'Support Department', 'support@example.com', 1, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `ticketreplies`
--

CREATE TABLE IF NOT EXISTS `ticketreplies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tid` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `admin` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `tid_date` (`tid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `did` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Pending','Answered','Customer Reply','In Progress','Closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `admin` text COLLATE utf8_unicode_ci NOT NULL,
  `replyby` text COLLATE utf8_unicode_ci NOT NULL,
  `closed_by` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
