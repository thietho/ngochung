<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>Kotra</title>

    <!-- META SECTION -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!-- END META SECTION -->

    <!-- BEGIN STYLESHEETS -->
    <link rel="stylesheet" href="<?php echo DIR_CSS ?>responsive.css" type="text/css"/>
    <link rel="stylesheet" href="<?php echo DIR_CSS ?>styles.css" type="text/css"/>
    <link rel="stylesheet" href="<?php echo DIR_CSS ?>toastr.min.css" type="text/css"/>

    <link rel="stylesheet" href="<?php echo DIR_COMMON ?>ckeditor/skins/moono/editor_gecko.css" type="text/css"/>
    <!-- END STYLESHEETS -->
    <script type="application/javascript">
        var DIR_USERIMAGE = "<?php echo DIR_USERIMAGE?>";
    </script>
    <!-- ADD JAVASCRIPT -->
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/jquery/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/moment/moment.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/customscrollbar/jquery.mCustomScrollbar.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/bootstrap-select/bootstrap-select.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/maskedinput/jquery.maskedinput.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/form-validator/jquery.form-validator.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/noty/jquery.noty.packaged.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/datatables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/datatables/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/sweetalert/sweetalert.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/knob/jquery.knob.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/jvectormap/jquery-jvectormap.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/jvectormap/jquery-jvectormap-us-aea-en.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/sparkline/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/morris/raphael.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/morris/morris.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/rickshaw/d3.v3.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/rickshaw/rickshaw.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/isotope/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>app.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>app_plugins.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>toastr.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>common.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>jquery.fileupload.js"></script>

    <script type="text/javascript" src="<?php echo DIR_COMMON ?>ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="<?php echo DIR_COMMON ?>ckeditor/config.js"></script>
    <script type="text/javascript" src="<?php echo DIR_COMMON ?>ckeditor/lang/<?php echo $this->config->get('config_languageid') ?>.js"></script>
    <script type="text/javascript" src="<?php echo DIR_COMMON ?>ckeditor/styles.js"></script>
    <!-- END JAVASCRIPT -->
</head>

<body>

<!-- APP WRAPPER -->
<div class="app">
    <!-- START APP CONTAINER -->
    <div class="app-container app-sidebar-left-closed">
        <div class="app-content">
            <!-- START APP HEADER -->
            <div class="app-header">
                <?php echo $header?>
            </div>
            <!-- END APP HEADER  -->

            <!-- START PAGE HEADING -->
            <div class="app-navigation-horizontal">
                <?php echo $mainmenu?>
            </div>
            <!-- END PAGE HEADING -->

            <!-- START PAGE CONTAINER -->
            <?php echo $pagecontent?>
            <!-- END PAGE CONTAINER -->
        </div>
        <!-- END APP CONTENT -->
    </div>
    <!-- END APP CONTAINER -->
    <!-- APP OVERLAY -->
    <div class="app-overlay"></div>
    <!-- END APP OVERLAY -->
</div>
<!-- END APP WRAPPER -->
<div id="loading" style="position:fixed;top: 0;width: 100%;height: 100%;text-align: center;display: table;background: #fff;opacity: 0.7;" class="hidden">
    <span style="display: table-cell;vertical-align: middle">
        <img src="<?php echo DIR_IMAGE?>loading.gif" >
    </span>

</div>
<!-- MODAL SMALL -->
<div class="modal fade" id="modal-select-file" tabindex="-1" role="dialog" aria-labelledby="modal-small-header">
    <div class="modal-dialog modal-lg" role="document">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="icon-cross"></span>
        </button>
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="modal-small-header">Select file</h4>
            </div>
            <div class="modal-body"></div>
        </div>
    </div>
</div>

<!-- END MODAL SMALL -->
</body>
</html>