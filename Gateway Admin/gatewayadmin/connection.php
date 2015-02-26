<?php
session_start();

$connection = mysql_connect('localhost','root','') or die("connection Error!");
mysql_select_db("routing") or die("Selection Error!");


/* $conn = oci_connect("irfan", "irfan#bulk", "192.168.91.130:1521/pushapp.sslwireless.com");
if (!$conn)
{
    $m = oci_error();
    $ou=$m['message'];
    $c=0;
}
else {
    $ou="ok";
    echo  "Connected to Oracle!";
}
*/


/*
 * if (!$conn)
 {
 $m = oci_error();
  $ou=$m['message'];
 $c=0;
 }
 else {
 $ou="ok";
 //echo  "Connected to Oracle!";
 }
*/

/*
 * $already_request="select BILL_NO from bill_collection_test where  bill_no='$billno'";
$exist=oci_parse($conn,$already_request);
oci_execute($exist);
$row_exist=oci_fetch_array($exist,OCI_BOTH);

WriteLog("[$billno][bill info request]:  exist in oracle db billno=".$row_exist['BILL_NO']);

if($existrow>0||$row_exist['BILL_NO']!='')
*/
?>
