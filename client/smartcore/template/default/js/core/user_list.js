function confirmDeleteList() {
    var $param = $("#formlist").serialize();
    if($param.length == 0) {
        toastr.error('<div class="toast-title">' + '<?php echo $lang_text_notification ?>' + '</div><div class="toast-messsage">' + '<?php echo $lang_text_select_user_item ?>' + '</div>');
    } else {
        showSimpleModal("<?php echo $lang_text_delete_data ?>", "<?php echo $lang_text_confirm_delete ?>", "deleteUser()", "<?php echo $lang_text_cancel?>", "<?php echo $lang_text_delete ?>");
    }

}

function deleteUser() {
    closeSimpleModal();

    showloading();
    $.post("?route=core/user/delete", $("#formlist").serialize(),
        function ($data) {
            endloading();
            var $response = JSON.parse($data);
            var $errors = $response['errors'];
            if($response['status'] == 'failed') {
                $("html, body").animate({ scrollTop: 0 }, "fast");
                toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

            } else {
                toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                window.location.reload();
            }
        }
    );

}

function activeUser($userid) {
    showloading();
    $.post("?route=core/user/active", {userid: $userid}, function($data) {
        endloading();
        var $response = JSON.parse($data);
        var $errors = $response['errors'];
        if($response['status'] == 'failed') {
            $("html, body").animate({ scrollTop: 0 }, "fast");
            toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

        } else {
            toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
            window.location.reload();
        }
    });
}