<?php
// CONFIG DOMAIN
$base_domain = 'localhost:81'; //ex: google.com
$domain = 'localhost:81'; //ex: www.google.com
$main_http_server = "http://$domain/ngochung/client/";
$root_http_server = "http://$domain/ngochung/client/";
$root_https_server = "https://$domain/ngochung/client/";
$file_server = "http://$domain/ngochung/client/fileserver/";
$image_server = "http://$domain/ngochung/fileserver/";

$direct_file_server = $image_server . "file_default" . "/file/";
define('DIRECT_FILE_SERVER', $direct_file_server);


//Set language for website
if (!isset($_GET['lang']) || $_GET['lang'] == "") {
    $langs = (!isset($_SESSION['lang_session']) || $_SESSION['lang_session'] == "") ? "en" : $_SESSION['lang_session'];
} else {
    $langs = $_GET['lang'];
}
$_SESSION['lang_session'] = $langs == "vi" ? "vn" : $langs;

if (!isset($_GET['countrycode']) || $_GET['countrycode'] == "") {
    $countryCode = (!isset($_SESSION['country_session']) || $_SESSION['country_session'] == "") ? "vn" : $_SESSION['country_session'];
} else {
    $countryCode = $_GET['countrycode'];
}
$_SESSION['country_session'] = $countryCode;


//COMMON URL
define('MAIN_HTTP_SERVER', $main_http_server);
define('ROOT_HTTP_SERVER', $root_http_server);
define('HTTP_SERVER', $root_http_server );
define('HTTPS_SERVER', $root_https_server);
define('FILE_SERVER', $file_server);
define('IMAGE_SERVER', $image_server);
define('HTTP_WEB', $root_http_server . $langs . '-' . $countryCode . '/');
define('HTTP_COMPONENT', MAIN_HTTP_SERVER . 'component/');



//CONFIG DIRECTORY
define('DIR_SERVERROOT', str_replace('\\', '/', realpath(dirname(__FILE__))) . '/');
//define('DIR_SERVERROOT_PARENT', str_replace('\\', '/', realpath(dirname(__FILE__) . '/..')) . '/');
define('DIR_APPLICATION', DIR_SERVERROOT . 'smartcore/');
define('DIR_CONTROLLER', DIR_SERVERROOT . 'smartcore/controller/');
define('DIR_MODEL', DIR_SERVERROOT . 'smartcore/model/');
define('DIR_LANGUAGE', DIR_SERVERROOT . 'smartcore/language/');
define('DIR_COMMON', FILE_SERVER . 'common/');
define('DIR_COMPONENT', DIR_SERVERROOT . 'component/');
define('DIR_SYSTEM', DIR_SERVERROOT . 'system/');
define('DIR_DATABASE', DIR_SYSTEM . 'database/');
define('DIR_CONFIG', DIR_SYSTEM . 'config/');
define('TOKE', '20485');

//ADDITIONAL DIRECTORY
define('DIR_MODIFICATION_SYSTEM', DIR_SERVERROOT . 'system_setting/');
define('DIR_LOGS', DIR_SERVERROOT . 'logs/');

//
define('DIR_FILE','../fileserver/file_default/file/');