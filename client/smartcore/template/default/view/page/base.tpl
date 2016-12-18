<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>Ngọc Hùng</title>

    <!-- META SECTION -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="shortcut icon" href="<?php echo DIR_IMAGE?>logo.png" type="image/x-icon">
    <link rel="icon" href="<?php echo DIR_IMAGE?>logo.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <!-- END META SECTION -->

    <!-- BEGIN STYLESHEETS -->
    <link rel="stylesheet" href="<?php echo DIR_CSS ?>styles.css" type="text/css"/>

    <link rel="stylesheet" href="<?php echo DIR_CSS ?>font-awesome.css" type="text/css"/>
    <link rel="stylesheet" href="<?php echo DIR_CSS ?>toastr.min.css" type="text/css"/>
    <!-- END STYLESHEETS -->

    <!-- ADD JAVASCRIPT -->
    <script type="text/javascript" src="<?php echo DIR_JS ?>jquery/jquery.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>jquery/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>toastr.min.js"></script>
    <script type="text/javascript" src="<?php echo DIR_JS ?>common.js"></script>
    <script language="JavaScript">
        var HTTP_SERVER = '<?php echo HTTP_SERVER?>';
    </script>

    <!-- END JAVASCRIPT -->
</head>

<body>
    <div id="elife-page">
        <?php echo $header?>
        <?php echo $pagecontent?>
        <?php echo $footer?>

    </div>
    <div id="loading" style="position:fixed;top: 0;width: 100%;height: 100%;text-align: center;display: table;background: #fff;opacity: 0.7;" class="hidden">
    <span style="display: table-cell;vertical-align: middle">
        <img src="<?php echo DIR_IMAGE?>loading.gif" >
    </span>

    </div>
</body>
</html>