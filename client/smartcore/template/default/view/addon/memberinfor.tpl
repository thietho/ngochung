<h1 class="title">
    Cập nhật thông tin cá nhân
</h1>

<style>
.text
{
	cursor:pointer;
}

.date
{
	cursor:pointer;
}
</style>
<div>
	<form id="frmRegister" method="post">
    	<div id="error" class="ben-error" style="display:none"></div>
    	<table class="ben-table">
        	<tr>
            	<td><label>Tên đăng nhập</label></td>
                <td><?php echo @$member['username']?></td>
            </tr>
            
            <tr>
            	<td><label>Họ và tên</label></td>
                <td id="fullname" class="text"><?php echo @$member['fullname']?></td>
            </tr>
            <tr>
            	<td><label>Email</label></td>
                <td id="email" class="text"><?php echo @$member['email']?></td>
            </tr>

            <tr>
            	<td><label>Điện thoại</label></td>
                <td id="phone" class="text"><?php echo @$member['phone']?></td>
            </tr>
            
            
            
        </table>
    </form>
</div>
<div class="clearer">&nbsp;</div>

<script type="text/javascript" charset="utf-8">
var DIR_UPLOADPHOTO = "<?php echo @$DIR_UPLOADPHOTO?>";
var isedit = true
function editText(eid)
{
	if(isedit)
	{
		var text = $("#"+eid).html();
		var html = '<input type="text" class="ben-textbox" id="text-'+eid+'" value="'+text+'">';
		html+=' <input id="btnSaveInfor" type="button" class="ben-button" value="Save" onclick="saveInfor(\''+eid+'\')">';
		
						
		$("#"+eid).html(html);
		$("#"+eid).unbind('click');
		
	}
	
}

$(".text").click(function(){
	
	 editText(this.id);

});

function editDate(eid)
{
	if(isedit)
	{
		var text = $("#"+eid).html();
		var html = '<input type="text" class="ben-textbox" id="text-'+eid+'" value="'+text+'">';
		html+=' <input id="btnSaveInfor" type="button" class="ben-button" value="Save" onclick="saveDate(\''+eid+'\')">';
		
		$("#"+eid).html(html);
		$("#text-"+eid).datepicker({
			changeMonth: true,
			changeYear: true,
			dateFormat: 'dd-mm-yy'
		});
		$("#"+eid).unbind('click');
		
	}
	
}
$(".date").click(function(){
	
	 editDate(this.id);

});
function saveInfor(eid)
{
	isedit = false;
	$.post("<?php echo HTTP_SERVER?>?route=addon/memberinfor/saveInfor", { userid: "<?php echo @$member['username']?>", colname: eid , value: $("#text-"+eid).val()},
		function(data){
			if(data == "true")
			{
				
			}
			
		}
	);
	$("#"+eid).html($("#text-"+eid).val());
	$("#"+eid).bind('click', function() {
		 editText(this.id);
		 isedit = true;
	});
}
function saveDate(eid)
{
	isedit = false;
	$.post("<?php echo HTTP_SERVER?>?route=addon/memberinfor/saveDate", { userid: "<?php echo @$member['username']?>", colname: eid , value: $("#text-"+eid).val()},
		function(data){
			if(data == "true")
			{
				
			}
			
		}
	);
	$("#"+eid).html($("#text-"+eid).val());
	$("#"+eid).bind('click', function() {
		 editDate(this.id);
		 isedit = true;
	});
}

function callbackfunc(objfile)
{
	$.post("<?php echo HTTP_SERVER?>?route=addon/memberinfor/saveAvatar", { userid: "<?php echo @$member['username']?>", imageid: objfile.imageid , imagepath: objfile.imagepath},
		function(data){
			if(data == "true")
			{
				
			}
			
		}
	);
}

</script>