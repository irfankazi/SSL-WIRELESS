<?php
include("connection.php");
error_reporting(0);
$prev = "";
$implode = array();
$todate=$_REQUEST['todate'];
$fromdate=$_REQUEST['fromdate'];
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
if ($implode) {
    $sql .= " WHERE " . implode(" AND ", $implode);

}
$sql_for_time = "";
if (!empty($_REQUEST['fromdate'])&&!empty($todate))
{
    $sql_for_time= "in_time BETWEEN '" .$fromdate."' AND '".$todate."'";
}
else
{
    $sql_for_time= "in_time < '" . $today . "'";
    $fromdate='';
}

$sql = mysql_query("SELECT msisdn,COUNT(*) FROM sms_info  GROUP BY msisdn");

require_once "php_writeexcel-0.3.0/class.writeexcel_workbook.inc.php";
require_once "php_writeexcel-0.3.0/class.writeexcel_worksheet.inc.php";

$fname = tempnam("tmp", "channel_24_search_count_report.xls");
$workbook = new writeexcel_workbook($fname);
$worksheet = $workbook->addworksheet('channel_24_search_count_report');
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
$worksheet->write('B1', "Total",$heading);
$worksheet->write('C1', "Answer A",$heading);
$worksheet->write('D1', "Answer B",$heading);
$worksheet->write('E1', "Answer Others",$heading);



$k=1;
$i=1;

while($result = mysql_fetch_array($sql))
{
    $sql_for_answer_A= "SELECT COUNT(*) As Answer_A FROM sms_info WHERE answer='A'"." AND msisdn=".$result['msisdn']. " AND ". $sql_for_time;
    $sql_for_answer_B = "SELECT COUNT(*) As Answer_B FROM sms_info WHERE answer='B'"." AND msisdn=".$result['msisdn']. " AND ". $sql_for_time;

    $mysql_for_answer_A = mysql_query($sql_for_answer_A);
    $result_for_answer_A = mysql_fetch_row($mysql_for_answer_A);
    $ansA=$result_for_answer_A[0];

    $mysql_for_answer_B = mysql_query($sql_for_answer_B);
    $result_for_answer_B = mysql_fetch_row($mysql_for_answer_B);
    $ansB=$result_for_answer_B[0];
    $others=$result['COUNT(*)']-($ansA+$ansB);

    $i++;
    $worksheet->write('A'.$i, $result["msisdn"]);
    $worksheet->write('B'.$i, $result['COUNT(*)']);
    $worksheet->write('C'.$i, $ansA);
    $worksheet->write('D'.$i, $ansB);
    $worksheet->write('E'.$i, $others);
}

$i +=3;
$m = $i+3;
$workbook->close();

header("Content-Type:application/vnd.ms-excel; name=\"channel_24_search_count_report.xls\"");
header("Content-Disposition: attachment; filename=\"channel_24_search_count_report.xls\"");

$fh=fopen($fname, "rb");
fpassthru($fh);
unlink($fname);