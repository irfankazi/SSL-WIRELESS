<?php

session_start();
session_unset();
session_destroy();

header("location: http://192.168.69.197:8080/gatewayadmin/index.php");
exit();

?>