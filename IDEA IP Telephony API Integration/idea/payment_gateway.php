<?php
$username = $_GET["username"];
$method= "P";
$amount = $_GET["amount"];
$remark = "";



$url = "http://223.27.112.66:8080/vms45soap/services/SoapProvisioning/payment?userName=$username&amount=$amount&method=$method&remark=$remark";
$file = fopen($url, 'r');
$msg_reply = fread($file, 10000);
echo $msg_reply;