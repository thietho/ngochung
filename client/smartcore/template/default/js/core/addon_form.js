var $jAddonId = $('#addonid');

function save() {
    //validate form
    if(validate_form()) {
        showloading();
        $.post("?route=core/addon/save", $("#frmform").serialize(), function($data) {
            endloading();
            var $response = JSON.parse($data);
            var $errors = $response['errors'];
            if($response['status'] == 'failed') {
                for (var $error_code in $errors) {
                    if ($errors.hasOwnProperty($error_code)) {
                        if($error_code == 'addonid') {
                            showError($jAddonId, 'addonid');
                        }
                        if($error_code == 'addonid_duplicated') {
                            showError($jAddonId, 'addonid_duplicated');
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

/*
function showError($jSelector, $classHelp) {
    $jSelector.parent().addClass('has-error');
    $jSelector.siblings("." + $classHelp).css('display', 'inline-block');
}

function hideError($jSelector, $classHelp) {
    $jSelector.parent().removeClass('has-error');
    $jSelector.siblings("." + $classHelp).css('display', 'none');
}
*/


function validate_form() {
    var $isValid = true;
    var $addonid = $jAddonId.val().trim();

    if(0 == $addonid.length) {
        showError($jAddonId, 'addonid');
        $isValid = false;
    } else {
        hideError($jAddonId, 'addonid');
    }

    return $isValid;
}