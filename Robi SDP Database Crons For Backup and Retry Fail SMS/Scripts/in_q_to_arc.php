<?php
include("connection.php");

include("function.php");

move_table_data("inbox_queue","inbox_archive", true);