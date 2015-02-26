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
<?php
include('session.php');
//$id=$_REQUEST['id'];
?>
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
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
            <div id="gp_portion" align="center">
                <p><input name="search_masking" type="text" id="search_masking" placeholder="Masking" </p>
                <input style="width: 9%" name="search_stakeholder" type="submit" id="search_stakeholder" value="Search">
<!--                <input name="id" type="hidden" value="--><?php //echo $id; ?><!--">-->
            </div>
        </form>
<table>
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <?php
                if(isset($_POST["search_stakeholder"]))
                {

                    $masking = mysql_real_escape_string($_POST["search_masking"]);
                    if(!empty($masking))
                    {
                        $query = "SELECT STAKEHOLDER_UID FROM stakeholder_ctrl WHERE BRAND_NAME= '$masking';";
                        $result = mysql_query($query);
                        echo'<table align="center"><tr><td>';
                        echo'<center><select name="stakeholder_list"></center>';
                        echo '<option>Please Select</option>';
                        while($row = mysql_fetch_array( $result ))
                        {
                            echo '<option value="'.$row['STAKEHOLDER_UID'].'">' . $row['STAKEHOLDER_UID'] . '</option>';
                        }
                        echo '</select>';
                        echo'</td></tr>';
                        echo'<tr><td><input name="show_details" type="submit" id="search_details" value="Show Details"></td></tr></table>';

                    }
                    else
                    {
                        echo "<p align=\"center\">No Masking Provided</p>";
                    }
                    }

                ?>
<!--            <input name="id" type="hidden" value="--><?php //echo $id; ?><!--">-->
        </form>
</table>
<table>
<form action="http://192.168.69.197:8080/gatewayadmin/update.php" method="post">

        <?php
        if(isset($_POST["show_details"]))
        {
            $request_from = $_POST["stakeholder_list"];
            if($request_from != "Please Select")
            {
                function list_count()
                {
                    $output = "";
                    $request_from = $_POST["stakeholder_list"];
                    $sql_for_data = "SELECT * FROM tbl_routing_table WHERE REQUEST_FROM = '$request_from'";
                    $data_query = mysql_query ($sql_for_data) or die (mysql_error());
                    while($row = mysql_fetch_array($data_query))
                    {
                        $output .= '
      <tr>
      <td>' . $row['REQUEST_FROM'].'</td>
      <td>' . $row['IN_TELCO'] . '</td>
      <td>' . $row['OUT_TELCO'] . '</td>';
                        $query_to_select_out_telco = "SELECT DISTINCT telco_name FROM out_telco";
                        if($fetch_out_telco = mysql_query($query_to_select_out_telco))
                        {

                            $output .="<td><select name='update_out_telco".$row['IN_TELCO']."'>";
                            $output .="<option>".""."</option>";
                            while($out_telco_data = mysql_fetch_array($fetch_out_telco))
                            {
                                $output .="<option>".$out_telco_data["telco_name"]."</option>";
                            }
                            $output .='</select></td>';
                        }
                        $output .= '<td>' . $row['MAPUSR'] . '</td>';
                        $query_to_select_map_user = "SELECT DISTINCT map_user FROM map_user";
                        if($fetch_map_user = mysql_query($query_to_select_map_user))
                        {
                            $output .="<td><select name='update_map_user".$row['IN_TELCO']."'>";
                            $output .="<option>".""."</option>";
                            while($map_user_data = mysql_fetch_array($fetch_map_user))
                            {
                                $output .="<option>".$map_user_data["map_user"]."</option>";
                            }
                            $output .='</select></td>';
                        }
                        $output .= '</tr>';
                    }
                    echo $output;
                    echo "</table>";
                }
                ?>
                <div id="details">
                    <table border="1" align = "center">
                        <tr>
                            <th>Request From</th>
                            <th>In Telco</th>
                            <th>Out Telco</th>
                            <th>Update Out Telco</th>
                            <th>Map User</th>
                            <th>Update Map User</th>
                        </tr>
                        <tr>
                    <?php
                     list_count();
                    ?>
                </tr>
                    </table>
                    <center>
                    <input style="width: 9%" type="submit" name="update" value="Update"" />
                    <input type="hidden" name="request_from" value="<?php echo $_POST["stakeholder_list"]; ?>">
                    </center>
                </div>
                <?php
            }
            else
            {
                echo "<p align=\"center\">You have not selected any stakeholder</p>";
            }
        }
            ?>
        </table>
        </form>
    </div>
    <!-- end page -->
</div>
<div id="footer">
    <p class="copyright">&copy;&nbsp;&nbsp;<?php echo Date("Y"); ?> All Rights Reserved &nbsp;&bull;&nbsp; Designed by <a href="http://www.sslwireless.com/">SSLWireless</a>.</p>
    <p class="link"><a href="http://www.sslwireless.com/">Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href="http://www.sslwireless.com/">Terms of Use</a></p>
</div>
</body>
</html>
