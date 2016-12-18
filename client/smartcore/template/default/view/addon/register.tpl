<h1 class="title">Đăng ký thành viên</h1>
<div>

    <div id="error" class="ben-error" style="display:none"></div>
	<form id="frmRegister" method="post">
    	
    	<table class="ben-form">
        	<tr>
            	<td><label>Tên đăng nhập</label></td>
                <td><input type="text" id="username" name="username" class="form-control" size="40"></td>
            </tr>
            <tr>
            	<td><label>Mật khẩu</label></td>
                <td><input type="password" id="password" name="password" class="form-control" size="40"></td>
            </tr>
            <tr>
            	<td><label>Xác nhận mật khẩu</label></td>
                <td><input type="password" id="confirmpassword" name="confirmpassword" class="form-control" size="40"></td>
            </tr>
            <tr>
            	<td><label>Họ và tên</label></td>
                <td><input type="text" id="fullname" name="fullname" class="form-control" size="40"></td>
            </tr>
            <tr>
            	<td><label>Email</label></td>
                <td><input type="text" id="email" name="email" class="form-control" size="40"></td>
            </tr>
            <tr>
            	<td><label>Điện thoại</label></td>
                <td><input type="text" id="phone" name="phone" class="form-control" size="40"></td>
            </tr>

            
            <tr>
            	<td></td>
                <td>
                	<div class="ben-dieukhoan">
                    	<?php echo @$rules?>
                	</div>
                </td>
            </tr>
            <tr>
            	<td></td>
                <td>
                	<input type="checkbox" id="chkaccept" name="chkaccept" value="accept" class="form-control">
                    Tôi đồng ý với điều khoản trên
                </td>
            </tr>
            <tr>
            	<td></td>
                <td>
                	<input type="button" id="btnRegister" name="btnRegister" class="btn form-control" value="Đăng ký">
                </td>
            </tr>
        </table>
    </form>
</div>
<div class="clearer">&nbsp;</div>
<script language="javascript">
$("#btnRegister").click(function(){
	showLoading();
	
	$.post("<?php echo HTTP_SERVER?>?route=addon/register/save", $("#frmRegister").serialize(),
		function(data){
			if(data == "true")
			{
				$('#error').html("Bạn đã đăng ký thành công! Mã kích hoạt tài khoản đã đươc gửi tới email của bạn! <a href='<?php echo @$this->document->createLink('active')?>'>Kích hoạt tài khoản click vào đây</a>").show('slow');
				$("#frmRegister").hide();

			}
			else
			{

                toastr.error(data,"Lỗi");
				
			}
			endLoading();
		}
	);					   
});
</script>