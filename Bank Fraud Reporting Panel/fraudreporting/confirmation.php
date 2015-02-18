<?php
include('connection.php');
$short_code = $_GET['shortcode'];
$msisdn = $_GET['msisdn'];
$msisdn = "88".substr(str_replace("-","",$msisdn), -11);
$sms = $_GET['sms'];
$sms = strtolower($sms);

$query_to_check = mysql_query("SELECT * FROM tbl_customer_info WHERE customer_msisdn = '$msisdn'");

$row = mysql_num_rows($query_to_check);

if($row > 0 && $sms == 'yes')
{
$query_for_update= mysql_query("UPDATE tbl_transaction SET STATUS='success' WHERE customer_msisdn = '$msisdn' AND  TIME_TO_SEC(TIMEDIFF(NOW(),transaction_date))  < 1800");
echo "Your Transaction has been confirmed";
}
else
{
    $query_for_update= mysql_query("UPDATE tbl_transaction SET STATUS='not confirmed' WHERE customer_msisdn = '$msisdn' AND  TIME_TO_SEC(TIMEDIFF(NOW(),transaction_date))  < 1800");
    echo "Transaction has not been confirmed";
}
?>