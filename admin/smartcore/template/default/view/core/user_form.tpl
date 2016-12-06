<section>
    <div class="section-header">
        <h3 class="text-standard text-uppercase"><strong><?php echo $lang_text_user_mangament ?></strong></h3>
    </div>
    <div class="section-body">
        <div class="row">
            <div class="col-md-3 pull-right clearfix">
                <div class="panel-heading text-right">
                    
                    <button type="button" class="btn btn-primary" onclick="save()"><span class="fa fa-save"></span> <?php echo $lang_text_save ?></button>
                    <button type="button" class="btn btn-danger" onclick="window.location = '?route=core/user'"><span class="fa fa-backward"></span> <?php echo $lang_text_cancel ?></button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-head">
                        <header class="col-md-12 error-message hidden"></header>
                    </div>
                </div>
            </div>

            <form id="frmform" class="form-horizontal form-bordered" role="form" enctype="multipart/form-data" method="post" name="frm">
                <input id="userid" type="hidden" name="userid" value="<?php echo $user['userid']?>"/>

                <div class="col-md-12">
                    <div class="panel-group">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;<?php echo $lang_text_user_info ?></h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse in" style="height: auto;">
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="col-lg-2 col-md-2 col-sm-12">
                                            <label class="control-label required" for="username"><?php echo $lang_text_user_type ?></label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-12">
                                            <select id="usertypeid" name="usertypeid" class="form-control control-width-medium">
                                                <?php foreach($usertypes as $usertype) { ?>
                                                <option value="<?php echo $usertype['usertypeid'] ?>" <?php echo $user['usertypeid'] == $usertype['usertypeid'] ? 'selected' : '' ?>><?php echo $usertype['usertypename'] ?></option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-2 col-md-2 col-sm-12">
                                            <label class="control-label required" for="username"><?php echo $lang_text_user_account ?></label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-12">
                                            <input id="username" class="form-control control-width-large" type="text" name="username" maxlength="100"
                                                   value="<?php echo $user['username']?>" <?php echo isset($this->request->get['userid']) ? 'readonly' : '' ?>>
                                            <span class="username-required help-block hidden"><?php echo $lang_err_username_required ?></span>
                                            <span class="username-used help-block hidden"><?php echo $lang_err_username_used ?></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-2 col-md-2 col-sm-12">
                                            <label class="control-label required" for="fulname"><?php echo $lang_text_user_name ?></label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-12">
                                            <input id="fullname" class="form-control control-width-large" type="text" name="fullname" maxlength="100" value="<?php echo $user['fullname']?>">
                                            <span class="fullname-required help-block hidden"><?php echo $lang_err_fullname_required ?></span>
                                        </div>
                                    </div>


                                    <?php if($isInsert) { ?>
                                    <div class="form-group">
                                        <div class="col-lg-2 col-md-2 col-sm-12">
                                            <label class="control-label required" for="password"><?php echo $lang_text_user_password ?></label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-12">
                                            <input id="password" class="form-control control-width-large" type="password" name="password" maxlength="100" value="">
                                            <span class="password-required help-block hidden"><?php echo $lang_err_password_required ?></span>
                                            <span class="password-length help-block hidden"><?php echo $lang_err_password_length ?></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-2 col-md-2 col-sm-12">
                                            <label class="control-label required" for="confirmpassword"><?php echo $lang_text_user_confirmpassword ?></label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-12 confirm">
                                            <input id="confirmpassword" class="form-control control-width-large" type="password" name="confirmpassword" maxlength="100" value="">
                                            <span class="confirmpassword-required help-block hidden"><?php echo $lang_err_confirmpassword_required ?></span>
                                            <span class="confirmpassword-length help-block hidden"><?php echo $lang_err_password_length ?></span>
                                            <span class="confirmpassword-match help-block hidden"><?php echo $lang_err_password_match ?></span>
                                        </div>
                                    </div>
                                    <?php } ?>


                                    <div class="form-group">
                                        <div class="col-lg-2 col-md-2 col-sm-12">
                                            <label class="control-label required" for="email"><?php echo $lang_text_user_email ?></label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-12">
                                            <input id="email" class="form-control control-width-large text-lowercase" type="text" name="email" maxlength="100" value="<?php echo $user['email']?>">
                                            <span class="email-required help-block hidden"><?php echo $lang_err_email_required ?></span>
                                            <span class="email-invalid help-block hidden"><?php echo $lang_err_email_invalid ?></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-2 col-md-2 col-sm-12">
                                            <label class="control-label" for="phone"><?php echo $lang_text_user_phone ?></label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-12">
                                            <input id="phone" class="form-control control-width-large" type="text" name="phone" maxlength="100" value="<?php echo $user['phone']?>">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-2 col-md-2 col-sm-12">
                                            <label class="control-label" for="contactemail"><?php echo $lang_text_user_image ?></label>
                                        </div>
                                        <div class="col-lg-10 col-md-10 col-sm-12">

                                            <!--
                                            <a class="btn btn-primary btn-equal" onclick="elifeupload_one('imagepath','imagepreview')">
                                                <i class="fa fa-pencil" aria-hidden="true"></i>
                                            </a>
                                            <a class="btn btn-danger btn-equal" onclick="elifeupload_unselectimage('imagepath','imagepreview')">
                                                <i class="fa fa-refresh" aria-hidden="true"></i>
                                            </a>
                                            <div class="qu-imagepreview-thumb">
                                                <?php if($user['imagepath'] == '') { ?>
                                                <img height="64" id="imagepreview" imagetype="images/autosize-0x64" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" />
                                                <?php } else { ?>
                                                <img height="64" id="imagepreview" imagetype="images/autosize-0x64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $user['imagepath'] ?>" />
                                                <?php } ?>
                                                <input type="hidden" id="imagepath" name="imagepath" value="<?php echo $user['imagepath']?>" />
                                            </div>
                                            -->

                                            <!-- control upload image -->
                                            <input id="avatar-imagepath" type="hidden" name="imagepath" value="<?php echo $user['imagepath'] ?>" />
                                            <div class="qu-imagepreview-thumb">
                                                <p>
                                                    <a class="btn btn-primary btn-equal" onclick="elifeupload_one('avatar-imagepath','avatar-imagepreview')">
                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    </a>
                                                    <a class="btn btn-danger btn-equal" onclick="elifeupload_unselectimage('avatar-imagepath','avatar-imagepreview')">
                                                        <i class="fa fa-refresh" aria-hidden="true"></i>
                                                    </a>
                                                </p>
                                                <p>
                                                    <?php if($user['imagepath'] == '') { ?>
                                                    <img height="64" id="avatar-imagepreview" imagetype="images/autosize-0x64" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" />
                                                    <?php } else { ?>
                                                    <img height="64" id="avatar-imagepreview" imagetype="images/autosize-0x64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $user['imagepath'] ?>" />
                                                    <?php } ?>
                                                </p>
                                            </div>
                                            <div class="qu-imagepreview-thumb mobile">
                                                <p>
                                                    <a class="btn btn-primary btn-equal" onclick="quickupload_one('<?php echo SKINID ?>', 'avatar')">
                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    </a>
                                                    <a class="btn btn-danger btn-equal" onclick="quickupload_one_remove('<?php echo IMAGE_SERVER ?>file_<?php echo SKINID ?>/file/quickupload.php?file=', 'avatar')">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </a>
                                                </p>

                                                <p>
                                                    <input id="avatar-qu-oldimagepath" type="hidden" imageupload="<?php echo $user['imagepath'] ?>" value="images/autosize-0x64/<?php echo $user['imagepath'] ?>">
                                                    <?php if($user['imagepath'] == '') { ?>
                                                    <img id="avatar-qu-imagepreview" imagepath="images/autosize-0x64/upload/" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">
                                                    <?php } else { ?>
                                                    <img id="avatar-qu-imagepreview" imagepath="images/autosize-0x64/upload/" src="images/autosize-0x64/<?php echo $user['imagepath'] ?>" />
                                                    <?php } ?>
                                                    <img id="avatar-qu-imagewaiting" class="hidden" width="50" height="50" src="<?php echo DIR_IMAGE ?>loading.gif" />
                                                    <input id="avatar-qu-fileupload" type="file" style="display:none" name="files[]" data-url="<?php echo IMAGE_SERVER ?>file_<?php echo SKINID ?>/file/quickupload.php" accept="image/*; capture=camera">
                                                </p>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </form>
        </div>
    </div>
</section>
<script type="application/javascript">
    var $jUserId = $('#userid');
    var $jUsername = $('#username');
    var $jFullname = $('#fullname');
    var $jEmail = $('#email');
    var $jPassword = $('#password');
    var $jConfirmPassword = $('#confirmpassword');


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
            showLoading();
            $.post("?route=core/user/save", $("#frmform").serialize(), function($data) {
                endLoading();
                var $response = JSON.parse($data);
                var $errors = $response['errors'];
                if($response['status'] == 'failed') {
                    for (var $error_code in $errors) {
                        if ($errors.hasOwnProperty($error_code)) {
                            if($error_code == 'username') {
                                showError($jUsername, 'username-required');
                            }
                            if($error_code == 'fullname') {
                                showError($jFullname, 'fullname-required');
                            }
                            if($error_code == 'email-required') {
                                showError($jEmail, 'email-required');
                            }
                            if($error_code == 'email-invalid') {
                                showError($jEmail, 'email-invalid');
                            }

                            if($error_code == 'username-used') {
                                showError($jUsername, 'username-used');
                            }
                            if($error_code == 'password-required') {
                                showError($jPassword, 'password-required');
                            }
                            if($error_code == 'password-length') {
                                showError($jPassword, 'password-length');
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
                    //toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                    window.location.href = "?route=core/user";

                }
            });
        }
    }


    function validate_form() {
        var $isValid = true;
        var $userid = $jUserId.val().trim();
        var $username = $jUsername.val().trim();
        var $fullname = $jFullname.val().trim();
        var $email = $jEmail.val().trim();


        if(0 == $username.length) {
            showError($jUsername, 'username-required');
            $isValid = false;
        } else {
            hideError($jUsername, 'username-required');
        }

        if(0 == $fullname.length) {
            showError($jFullname, 'fullname-required');
            $isValid = false;
        } else {
            hideError($jFullname, 'fullname-required');
        }

        if(0 == $email.length) {
            showError($jEmail, 'email-required');
            $isValid = false;
        } else {
            hideError($jEmail, 'email-required');

            //check email valid
            if(!validateEmail($email)) {
                showError($jEmail, 'email-invalid');
                $isValid = false;
            } else {
                hideError($jEmail, 'email-invalid');
            }
        }

        //check for case insert new user
        if(0 == $userid.length) {
            var $password = $jPassword.val().trim();
            var $confirmpassword = $jConfirmPassword.val().trim();

            if(0 == $password.length) {
                showError($jPassword, 'password-required');
                $isValid = false;
            } else {
                hideError($jPassword, 'password-required');
            }

            if(5 > $password.length) {
                showError($jPassword, 'password-length');
                $isValid = false;
            } else {
                hideError($jPassword, 'password-length');
            }

            if(0 == $confirmpassword.length) {
                showError($jConfirmPassword, 'confirmpassword-required');
                $isValid = false;
            } else {
                hideError($jConfirmPassword, 'confirmpassword-required');
            }

            if(5 > $confirmpassword.length) {
                showError($jConfirmPassword, 'confirmpassword-length');
                $isValid = false;
            } else {
                hideError($jConfirmPassword, 'confirmpassword-length');
            }

            if($confirmpassword.length >= 5 && $password.length >= 5) {
                if($confirmpassword != $password) {
                    showError($jConfirmPassword, 'confirmpassword-match');
                    $isValid = false;
                } else {
                    hideError($jConfirmPassword, 'confirmpassword-match');
                }
            }

        }

        return $isValid;
    }



</script>