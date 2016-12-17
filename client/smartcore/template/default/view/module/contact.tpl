<h1 class="title">
    <?php echo $sitemap['sitemapname']?>
</h1>
<div class="elife-editor">
    <?php echo $sitemap['description']?>
</div>
<form id="frmContact">
    <div class="form-group">
        <div>
            <label>Họ tên</label>
        </div>
        <div>
            <input type="text" class="form-control" name="fullname" placeholder="Họ tên">
        </div>
    </div>
    <div class="form-group">
        <div>
            <label>Email</label>
        </div>
        <div>
            <input type="text" class="form-control" name="email" placeholder="Email">
        </div>
    </div>
    <div class="form-group">
        <div>
            <label>Điện thoại</label>
        </div>
        <div>
            <input type="text" class="form-control" name="phone" placeholder="Điện thoại">
        </div>
    </div>
    <div class="form-group">
        <div>
            <label>Lời nhắn</label>
        </div>
        <div>
            <textarea class="form-control" name="desscriptions" placeholder="Lời nhắn"></textarea>
        </div>
    </div>

    <div>
        <button type="button" class="btn form-control" id="btnSend">Gửi</button>
        <button type="reset" class="btn form-control">Làm lại</button>
    </div>

</form>
<script type="application/javascript">
$('#frmContact #btnSend').click(function () {
    showLoading();
    $.post("<?php echo HTTP_SERVER?>?route=module/contact/send",$('#frmContact').serialize(), function (data) {
        endLoading();
        var obj = $.parseJSON(data)
        if(obj.errorstext != '')
        {
            toastr.error(obj.errorstext,"Lỗi");
        }
        else
        {
            toastr.options.onHidden = function() { window.location = '<?php echo HTTP_SERVER?>'};
            toastr.success('Bạn đã gửi thông tin liên hệ thành công!', 'Thành công', {timeOut: 1000});
        }
    });
});
</script>