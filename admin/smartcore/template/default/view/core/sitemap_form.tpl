<div class="app-heading app-heading-bordered app-heading-page">
    <div class="icon icon-lg"><span class="icon-clipboard-text"></span></div>
    <div class="title">
        <?php if($item['id'] == ""){ ?>
        <h2 >Add sitemap</h2>
        <?php } else { ?>
        <h2 >Edit sitemap</h2>
        <?php }?>
        <p>Sitemap management</p>
    </div>
</div>
<div class="container container-boxed">
    <!-- START BLOCk -->
    <div class="block">
        <div class="row">
            <form class="form-horizontal" id="frmSitemap">
                <input type="hidden" id="id" name="id" value="<?php echo $item['id'] ?>">
                <input type="hidden" name="sitemapparent" id="sitemapparent" value="<?php echo $item['sitemapparent'] ?>">
                <input type="hidden" name="pos" id="pos" value="<?php echo $item['pos'] ?>">
                <div class="col-md-6 col-md-offset-3">

					<div class="form-group">
						<label class="col-md-3 control-label">Site Map Name</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-control"
                                       name="sitemapname" id="sitemapname" placeholder="Site Map Name"
                                       value="<?php echo $item['sitemapname'] ?>">
						</div>
					</div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Site Map ID</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control"
                                   name="sitemapid" id="sitemapid" placeholder="Site Map ID"
                                   value="<?php echo $item['sitemapid'] ?>">
                        </div>
                    </div>
					<div class="form-group">
						<label class="col-md-3 control-label">Module</label>
						<div class="col-md-9">

                            <select class="form-control" name="module" id="module">
                                <option value=""></option>
                                <?php foreach($this->document->module as $module => $name){ ?>
                                <option value="<?php echo $module?>"><?php echo $name?></option>
                                <?php } ?>
                            </select>
						</div>
					</div>

                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3 margin-top-30">
                <div class="text-center">
                    <button type="button" class="btn btn-sm btn-default btn-bg <?php echo $item['id'] == '' ? 'btn-success' : 'btn-info' ?>" id="btnSaveSitemap">
                        <?php echo $item['id'] == '' ? 'Insert' : 'Update' ?>
                    </button>
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=core/sitemap'" type="button" class="btn btn-sm btn-default btn-bg">Cancel</button>
                </div>
            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<!-- END PAGE CONTAINER -->

<script type="application/javascript">
    $('#frmSitemap #module').val("<?php echo $item['module']?>");
    $('#frmSitemap #sitemapname').change(function () {
        $.get('?route=core/sitemap/createID&sitemapname='+ encodeURI($('#frmSitemap #sitemapname').val()), function (html) {
            $('#frmSitemap #sitemapid').val(html);
        })
    });
    <?php if($_GET['type'] != 'popup'){ ?>
        $('#btnSaveSitemap').click(function(){
            showLoading();
            $.post("?route=core/sitemap/save",$('#frmSitemap').serialize(),function(data){
                endLoading();
                var obj = $.parseJSON(data)
                if(obj.errorstext != '')
                {
                    toastr.error(obj.errorstext,"Errors");
                }
                else
                {
                    toastr.options.onHidden = function() { window.location = '?route=core/sitemap'};
                    toastr.success('Sitemap has been save', 'Save success', {timeOut: 1000});
                }

            });
        });
    <?php } ?>

</script>