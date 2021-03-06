var $languages = JSON.parse('<?php echo json_encode($languages) ?>');

$(document).ready(function(){
    for(var $languageid in $languages){
        setCKEditorType('summary' + $languageid, 0, '450px');
    }

    $('#status-date-control').datetimepicker({
        pickTime: false
    });
});

function tagItemClick(element, language) {
    var value_textbox;
    var jCurrentTag = $("#tag"+language);
    if (element.checked == true) {
        var currentTag = jCurrentTag.val();
        if(currentTag == "")
            value_textbox = element.value.trim() + ',';
        else {
            if (currentTag.slice(-1) != ",") {
                currentTag += ",";
            }
            value_textbox = currentTag + element.value.trim() + ',';
        }
        jCurrentTag.val(value_textbox);
    }
    else{
        value_textbox = jCurrentTag.val();
        var arr = value_textbox.split(',');
        for ( var i = 0; i < arr.length; i++ ) {
            if(element.value.trim() == arr[i].trim())
            {
                arr = jQuery.grep(arr, function(value){return value != arr[i]});
            }
        }
        jCurrentTag.val(arr);
    }
}


function save() {
    var jErrorMessage = $('.error-message');
    jErrorMessage.html('');
    jErrorMessage.hide();

    for(var x in $languages){
        var pageValue;
        var summary = CKEDITOR.instances['summary'+x] ;
        pageValue = summary.getData();
        $('textarea#summary'+x).val(pageValue);
    }

    showloading();
    $.post("?route=module/faq/save", $("#frmform").serialize(), function($data) {
        endloading();

        var $response = JSON.parse($data);
        var $errors = $response['errors'];
        if($response['status'] == 'failed') {
            var $error_panel = '<div class="alert alert-danger" role="alert">';
            $error_panel += '<a class="close" title="close" aria-label="close" data-dismiss="alert" href="#">×</a>';
            for (var $error_code in $errors) {
                if ($errors.hasOwnProperty($error_code)) {
                    $error_panel += '<p>-&nbsp;'+ $errors[$error_code] +'</p>';
                }
            }
            $error_panel += '</div>';
            jErrorMessage.append($error_panel);
            jErrorMessage.show();

            $("html, body").animate({ scrollTop: 0 }, "fast");
            toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

        } else {
            toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

            var $mediaid = $('#mediaid').val();
            var $sitemapidold = $('#sitemapidold').val();
            var $sitemapid = $('#sitemapid').val();
            if("" == $mediaid) {
                window.location.href = "?route=module/faq&sitemapid=" + $sitemapid;

            } else {
                if($sitemapid != $sitemapidold) {
                    window.location.href = $('#btnCancel').attr('href');
                }
            }

        }
    });
}



