<?php
include('connection.php');
$error = '';
if(isset($_POST['log_submit']))
{
    $username = mysql_real_escape_string($_POST['username']);
    $password = mysql_real_escape_string($_POST['password']);

    $qUser = mysql_query("SELECT * FROM user_info WHERE username='$username'");

    if(mysql_num_rows($qUser) == 0)
    {
          $error = "<strong>Login Failed: </strong>Error! Username Mismatch";
    }


    else {
        $row = mysql_fetch_assoc($qUser);
        if($row['password'] == $password)
        {
            $_SESSION['username'] = $row["username"];
            header("Location: http://192.168.69.197:8080/gatewayadmin/operations.php");
        }
        else
        {
            $error = "<strong>Login Failed: </strong>Error! Password Mismatch";
        }
    }
}

?>
