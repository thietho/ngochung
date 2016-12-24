
<div class="container container-boxed">
    <!-- START BLOCk -->
    <div class="block">
        <div class="row margin-top-15">

            <form class="form-horizontal" id="frmSetting">
                <input type="hidden" name="site[id]" id="id" value="<?php echo $site['id']?>">
                <input type="hidden" name="site[siteid]" id="siteid" value="<?php echo $site['siteid']?>">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Slogan</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="site[slogan]" value="<?php echo $site['slogan']?>">

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Site Name</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="site[sitename]" value="<?php echo $site['sitename']?>">

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Logo</label>
                        <div class="col-md-9">
                            <input type="hidden" name="site[logo]" id="site-logo" value="<?php echo $header['settingvalue']?>">

                            <img id="imgsite-logo" width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $site['logo']?>" />

                            <button type="button" class="btn btn-sm btn-default btn-bg btn-success btnSelectImageSite" eid="site-logo">Select</button>

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">Email contact</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="site[contactemail]" value="<?php echo $site['contactemail']?>">

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Site URL</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="site[siteurl]" value="<?php echo $site['siteurl']?>">

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Description</label>
                        <div class="col-md-9">

                            <textarea class="form-control" name="site[description]"><?php echo $site['description']?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Keywords</label>
                        <div class="col-md-9">

                            <textarea class="form-control" name="site[keywords]"><?php echo $site['keywords']?></textarea>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Google Analytics</label>
                        <div class="col-md-9">

                            <textarea class="form-control" name="site[googleanalytics]"><?php echo $site['googleanalytics']?></textarea>

                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Header Image(946x148)</label>
                        <div class="col-md-9">
                            <input type="hidden" name="header" id="header" value="<?php echo $header['settingvalue']?>">

                            <img id="imgheader" width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $header['settingvalue']?>" />

                            <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSelectImageHeader">Select</button>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Banner(629x212)</label>
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
                                <li><input type="hidden" name="sitemaphome[]" value="<?php echo $sitemap['id']?>"><?php echo $sitemap['sitemapname']?><button type="button" class="btn btn-sm btn-default btn-icon btn-danger margin-0 margin-right-5 btnDelSitemapHome"><span class="fa fa-trash"></span></button></li>
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
                    toastr.success('Setting has been save', 'Save success', {timeOut: 1000})
                }

            });
        });

    <?php } ?>
    $('#btnSelectImageHeader').click(function(){
        $('#modal-select-file').modal();
        var folder = "header";

        $('#modal-select-file .modal-body').load('?route=core/uploadfile&folder='+folder+"&eid=header",function(){

        });
    });
    $('.btnSelectImageSite').click(function(){
        $('#modal-select-file').modal();
        var folder = "site";

        $('#modal-select-file .modal-body').load('?route=core/uploadfile&folder='+folder+"&eid="+$(this).attr('eid'),function(){

        });
    });
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
    $(document).ready(function(){
        $('.btnDelSitemapHome').click(function(){
            $(this).parent().remove();
        });
    });
</script>
