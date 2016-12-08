<link href="<?php echo DIR_CSS?>jquery.nestable.css" rel="stylesheet">
<script src="<?php echo DIR_JS?>jquery.nestable.js"></script>
<div class="app-heading app-heading-bordered app-heading-page">
    <div class="icon icon-lg"><span class="icon-clipboard-text"></span></div>
    <div class="title">
        <h2>Sitemap management list</h2>
        <p>Client Sitemap management</p>
    </div>
</div>
<div class="container">


    <!-- START BLOCk -->
    <div class="block">
        <div class="row">
            <div class="col-md-12">

                <div class="pull-left margin-bottom-20">
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=core/sitemap/insert'" type="button" class="btn btn-default btn-bg btn-success"><span class="fa fa-plus"></span> Add sitemap</button>
                </div>
                <button id="btnEditPosition" name="btnEditPosition" class="btn btn-default btn-bg btn-success"><span class="fa fa-sort"></span> Sắp sếp thứ tự</button>
                <button id="btnUpdateTree" name="btnUpdateTree" class="btn btn-default btn-bg btn-success" style="display:none" onclick="updateTree()"><span class="fa fa-check-square-o"> Lưu</button>

                <div class="clear-mobile"></div>
                <div class="dataTable_wrapper">
                    <form action="" method="post" id="listitem" name="listitem">
                        <div class="dd" id="nestable">
                            <ol class="dd-list">
                                <?php echo @$tree?>
                            </ol>
                        </div>
                    </form>
                </div>

            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<!-- END PAGE CONTAINER -->


<textarea id="nestable-output" style="display: none"></textarea>
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Lựa chọn phương thức</h4>
            </div>
            <div class="modal-body">
                <p>Some text in the modal.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnCatManagement">Quản lý nội dung</button>
                <button type="button" class="btn btn-default" id="btnCatEdit">Chỉnh sửa</button>
                <button type="button" class="btn btn-default" id="btnCatAddChild">Thêm con</button>

                <button type="button" class="btn btn-default" id="btnCatDel">Xóa</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script language="javascript">
    var updateOutput = function(e)
    {
        var list   = e.length ? e : $(e.target),output = list.data('output');
        if (window.JSON) {
            $('#nestable-output').val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
        } else {
            $('#nestable-output').val('JSON browser support required for this demo.');
        }
    };
    $(document).ready(function(e) {
        /* $('#nestable').nestable({

         })
         .on('change', updateOutput);*/
        $('[data-toggle="popover"]').popover();
    });
    $('.hl-cat').click(function(e) {
        $('.modal-body').html($(this).attr('sitemapname'));
        switch($(this).attr('module'))
        {
            case "module/product":
            case "module/news":
                $('#btnCatManagement').attr('sitemapid',$(this).attr('id'));
                $('#btnCatManagement').attr('module',$(this).attr('module'));
                $('#btnCatManagement').removeClass('hide');
                break;
            default :
                $('#btnCatManagement').addClass('hide');
        }
        $('#btnCatEdit').attr('sitemapid',$(this).attr('id'));
        $('#btnCatAddChild').attr('sitemapid',$(this).attr('sitemapid'));
        $('#btnCatEditConten').attr('sitemapid',$(this).attr('sitemapid'));
        $('#btnCatDel').attr('sitemapid',$(this).attr('sitemapid'));
    });
    $('#btnCatManagement').click(function(e) {
        window.location = '?route='+$(this).attr('module')+'&sitemapid='+ $(this).attr('sitemapid');
    });
    $('#btnCatEdit').click(function(e) {
        window.location = '?route=core/sitemap/update&sitemapid='+ $(this).attr('sitemapid');
    });
    $('#btnCatAddChild').click(function(e) {
        window.location = '?route=core/sitemap/insert&parent='+ $(this).attr('sitemapid');
    });
    $('#btnCatEditConten').click(function(e) {
        window.location = '?route=module/information&sitemapid=cat'+ $(this).attr('sitemapid');
    });
    $('#btnCatDel').click(function(e) {

        deleteitem($(this).attr('sitemapid'));
    });
    $('#btnEditPosition').click(function(e) {
        $('#nestable').nestable({

        })
                .on('change', updateOutput);
        $('#btnUpdateTree').show();
        $('#btnEditPosition').hide();
    });
    function deleteitem(sitemapid)
    {
        var answer = confirm("Bạn có muốn xoa không?")
        if (answer)
        {
            $.get("?route=core/sitemap/delete&sitemapid="+sitemapid,

                    function(data)
                    {
                        if(data!="")
                        {
                            alert(data)
                            window.location.reload();
                        }
                    }
            );
        }
    }

    function updateTree()
    {
        showLoading();

        $.post("?route=core/sitemap/updateTree",
                {data:encodeURI($('#nestable-output').val())},
                function(data)
                {
                    endLoading();
                    if(data!="")
                    {
                        $('.hl-message').html('<h1>Lưu thành công!!!<h1>');

                    }
                    window.location.reload();

                }

        );

    }

</script>