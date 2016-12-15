<h1 class="title">
    <?php echo $sitemap['sitemapname']?>
</h1>
<div class="elife-editor">
    <?php echo $sitemap['description']?>
</div>
<form id="frmContact">
    <table class="table-form">
        <tr>
            <td width="10%"><label>Họ tên</label></td>
            <td><input type="text" class="form-control" name="fullname" placeholder="Họ tên"></td>
        </tr>
        <tr>
            <td><label>Email</label></td>
            <td><input type="text" class="form-control" name="email" placeholder="Email"></td>
        </tr>
        <tr>
            <td><label>Điện thoại</label></td>
            <td><input type="text" class="form-control" name="phone" placeholder="Điện thoại"></td>
        </tr>
        <tr>
            <td><label>Lời nhắn</label></td>
            <td><textarea class="form-control" name="desscriptions" placeholder="Lời nhắn"></textarea></td>
        </tr>
    </table>
    <div class="elife-center">
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