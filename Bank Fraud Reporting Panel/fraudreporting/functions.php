<?php
include('connection.php');
$error = '';
if(isset($_POST['log_submit']))
{
    $username = mysql_real_escape_string($_POST['username']);
    $password = mysql_real_escape_string($_POST['password']);

    $qUser = mysql_query("SELECT * FROM tbl_user_info_login WHERE user_id='$username'");

    if(mysql_num_rows($qUser) == 0)
    {
          $error = "<strong>Login Failed: </strong>Error! Username Mismatch";
    }


    else {
        $row = mysql_fetch_assoc($qUser);
        if($row['password'] == $password && $row['user_role'] == 'user')
        {
            $_SESSION['user_login'] = $username;
            $_SESSION['user_id'] = $rows["id"];
            header("Location: http://192.168.69.197:8080/fraudreporting/profile.php");
        }
        elseif($row['password'] == $password && $row['user_role'] == 'admin')
        {
            $_SESSION['user_login'] = $username;
            $_SESSION['user_id'] = $rows["id"];
            header("Location: http://192.168.69.197:8080/fraudreporting/admin_profile.php");
        }
        else
        {
            $error = "<strong>Login Failed: </strong>Error! Password Mismatch";
        }
    }
}
?>