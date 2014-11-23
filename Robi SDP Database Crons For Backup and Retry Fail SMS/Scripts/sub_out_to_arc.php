<?php
include("connection.php");

include("function.php");

move_table_data("subs_outbox","subs_outbox_archive", false);