<?php
$xfooter='
    <script src="views/besma/assets/js/jquery.parsley/parsley.js" type="text/javascript" ></script>
';
 require ('theme/header.tpl.php');
?>

    <div class="container-fluid" id="pcont">
        <div class="page-head">
            <h2>SMS API Setup</h2>
            <ol class="breadcrumb">
                <li><a href="index.php">Home</a></li>
                <li class="active">SMS API Setup</li>
            </ol>
        </div>
        <div class="cl-mcont">
            <?php notify(); ?>
            <div class="row">


                <div class="col-sm-12 col-md-12">
                    <div class="block-flat">
                        <div class="header">
                            <h3>SMS API Setup</h3>
                        </div>
                        <div class="content">


                            <form class="form-horizontal group-border-dashed" role="form"  parsley-validate novalidate action="setup-sms-api.php" method="post">
                                <div class="form-group">
                                    <label for="gname" class="col-sm-3 control-label">SMS API URL</label>
                                    <div class="col-sm-7">
                                        <input type="text" required  class="form-control" id="apiurl" placeholder="SMS API URL" name="apiurl" value="<?php echo appconfig('sms_api_url'); ?>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="gname" class="col-sm-3 control-label">SMS API User Name</label>
                                    <div class="col-sm-7">
                                        <input type="text" required  class="form-control" id="username" placeholder="SMS API User Name" name="username" value="<?php echo appconfig('sms_api_user'); ?>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="gname" class="col-sm-3 control-label">SMS API Password</label>
                                    <div class="col-sm-7">
                                        <input type="text" required  class="form-control" id="password" placeholder="SMS API Password" name="password" value="<?php echo appconfig('sms_api_password'); ?>">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-9">
                                        <button type="submit" class="btn btn-primary" name="submit" >Update SMS API</button>
                                        <button class="btn btn-default" type="reset">Cancel</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>

<?php  require ('theme/footer.tpl.php'); ?>