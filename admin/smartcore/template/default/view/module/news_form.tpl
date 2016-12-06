<div class="block">

    <div class="title">
        <?php if($item['id'] == ""){ ?>
        <h2 >Add news</h2>
        <?php } else { ?>
        <h2 >Edit news</h2>
        <?php }?>
        <p>News management</p>
    </div>
</div>
<div class="container container-boxed">
    <!-- START BLOCk -->
    <div class="block">
        <div class="row">
            <form class="form-horizontal" id="frmNews">
                <input type="hidden" id="id" name="id" value="<?php echo $item['id'] ?>">
                
                <div class="col-md-6 col-md-offset-3">
                    <div class="form-group">
						<label class="col-md-3 control-label">Title</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-control"
                                       name="title" id="title" placeholder="Title"
                                       value="<?php echo $item['title'] ?>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Summary</label>
						<div class="col-md-9">

                            <textarea class="form-control input-control" name="summary" id="summary"><?php echo $item['summary'] ?></textarea>
						</div>
					</div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Site map</label>
                        <div class="col-md-9">
                            <select id="sitemapid" name="sitemapid" class="form-control">
                                <option value=""></option>
                                <?php foreach($sitemaps as $sitemap){ ?>
                                <option value="<?php echo $sitemap['id']?>"><?php echo $sitemap['sitemapname']?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
					<div class="form-group">
						<label class="col-md-3 control-label">Image(503x333)</label>
                        <div class="col-md-9">
                            <input type="hidden" name="image" id="image" value="<?php echo $item['image']?>">
                            <img id="imgimage" width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $item['image'] ?>" />

                            <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSelectImage">Select</button>
                        </div>
					</div>
					
                </div>
                <div class="block">
                    <div class="form-group">
                        <label class="control-label">Description</label>
                        <?php if($item['id'] != ''){ ?>
                        <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSelectFileDescription">Select</button>
                        <?php } ?>
                        <div class="col-md-12">
                            <textarea class="form-control input-control" name="description" id="description"><?php echo $item['description'] ?></textarea>

                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3 margin-top-30">
                <div class="text-center">
                    <button type="button" class="btn btn-sm btn-default btn-bg <?php echo $item['id'] == '' ? 'btn-success' : 'btn-info' ?>" id="btnSaveNews">
                        <?php echo $item['id'] == '' ? 'Insert' : 'Update' ?>
                    </button>
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=module/news'" type="button" class="btn btn-sm btn-default btn-bg">Cancel</button>
                </div>
            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<!-- END PAGE CONTAINER -->

<script type="application/javascript">
    $(document).ready(function(){
        $('#frmNews #sitemapid').val("<?php echo $item['sitemapid']?>");
        numberReady();
        setCKEditorType('description', 0, '100%');

    });
    <?php if($_GET['type'] != 'popup'){ ?>
        $('#btnSaveNews').click(function(){
            showLoading();
            var description = CKEDITOR.instances['description'];
            pageValue = description.getData();
            $('textarea#description').val(pageValue);
            $.post("?route=module/news/save",$('#frmNews').serialize(),function(data){
                endLoading();
                var obj = $.parseJSON(data)
                if(obj.errorstext != '')
                {
                    toastr.error(obj.errorstext,"Errors");
                }
                else
                {
                    toastr.options.onHidden = function() { window.location = '?route=module/news'};
                    toastr.success('News has been save', 'Save success', {timeOut: 1000});
                }

            });
        });
    <?php } ?>
    $('#btnSelectImage').click(function(){
        $('#modal-select-file').modal();
        var folder = "news";
        if($('#frmNews #id').val() == '')
            folder += "/temp"+ Date.now() ;
        else
            folder += "/"+$('#frmNews #id').val();
        $('#modal-select-file .modal-body').load('?route=core/uploadfile&folder='+folder+"&eid=image",function(){

        });
    });
    $('#btnSelectFileDescription').click(function(){
        $('#modal-select-file').modal();
        var folder = "news";
        if($('#frmNews #id').val() == '')
            folder += "/temp"+ Date.now() ;
        else
            folder += "/"+$('#frmnews #id').val();
        $('#modal-select-file .modal-body').load('?route=core/uploadfile&folder='+folder+"&eid=description&type=editor",function(){

        });
    });
</script>