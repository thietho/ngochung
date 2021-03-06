var $languages = JSON.parse('<?php echo json_encode($languages) ?>');

$(document).ready(function(){
    for(var $languageid in $languages){
        setCKEditorType('summary' + $languageid, 0, '150px');
        setCKEditorType('description' + $languageid, 0, '500px');
        setCKEditorType('seo_content' + $languageid, 0, '150px');
    }

    $('.input-date').datetimepicker({
        pickTime: false
    });
});


function save() {
    var jErrorMessage = $('.error-message');
    jErrorMessage.html('');
    jErrorMessage.hide();

    for(var x in $languages){
        var pageValue;
        var summary = CKEDITOR.instances['summary'+x] ;
        pageValue = summary.getData();
        $('textarea#summary'+x).val(pageValue);

        var description = CKEDITOR.instances['description'+x] ;
        pageValue = description.getData();
        $('textarea#description'+x).val(pageValue);

        var seo_content = CKEDITOR.instances['seo_content'+x] ;
        pageValue = seo_content.getData();
        $('textarea#seo_content'+x).val(pageValue);
    }

    showloading();
    $.post("?route=module/information/save", $("#frmform").serialize(), function($data) {
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
            jErrorMessage.html('');
            jErrorMessage.hide();

            toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
        }
    });

}
