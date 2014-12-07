<?php
$connection = mysql_connect('localhost', 'root', '') or die("connection Error!");
mysql_select_db("httpapi") or die("Selection Error!");

$from = $_GET["from"];
$msisdn = $_GET["msisdn"];
$msg_text= $_GET["msgtext"];
date_default_timezone_set("Asia/Dhaka");
$current_time = date("Y-m-d H:i:s");

$url = "http://217.118.27.5/bulksms/bulksend.go?username=iftekhar@sslwireless.com&password=146EB9E1&originator=$from&phone=$msisdn&msgtext=$msg_text";
$file = fopen($url, 'r');
$msg_reply = fread($file, 10000);
echo $msg_reply;

$query_for_insertion_log = "INSERT INTO api_log (date, originator, msisdn, msgtext, msgreply)VALUES ('$current_time', '$from', '$msisdn', '$msg_text', '$msg_reply')";

        if(mysql_query($query_for_insertion_log))
        {
            echo "<br/><br/>Log entered successfully <br/><br/>";
        }
        else
        {
            echo "<br/><br/>Error: ".mysql_error()."<br/><br/>";
        }

?>