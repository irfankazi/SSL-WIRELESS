<?php
require 'initapp.php';
$self='add-new-group.php';

if (isset($_POST['submit'])){

    $grname=_post('gname');

if ($grname==''){
    conf($self,'e','Group Name Was Empty');
}


    $clientgrp= ORM::for_table('accgroups')->create();
    $clientgrp->groupname=$grname;
    $clientgrp->save();
    $grpid = $clientgrp->id();

        conf("all-groups.php",'s','Client Group Add Successfully');
    }


else{
          conf($self,'e','Please Enter Group Information Again');

}


?>