<?php
$username = $_GET["username"];
$password = $_GET["password"];
$recharge_pin= $_GET["recharge_pin"];
$remark = "";



$url = "http://223.27.112.66:8080/vms45soap/services/SoapProvisioning/recharge?userName=$username&rechargePin=$recharge_pin&rechargePassword=$password&remark=$remark";
$file = fopen($url, 'r');
$msg_reply = fread($file, 10000);
echo $msg_reply;
