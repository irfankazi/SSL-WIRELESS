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
<style>
    table, td, th {
        border: 1px solid #525b80;
        align-content: center;
        align-items: center;
        text-align: center;
        font-size: 50;
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
                <li><a href="http://192.168.69.197:8080/fraudreporting/profile.php"><span>Account Details</span></a></li>
                <li><a href="http://192.168.69.197:8080/fraudreporting/fund_transfer.php" class="active"><span>Fund Transfer</span></a></li>
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
                        <h2>Fund Transfer</h2>
                    </div>
                    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                        <label><strong>From Account:</strong></label>
                        <?php
                        $user= "ssl6969";
                        $password = "123456";
                        $s_id= "ssl6969";
                        $url= "http://sms.sslwireless.com/pushapi/dynamic/server.php";
                        $query = "SELECT account_number FROM tbl_account_info WHERE customer_id = '$customer_id'";
                        $result = mysql_query($query);
                        echo'<select name="from_account_list">';
                        echo '<option>Please Select</option>';
                        while($row = mysql_fetch_assoc( $result )) {
                            echo '<option value="'.$row['account_number'].'">' . $row['account_number'] . '</option>';
                        }
                        echo '</select>';?>
                        <br>
                        <label><strong>To Account:&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
                        <?php     $query = "SELECT account_number FROM tbl_account_info WHERE customer_id = '$customer_id'";
                        $result = mysql_query($query);
                        echo'<select name="to_account_list">';
                        echo '<option>Please Select</option>';
                        while($row = mysql_fetch_assoc( $result ))
                        {
                            echo '<option value="'.$row['account_number'].'">' . $row['account_number'] . '</option>';
                        }
                        echo '</select>';?>
                        <br>
                        <label><strong>Amount :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
                        <input id="amount" name="amount" placeholder="amount" type="text">
                        <br>
                        <input name="fund_transfer" type="submit" value=" Fund Transfer "/>
                        <br>
                    </form>
                    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                        <?php
                        if(isset($_POST["fund_transfer"]))
                        {
                            $amount = $_POST['amount'];
                            $amount = str_replace(',', '', $amount);


                            $from_account_number = $_POST["from_account_list"];
                            $from_query = "SELECT account_number, balance FROM tbl_account_info WHERE customer_id = '$customer_id' AND account_number='$from_account_number'";
                            $from_result = mysql_query($from_query);
                            $from_row = mysql_fetch_assoc($from_result);
                            $from_balance = $from_row["balance"];

                            $to_account_number = $_POST["to_account_list"];
                            $to_query = "SELECT account_number, balance FROM tbl_account_info WHERE customer_id = '$customer_id' AND account_number='$to_account_number'";
                            $to_result = mysql_query($to_query);
                            $to_row = mysql_fetch_assoc($to_result);
                            $to_balance = $to_row["balance"];

                            if($from_account_number != "Please Select" && $to_account_number != "Please Select")
                            {
                                if($from_account_number == $to_account_number)
                                {
                                    echo "<span><strong>Fund can't be transferred between the same account. Fund transfer failed</strong></span>";
                                }
                                elseif(empty($amount))
                                {
                                    echo "<span><strong>Please put an amount you want to transfer. Fund transfer failed</strong></span>";
                                }
                                elseif($from_balance < $amount)
                                {
                                    echo "<span><strong>You don't have sufficient balance to transfer. Fund transfer failed</strong></span>";
                                }
                                elseif($amount < 0)
                                {
                                    echo "<span><strong>Transfer amount can never be a negative number. Fund transfer failed</strong></span>";
                                }
                                else
                                {
                                    $subtract_balance = $from_balance - $amount;
                                    $add_balance = $to_balance + $amount;
                                    $query_subtract_balance = mysql_query("UPDATE tbl_account_info SET balance='$subtract_balance' WHERE account_number='$from_account_number'");
                                    $query_add_balance = mysql_query("UPDATE tbl_account_info SET balance='$add_balance' WHERE account_number='$to_account_number'");
                                    $transaction_id = uniqid();
                                    date_default_timezone_set("Asia/Dhaka");
                                    $transaction_time = date("Y-m-d H:i:s");
                                    $get_msisdn_query = mysql_query("SELECT customer_msisdn FROM tbl_customer_info WHERE id = '$customer_id'");
                                    $get_msisdn_result = mysql_fetch_assoc($get_msisdn_query);
                                    $msisdn = $get_msisdn_result["customer_msisdn"];
                                    $msisdn = "88".substr(str_replace("-","",$msisdn), -11);
                                    $query_transaction = mysql_query("INSERT INTO tbl_transaction (transaction_id, customer_msisdn, from_acc_num, to_acc_num, amount, transaction_date) VALUES ('$transaction_id', '$msisdn', '$from_account_number', '$to_account_number', '$amount', '$transaction_time')");
                                    echo "<p><strong>Fund Transfer Successful. An sms has been sent to $msisdn. Please type 'yes' and send it to 6969 for confirmation </strong></p>";

                                    $message="An amount of BDT ". $amount. " has been transferred from Account No: ".$from_account_number. " to Account No: ".$to_account_number. ". Please type 'yes' and send to 6969 for confirmation" ;
                                    $message = htmlspecialchars($message);
                                    $param="user=$user&pass=$password&sms[0][0]=".urlencode ( $msisdn )."&sms[0][1]=".urlencode(html_entity_decode(html_entity_decode($message,ENT_QUOTES), ENT_QUOTES))."&sid=$s_id";

                                    $crl = curl_init();
                                    curl_setopt($crl,CURLOPT_SSL_VERIFYPEER,FALSE);
                                    curl_setopt($crl,CURLOPT_SSL_VERIFYHOST,2);
                                    curl_setopt($crl,CURLOPT_URL,$url);
                                    curl_setopt($crl,CURLOPT_HEADER,0);
                                    curl_setopt($crl,CURLOPT_RETURNTRANSFER,1);
                                    curl_setopt($crl,CURLOPT_POST,1);
                                    curl_setopt($crl,CURLOPT_POSTFIELDS,$param);
                                    $returns = curl_exec($crl);

                                    curl_close($crl);
                                }
                            }
                            else
                            {
                                echo "<span><strong>Please Select Account Numbers properly from the list</strong></span>";
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
            <!-- Box -->
            <div class="box">

                <!-- Box Head -->
                <div class="box-head">
                    <h2>List Of Accounts</h2>
                </div>
                <!-- End Box Head-->

                <div class="box-content">
                    <?php
                        $query = "SELECT account_number FROM tbl_account_info WHERE customer_id = '$customer_id'";
                        $output = "<center><table border=\"1\" style=\"width:50%\" align = \"center\"><tr><th>Account List</th></tr>";
                        $result = mysql_query($query);

                        while($row = mysql_fetch_array($result))
                        {
                            $output .= '
      <tr>
      <td>' . $row['account_number'].'</td>
      </tr>';
                        }
                    $output .="</table></center>";
                        echo $output;
                    ?>

                </div>
            </div>
            <!-- End Box -->

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