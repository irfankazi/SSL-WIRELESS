<?php
include('connection.php');

$user_check = $_SESSION['user_login'];

$query = mysql_query("select user_id,customer_id, user_role from tbl_user_info_login where user_id = '$user_check'");
$row = mysql_fetch_assoc($query);
$login_session = $row['user_id'];
$customer_id = $row['customer_id'];
$user_role = $row['user_role'];
if(!isset($login_session))
{
    header('Location: http://192.168.69.197:8080/fraudreporting/index.php');
}
?>