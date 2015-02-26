<?php
session_start();

$connection = mysql_connect('192.168.81.7','channel24','24.Ch#n1ldehg') or die("connection Error!");
mysql_select_db("channel_24") or die("Selection Error!");

?>
