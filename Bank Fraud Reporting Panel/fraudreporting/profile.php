<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php
include('session.php');
include_once("header.php");
?>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>User Profile: <?php echo $login_session?></title>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<style>
    table, td, th {
        border: 1px solid #525b80;
    }

    th {
        background-color: #648078;
        color: white;
    }
</style>
<body>
<!-- Header -->
<div id="header">
    <div class="shell">
        <!-- Logo + Top Nav -->
        <div id="top">
            <h1><a href="http://192.168.69.197:8080/fraudreporting/profile.php">User Panel</a></h1>
            <div id="top-navigation">
                Welcome <a href="http://192.168.69.197:8080/fraudreporting/profile.php"><strong><?php echo $login_session; ?></strong></a>
                <span>|</span>
                <a href="logout.php">Log out</a>
            </div>
        </div>
        <!-- End Logo + Top Nav -->

        <!-- Main Nav -->
        <div id="navigation">
            <ul>
                <li><a href="http://192.168.69.197:8080/fraudreporting/profile.php" class="active"><span>Account Details</span></a></li>
                <li><a href="http://192.168.69.197:8080/fraudreporting/fund_transfer.php"><span>Fund Transfer</span></a></li>
            </ul>
        </div>
        <!-- End Main Nav -->
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

                <!-- Box -->
                <div class="box">
                    <!-- Box Head -->
                    <div class="box-head">
                        <h2 class="left">Account Details</h2>
                            </div>
                    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                        <div id="account_details_portion">
                            <label><strong>Accounts</strong></label>
                            <?php     $query = "SELECT account_number FROM tbl_account_info WHERE customer_id = '$customer_id'";
                            $result = mysql_query($query);
                            echo'<select name="account_list" align="center">';
                            echo '<option>Please Select</option>';
                            while($row = mysql_fetch_assoc( $result ))
                            {
                                echo '<option value="'.$row['account_number'].'">' . $row['account_number'] . '</option>';
                            }
                            echo '</select>';?>
                            <input name="show_details" type="submit" value=" Show Details "/></a>
                            </div>
                        </form>
                    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                        <?php
                        if(isset($_POST["show_details"]))
                        {
                            if($_POST["account_list"] != "Please Select")
                            {
                                $account_number = $_POST["account_list"];
                                $query = "SELECT account_number, balance FROM tbl_account_info WHERE customer_id = '$customer_id' AND account_number='$account_number'";
                                $result = mysql_query($query);
                                $row = mysql_fetch_assoc($result);
                                ?>
                                <br>
                                <div id="details">
                                    <center>
                                        <table border="1" style="width:50%" align = "center">
                                            <tr>
                                                <th>Account Number</th>
                                                <th>Balance</th>
                                            </tr>
                                            <tr>
                                                <td><?php echo $row["account_number"] ?></td>
                                                <td><?php echo $row["balance"] ?></td>
                                            </tr>
                                        </table>
                                    </center>
                                </div>
                            <?php
                            }
                            else
                            {
                                echo "<span><strong>No account Selected</strong></span>";
                            }
                            }
                        ?>
                    </form>
                    </div>
                <body>
                <?php

                ?>
                    <!-- End Box Head -->



                </div>
                <!-- End Box -->

            </div>
            <!-- End Content -->

            <!-- Sidebar -->
            <div id="sidebar">


            </div>
            <!-- End Sidebar -->

            <div class="cl">&nbsp;</div>
        </div>
        <!-- Main -->
    </div>
</div>
<!-- End Container -->

<!-- Footer -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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