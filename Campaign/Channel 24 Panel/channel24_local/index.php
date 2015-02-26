<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <title>Channel 24 Panel</title>
    <meta charset="iso-8859-1">
    <link rel="stylesheet" href="styles/layout.css" type="text/css">
    <link rel="stylesheet" href="bootstrap-datetimepicker.css" type="text/css">
    <!--[if lt IE 9]><script src="scripts/html5shiv.js"></script><![endif]-->
</head>
<body>
<div class="wrapper row1">
    <header id="header" class="clear">
        <div id="hgroup">
            <h1><a href="#">SSL Wireless</a></h1>
            <h2>Channel 24 SMS Panel</h2>
        </div>
    </header>
</div>
<!-- content -->
<div class="wrapper row2">
    <div id="container" class="clear">
        <!-- content body -->
        <!-- main content -->
        <div id="homepage" class="clear">
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

            <!-- / content body -->
        </div>
    </div>
    <!-- Footer -->
    <div class="wrapper row3">
        <footer id="footer" class="clear">
            <p class="fl_left">Copyright &copy; <?php echo Date("Y"); ?> - All Rights Reserved - <a href="www.sslwireless.com">SSL Wireless</a></p>
        </footer>
    </div>
    <?php
    include("footer.php");
    ?>
</body>
</html>
<script>
    $(function() {
        $( "#datepicker_from" ).datepicker({dateFormat: "yy-mm-dd"});
    });

    $(function() {
        $( "#datepicker_to" ).datepicker({dateFormat: "yy-mm-dd"});
    });
</script>



