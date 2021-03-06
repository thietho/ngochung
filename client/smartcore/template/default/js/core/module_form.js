var $jModuleName = $('#modulename');
var $jModuleID = $('#moduleid');
var $jModuleCode = $('#modulecode');
var $jModulePath = $('#modulepath');


function save() {
    //validate form
    if(validate_form()) {
        showloading();
        $.post("?route=core/module/save", $("#frmform").serialize(), function($data) {
            endloading();
            var $response = JSON.parse($data);
            var $errors = $response['errors'];
            if($response['status'] == 'failed') {
                for (var $error_code in $errors) {
                    if ($errors.hasOwnProperty($error_code)) {
                        if($error_code == 'modulename') {
                            showError($jModuleName, 'modulename');
                        }
                        if($error_code == 'moduleid') {
                            showError($jModuleID, 'moduleid');
                        }
                        if($error_code == 'modulecode') {
                            showError($jModuleCode, 'modulecode');
                        }
                        if($error_code == 'moduleid_duplicated') {
                            showError($jModuleID, 'moduleid_duplicated');
                        }
                    }
                }
                $("html, body").animate({ scrollTop: 0 }, "fast");
                toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

            } else {
                toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                if($response['updatetype'] == 'insert') {
                    window.location.href = "<?php echo $cancel_link ?>";
                }
            }
        });
    }
}

function showError($jSelector, $classHelp) {
    $jSelector.parent().addClass('has-error');
    $jSelector.siblings("." + $classHelp).css('display', 'inline-block');
}

function hideError($jSelector, $classHelp) {
    $jSelector.parent().removeClass('has-error');
    $jSelector.siblings("." + $classHelp).css('display', 'none');
}


function validate_form() {
    var $isValid = true;
    var $modulename = $jModuleName.val().trim();
    var $moduleid = $jModuleID.val().trim();
    var $modulecode = $jModuleCode.val().trim();
    var $modulepath = $jModulePath.val().trim();

    if(0 == $modulename.length) {
        showError($jModuleName, 'modulename');
        $isValid = false;
    } else {
        hideError($jModuleName, 'modulename');
    }

    if(0 == $moduleid.length) {
        showError($jModuleID, 'moduleid');
        $isValid = false;
    } else {
        hideError($jModuleID, 'moduleid');
    }

    if(0 == $modulecode.length) {
        showError($jModuleCode, 'modulecode');
        $isValid = false;
    } else {
        hideError($jModuleCode, 'modulecode');
    }

    return $isValid;
}