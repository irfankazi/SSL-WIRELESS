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
            <h1><a href="http://192.168.69.197:8080/fraudreporting/admin_profile.php">Admin Panel</a></h1>
            <div id="top-navigation">
                Welcome <a href="http://192.168.69.197:8080/fraudreporting/admin_profile.php"><strong><?php echo $login_session; ?></strong></a>
                <span>|</span>
                <a href="logout.php">Log out</a>
            </div>
        </div>
        <!-- End Logo + Top Nav -->

        <!-- Main Nav -->
        <div id="navigation">
            <ul>
                <li><a href="http://192.168.69.197:8080/fraudreporting/admin_profile.php" class="active"><span>Transaction Details</span></a></li>
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
                        <h2>Transaction Details</h2>
                    </div>
                    <div id="details">
                        <?php
                        function transaction_details()
                        {
                        $output = "";
                        $num_rec_per_page=10;
                        if (isset($_GET["page"]))
                        {
                        $page  = $_GET["page"];
                        }
                        else
                        {
                        $page=1;
                        };
                        $start_from = ($page-1) * $num_rec_per_page;

                        $sql_for_pagination = "SELECT * FROM tbl_transaction LIMIT $start_from, $num_rec_per_page";
                        $pagination_query = mysql_query ($sql_for_pagination) or die (mysql_error());
                        while($row = mysql_fetch_array($pagination_query))
                        {
                        $output .= '
      <tr>
      <td>' . $row['transaction_id'].'</td>
      <td>' . $row['customer_msisdn'] . '</td>
      <td>' . $row['from_acc_num'] . '</td>
      <td>' . $row['to_acc_num'] . '</td>
      <td>' . $row['amount'] . '</td>
      <td>' . $row['transaction_date'] . '</td>
      <td>' . $row['status'] . '</td>
      </tr>';
                        }
                        echo $output;
                        echo "</table>";
                        $sql = "SELECT * FROM tbl_transaction";
                        $rs_result = mysql_query($sql); //run the query
                        $total_records = mysql_num_rows($rs_result);  //count number of records
                        $total_pages = ceil($total_records / $num_rec_per_page);
                        ?>
                        <center>
                            <?php
                            echo "<strong><a href='admin_profile.php?page=1'>"."|<"."</a></strong>"; // Goto 1st page

                            for ($i=1; $i<=$total_pages; $i++) {
                                echo "<strong><a href='admin_profile.php?page=".$i."'>".$i."-</a></strong>";
                            };
                            echo "<strong><a href='admin_profile.php?page=$total_pages'>".">|"."</a></strong>"; // Goto last
                            ?>
                        </center>
                        <?php
                        }
                        ?>
                        <center>
                        <table border="1" align="center">
                            <tr>
                                <th>Transaction ID</th>
                                <th>MSISDN</th>
                                <th>From</th>
                                <th>To</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th>Status</th>
                            </tr>
                            <?php
                            transaction_details();
                            ?>
                        </table>
                        </center>
                    </div>
                    <!-- End Box Head -->


                </div>
                <!-- End Box -->

                <!-- Box -->
                <div class="box">
                    <!-- Box Head -->
                    <div class="box-head">
                        <h2>Search</h2>
                    </div>
                    <div id="search_details">
                        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                        <p><strong>Date From: </strong><input name="date_from" type="text" id="datepicker_from"</p>
                        <p><strong>Date To: </strong>&nbsp;&nbsp;&nbsp;&nbsp;<input name="date_to" type="text" id="datepicker_to"></p>
                        <input name="admin_search" type="submit" id="search" value="Search">
                        </form>
                        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                            <?php
                            if(isset($_POST['admin_search']))
                            {
                                if(!empty($_POST['date_from']) && !empty($_POST['date_to']))
                                {
                                        function search_transaction()
                                        {
                                            $output = "";
                                            $from_date = mysql_real_escape_string($_POST['date_from']);
                                            $to_date = mysql_real_escape_string($_POST['date_to']);
                                            $query_to_fetch_data = "SELECT * FROM tbl_transaction WHERE DATE(transaction_date) BETWEEN '$from_date' AND '$to_date'";
                                            $result = mysql_query($query_to_fetch_data);
                                            $rows = mysql_num_rows($result);
                                            while ($row = mysql_fetch_array($result)){
                                                $output .= '
      <tr>
      <td>' . $row['transaction_id'].'</td>
      <td>' . $row['customer_msisdn'] . '</td>
      <td>' . $row['from_acc_num'] . '</td>
      <td>' . $row['to_acc_num'] . '</td>
      <td>' . $row['amount'] . '</td>
      <td>' . $row['transaction_date'] . '</td>
      <td>' . $row['status'] . '</td>
      </tr>';
                                            }
                                            echo $output;
                                        }
                                        ?>
                                        <div id="details">
                                            <center>
                                                <table border="1">
                                                    <tr>
                                                        <th>Transaction ID</th>
                                                        <th>MSISDN</th>
                                                        <th>From</th>
                                                        <th>To</th>
                                                        <th>Amount</th>
                                                        <th>Date</th>
                                                        <th>Status</th>
                                                    </tr>
                                                    <?php
                                                    search_transaction();
                                                    ?>
                                                </table>
                                            </center>
                                        </div>
                                    <?php
                                    }
                                else
                                    {
                                        echo "<span><strong>Please Choose Both Dates</strong></span>";
                                    }
                                ?>
                                    <?php
                                }
                                ?>
                        </form>
                    </div>
                    <!-- End Box Head -->
                </div>
            </div>
            <!-- End Content -->

            <!-- Sidebar -->
            <div id="sidebar">


            </div>
            <!-- End Sidebar -->

        </div>
        <!-- Main -->
    </div>
</div>
<!-- End Container -->

<?php
include_once("footer.php");
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
