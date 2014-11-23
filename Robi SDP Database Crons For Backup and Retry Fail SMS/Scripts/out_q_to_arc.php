<?php
include("connection.php");

include("function.php");

move_table_data("outbox_queue","outbox_archive", false);