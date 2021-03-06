function confirmDeleteList() {
    showSimpleModal("<?php echo $lang_text_delete_data ?>", "<?php echo $lang_text_confirm_delete ?>", "sitemap_delete()", "<?php echo $lang_text_cancel?>", "<?php echo $lang_text_delete ?>");
}

function sitemap_delete() {
    closeSimpleModal();

    showloading();
    var jErrorMessage = $('.error-message');

    var url = "?route=elife/sitemap/deletelist";
    $.post(url, $('#formlist').serialize(), function ($data) {
        var $response = JSON.parse($data);
        var $errors = $response['errors'];
        if($response['status'] == 'failed') {
            endloading();

            jErrorMessage.html('');
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
            window.location.reload();
        }
    });
}


function updateList() {
    showloading();
    var url = "?route=elife/sitemap/updatelist";
    $.post(url, $('#formlist').serialize(), function ($data) {
        var $response = JSON.parse($data);
        toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
        window.location.reload();
    });
}