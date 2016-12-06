<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>Kotra</title>

    <!-- META SECTION -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
    <meta name="viewport" content="width=1080, user-scalable=no">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <!-- END META SECTION -->

    <!-- BEGIN STYLESHEETS -->
    <link rel="stylesheet" href="<?php echo DIR_CSS ?>styles.css" type="text/css"/>
    <link rel="stylesheet" href="<?php echo DIR_CSS ?>toastr.min.css" type="text/css"/>
    <!-- END STYLESHEETS -->

    <!-- ADD JAVASCRIPT -->
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>vendor/jquery/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>toastr.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>common.js"></script>


    <!-- END JAVASCRIPT -->
</head>

<body>
<div id="elife-bankpage">
    <?php echo $pagecontent?>
</div>

</body>
</html>