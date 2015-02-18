<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>Bank Login Panel</title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<body>
<!-- Header -->
<div id="header">
    <div class="shell">
        <div id="top">
            <h1><a href="#">Bank Login Panel</a></h1>
        </div>
    </div>
</div>
<!-- End Header -->

<!-- Container -->
<div id="container">
    <div class="shell">


        <!-- Main -->
        <div id="main">
            <div class="cl">&nbsp;</div>

            <!-- Content -->
            <div id="content">
                <?php
                include_once("header.php");
                include_once("functions.php");
                ?>
                <div id="login" align="center">
                    <h1>Login</h1>
                    <form action="" method="POST">
                        <input class="form-control" id="name" name="username" placeholder="Username" type="text">
                        <br>
                        <input id="password" name="password" placeholder="Password" type="password">
                        <br>
                        <input class="btn btn-default" name="log_submit" type="submit" value=" Login ">
                        <br>
                        <span><strong><?php echo $error; ?></strong></span>
                    </form>
                </div>
            </div>
        </div>
        <!-- Main -->
    </div>
</div>
<!-- End Container -->

<!-- Footer -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div id="footer">
    <div class="shell">
        <p class="copyright">&copy;&nbsp;&nbsp;<?php echo Date("Y"); ?> All Rights Reserved &nbsp;&bull;&nbsp; Designed by <a href="http://www.sslwireless.com/">SSLWireless</a></p>
    </div>
</div>
<!-- End Footer -->
<?php
include_once("footer.php");
?>
</body>
</html>