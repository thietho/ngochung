<div class="app-heading app-heading-bordered app-heading-page">
    <div class="icon icon-lg"><span class="icon-clipboard-text"></span></div>
    <div class="title">
        <?php if($item['id'] == ""){ ?>
        <h2 >Add movies</h2>
        <?php } else { ?>
        <h2 >Edit movies</h2>
        <?php }?>
        <p>Movies management</p>
    </div>
</div>
<div class="container container-boxed">
    <!-- START BLOCk -->
    <div class="block">
        <div class="row">
            <form class="form-horizontal" id="frmMovies">
                <input type="hidden" id="id" name="id" value="<?php echo $item['id'] ?>">
                
                <div class="col-md-6 col-md-offset-3">
                    <form class="form-horizontal">
                        <div class="form-group">
							<label class="col-md-3 control-label">Movies name</label>
							<div class="col-md-9">
								<input type="text" class="form-control input-control"
                                       name="moviesname" placeholder="Movies name"
                                       value="<?php echo $item['moviesname'] ?>">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Description</label>
							<div class="col-md-9">
                                <textarea placeholder="Description" name="description" id="description" class="form-control input-control"><?php echo $item['description']?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Image</label>
							<div class="col-md-9">
                                <input type="hidden" name="image" id="image" value="<?php echo $item['image']?>">
                                <img id="imgimage" width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $item['image'] ?>" />

                                <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSelectImage">Select</button>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Movies path</label>
							<div class="col-md-9">
                                <input type="hidden" name="filename" id="filename" value="<?php echo $item['filename']?>">
                                <img id="imgfilename" width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $item['filename'] ?>" />
                                <label id="lblfilename"><?php echo $item['filename']?></label>
                                <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSelectVideo">Select</button>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Status</label>
							<div class="col-md-9">
                                <select class="form-control" name="status" id="status">
                                    <?php foreach($this->document->status as $status => $statustext){ ?>
                                    <option value="<?php echo $status?>"><?php echo $statustext?></option>
                                    <?php } ?>
                                </select>
							</div>
						</div>
						
                    </form>
                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3 margin-top-30">
                <div class="text-center">
                    <button type="button" class="btn btn-sm btn-default btn-bg <?php echo $item['id'] == '' ? 'btn-success' : 'btn-info' ?>" id="btnSaveMovies">
                        <?php echo $item['id'] == '' ? 'Insert' : 'Update' ?>
                    </button>
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=kotra/movies'" type="button" class="btn btn-sm btn-default btn-bg">Cancel</button>
                </div>
            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<!-- END PAGE CONTAINER -->

<script type="application/javascript">

    <?php if($_GET['type'] != 'popup'){ ?>
        $('#btnSaveMovies').click(function(){
            showLoading();
            $.post("?route=kotra/movies/save",$('#frmMovies').serialize(),function(data){
                endLoading();
                var obj = $.parseJSON(data)
                if(obj.errorstext != '')
                {
                    toastr.error(obj.errorstext,"Errors");
                }
                else
                {
                    toastr.options.onHidden = function() { window.location = '?route=kotra/movies'};
                    toastr.success('Movies has been save', 'Save success', {timeOut: 1000});
                }

            });
        });
    <?php } ?>
    $('#btnSelectImage').click(function(){
        $('#modal-select-file').modal();
        var folder = "movies";
        if($('#frmMovies #id').val() == '')
            folder += "/temp"+ Date.now() ;
        else
            folder += "/"+$('#frmMovies #id').val();
        $('#modal-select-file .modal-body').load('?route=core/uploadfile&folder='+folder+"&eid=image",function(){

        });
    });
    $('#btnSelectVideo').click(function(){
        $('#modal-select-file').modal();
        var folder = "movies";
        if($('#frmMovies #id').val() == '')
            folder += "/temp"+ Date.now() ;
        else
            folder += "/"+$('#frmMovies #id').val();
        $('#modal-select-file .modal-body').load('?route=core/uploadfile&folder='+folder+"&eid=filename",function(){

        });
    });
</script>