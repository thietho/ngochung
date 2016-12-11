<h1 class="title">
    <?php echo $sitemap['sitemapname']?>
</h1>
<div>
    <?php echo $sitemap['description']?>
</div>
<form id="frmContact">
    <table class="table-form">
        <tr>
            <td width="10%"><label>Họ tên</label></td>
            <td><input type="text" class="form-control" name="txt_fullname" placeholder="Họ tên"></td>
        </tr>
        <tr>
            <td><label>Email</label></td>
            <td><input type="text" class="form-control" name="txt_email" placeholder="Email"></td>
        </tr>
        <tr>
            <td><label>Điện thoại</label></td>
            <td><input type="text" class="form-control" name="txt_phone" placeholder="Điện thoại"></td>
        </tr>
        <tr>
            <td><label>Lời nhắn</label></td>
            <td><textarea class="form-control" name="txt_notes" placeholder="Lời nhắn"></textarea></td>
        </tr>
    </table>
    <button type="button" class="btn form-control">Gửi</button>
</form>