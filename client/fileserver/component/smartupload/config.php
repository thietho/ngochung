<?php
$skinid = "";
define('TOKE', '20485');

switch ($_GET['site']) {
    case md5("default" . TOKE):
        $skinid = "default";
        break;
}
if ($skinid == "") {
    header("Location: error.html");
} else {
    $folder_upload_name = isset($_GET['folder_upload_name']) ? $_GET['folder_upload_name'] : '';
    $folder_thumb_name = isset($_GET['folder_thumb_name']) ? $_GET['folder_thumb_name'] : '';
    define("DIR_FOLDER_FILE", "../../file_" . $skinid . "/file/");
    define("DIR_FILE", "../../file_" . $skinid . "/file/?folder_upload_name=". $folder_upload_name ."&folder_thumb_name=" . $folder_thumb_name);
}