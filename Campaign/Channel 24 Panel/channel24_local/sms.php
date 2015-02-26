<?php
include('connection.php');
$today=date('Y-m-d H:i:s');
function qry_insert($table, $data)
{
    $fields = array_keys( $data );
    $values =  array_values( $data );
    $query = mysql_query("INSERT IGNORE INTO $table(".implode(",",$fields).") VALUES ('".implode("','", $values )."');") or die( mysql_error() );
    if (mysql_affected_rows() > 0) {
        return 1;
    }
    else{
        return 0;
    }
}
if(isset ($_REQUEST)&&!empty ($_REQUEST))
{
    $msisdn= $_REQUEST['msisdn'];
    $sms = $_REQUEST['sms'];
    $msisdn = '88'.substr($msisdn, -11);
    $sms = trim(substr($sms, 2));
    $sms = strtolower($sms);

    if($sms == "a" || $sms == "b")
    {
        $status= "Valid";
        $reply= "Thanks for your participation at Channel 24 quiz. Keep sending more sms to win grand prizes.";

    }
    else
    {
        $status= "Invalid";
        $reply= "Sorry. Wrong format. Please contact 880 9612 226969 for details.";
    }

    $sms_data=array(
        'msisdn'=>$msisdn,
        'in_msg'=> $_REQUEST['sms'],
        'out_msg'=>$reply,
        'in_time'=>$today,
        'status'=>$status,
        'answer'=>$sms,
    );

    $sms_data_insert=qry_insert('sms_info',  $sms_data);
    echo $reply;
}
