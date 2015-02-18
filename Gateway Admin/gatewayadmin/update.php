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
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<body>
<!-- start header -->
<div id="header">
    <div id="logo">
        <h1><a href="http://192.168.69.197:8080/gatewayadmin/operations.php"><span>Gateway</span>Admin</a></h1>

    </div>
    <div id="menu">
        <ul id="main">
            <li><a href="http://192.168.69.197:8080/gatewayadmin/operations.php">Search Masking</a></li>
            <li class="current_page_item"><a href="http://192.168.69.197:8080/gatewayadmin/profile.php">Report</a></li>
            <li><a href="#"></a></li><li><a href="#"></a></li>
            <li><a href="#"></a></li><li><a href="#"></a></li>
            <li><a href="#"></a></li><li><a href="#"></a></li>
            <li><a href="#"></a></li><li><a href="#"></a></li>
            <li><a href="#"></a></li><li><a href="#"></a></li>
            <li><a href="http://192.168.69.197:8080/gatewayadmin/logout.php">Logout</a></li>
        </ul>
    </div>

</div>
<!-- end header -->
<div id="wrapper">
<!-- start page -->
<div id="page">
<table>
<?php
include('session.php');
if(isset($_POST['update']))
{
?>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
        <?php
        $final_message= "";
        $message_for_update_out_telco = "<b><center> Out Telco Change </center></b> <table border='1' align=\"center\"><tr><th>Stakeholder</th><th>In Telco</th><th>Out Telco</th></tr>";
        $message_for_update_map_user = "<b><center> Map User Change </center></b> <table border='1' align=\"center\"><tr><th>Stakeholder</th><th>In Telco</th><th>Map User</th></tr><tr>";

        if($_POST['request_from'])
        {
            $request_from = $_POST['request_from'];
        }
        if(isset($_REQUEST['update_out_telcoGRAMEEN']))
        {
            $in_telco_grameen=$_REQUEST['update_out_telcoGRAMEEN'];
        }
        if(isset($_REQUEST['update_out_telcoBANGLALINK']))
        {
            $in_telco_banglalink=$_REQUEST['update_out_telcoBANGLALINK'];
        }
        if(isset($_REQUEST['update_out_telcoAKTEL']))
        {
            $in_telco_aktel=$_REQUEST['update_out_telcoAKTEL'];
        }
        if(isset($_REQUEST['update_out_telcoAIRTEL']))
        {
            $in_telco_warid=$_REQUEST['update_out_telcoAIRTEL'];
        }
        if(isset($_REQUEST['update_out_telcoCITYCELL']))
        {
            $in_telco_citycell=$_REQUEST['update_out_telcoCITYCELL'];
        }
        if(isset($_REQUEST['update_out_telcoTELETALK']))
        {
            $in_telco_teletalk=$_REQUEST['update_out_telcoTELETALK'];
        }
        if(isset($_REQUEST['update_map_userGRAMEEN']))
        {
            $map_user_grameen=$_REQUEST['update_map_userGRAMEEN'];
        }
        if(isset($_REQUEST['update_map_userBANGLALINK']))
        {
            $map_user_banglalink=$_REQUEST['update_map_userBANGLALINK'];
        }
        if(isset($_REQUEST['update_map_userAKTEL']))
        {
            $map_user_aktel=$_REQUEST['update_map_userAKTEL'];
        }
        if(isset($_REQUEST['update_map_userAIRTEL']))
        {
            $map_user_warid=$_REQUEST['update_map_userAIRTEL'];
        }
        if(isset($_REQUEST['update_map_userCITYCELL']))
        {
            $map_user_citycell=$_REQUEST['update_map_userCITYCELL'];
        }
        if(isset($_REQUEST['update_map_userTELETALK']))
        {
            $map_user_teletalk=$_REQUEST['update_map_userTELETALK'];
        }

        if(!empty($in_telco_grameen))
        {
            $message_for_update_out_telco .= "<tr><td>$request_from</td><td>GRAMEEN</td><td>$in_telco_grameen</td></tr>";
        }

        if(!empty($in_telco_banglalink))
        {
            $message_for_update_out_telco .= "<tr><td>$request_from</td><td>BANGLALINK</td><td>$in_telco_banglalink</td></tr>";
        }
        if(!empty($in_telco_aktel))
        {
            $message_for_update_out_telco .= "<tr><td>$request_from</td><td>AKTEL</td><td>$in_telco_aktel</td></tr>";
        }
        if(!empty($in_telco_warid))
        {
            $message_for_update_out_telco .= "<tr><td>$request_from</td><td>AIRTEL</td><td>$in_telco_warid</td></tr>";
        }
        if(!empty($in_telco_citycell))
        {
            $message_for_update_out_telco .= "<tr><td>$request_from</td><td>CITYCELL</td><td>$in_telco_citycell</td></tr>";
        }
        if(!empty($in_telco_teletalk))
        {
            $message_for_update_out_telco .= "<tr><td>$request_from</td><td>TELETALK</td><td>$in_telco_teletalk</td></tr>";
        }

        if(!empty($map_user_grameen))
        {
            $message_for_update_map_user .= "<tr><td>$request_from</td><td>GRAMEEN</td><td>$map_user_grameen</td></tr>";
        }

        if(!empty($map_user_banglalink))
        {
            $message_for_update_map_user .= "<tr><td>$request_from</td><td>BANGLALINK</td><td>$map_user_banglalink</td></tr>";
        }
        if(!empty($map_user_aktel))
        {
            $message_for_update_map_user .= "<tr><td>$request_from</td><td>AKTEL</td><td>$map_user_aktel</td></tr>";
        }
        if(!empty($map_user_warid))
        {
            $message_for_update_map_user .= "<tr><td>$request_from</td><td>AIRTEL</td><td>$map_user_warid</td></tr>";
        }
        if(!empty($map_user_citycell))
        {
            $message_for_update_map_user .= "<tr><td>$request_from</td><td>CITYCELL</td><td>$map_user_citycell</td></tr>";
        }
        if(!empty($map_user_teletalk))
        {
            $message_for_update_map_user .= "<tr><td>$request_from</td><td>TELETALK</td><td>$map_user_teletalk</td></tr>";
        }

        $message_for_update_out_telco .= "</table>";
        $message_for_update_map_user .= "</table>";
        $final_message .= $message_for_update_out_telco."<center> & </center><br>".$message_for_update_map_user;

    if(!isset($_POST["data_update"]) && !isset($_POST['cancel_update']) && empty($in_telco_grameen)&& empty($in_telco_banglalink)&& empty($in_telco_aktel) && empty($in_telco_warid) && empty($in_telco_citycell) && empty($in_telco_teletalk) && empty($map_user_grameen) && empty($map_user_banglalink) && empty($map_user_aktel) && empty($map_user_warid) && empty($map_user_citycell) && empty($map_user_teletalk))
    {
        $final_message = "You have selected no data for change. Hence no change would be done";
        echo "<p align=\"center\">$final_message</p>";
    }
    elseif(!isset($_POST["data_update"]) && !isset($_POST['cancel_update']) && empty($in_telco_grameen)&& empty($in_telco_banglalink)&& empty($in_telco_aktel) && empty($in_telco_warid) && empty($in_telco_citycell) && empty($in_telco_teletalk))
    {
        echo "<p align=\"center\">$message_for_update_map_user</p>";
    }

    elseif(!isset($_POST["data_update"]) && !isset($_POST['cancel_update']) && empty($map_user_grameen) && empty($map_user_banglalink) && empty($map_user_aktel) && empty($map_user_warid) && empty($map_user_citycell) && empty($map_user_teletalk))
    {
        echo "<p align=\"center\">$message_for_update_out_telco</p>";
    }

    elseif(!isset($_POST["data_update"]) || !isset($_POST['cancel_update']))
    {
        echo "<p align=\"center\">$final_message</p>";
    }
        ?>
        <br>
        <input name="data_update" type="submit" align="center" value=" Update "/>
        <input name="cancel_update" type="submit" align="center" value=" Cancel "/>
        <input type="hidden" name="request_from" value="<?php echo $_POST["request_from"]; ?>">
        <input type="hidden" name="update_out_telcoGRAMEEN" value="<?php echo $_POST["update_out_telcoGRAMEEN"]; ?>">
        <input type="hidden" name="update_out_telcoBANGLALINK" value="<?php echo $_POST["update_out_telcoBANGLALINK"]; ?>">
        <input type="hidden" name="update_out_telcoAKTEL" value="<?php echo $_POST["update_out_telcoAKTEL"]; ?>">
        <input type="hidden" name="update_out_telcoAIRTEL" value="<?php echo $_POST["update_out_telcoAIRTEL"]; ?>">
        <input type="hidden" name="update_out_telcoCITYCELL" value="<?php echo $_POST["update_out_telcoCITYCELL"]; ?>">
        <input type="hidden" name="update_out_telcoTELETALK" value="<?php echo $_POST["update_out_telcoTELETALK"]; ?>">
        <input type="hidden" name="update_map_userGRAMEEN" value="<?php echo $_POST["update_map_userGRAMEEN"]; ?>">
        <input type="hidden" name="update_map_userBANGLALINK" value="<?php echo $_POST["update_map_userBANGLALINK"]; ?>">
        <input type="hidden" name="update_map_userAKTEL" value="<?php echo $_POST["update_map_userAKTEL"]; ?>">
        <input type="hidden" name="update_map_userAIRTEL" value="<?php echo $_POST["update_map_userAIRTEL"]; ?>">
        <input type="hidden" name="update_map_userCITYCELL" value="<?php echo $_POST["update_map_userCITYCELL"]; ?>">
        <input type="hidden" name="update_map_userTELETALK" value="<?php echo $_POST["update_map_userTELETALK"]; ?>">
    </form>
<?php
}
?>
<?php
if(!isset($_POST['update']))
{
?>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
        <?php
        date_default_timezone_set("Asia/Dhaka");
        $current_time = date("Y-m-d H:i:s");
        if(isset($_POST['data_update']))
        {
            $sql_for_update_out_telco = "UPDATE tbl_routing_table SET OUT_TELCO = CASE IN_TELCO";
            $sql_for_update_map_user = "UPDATE tbl_routing_table SET MAPUSR = CASE IN_TELCO";

            if($_POST['request_from'])
            {
                $request_from = $_POST['request_from'];
            }
            if(isset($_REQUEST['update_out_telcoGRAMEEN']))
            {
                $in_telco_grameen=$_REQUEST['update_out_telcoGRAMEEN'];
            }
            if(isset($_REQUEST['update_out_telcoBANGLALINK']))
            {
                $in_telco_banglalink=$_REQUEST['update_out_telcoBANGLALINK'];
            }
            if(isset($_REQUEST['update_out_telcoAKTEL']))
            {
                $in_telco_aktel=$_REQUEST['update_out_telcoAKTEL'];
            }
            if(isset($_REQUEST['update_out_telcoAIRTEL']))
            {
                $in_telco_warid=$_REQUEST['update_out_telcoAIRTEL'];
            }
            if(isset($_REQUEST['update_out_telcoCITYCELL']))
            {
                $in_telco_citycell=$_REQUEST['update_out_telcoCITYCELL'];
            }
            if(isset($_REQUEST['update_out_telcoTELETALK']))
            {
                $in_telco_teletalk=$_REQUEST['update_out_telcoTELETALK'];
            }
            if(isset($_REQUEST['update_map_userGRAMEEN']))
            {
                $map_user_grameen=$_REQUEST['update_map_userGRAMEEN'];
            }
            if(isset($_REQUEST['update_map_userBANGLALINK']))
            {
                $map_user_banglalink=$_REQUEST['update_map_userBANGLALINK'];
            }
            if(isset($_REQUEST['update_map_userAKTEL']))
            {
                $map_user_aktel=$_REQUEST['update_map_userAKTEL'];
            }
            if(isset($_REQUEST['update_map_userAIRTEL']))
            {
                $map_user_warid=$_REQUEST['update_map_userAIRTEL'];
            }
            if(isset($_REQUEST['update_map_userCITYCELL']))
            {
                $map_user_citycell=$_REQUEST['update_map_userCITYCELL'];
            }
            if(isset($_REQUEST['update_map_userTELETALK']))
            {
                $map_user_teletalk=$_REQUEST['update_map_userTELETALK'];
            }

            if(!empty($in_telco_grameen))
            {
                $sql_for_update_out_telco .= " WHEN 'GRAMEEN' THEN '$in_telco_grameen'";
            }

            if(!empty($in_telco_banglalink))
            {
                $sql_for_update_out_telco .= " WHEN 'BANGLALINK' THEN '$in_telco_banglalink'";
            }
            if(!empty($in_telco_aktel))
            {
                $sql_for_update_out_telco .= " WHEN 'AKTEL' THEN '$in_telco_aktel'";
            }
            if(!empty($in_telco_warid))
            {
                $sql_for_update_out_telco .= " WHEN 'AIRTEL' THEN '$in_telco_warid'";
            }
            if(!empty($in_telco_citycell))
            {
                $sql_for_update_out_telco .= " WHEN 'CITYCELL' THEN '$in_telco_citycell'";
            }
            if(!empty($in_telco_teletalk))
            {
                $sql_for_update_out_telco .= " WHEN 'TELETALK' THEN '$in_telco_teletalk'";
            }

            if(!empty($map_user_grameen))
            {
                $sql_for_update_map_user .= " WHEN 'GRAMEEN' THEN '$map_user_grameen'";
            }

            if(!empty($map_user_banglalink))
            {
                $sql_for_update_map_user .= " WHEN 'BANGLALINK' THEN '$map_user_banglalink'";
            }
            if(!empty($map_user_aktel))
            {
                $sql_for_update_map_user .= " WHEN 'AKTEL' THEN '$map_user_aktel'";
            }
            if(!empty($map_user_warid))
            {
                $sql_for_update_map_user .= " WHEN 'AIRTEL' THEN '$map_user_warid'";
            }
            if(!empty($map_user_citycell))
            {
                $sql_for_update_map_user .= " WHEN 'CITYCELL' THEN '$map_user_citycell'";
            }
            if(!empty($map_user_teletalk))
            {
                $sql_for_update_map_user .= " WHEN 'TELETALK' THEN '$map_user_teletalk'";
            }

            $sql_for_update_out_telco .= " ELSE OUT_TELCO END WHERE REQUEST_FROM IN('$request_from')";
            $sql_for_update_map_user .= " ELSE MAPUSR END WHERE REQUEST_FROM IN('$request_from')";

            if(mysql_query($sql_for_update_out_telco) && mysql_query($sql_for_update_map_user))
            {
                mysql_query("INSERT INTO update_log (USER, update_time, update_info) VALUES ('$login_session_user', '$current_time', 'out_telco, map_user')");
                echo "<p color=\"green\" align=\"center\">Successfully Updated</p>";
            }
            elseif(mysql_query($sql_for_update_out_telco))
            {
                mysql_query("INSERT INTO update_log (USER, update_time, update_info) VALUES ('$login_session_user', '$current_time', 'out_telco')");
                echo "<p color=\"green\" align=\"center\">OUT TELCO Updated</p>  ";
            }
            elseif(mysql_query($sql_for_update_map_user))
            {
                mysql_query("INSERT INTO update_log (USER, update_time, update_info) VALUES ('$login_session_user', '$current_time', 'map_user')");
                echo "<p color=\"green\" align=\"center\">MAP USER Updated</p>  ";
            }
            else
            {
                echo "<p color=\"red\" align=\"center\">No Update Occured</p> ";
            }
        ?>
        <br>
        <a href="operations.php"><input name="back_to_search_masking" type="button" align="center" value=" Back "/>
            <input type="hidden" name="request_from" value="<?php echo $_POST["request_from"]; ?>">
            <input type="hidden" name="update_out_telcoGRAMEEN" value="<?php echo $_POST["update_out_telcoGRAMEEN"]; ?>">
            <input type="hidden" name="update_out_telcoBANGLALINK" value="<?php echo $_POST["update_out_telcoBANGLALINK"]; ?>">
            <input type="hidden" name="update_out_telcoAKTEL" value="<?php echo $_POST["update_out_telcoAKTEL"]; ?>">
            <input type="hidden" name="update_out_telcoAIRTEL" value="<?php echo $_POST["update_out_telcoAIRTEL"]; ?>">
            <input type="hidden" name="update_out_telcoCITYCELL" value="<?php echo $_POST["update_out_telcoCITYCELL"]; ?>">
            <input type="hidden" name="update_out_telcoTELETALK" value="<?php echo $_POST["update_out_telcoTELETALK"]; ?>">
            <input type="hidden" name="update_map_userGRAMEEN" value="<?php echo $_POST["update_map_userGRAMEEN"]; ?>">
            <input type="hidden" name="update_map_userBANGLALINK" value="<?php echo $_POST["update_map_userBANGLALINK"]; ?>">
            <input type="hidden" name="update_map_userAKTEL" value="<?php echo $_POST["update_map_userAKTEL"]; ?>">
            <input type="hidden" name="update_map_userAIRTEL" value="<?php echo $_POST["update_map_userAIRTEL"]; ?>">
            <input type="hidden" name="update_map_userCITYCELL" value="<?php echo $_POST["update_map_userCITYCELL"]; ?>">
            <input type="hidden" name="update_map_userTELETALK" value="<?php echo $_POST["update_map_userTELETALK"]; ?>">
    </form>
    <?php
    }
            if(isset($_POST['cancel_update']))
        {
            echo "<p color=\"red\" align=\"center\">Update Cancelled</p>";
            ?>
    <a href="operations.php"><input name="back_to_search_masking" type="button" align="center" value=" Back "/></a>
            <?php
        }
}
        ?>
        </table>
    </div>
    <!-- end page -->
</div>
<div id="footer">
    <p class="copyright">&copy;&nbsp;&nbsp;<?php echo Date("Y"); ?> All Rights Reserved &nbsp;&bull;&nbsp; Designed by <a href="http://www.sslwireless.com/">SSLWireless</a>.</p>
    <p class="link"><a href="http://www.sslwireless.com/">Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href="http://www.sslwireless.com/">Terms of Use</a></p>
</div>
</body>
</html>
