var $jLangugeKey = $('#languagekey');
var $jVN = $('#vn');
var $jEN = $('#en');
var $jRU = $('#ru');
var $jKH = $('#kh');
var $jCN = $('#cn');
var $jFR = $('#fr');
var $jJP = $('#jp');

$(document).ready(function(){
    $jLangugeKey.focus();
});

function save() {
    //validate form
    if(validateForm()) {
        showloading();
        $.post("?route=elife/dictionary/save", $("#frmLanguage").serialize(), function($data) {
            endloading();
            var $response = JSON.parse($data);
            var $errors = $response['errors'];
            if($response['status'] == 'failed') {
                for (var $error_code in $errors) {
                    if ($errors.hasOwnProperty($error_code)) {
                        if($error_code == 'languagekey') {
                            showError($jSitename);
                        }
                        if($error_code == 'vn') {
                            showError($jVN);
                        }
                        if($error_code == 'en') {
                            showError($jEN);
                        }
                        if($error_code == 'ru') {
                            showError($jRU);
                        }
                        if($error_code == 'kh') {
                            showError($jKH);
                        }
                        if($error_code == 'cn') {
                            showError($jCN);
                        }
                        if($error_code == 'fr') {
                            showError($jFR);
                        }
                        if($error_code == 'jp') {
                            showError($jJP);
                        }
                    }
                }
                $("html, body").animate({ scrollTop: 0 }, "fast");
                toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

            } else {
                toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                if($response['updatetype'] == 'insert') {
                    window.location.href = "?route=elife/dictionary";
                }
            }


        });
    }
}

function validateForm() {
    var $isValid = true;
    var $languageKey = $jLangugeKey.val().trim();
    var $vn = $jVN.val().trim();
    var $en = $jEN.val().trim();
    var $ru = $jRU.val().trim();
    var $kh = $jKH.val().trim();
    var $cn = $jCN.val().trim();
    var $fr = $jFR.val().trim();
    var $jp = $jJP.val().trim();

    if($languageKey.length == 0) {
        showError($jLangugeKey);
        $isValid = false;
    } else {
        hideError($jLangugeKey);
    }

    if($vn.length == 0) {
        showError($jVN);
        $isValid = false;
    } else {
        hideError($jVN);
    }

    if($en.length == 0) {
        showError($jEN);
        $isValid = false;
    } else {
        hideError($jEN);
    }

    if($ru.length == 0) {
        showError($jRU);
        $isValid = false;
    } else {
        hideError($jRU);
    }

    if($kh.length == 0) {
        showError($jKH);
        $isValid = false;
    } else {
        hideError($jKH);
    }

    if($cn.length == 0) {
        showError($jCN);
        $isValid = false;
    } else {
        hideError($jCN);
    }

    if($fr.length == 0) {
        showError($jFR);
        $isValid = false;
    } else {
        hideError($jFR);
    }

    if($jp.length == 0) {
        showError($jJP);
        $isValid = false;
    } else {
        hideError($jJP);
    }

    return $isValid;
}


function showError($jSelector) {
    $jSelector.parent().addClass('has-error');
    $jSelector.siblings(".help-block").css('display', 'inline-block');
}

function hideError($jSelector) {
    $jSelector.parent().removeClass('has-error');
    $jSelector.siblings(".help-block").css('display', 'none');
}
