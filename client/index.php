<?php
ini_set("memory_limit","1500M");
ini_set('post_max_size', '1000M');
ini_set('upload_max_filesize', '1000M');

error_reporting(E_ALL & ~E_NOTICE);
date_default_timezone_set('Asia/Ho_Chi_Minh');
require_once('dbconfig.php');
require_once('config.php');

// Startup
require_once(DIR_SYSTEM . 'startup.php');


// Front Controller
$controller = new Front();

// Maintenance Mode
$controller->addPreAction(new Action('common/maintenance'));

// SEO URL's
//$controller->addPreAction(new Action('common/seo_url'));




// Router
if (isset($request->get['route'])) {
	$action = new Action($request->get['route']);
} else {
	$action = new Action('module/home');
}

// Dispatch
$controller->dispatch($action, new Action('error/not_found'));

// Output
$response->output();