var $languages = JSON.parse("<?php echo json_encode($languages) ?>");
var $product_images = JSON.parse("<?php echo json_encode($product_images) ?>");

$(document).ready(function () {
    for (var $languageid in $languages) {
        setCKEditorType('summary' + $languageid, 0, '150px');
        setCKEditorType('description' + $languageid, 0, '500px');
        setCKEditorType('seo_content' + $languageid, 0, '150px');
    }

    $(".currency").inputmask();

    createSeo();

    //add subimages
    if ($product_images.length > 0) {
        for (var $index in $product_images) {
            if ($product_images.hasOwnProperty($index)) {
                $('#subImageList').append(subImage.addImageSub($product_images[$index]['image'], $product_images[$index]['sortorder']));
            }
        }
    }
});


function createSeo() {
    for (var $languageid in $languages) {
        var jSeoURL = $("#seo_url_" + $languageid);
        if (jSeoURL.val().trim().length == 0) {
            $("#product_name_" + $languageid).on('change keyup paste', function () {
                var name = $(this).val();
                var $language_id = $(this).attr('rel');
                var jSeoURL = $("#seo_url_" + $language_id);
                name = escapeUnicode(name);
                name = name.toLowerCase(); // lowercase
                name = name.replace(/^\s+|\s+$/g, ''); // remove leading and trailing whitespaces
                name = name.replace(/\s+/g, '-'); // convert (continuous) whitespaces to one -
                name = name.replace(/[^a-z0-9-]/g, ''); // remove everything that is not [a-z] or -
                jSeoURL.val(name);
            });
        }
    }
}


//----------------------------------------------------------------------------------------------------------------------
//add subimage
function addSubImage() {
    elifeupload_multi('subimage', 'subImageList');
}

//class SubImage
function SubImage() {
    this.index = 0;

    this.addImageSub = function (path, sortorder) {
        var img = "<div class='image_item'><img src='images/resize-200x200/" + path + "'/><input type='hidden' name='product_image[" + subImage.index + "][image]'  value='" + path + "' /><input type='hidden' name='product_image[" + subImage.index + "][sortorder]'  value='" + sortorder + "' /></div>";
        var control = '<a class="btndeleteimage btn btn-danger" path="'+ path +'"><i class="fa fa-remove"></i></a>';

        var row = '<div class="subimage-item col-md-4 col-sm-12">';
        row += '<div class="text-center">' + img + '</div>';
        row += '<div class="subimage-item-control">' + control + '</div>';
        row += '</div>';

        subImage.index++;
        return row;
    }

}
var subImage = new SubImage();

//delete subimage
$('.btndeleteimage').live('click', function () {
    var width = $(window).width();
    if(width > 1024) {
        $(this).parent().parent().remove();
    } else {
        if(confirm("<?php echo $lang_text_confirm_delete ?>")) {
            var $owner = $(this);
            var url = "<?php echo IMAGE_SERVER ?>file_<?php echo SKINID ?>/file/quickupload.php?file=";
            var path = $(this).attr('path');

            var pieces = path.split("/");
            var filename = pieces[pieces.length-1];
            var url_remove = url + filename;
            showloading();
            $.ajax({
                url: url_remove,
                type: 'DELETE',
                success: function(result) {
                    endloading();
                    var response = JSON.parse(result);
                    if(response[filename] == true) {
                        $owner.parent().parent().remove();
                    }
                },
                fail: function() {
                    endloading();
                }
            });
        }
    }
});
//----------------------------------------------------------------------------------------------------------------------


function save() {
    var jErrorMessage = $('.error-message');
    jErrorMessage.html('');
    jErrorMessage.hide();

    for (var x in $languages) {
        var pageValue;
        var summary = CKEDITOR.instances['summary' + x];
        pageValue = summary.getData();
        $('textarea#summary' + x).val(pageValue);

        var description = CKEDITOR.instances['description' + x];
        pageValue = description.getData();
        $('textarea#description' + x).val(pageValue);

        var seo_content = CKEDITOR.instances['seo_content' + x];
        pageValue = seo_content.getData();
        $('textarea#seo_content' + x).val(pageValue);
    }

    showloading();
    $.post("?route=module/product/save", $("#frmform").serialize(), function ($data) {
        endloading();

        var $response = JSON.parse($data);
        var $errors = $response['errors'];
        if ($response['status'] == 'failed') {
            var $error_panel = '<div class="alert alert-danger" role="alert">';
            $error_panel += '<a class="close" title="close" aria-label="close" data-dismiss="alert" href="#">×</a>';
            for (var $error_code in $errors) {
                if ($errors.hasOwnProperty($error_code)) {
                    $error_panel += '<p>-&nbsp;' + $errors[$error_code] + '</p>';
                }
            }
            $error_panel += '</div>';
            jErrorMessage.append($error_panel);
            jErrorMessage.show();

            $("html, body").animate({scrollTop: 0}, "fast");
            toastr.error('<div class="toast-title">' + $response['title'] + '</div><div class="toast-messsage">' + $response['message'] + '</div>');

        } else {
            toastr.success('<div class="toast-title">' + $response['title'] + '</div><div class="toast-messsage">' + $response['message'] + '</div>');

            var $productid = $('#productid').val().trim();
            var $sitemapidold = $('#sitemapidold').val();
            var $sitemapid = $('#sitemapid').val();
            if ($productid == "") {
                window.location.href = "?route=module/product/&sitemapid=" + $sitemapid + "&page=1";
            } else {
                if ($sitemapid != $sitemapidold) {
                    window.location.href = $('#btnCancel').attr('href');
                } else {
                    var $modelold = $('#modelold').val();
                    var $model = $('#model').val();
                    if ($modelold != $model) {
                        window.location.href = $('#btnCancel').attr('href');
                    }
                }
            }

        }
    });

}
