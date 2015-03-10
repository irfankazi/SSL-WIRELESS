<?php
$CsvString = 'Bog0001,Rakib Honda Servicing Center,"Joybanglahat, Bogra"';
$Data = str_getcsv($CsvString, ",");

if(isset($Data['2'])) {
 $newfiled = explode("," , $Data['2']);
 $newfiled1 = isset($newfiled[0]) ?  trim($newfiled[0]) : '';
 $newfiled2 = isset($newfiled[1]) ?  trim($newfiled[1]) : '';
}
echo $newfiled1 . "\n" .$newfiled2."\n"  ;