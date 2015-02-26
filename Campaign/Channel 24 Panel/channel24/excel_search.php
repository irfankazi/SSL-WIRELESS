<?php
error_reporting(0);
include("connection.php");
$prev = "";
$implode = array();
$todate=$_REQUEST['todate'];
$fromdate=$_REQUEST['fromdate'];
$status=$_REQUEST['status'];
$msisdn = $_REQUEST['msisdn'];
$answer = $_REQUEST['answer'];
//$pageNum=$_REQUEST['pageNum'];

$sql = "SELECT * FROM sms_info ";

$today=date('Y-m-d H:i:s');

if (!empty ($todate))
{
    $todate=$todate." 23:59:59";
}
if (empty ($todate))
{
    $todate=date('Y-m-d  H:i:s');
}
if (empty ($fromdate))
{
    $fromdate=date('Y-m-d');
}
//print_r($fdate);exit;
if (!empty($msisdn))
{
    $msisdn=  '88'.substr($msisdn, -11);
    $implode[] = "msisdn = '" . $msisdn . "'";

}

if (!empty($answer))
{
    $implode[] = "answer = '" . $answer . "'";
}

if (!empty($status))
{
    $implode[] = "status = '" . $status . "'";
}

if (!empty($_REQUEST['fromdate'])&&!empty($todate))
{
    $implode[]= " in_time BETWEEN '" .$fromdate."' AND '".$todate."'";
}
else
{
    $implode[] = "in_time < '" . $today . "'";
    $fromdate='';
}
if ($implode) {
    $sql .= " WHERE " . implode(" AND ", $implode);

}

$sql = $sql." order by id desc ";

//echo $sql;
//print_r($sql);exit;
// die();
$mysql=mysql_query($sql);

require_once "php_writeexcel-0.3.0/class.writeexcel_workbook.inc.php";
require_once "php_writeexcel-0.3.0/class.writeexcel_worksheet.inc.php";

$fname = tempnam("tmp", "channel_24_search_report.xls");
$workbook = new writeexcel_workbook($fname);
$worksheet = $workbook->addworksheet('channel_24_search_report');
//print_r($workbook);exit;

#######################################################################
#
# Write a general heading
#

$worksheet->set_column('A:M', 20);
$heading  = $workbook->addformat(array(
    bold    => 1,
    color   => 'black',
    size    => 12,
    merge   => 1,
));
$worksheet->write('A1', "Mobile Number",$heading);
$worksheet->write('B1', "SMS",$heading);
$worksheet->write('C1', "In Time",$heading);
$worksheet->write('D1', "Status",$heading);
$worksheet->write('E1', "Answer",$heading);



$k=1;
$i=1;



while($rowres=mysql_fetch_array($mysql))
{
    $i++;
    $worksheet->write('A'.$i, $rowres["msisdn"]);
    $worksheet->write('B'.$i, $rowres["in_msg"]);
    $worksheet->write('C'.$i, $rowres["in_time"]);
    $worksheet->write('D'.$i, $rowres["status"]);
    $worksheet->write('E'.$i, $rowres["answer"]);

}
$i +=3;
$m = $i+3;
$workbook->close();

header("Content-Type:application/vnd.ms-excel; name=\"channel_24_search_report.xls\"");
header("Content-Disposition: attachment; filename=\"channel_24_search_report.xls\"");

$fh=fopen($fname, "rb");
fpassthru($fh);
unlink($fname);


?>

