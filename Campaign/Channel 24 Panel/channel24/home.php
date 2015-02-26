<!DOCTYPE html>
<html lang="en" dir="ltr">
<?php
include('session.php');
include_once("header.php");

?>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<head>
    <title>Channel 24 Panel</title>
    <meta charset="iso-8859-1">
    <link rel="stylesheet" href="styles/layout.css" type="text/css">
    <!--[if lt IE 9]><script src="scripts/html5shiv.js"></script><![endif]-->
</head>
<body>
<div class="wrapper row1">
    <header id="header" class="clear">
        <div id="hgroup">
            <h1><a href="#">SSL Wireless</a></h1>
            <h2>Channel 24 SMS Panel</h2>
        </div>
        <form action="#" method="post">
            <fieldset>
                <legend>Search:</legend>
                <!--<input type="text" value="Search Our Website&hellip;" onFocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;">
                <input type="submit" id="sf_submit" value="submit">-->
            </fieldset>
        </form>
        <nav>
            <ul>
                <li><a href="home.php">Search Panel</a></li>
                <li><a href="winner.php">Winner</a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li class="last"><a href="logout.php"">Logout</a></li>
            </ul>
        </nav>
    </header>
</div>
<!-- content -->
<div class="wrapper row2">
    <div id="container" class="clear">
        <!-- content body -->
        <!-- main content -->
        <div id="homepage" class="clear">

                <strong>Date From: </strong><input name="date_from" type="text" id="datepicker_from">
                <strong> Date To: </strong>&nbsp;&nbsp;&nbsp;&nbsp;<input name="date_to" type="text" id="datepicker_to">
                <strong> Mobile Number: </strong>&nbsp;&nbsp;&nbsp;&nbsp;<input name="msisdn" type="text" id="msisdn">
                <strong> Status: </strong><select name="status" id="status">
                    <option value="">Please Select</option>
                    <option value="valid">Valid</option>
                    <option value="invalid">Invalid</option>
                </select>
                <p><strong> Answer: </strong><select name="answer" id="answer">
                    <option value="">Please Select</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                </select></p>
                <input name="search" type="submit" id="search" value="Search">

            <div id="search222">

            </div>

                </div>

        <!-- / content body -->
    </div>
</div>
<!-- Footer -->
<div class="wrapper row3">
    <footer id="footer" class="clear">
        <p class="fl_left">Copyright <?php echo Date("Y"); ?> - All Rights Reserved - <a href="#">SSL Wireless</a></p>
    </footer>
</div>
    <?php
    include("footer.php");
    ?>
</body>
</html>
<script>
    $(function() {
        $( "#datepicker_from" ).datepicker({dateFormat: "yy-mm-dd"});
    });

    $(function() {
        $( "#datepicker_to" ).datepicker({dateFormat: "yy-mm-dd"});
    });
</script>
<script type="text/javascript">
    $('#search').click(function() {
        var fromdate=$('#datepicker_from').val();
        var todate=$('#datepicker_to').val();
        var status=$('#status').val();
        var msisdn=$('#msisdn').val();
        var answer=$('#answer').val();

        $.ajax({
            url: 'search.php',
            type: 'get',
            data: 'todate='+todate+'&fromdate='+fromdate+'&status='+status+'&msisdn='+msisdn+'&answer='+answer,
            dataType: 'html',

            success: function(html) {
                $('#search222').empty();
                $('#search222').html(html);


            }
        });
    });
    /*
     $("#fdate").datetimepicker({format: 'yyyy-mm-dd hh:ii:ss'});
     $("#tdate").datetimepicker({format: 'yyyy-mm-dd hh:ii:ss'});
     */
    //$("#fdate").datepicker({format: 'yyyy-mm-dd'});
    //$("#tdate").datepicker({format: 'yyyy-mm-dd'});

    $("#pagination li").on( "click", function() {
    //$("#pagination li").live('click',function (){
        var pageNum = this.id;
        var fromdate=$('#datepicker_from').val();
        var todate=$('#datepicker_to').val();
        var status=$('#status').val();
        var msisdn=$('#msisdn').val();
        var answer=$('#answer').val();

        $.ajax({
            url: 'search.php',
            type: 'post',
            data: 'todate='+todate+'&fromdate='+fromdate+'&status='+status+'&msisdn='+msisdn+'&answer='+answer,
            dataType: 'html',
            success: function(html) {
                $('#search222').empty();
                $('#search222').html(html);


            }
        });
    });
</script>





