<?php
$username = $_GET["username"];
$password = $_GET["password"];
$class_of_service= 1;
$balance = 0;
$remark = "";



$url = "http://223.27.112.66:8080/vms45soap/services/SoapProvisioning/createAccount?userName=$username&cos=$class_of_service&balance=$balance&password=$password&remark=$remark";
$file = fopen($url, 'r');
$msg_reply = fread($file, 10000);
echo $msg_reply;
