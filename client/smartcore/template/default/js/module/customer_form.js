var $jNewPassword = $('#newpassword');
var $jRePassword = $('#repassword');
var $jFirstName = $('#firstname');
var $jLastName = $('#lastname');
var $jGender = $('#gender');
var $jEmail = $('#email');

$(document).ready(function () {

    $("#form-account-detail").submit(function ($e) {
        $e.preventDefault();
        if (validateForm()) {
            showloading();
            $.post('?route=module/customer/update', $("#form-account-detail").serialize(), function ($data) {
                endloading();
                var $response = JSON.parse($data);
                var $errors = $response['errors'];
                if ($response['status'] == 'failed') {
                    if ($errors) {
                        for (var $error_code in $errors) {
                            if ($errors.hasOwnProperty($error_code)) {
                                if ('firstname' == $error_code) {
                                    showError($jFirstName, 'firstname');
                                }
                                if ('lastname' == $error_code) {
                                    showError($jLastName, 'lastname');
                                }
                                if ('email' == $error_code) {
                                    showError($jEmail, 'email');
                                }
                                if ('email_exists' == $error_code) {
                                    showError($jEmail, 'email_exists');
                                }
                                if ('gender' == $error_code) {
                                    showError($jGender, 'gender');
                                }
                            }
                        }
                        $("html, body").animate({scrollTop: $('#form-account-detail').offset().top }, "fast");

                    } else {
                    toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                    }
                } else {
                    toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                }
            });
        }
    });


    $("#passwordForm").submit(function ($e) {
        $e.preventDefault();
        if (validatePasswordForm()) {
            showloading();
            $.post('?route=module/customer/changePass', $("#passwordForm").serialize(), function ($data) {
                endloading();
                var $response = JSON.parse($data);
                var $errors = $response['errors'];
                if ($response['status'] == 'failed') {
                    if ($errors) {
                        for (var $error_code in $errors) {
                            if ($errors.hasOwnProperty($error_code)) {

                                if ($error_code == 'newpassword') {
                                    showError($jNewPassword, 'newpassword');
                                }
                                if ($error_code == 'newpassword-invalid') {
                                    showError($jNewPassword, 'newpassword-invalid');
                                }
                                if ($error_code == 'repassword') {
                                    showError($jRePassword, 'repassword');
                                }
                                if ($error_code == 'repassword-match') {
                                    showError($jRePassword, 'repassword-match');
                                }
                            }
                        }
                        $("html, body").animate({scrollTop: $('#passwordForm').offset().top }, "fast");

                    } else {
                        toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                    }
                } else {
                    toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                    $jNewPassword.val("");
                    $jRePassword.val("");
                }
            });
        }
    });
});


function validateForm() {

    var $isValid = true;
    var $email = $jEmail.val().trim().toLowerCase();
    var $firstname = $jFirstName.val().trim();
    var $lastname = $jLastName.val().trim();
    var $gender = $jGender.val().trim();

    if ("" == $firstname) {
        showError($jFirstName, 'firstname');
        $isValid = false;
    } else {
        hideError($jFirstName, 'firstname');
    }

    if ("" == $lastname) {
        showError($jLastName, 'lastname');
        $isValid = false;
    } else {
        hideError($jLastName, 'lastname');
    }

    if ("" == $email || ("" != $email && !validateEmail($email))) {
        showError($jEmail, 'email');
        $isValid = false;
    } else {
        hideError($jEmail, 'email');
    }

    if ("" == $gender) {
        showError($jGender, 'gender');
        $isValid = false;
    } else {
        hideError($jGender, 'gender');
    }

    return $isValid;
}


function validatePasswordForm() {

    var $isValid = true;
    var $newPassword = $jNewPassword.val().trim();
    var $rePassword = $jRePassword.val().trim();

    if ("" == $newPassword) {
        showError($jNewPassword, 'newpassword');
        $isValid = false;
    } else {
        hideError($jNewPassword, 'newpassword');
        if (6 > $newPassword.length) {
            showError($jNewPassword, 'newpassword-invalid');
            $isValid = false;
        } else {
            hideError($jNewPassword, 'newpassword-invalid');
        }
    }

    if ("" == $rePassword) {
        showError($jRePassword, 'repassword');
        $isValid = false;
    } else {
        hideError($jRePassword, 'repassword');
        if ($newPassword != $rePassword) {
            showError($jRePassword, 'repassword-match');
            $isValid = false;
        } else {
            hideError($jRePassword, 'repassword-match');
        }
    }

    return $isValid;
}

