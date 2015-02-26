<style>
    table, td, th {
        border: 1px solid #525b80;
    }

    th {
        background-color: #26807b;
        color: white;
    }
</style>
<?php
include("connection.php");
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
?>
<table class="table table-striped" width="100%">
    <tr>
        <th>Mobile No</th>
        <th>Total SMS</th>
        <th>Answer A</th>
        <th>Answer B</th>
        <th>Answer Others</th>
    </tr>
    <?php
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
?>
    <tr>
        <td><?php echo $result['msisdn'] ?></td>
        <td><?php echo $result['COUNT(*)'] ?></td>
        <td><?php echo $ansA ?></td>
        <td><?php echo $ansB ?></td>
        <td><?php echo $others ?></td>
    </tr>

    <?php
    }
?>
<?php
/*
 $mysql2=mysql_query($sql);
$num_rows = mysql_num_rows($mysql2);
$itemsPerPage = 20;
$num_rows = mysql_num_rows($mysql2);
$total_page=  ceil($num_rows/$itemsPerPage);
if(!empty ($pageNum) )
{
    $page = $pageNum ;


}
else
{
    $page = 0;
    $limit=0;
}
$limit = $itemsPerPage * $page ;
$limit2 = $itemsPerPage * ($page+1) ;
$sql4=$sql;
$sql4.="LIMIT ".$limit.",".$itemsPerPage."";
*/
//echo $sql4;
?>

<table>
    <tr>
    <td><a href="excel_search_count.php?todate=<?php echo $todate ?>&fromdate=<?php echo $fromdate ?>">Generate Excel</a></td></tr>
</table>
<style>
    #loading
    {
        width: 100%;
        position: absolute;
    }
    #pagination li
    {
        list-style: none;
        float: left;
        margin-right: 16px;
        padding:5px;
        border:solid 1px #dddddd;
        color:#0063DC;
    }
    #pagination li:hover
    {
        color:#FF0084;
        cursor: pointer;
    }
</style>
<ul id="pagination">
    <?php

    //Pagination Numbers
    /*
    if(!isset($pageNum)){
        $pageNum=0;
        $total_page=4;
        $next = $total_page + 1;
        $i=0;
        $lastpage = ceil($num_rows/$itemsPerPage);
        if($lastpage<=$total_page){
            $total_page=$lastpage-1;
        }
    }
    else
    {
        $i=$pageNum;
        $total_page2=4+$pageNum;

        $lastpage = ceil($num_rows/$itemsPerPage)-1;

        if($total_page2<=$lastpage)
        {
            $total_page=4+$pageNum;
        }
        else{
            $lastpage = ceil($num_rows/$itemsPerPage)-1;
            $total_page=($lastpage-$pageNum)+$pageNum;

        }
        $prev = $pageNum - 1;
        $next = $pageNum + 1;
        $lastpage = ceil($num_rows/$itemsPerPage)-1;
        $LastPagem1 = $lastpage - 1;
//echo $pageNum;
//echo $prev;exit;



    }
    if(($pageNum!=0)||($prev>0)){
        echo '<li id="'.$prev.'" style="border:none;">Prev</li>';
    }
    $k=0;
    for($i; $i<=$total_page; $i++)
    {
        $k=$i+1;
        if($i==$pageNum){
            echo '<li id="'.$i.'" style="border:none;">'.$k.'</li>';
        }
        else{
            echo '<li id="'.$i.'">'.$k.'</li>';
        }
    }
    $lastpage4 = ceil($num_rows/$itemsPerPage);
    if($k!=$lastpage4){
        if(($pageNum<$lastpage)&&($next<=$lastpage ) ){
            echo '<li id="'.$next.'" style="border:none;">Next</li>';
        }
    }
    */
    ?>
</ul>
<?php
//print_r($sql4);
?>

