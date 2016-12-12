<div class="app-heading app-heading-bordered app-heading-page">
    <div class="icon icon-lg"><span class="icon-clipboard-text"></span></div>
    <div class="title">
        <h2>Message management list</h2>
        <p>Client Message management</p>
    </div>
</div>
<div class="container">
    <div class="block">
        <div class="row">
            <form id="frmMessageSearch">
                <div class="col-md-3">
					<label class="control-label">Title</label>
					<input type="text" class="form-control input-control" placeholder="Title" id="title" name="title">
				</div>

				<div class="col-md-3">
					<label class="control-label">From Date</label>
					<input type="text" class="form-control input-control bs-datepicker" placeholder="From Date" id="createdatefrom" name="createdatefrom">
				</div>
                <div class="col-md-3">
                    <label class="control-label">To Date</label>
                    <input type="text" class="form-control input-control bs-datepicker" placeholder="To Date" id="createdateto" name="createdateto">
                </div>
				<div class="col-md-3">
					<label class="control-label">Full Name</label>
					<input type="text" class="form-control input-control" placeholder="Full Name" id="fullname" name="fullname">
				</div>
				<div class="col-md-3">
					<label class="control-label">Phone</label>
					<input type="text" class="form-control input-control" placeholder="Phone" id="phone" name="phone">
				</div>
				<div class="col-md-3">
					<label class="control-label">Email</label>
					<input type="text" class="form-control input-control" placeholder="Email" id="email" name="email">
				</div>
				<div class="col-md-3">
					<label class="control-label">Status</label>

                    <select class="form-control input-control" id="status" name="status">
                        <option value=""></option>
                        <?php foreach($this->document->statusmessage as $status => $statusname){ ?>
                        <option value="<?php echo $status?>"><?php echo $statusname?></option>
                        <?php } ?>
                    </select>
				</div>
				
                <input type="hidden" id="sorttype" name="sorttype" value="">
                <input type="hidden" id="sortcol" name="sortcol" value="">
                <input type="hidden" name="type" value="<?php echo $_GET['type']?>">
                <div class="col-md-12 text-right">
                    <button id="btnSearch" class="btn btn-primary" type="button" onclick="elife_Message.search()"><span class="fa fa-search"></span> Search</button>
                </div>
            </form>
        </div>
    </div>

    <!-- START BLOCk -->

    <div class="block">
        <div class="row">
            <div class="col-md-12">
                <!--
                <?php if($_GET['type'] != 'popup'){ ?>
                <div class="pull-left margin-bottom-20">
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=core/message/insert'" type="button" class="btn btn-default btn-bg btn-success"><span class="fa fa-plus"></span> Add message</button>
                </div>
                <?php } ?>
                <div class="clear-mobile"></div>
                -->
                <div id="message-list"></div>

            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<!-- END PAGE CONTAINER -->


<script type="application/javascript">
    function Message()
    {
        this.id = 0;
        this.search = function()
        {
            showLoading();
            $.get("?route=core/message/loadData", $('#frmMessageSearch').serialize(), function(html){
                endLoading();
                $('#message-list').html(html);
            });
        };

        this.showDeleteDialog = function(id, name)
        {
            this.id = id;
            var jModalLocationDelete = $('#modal-message-delete');
            jModalLocationDelete.modal();
            jModalLocationDelete.find('.modal-header').html("Do you want to delete " + name + "?");
        };

        this._delete = function()
        {
            $.get('?route=core/message/delete&id=' + this.id,function(data){
                if(data == 'true')
                {
                    toastr.options.onHidden = function() { elife_Message.search(); };
                    toastr.success('Message has been deleted', 'Delete success', {timeOut: 1000})
                }
            });
        };
    }


    var jFrmMessageSearch = $('#frmMessageSearch');
    var elife_Message = new Message();
    $(document).ready(function(){
        elife_Message.search();

        jFrmMessageSearch.submit(function(e){
            e.preventDefault();
        });

        jFrmMessageSearch.find('.form-control').change(function () {
            elife_Message.search();
        });
    });

</script>

<!-- MODAL SMALL -->
<div class="modal fade" id="modal-message-delete" tabindex="-1" role="dialog" aria-labelledby="modal-small-header">
    <div class="modal-dialog modal-sm" role="document">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="icon-cross"></span>
        </button>
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="modal-small-header"></h4>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default btn-bg btn-info" data-dismiss="modal" onclick="elife_Message._delete()">OK</button>
                <button type="button" class="btn btn-default btn-bg" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>