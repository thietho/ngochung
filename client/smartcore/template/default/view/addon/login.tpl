<h1 class="title">
    Đăng nhập
</h1>
<div>
	<h3>Thành viên đã đăng ký</h3>
    <p>Nếu bạn đã đăng ký với chúng tôi, hãy đăng nhập phía dưới.</p>
</div>
<div>
    <form id="frmLogin" method="post">
    	<div id="error" class="ben-error" style="display:none"></div>
        <table class="ben-form">
            <tr>
                <td><label>Tên đăng nhập</label></td>
                <td><input type="text" id="username" name="username" class="form-control"></td>
            </tr>
            <tr>
                <td><label>Mật khẩu</label></td>
                <td><input type="password" id="password" name="password" class="form-control"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <p>
                        <input type="button" class="btn form-control" id="btnLogin" value="Đăng nhập"> <a href="<?php echo @$this->document->createLink('register')?>">Đăng ký</a> <a href="<?php echo @$this->document->createLink('forgotpassword')?>">Quên mật khẩu</a>
                    </p>
                    
                    <input type="checkbox" name="remember" value="1"> Ghi nhớ
                    
                </td>
            </tr>
        </table>
    </form>
</div>
<script language="javascript">
$("#btnLogin").click(function(){
	showLoading();
	
	$.post("<?php echo HTTP_SERVER?>?route=addon/login/login", $("#frmLogin").serialize(),
		function(data){
            endLoading();
			if(data == "true")
			{
				alert("Bạn đã đăng nhập thành công!");
				if(history.length=1)
					window.location = '<?php echo HTTP_SERVER?>';
				history.go(-1);
			}
			else
			{
                toastr.error(data,"Lỗi");

				
				
			}

		}
	);					   
});
</script>