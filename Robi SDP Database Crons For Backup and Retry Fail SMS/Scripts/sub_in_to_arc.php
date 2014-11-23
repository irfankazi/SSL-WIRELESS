<?php
include("connection.php");

include("function.php");

move_table_data("subs_inbox","subs_inbox_archive", false);
