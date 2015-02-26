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

?>
<?php

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
//echo $sql4;
?>

<b><h2 style="color:#663399">Total Found : <?php echo mysql_num_rows($mysql);?></h2></b>

<table>
    <tr>
    <td><a href="excel_search.php?todate=<?php echo $todate ?>&fromdate=<?php echo $fromdate ?>&answer=<?php echo $answer ?>&status=<?php echo $status ?>&msisdn=<?php echo $msisdn ?>">Generate Excel</a></td></tr>
</table>
<table class="table table-striped" width="100%">
    <tr>
        <th>Mobile No</th>
        <th>SMS</th>
        <th>In Time</th>
        <th>Status</th>
        <th>Answer</th>
    </tr>
    <?php
    //print_r($sql4);
    $mysql8=mysql_query($sql4);
    //$mysql8=mysql_query($sql);

    while($result=mysql_fetch_array($mysql8))
    {
        ?>
        <tr>

            <td><b><strong><?php echo $result['msisdn'] ?></strong></b></td>
            <td><b><strong><?php echo $result['in_msg'] ?></strong></b></td>
            <td><b><strong><?php echo $result['in_time'] ?></strong></b></td>
            <td><b><strong><?php echo $result['status'] ?></strong></b></td>
            <td><b><strong><?php echo $result['answer'] ?></strong></b></td>
        </tr>

    <?php
    };
    ?>
    <!--<tr>
        <td colspan="5" style="text-align: right">Total Number</td>
        <td><?php//  echo $num_rows ?></td>
    </tr>-->
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
    ?>
</ul>
<?php
//print_r($sql4);
?>

