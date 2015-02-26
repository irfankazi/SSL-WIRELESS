<?php
include('connection.php');

$username = $_SESSION['username'];

$query = mysql_query("select * from user_info where username = '$username'");
$row = mysql_fetch_assoc($query);
$login_session_user = $row['username'];
if(!isset($login_session_user))
{
    header('Location: index.php');
}
?>