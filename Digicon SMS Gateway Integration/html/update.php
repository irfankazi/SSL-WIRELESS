<?php
require ('AppConfig.php');
$msg = 'Running SQL Update.... <br>';
$dbh = null;
$v = '1.0.2';
$latest = '1.0.3';
try {
    $dbh = new PDO("mysql:host=$db_host;dbname=$db_name", $db_user, $db_password);
} catch (PDOException $e) {
    echo $e->getMessage();
}

if (count($dbh->query("SHOW COLUMNS FROM `accounts` LIKE 'email_perm'")->fetchAll())) {

    $v = '1.0.3';
    $msg .= 'It seems, your version is up to date for version 1.0.3 <br>';
} else {

    $msg .= 'Running update for Version 1.0.3 ..... <br>';

   $sql = <<<EOF

ALTER TABLE `accounts` ADD `email_perm` INT(1) NOT NULL DEFAULT '1' AFTER `lastlogin`;

ALTER TABLE `accounts` ADD `sms_perm` INT(1) NOT NULL DEFAULT '1' AFTER `email_perm`;

INSERT INTO `appconfig` (`id`, `setting`, `value`) VALUES (NULL, 'email_perm', '1'), (NULL, 'sms_perm', '1');


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

ALTER TABLE `invoices` DROP `item`;


ALTER TABLE `sms_gateway` ADD `schedule` ENUM('Yes','No') NOT NULL DEFAULT 'No' AFTER `credit`;

INSERT INTO `email_providers` (`id`, `name`, `host_name`, `username`, `password`, `port`, `status`) VALUES (NULL, 'MailGun', 'smtp.mailgun.org', 'postmaster@samples.mailgun.org', 'secret', '587', '1');

INSERT INTO `sms_gateway` (`id`, `name`, `api_link`, `username`, `password`, `api_id`, `credit`, `schedule`, `status`) VALUES (NULL, 'InfoBip', 'http://api.infobip.com/api/v3/sendsms/plain', 'username', 'password', NULL, '1', 'No', 'Active');

INSERT INTO `sms_gateway` (`id`, `name`, `api_link`, `username`, `password`, `api_id`, `credit`, `schedule`, `status`) VALUES (NULL, 'TelAPI', NULL, 'Account SID', 'Auth Token', NULL, '1', 'No', 'Active');

INSERT INTO `sms_gateway` (`id`, `name`, `api_link`, `username`, `password`, `api_id`, `credit`, `schedule`, `status`) VALUES (NULL, 'NibsSMS', 'http://nibssms.com/portal/apiclient', 'User Name', 'API Token', '18', '1', 'Yes', 'Active');

ALTER TABLE `tickets` ADD `closed_by` TEXT NULL ;

INSERT INTO `adminperms` (`roleid`, `permid`) VALUES ('1', '51'), ('1', '52');

EOF;

$msg .= 'Importing SQL Data....... <br>';

// Execute SQL QUERY
$qr = $dbh->exec($sql);

$msg .= 'Data import Completed....... <br>';
$msg .= '===== Update Complete ======" <br>';
$msg .= 'If you refresh this page now, you should see this message- "Your Version is Up to Date!" <br>';



}


if ($v == $latest){

    echo 'Your Version is Up to Date!';

}

else{

    echo $msg;
}

?>