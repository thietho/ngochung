<h1 class="title">Kích hoạt tài khoản</h1>
<div>

    <p>Mã kích hoạt đã giử vào email của bạn!</p>
</div>
<div>
	<form id="frmActive" method="post">
    	<div id="error" class="ben-error" style="display:none"></div>
    	<table>
        	<tr>
            	<td class="ben-right"><label>Tên đăng nhập</label></td>
                <td><input type="text" id="username" name="username" class="form-control" size="40"></td>
            </tr>
            <tr>
            	<td class="ben-right"><label>Mã kích hoạt</label></td>
                <td><input type="text" id="activecode" name="activecode" class="form-control" size="40"></td>
            </tr>
           
            <tr>
            	<td class="ben-right"></td>
                <td>
                	<input type="button" id="btnActive" name="btnActive" class="btn form-control" value="Kích hoạt">
                    
                </td>
            </tr>
        </table>
    </form>
</div>
<div class="clearer">&nbsp;</div>
<script language="javascript">
$("#btnActive").click(function(){
    showLoading();
	
	$.get("<?php echo HTTP_SERVER?>?route=addon/active/active", $("#frmActive").serialize(),
		function(data){
            endLoading();
			if(data == "true")
			{
				alert("Bạn đã kích hoạt tài khoản thành công!");
				window.location = "<?php echo @$this->document->createLink('login')?>";
			}
			else
			{
				
				$('#error').html(data).show('slow');
				
				
			}

		}
	);					   
});
</script>