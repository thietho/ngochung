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
    var type = "<?php echo $type?>";
    var eid = "<?php echo $eid?>";
    $(function () {
        $('#fileupload').fileupload({
            dataType: 'json',
            url: "?route=common/uploadfile&folder=<?php echo $folder?>",
            done: function (e, data) {

                resetProgressBar();
                if(eid != '')
                    returnControl(data.files[0].name);
                else
                    loadListFile();
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
    function loadListFile()
    {
        $('#listfile').load("?route=core/uploadfile/getList&folder=<?php echo $folder?>&type=<?php echo $type?>&eid=<?php echo $eid?>",function(){
            var fbbtnSelectFile = false;

            $(document).ajaxComplete(function(){

                if(fbbtnSelectFile == false)
                {
                    fbbtnSelectFile = true;

                    $('.btnSelectFile').click(function(){
                        returnControl($(this).attr('filename'));
                    });
                    $('.btnDownloadFile').click(function(){

                        //window.location. = $(this).attr('link');
                        var a = $("<a>")
                                .attr("href", $(this).attr('link'))
                                .attr("download", $(this).attr('filename'))
                                .appendTo("body");

                        a[0].click();

                        a.remove();
                    });
                }

                $('.btnDeleteFile').click(function(){
                    $.post("?route=core/uploadfile/delFile",{
                        filepath:$(this).attr('filepath')
                    },function(data){
                        if(data == 'true')
                        {
                            $('#listfile').load("?route=core/uploadfile/getList&folder=<?php echo $folder?>&type=<?php echo $type?>&eid=<?php echo $eid?>");
                        }
                    });
                });
            });
        });
    }
    $(document).ready(function(){
        loadListFile();
    });
    function returnControl(filename)
    {
        switch(type)
        {
            case '':
                $("#<?php echo $eid?>").val("<?php echo 'upload/'.$folder?>/"+filename);
                $("#lbl<?php echo $eid?>").html("<?php echo 'upload/'.$folder?>/"+filename);
                $("#img<?php echo $eid?>").attr('src',"<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo 'upload/'.$folder?>/"+filename);
                $('#modal-select-file').modal('hide');

                break;
            case 'multi':
                var s ="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo 'upload/'.$folder?>/"+filename;
                var filepath = "<?php echo 'upload/'.$folder?>/"+ filename;
                $("#<?php echo $eid?>").append('<div class="listfile" filepath="'+ filepath +'"><img src="'+s+'"> <button type="button" class="btn btn-sm btn-default btn-icon btn-danger margin-0 margin-right-5 btnDelFileList"><span class="fa fa-trash"></span></button></div>');
                $('#modal-select-file').modal('hide');
                $('.btnDelFileList').click(function(){
                    $(this).parent().remove();
                });
                break;
            case 'editor':
                var oEditor = CKEDITOR.instances["<?php echo $eid?>"] ;
                var filepath = "<?php echo 'upload/'.$folder?>/"+ filename;
                value = "<img src='<?php echo MAIN_HTTP_SERVER.DIR_FILE?>" + filepath + "'/>";
                // Check the active editing mode.
                if (oEditor.mode == 'wysiwyg' )
                {
                    // Insert the desired HTML.
                    oEditor.insertHtml( value ) ;

                    var temp = oEditor.getData()
                    oEditor.setData( temp );
                }
                else
                    alert( 'You must be on WYSIWYG mode!' ) ;
                $('#modal-select-file').modal('hide');
                break;

        }
    }

</script>