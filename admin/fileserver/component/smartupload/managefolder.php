<?php
session_start();
include('config.php');

//add group
if(isset($_GET['addfolder'])) {
    $folder = $_GET['addfolder'];
    if(trim($folder) != "") {
        $folder = rawurldecode($folder);
        $upload_folder = DIR_FOLDER_FILE . 'eupload_' . $folder . "/";
        $thumb_folder = DIR_FOLDER_FILE . 'ethumb_' . $folder . "/";

        if(!file_exists($upload_folder)) {
            if (!mkdir($upload_folder, 0777, true)) {
                echo 'Failed to create group: ' . $folder;
            } else {
                if(!file_exists($thumb_folder)) {
                    mkdir($thumb_folder, 0777, true);
                }
                echo 'true';
            }
        } else {
            echo "Failed: Duplicate group: " . $folder;
        }
    }
}

//remove group
//if have files in group, cant not delete folder
if(isset($_GET['removefolder'])) {
    $folder = $_GET['removefolder'];
    if(trim($folder) != "") {
        $folder = rawurldecode($folder);
        $upload_folder = DIR_FOLDER_FILE . 'eupload_' . $folder . "/";
        $thumb_folder = DIR_FOLDER_FILE . 'ethumb_' . $folder . "/";

        $fi = new FilesystemIterator($upload_folder, FilesystemIterator::SKIP_DOTS);
        if(iterator_count($fi)==0) {
            //echo 'dir empty';
            //remove folder
            if(file_exists($upload_folder)) {
                rmdir($upload_folder);
                if(file_exists($thumb_folder)) {
                    rmdir($thumb_folder);
                }
                echo "true";
            } else {
                echo 'Group: ' . $folder . ' not exist!';
            }
        } else {
            echo 'Failed: Can not remove group: ' . $folder . ' because folder is not empty';
        }
    }
}


//add group
if(isset($_GET['getfolder'])) {
    if(file_exists(DIR_FOLDER_FILE)) {
        $folders = array();
        $index = 0;
        foreach(glob(DIR_FOLDER_FILE . 'eupload_*') as $filename) {
            $folders[$index] = str_replace('eupload_', '', basename($filename));
            $index++;
        }
        echo json_encode($folders);
    }
}

