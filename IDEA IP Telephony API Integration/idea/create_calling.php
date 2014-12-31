<?php
$username = $_GET["username"];
$calling = $_GET["calling"];
$tag_number= $_GET["tag_no"];
$remark = "";



$url = "http://223.27.112.66:8080/vms45soap/services/SoapProvisioning/createCalling?userName=$username&calling=$calling&tagNo=$tag_number&remark=$remark";
$file = fopen($url, 'r');
$msg_reply = fread($file, 10000);
echo $msg_reply;