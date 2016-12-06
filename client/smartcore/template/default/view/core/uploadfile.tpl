<style>
    .progress
    {
        width:100%;

    }
    .bar {
        height: 18px;
        background: green;
        text-align:center;
    }
</style>
<input id="fileupload" class="file-input" type="file" name="files[]"  multiple value="Chon file">
<div class="progress" id="progress'+t+'"><div class="bar" style="width: 0%;"></div></div>
<div id="listfile"></div>
<script type="application/javascript">
    $(function () {
        $('#fileupload').fileupload({
            dataType: 'json',
            url: "?route=common/uploadfile&folder=<?php echo $folder?>",
            done: function (e, data) {

                resetProgressBar();
                $("#<?php echo $_GET['eid']?>").val("<?php echo 'upload/'.$folder?>/"+data.files[0].name);
                $("#lbl<?php echo $_GET['eid']?>").html("<?php echo 'upload/'.$folder?>/"+data.files[0].name);
                $("#img<?php echo $_GET['eid']?>").attr('src',"<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo 'upload/'.$folder?>/"+data.files[0].name);
                $('#modal-select-file').modal('hide');
            },
            progressall: function (e, data) {
                //showProgress(cur,e, data)
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('.bar').html(progress+"%");
                $('.progress .bar').css(
                        'width',
                        progress + '%'
                );
            }
        });
    });
    function resetProgressBar()
    {
        $('.bar').html('');
        $('.progress .bar').css(
                'width',0
        );
    }
    function showProgress(id,e, data)
    {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress'+cur+' .bar').css(
                'width',
                progress + '%'
        );
    }
    $(document).ready(function(){
        $('#listfile').load("?route=core/uploadfile/getList&folder=<?php echo $folder?>",function(){
            $(document).ajaxComplete(function(){
                $('.btnSelectFile').click(function(){
                    $("#<?php echo $_GET['eid']?>").val($(this).attr('filepath'));
                    $("#lbl<?php echo $_GET['eid']?>").html($(this).attr('filepath'));
                    $("#img<?php echo $_GET['eid']?>").attr('src',"<?php echo DIR_USERIMAGE ?>autosize-0x64/"+$(this).attr('filepath'));
                    $('#modal-select-file').modal('hide');
                });
                $('.btnDeleteFile').click(function(){
                    $.post("?route=core/uploadfile/delFile",{
                        filepath:$(this).attr('filepath')
                    },function(data){
                        if(data == 'true')
                        {
                            $('#listfile').load("?route=core/uploadfile/getList&folder=<?php echo $folder?>");
                        }
                    });
                });
            });
        });
    });
</script>