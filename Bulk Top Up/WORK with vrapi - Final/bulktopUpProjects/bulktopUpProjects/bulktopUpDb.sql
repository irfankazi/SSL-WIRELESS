/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.1.61 : Database - bulktopup
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bulktopup` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bulktopup`;

/*Table structure for table `RechargeInfoTbl` */

DROP TABLE IF EXISTS `RechargeInfoTbl`;

CREATE TABLE `RechargeInfoTbl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(50) NOT NULL,
  `client_pass` varchar(50) NOT NULL,
  `guid` varchar(30) NOT NULL,
  `vr_guid` varchar(30) DEFAULT NULL,
  `operator_id` int(5) NOT NULL,
  `recepient_msisdn` varchar(15) NOT NULL,
  `amount` int(100) NOT NULL,
  `connection_type` varchar(20) NOT NULL,
  `Create_Status_Code` varchar(50) DEFAULT NULL,
  `create_recharge_Status` varchar(150) DEFAULT 'processing',
  `Init_Status_Code` varchar(50) NOT NULL,
  `init_recharge_status` varchar(200) DEFAULT 'processing',
  `RequestDateTime` datetime DEFAULT NULL,
  `SentDateTime` datetime DEFAULT NULL,
  `ResponseDateTime` datetime DEFAULT NULL,
  `Create_Try` int(10) DEFAULT '0',
  `Init_try` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=401 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
