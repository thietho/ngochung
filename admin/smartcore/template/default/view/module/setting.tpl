
<div class="container container-boxed">
    <!-- START BLOCk -->
    <div class="block">
        <div class="row margin-top-15">

            <form class="form-horizontal" id="frmSetting">
                <input type="hidden" name="id" id="id" value="<?php echo $item['id']?>">
                <div class="col-md-6 col-md-offset-3">

                    <div class="form-group">
                        <label class="col-md-3 control-label">Banner</label>
                        <div class="col-md-9">
                            <input type="hidden" name="banner" id="banner" value="<?php echo $item['banner']?>">


                            <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSelectImage">Select</button>
                            <div id="listbanner"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Site Map Home</label>
                        <div class="col-md-9">

                            <select id="sitemaps" class="form-control">
                                <?php foreach($sitemaps as $sitemap){ ?>
                                <option value="<?php echo $sitemap['id']?>"><?php echo $this->string->setLoopStr("---",$sitemap['level'])?><?php echo $sitemap['sitemapname']?></option>
                                <?php } ?>
                            </select>
                            <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnAddSiteMapHome">Add</button>
                            <ul id="listsitemaps">
                                <?php foreach($sitemaphome['listsitemap'] as $sitemap){ ?>
                                <li><input type="hidden" name="sitemaphome[]" value="<?php $sitemap['id']?>"><?php echo $sitemap['sitemapname']?><button type="button" class="btn btn-sm btn-default btn-icon btn-danger margin-0 margin-right-5 btnDelSitemapHome"><span class="fa fa-trash"></span></button></li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>


                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3 margin-top-30">
                <div class="text-center">
                    <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSaveSetting"><span class="fa fa-save"></span> Save</button>
                    <button onclick="window.location.reload()" type="button" class="btn btn-sm btn-default btn-bg"><span class="fa fa-backward"></span> Cancel</button>
                </div>
            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<script type="application/javascript">

<?php foreach($banner['listfile'] as $filepath){ ?>
    addItemFile('listbanner',"<?php echo $filepath?>");
<?php }?>
    <?php if($_GET['type'] != 'popup'){ ?>
        $('#btnSaveSetting').click(function(){
            $('#frmSetting #banner').val('');
            var str = '';
            $('#listbanner .listfile').each(function(e){
                str += "["+$(this).attr('filepath')+"]";
            });
            $('#frmSetting #banner').val(str);

            showLoading();
            $.post("?route=module/setting/save",$('#frmSetting').serialize(),function(data){
                endLoading();
                var obj = $.parseJSON(data)
                if(obj.errorstext != '')
                {
                    toastr.error(obj.errorstext,"Errors");
                }
                else
                {
                    //toastr.options.onHidden = function() { window.location = '?route=module/movies' }
                    toastr.success('Movies has been save', 'Save success', {timeOut: 1000})
                }

            });
        });

    <?php } ?>
    $('#btnSelectImage').click(function(){
        $('#modal-select-file').modal();
        var folder = "banner";

        $('#modal-select-file .modal-body').load('?route=core/uploadfile&folder='+folder+"&eid=listbanner&type=multi",function(){

        });
    });
    $('#btnAddSiteMapHome').click(function(){
        var id = $('#frmSetting #sitemaps').val();
        var text = $('#sitemaps option:selected').text();
        var html = '<li><input type="hidden" name="sitemaphome[]" value="'+id+'">'+ text +'<button type="button" class="btn btn-sm btn-default btn-icon btn-danger margin-0 margin-right-5 btnDelSitemapHome"><span class="fa fa-trash"></span></button></li>'
        $('#listsitemaps').append(html);

        $('.btnDelSitemapHome').click(function(){
            $(this).parent().remove();
        });
    });
</script>
