var $jOldPassword = $('#oldpassword');
var $jNewPassword = $('#newpassword');
var $jConfirmPassword = $('#confirmpassword');
$jOldPassword.focus();

function showError($jSelector, $classHelp) {
    $jSelector.parent().addClass('has-error');
    $jSelector.siblings("." + $classHelp).css('display', 'inline-block');
}

function hideError($jSelector, $classHelp) {
    $jSelector.parent().removeClass('has-error');
    $jSelector.siblings("." + $classHelp).css('display', 'none');
}


function save() {
    //validate form
    if(validate_form()) {
        showloading();
        $.post("?route=core/profile/changepassword", $("#frmform").serialize(), function($data) {
            endloading();
            var $response = JSON.parse($data);
            var $errors = $response['errors'];
            if($response['status'] == 'failed') {
                for (var $error_code in $errors) {
                    if ($errors.hasOwnProperty($error_code)) {
                        if($error_code == 'oldpassword-required') {
                            showError($jOldPassword, 'oldpassword-required');
                        }
                        if($error_code == 'oldpassword-invalid') {
                            showError($jOldPassword, 'oldpassword-invalid');
                        }

                        if($error_code == 'newpassword-required') {
                            showError($jNewPassword, 'newpassword-required');
                        }
                        if($error_code == 'newpassword-length') {
                            showError($jNewPassword, 'password-length');
                        }

                        if($error_code == 'confirmpassword-required') {
                            showError($jConfirmPassword, 'confirmpassword-required');
                        }
                        if($error_code == 'confirmpassword-match') {
                            showError($jConfirmPassword, 'confirmpassword-match');
                        }
                    }
                }
                $("html, body").animate({ scrollTop: 0 }, "fast");
                toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

            } else {
                toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                $jOldPassword.val("");
                $jNewPassword.val("");
                $jConfirmPassword.val("");
            }
        });
    }
}


function validate_form() {
    var $isValid = true;
    //check for case insert new user
    var $oldpassword = $jOldPassword.val().trim();
    var $newpassword = $jNewPassword.val().trim();
    var $confirmpassword = $jConfirmPassword.val().trim();

    if(0 == $oldpassword.length) {
        showError($jOldPassword, 'oldpassword-required');
        $isValid = false;
    } else {
        hideError($jOldPassword, 'oldpassword-required');
    }

    if(0 == $newpassword.length) {
        showError($jNewPassword, 'newpassword-required');
        $isValid = false;
    } else {
        hideError($jNewPassword, 'newpassword-required');
    }

    if(5 > $newpassword.length) {
        showError($jNewPassword, 'newpassword-length');
        $isValid = false;
    } else {
        hideError($jNewPassword, 'newpassword-length');
    }

    if(0 == $confirmpassword.length) {
        showError($jConfirmPassword, 'confirmpassword-required');
        $isValid = false;
    } else {
        hideError($jConfirmPassword, 'confirmpassword-required');
    }

    if($newpassword.length >= 5) {
        if($confirmpassword != $newpassword) {
            showError($jConfirmPassword, 'confirmpassword-match');
            $isValid = false;
        } else {
            hideError($jConfirmPassword, 'confirmpassword-match');
        }
    }


    return $isValid;
}


