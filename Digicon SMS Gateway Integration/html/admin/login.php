<?php
ob_start();
session_start();
define("_APP_RUN", true);
require "../AppINIT.php";
$self='login.php';

if (isset($_POST['login']))
{

    prf();
    $username=_post('username');
    $password=_post('password');
    if($username==''){
        conf($self,'e','Please Enter Your Username');
    }

    if($password==''){
        conf($self,'e','Please Enter Your Password');
    }
    $password = md5($secret . $password);


    require ('../lib/admin.class.php');
    $admin_login= new Admins;
    $login=$admin_login->login($username,$password);
}

else {
    $theme=  appconfig('admintheme');
    require ("views/$theme/login.tpl.php");
}

?>