<h1 class="title">
    Đăng nhập
</h1>
<div>
    <form id="frmLogin">
        <div class="form-group">
            <div>
                <label>Tên đăng nhập</label>
            </div>
            <div>
                <input type="text" class="form-control" id="username" name="username">
            </div>
        </div>
        <div class="form-group">
            <div>
                <label>Mật khẩu</label>
            </div>
            <div>
                <input type="password" class="form-control" id="password" name="password">
            </div>
        </div>

        <div>
            <button type="button" class="btn form-control" id="btnSend">Đăng nhập</button>
            <button type="button" class="btn form-control" id="btnRegister">Đăng ký</button>
        </div>

    </form>
</div>
<script type="application/javascript">
    $('#btnRegister').click(function(){
        window.location = "<?php echo $this->document->createLink('register')?>";
    });
</script>