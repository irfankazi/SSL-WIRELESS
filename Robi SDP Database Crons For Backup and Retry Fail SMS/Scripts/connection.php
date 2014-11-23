<?php
	session_start();
	$connection = mysql_connect('localhost','root','') or die("connection Error!");
	mysql_select_db("robi_sdp") or die("Selection Error!");

?>
