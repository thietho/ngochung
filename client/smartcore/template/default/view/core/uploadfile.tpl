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
    $(function () {
        $('#fileupload').fileupload({
            dataType: 'json',
            url: "?route=common/uploadfile&folder=<?php echo $folder?>",
            done: function (e, data) {

                resetProgressBar();
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

    $(document).ready(function(){
        loadListFile();
    });
    function loadListFile()
    {
        $('#listfile').load("?route=core/uploadfile/getList&folder=<?php echo $folder?>&type=<?php echo $type?>",function(){
            var fbbtnSelectFile = false;

            $(document).ajaxComplete(function(){

                if(fbbtnSelectFile == false)
                {
                    fbbtnSelectFile = true;
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
                            $('#listfile').load("?route=core/uploadfile/getList&folder=<?php echo $folder?>");
                        }
                    });
                });
            });
        });
    }

</script>