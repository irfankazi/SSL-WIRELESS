<?php
function move_table_data($tb_name,$out_tb, $text){
    $rowid = array();
    $rowid2 = array();
    $insertCount = 0;
    $deleteCount = 0;
    $updateCount = 0;
    date_default_timezone_set("Asia/Dhaka");
    $curr_time = date("Y-m-d");
    $begin_time = date("Y-m-d H:i:s");

    $temp = "CREATE TABLE IF NOT EXISTS log_table (id INT NOT NULL AUTO_INCREMENT, script_id INT, insertCount VARCHAR(100), deleteCount VARCHAR(100), updateCount VARCHAR(100), begin_time DATE , end_time DATE ,PRIMARY KEY(id))";
    if(mysql_query($temp)){
        echo "<br/><br/>Log Table Created <br/><br/>";
    }
    else{
        echo "<br/><br/>Failed: ".mysql_error()."<br/><br/>";
    }





    $sql = "SELECT * FROM ".$tb_name." WHERE sms_status='SUCCESS' && DATE(incomming_time)<'".$curr_time."'";
    $sql2 = "SELECT * FROM ".$tb_name." WHERE sms_status != 'SUCCESS' && DATE(incomming_time)='".$curr_time."'";
    if($run = mysql_query($sql)){
        while($r=mysql_fetch_array($run)){
            array_push($rowid,$r['id']);
        }
        echo var_dump($rowid);
        for($i=0; $i<count($rowid); $i++){
            $usql = "UPDATE ".$tb_name." SET isRead=1 WHERE id=".$rowid[$i]."";
            if(mysql_query($usql)){
                echo "<br/>isRead is set to 1<br/>";
            }
            else {
                echo "<br/>Failed".mysql_error()."<br/>";
            }
            $updateCount += mysql_affected_rows();
        }
        if(!empty($rowid)){
            $updateData = "INSERT INTO ".$out_tb." SELECT * FROM ".$tb_name." WHERE isRead=1 && DATE(incomming_time)<'".$curr_time."'";
            $delData = "DELETE FROM ".$tb_name." WHERE isRead=1 && DATE(incomming_time)<'".$curr_time."'";
            if(mysql_query($updateData)){
                echo "<br/>Data inserted to table<br/>";
                $insertCount += mysql_affected_rows();
            }
            else{
                echo "<br/>Error: ".mysql_error()."<br/>";
            }
            if(mysql_query($delData)){
                echo "<br/>Data deleted from table<br/>";
                $deleteCount += mysql_affected_rows();
            }
            else{
                echo "<br/>Error: ".mysql_error()."<br/>";
            }
        }
    }
    if($text == true){
        if($run2 = mysql_query($sql2) or die(mysql_error())){

            while($r2=mysql_fetch_array($run2)){
                array_push($rowid2,$r2['id']);
            }
            echo var_dump($rowid2);
            for($j=0; $j<count($rowid2); $j++){
                $usql2 = "UPDATE ".$tb_name." SET sms_status='processing' WHERE id=".$rowid2[$j]."";
                if(mysql_query($usql2)){
                    echo "<br/>sms_status updated to processing<br/>";
                }
                else {
                    echo "<br/>Failed".mysql_error()."<br/>";
                }
                $updateCount += mysql_affected_rows();
            }
        }
    }


    switch($tb_name){
        case "inbox_queue":
            $scriptID = 1;
            break;
        case "outbox_queue":
            $scriptID=2;
            break;
        case "subs_inbox":
            $scriptID=3;
            break;
        case "subs_outbox":
            $scriptID=4;
            break;
    }

    $end_time = date("Y-m-d H:i:s");
    if($insertCount !=0 || $deleteCount != 0|| $updateCount != 0){
        $insert_temp = "INSERT INTO log_table(`script_id`,`insertCount`,`deleteCount`,`updateCount`,`begin_time`,`end_time`)VALUES('".$scriptID."','".$insertCount."','".$deleteCount."','".$updateCount."','".$begin_time."','".$end_time."')";
        if(mysql_query($insert_temp)){
            echo "<br/><br/>Log entered successfully<br/><br/>";
        }
        else {
            echo "<br/><br/>Error: ".mysql_error()."<br/><br/>";
        }
    }

}