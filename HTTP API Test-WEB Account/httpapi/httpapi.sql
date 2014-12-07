/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.6.12-log : Database - httpapi
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`httpapi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `httpapi`;

/*Table structure for table `api_log` */

DROP TABLE IF EXISTS `api_log`;

CREATE TABLE `api_log` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `originator` varchar(255) NOT NULL,
  `msisdn` varchar(255) NOT NULL,
  `msgtext` text NOT NULL,
  `msgreply` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
