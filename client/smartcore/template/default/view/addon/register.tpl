<h1 class="title">
    Đăng ký
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
        <div class="form-group">
            <div>
                <label>Nhập lại Mật khẩu</label>
            </div>
            <div>
                <input type="password" class="form-control" id="confirmpassword" name="confirmpassword">
            </div>
        </div>
        <div class="form-group">
            <div>
                <label>Họ tên</label>
            </div>
            <div>
                <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Họ tên">
            </div>
        </div>
        <div class="form-group">
            <div>
                <label>Email</label>
            </div>
            <div>
                <input type="text" class="form-control" id="email" name="email" placeholder="Email">
            </div>
        </div>
        <div class="form-group">
            <div>
                <label>Điện thoại</label>
            </div>
            <div>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="Điện thoại">
            </div>
        </div>
        <div>
            <button type="button" class="btn form-control" id="btnRegister">Đăng nhập</button>
            <button type="reset" class="btn form-control">Làm lại</button>
        </div>

    </form>
</div>
<script type="application/javascript">
    $('#btnRegister').click(function(){
        window.location = "<?php echo $this->document->createLink('register')?>";
    });
</script>