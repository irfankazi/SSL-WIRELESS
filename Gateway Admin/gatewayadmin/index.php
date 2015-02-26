<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Premium Series
Description: A three-column, fixed-width blog design.
Version    : 1.0
Released   : 20090303

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>SSL Wireless Gateway Admin</title>
    <meta name="keywords" content="" />
    <meta name="Premium Series" content="" />
    <link href="default.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<!-- start header -->
<div id="header">

    <!-- <h1><a href="http://localhost:8080/gatewayadmin/"><span>Gateway</span>Admin</a></h1> -->

    <!-- end header -->
    <div id="wrapper">
        <!-- start page -->
        <div id="page" align="center">
            <?php
            include_once("header.php");
            include_once("functions.php");
            ?>

            <title>Gateway Admin</title>
            <h1>Gateway Admin</h1>
            <div id="login" align="center">
                <h2>Login</h2>
                <form action="" method="POST">
                    <input align="center" class="form-control" id="name" name="username" placeholder="Username" type="text">
                    <br>
                    <input id="password" name="password" placeholder="Password" type="password">
                    <br>
                    <input align="center" class="btn btn-default" name="log_submit" type="submit" value=" Login ">
                    <br>
                    <span color="red"><?php echo $error; ?></span>
                </form>
            </div>
            <?php
            include_once("footer.php");
            ?>
        </div>
        <!-- end page -->
    </div>
    <div id="footer">
        <p class="copyright">&copy;&nbsp;&nbsp;<?php echo Date("Y"); ?> All Rights Reserved &nbsp;&bull;&nbsp; Designed by <a href="http://www.sslwireless.com/">SSLWireless</a>.</p>
        <p class="link"><a href="http://www.sslwireless.com/">Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href="http://www.sslwireless.com/">Terms of Use</a></p>
    </div>
</body>
</html>
