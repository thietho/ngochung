<h1 class="title">
    Quên mật khẩu
</h1>
<div id="login" class="section">

    
	<form id="forgetpassword">
    <div class="error" style="display:none"></div>
    <div class="section-content">
    	<div class="col2 left">  	
            <div>
                <p>
                    <label for="username">Email</label><br>
                    <input type="text" class="form-control" id="email" name="email" />
                </p>
                <p>
                    <input type="button" class="btn form-control" id="btnquenmatkhau" name="btnquenmatkhau" value="Lấy lại mật khẩu"/>
            	</p>
            </div>
        </div>
        <div class="clearer">&nbsp;</div>
    </div>
    </form>
</div>
<script language="javascript">
$('#btnquenmatkhau').click(function(){
	$.post("<?php echo HTTP_SERVER?>?route=addon/forgotpassword/resetPassword", $("#forgetpassword").serialize(),function(data){
		if(data=='true')
		{
			alert("Bạn vô mail để nhận mật khẩu mới");
			window.location = '<?php echo $this->document->createLink('login')?>';
		}
		else
		{

            toastr.error(data,"Lỗi");
		}
	});
});
</script>