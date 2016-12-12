<div class="app-heading app-heading-bordered app-heading-page">
    <div class="icon icon-lg"><span class="icon-clipboard-text"></span></div>
    <div class="title">
        <?php if($item['id'] == ""){ ?>
        <h2 >Add message</h2>
        <?php } else { ?>
        <h2 >Edit message</h2>
        <?php }?>
        <p>Message management</p>
    </div>
</div>
<div class="container container-boxed">
    <!-- START BLOCk -->
    <div class="block">
        <div class="row">
            <form class="form-horizontal" id="frmMessage">
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
						<label class="col-md-3 control-label">Desscriptions</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-control"
                                       name="desscriptions" id="desscriptions" placeholder="Desscriptions"
                                       value="<?php echo $item['desscriptions'] ?>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Date</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-control"
                                       name="createdate" id="createdate" placeholder="Date"
                                       value="<?php echo $item['createdate'] ?>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Full Name</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-control"
                                       name="fullname" id="fullname" placeholder="Full Name"
                                       value="<?php echo $item['fullname'] ?>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Phone</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-control"
                                       name="phone" id="phone" placeholder="Phone"
                                       value="<?php echo $item['phone'] ?>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Email</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-control"
                                       name="email" id="email" placeholder="Email"
                                       value="<?php echo $item['email'] ?>">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Status</label>
						<div class="col-md-9">
							<input type="text" class="form-control input-control"
                                       name="status" id="status" placeholder="Status"
                                       value="<?php echo $item['status'] ?>">
						</div>
					</div>
					
                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3 margin-top-30">
                <div class="text-center">
                    <button type="button" class="btn btn-sm btn-default btn-bg <?php echo $item['id'] == '' ? 'btn-success' : 'btn-info' ?>" id="btnSaveMessage">
                        <?php echo $item['id'] == '' ? 'Insert' : 'Update' ?>
                    </button>
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=core/message'" type="button" class="btn btn-sm btn-default btn-bg">Cancel</button>
                </div>
            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<!-- END PAGE CONTAINER -->

<script type="application/javascript">

    <?php if($_GET['type'] != 'popup'){ ?>
        $('#btnSaveMessage').click(function(){
            showLoading();
            $.post("?route=core/message/save",$('#frmMessage').serialize(),function(data){
                endLoading();
                var obj = $.parseJSON(data)
                if(obj.errorstext != '')
                {
                    toastr.error(obj.errorstext,"Errors");
                }
                else
                {
                    toastr.options.onHidden = function() { window.location = '?route=core/message'};
                    toastr.success('Message has been save', 'Save success', {timeOut: 1000});
                }

            });
        });
    <?php } ?>

</script>