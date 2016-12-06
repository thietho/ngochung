<div class="container">
    <div class="block">
        <div class="row">
            <form id="frmClientSearch">
                <div class="col-md-3">
                    <label class="control-label">Accout</label>
                    <input type="text" class="form-control input-control" placeholder="Name" name="fullname">
                </div>
                <div class="col-md-3">
                    <label class="control-label">Username</label>
                    <input type="text" class="form-control input-control" placeholder="Username" name="username">
                </div>
                <div class="col-md-3">
                    <label class="control-label">Status</label>
                    <select class="form-control" name="status">
                        <option value=""></option>
                        <?php foreach($this->document->status as $status => $statustext){ ?>
                        <option value="<?php echo $status?>"><?php echo $statustext?></option>
                        <?php } ?>
                    </select>
                </div>
                <input type="hidden" name="type" value="<?php echo $_GET['type']?>">

                <div class="col-md-12 text-right">
                    <button id="btnSearch" class="btn btn-primary" type="button" onclick="client.search()"><span class="fa fa-search"></span> Search</button>
                </div>

            </form>
        </div>
    </div>
    <!-- START BLOCk -->
    <div class="block">
        <div class="row">
            <div class="col-md-12">
                <?php if($_GET['type'] != 'popup'){ ?>
                <div class="pull-left margin-bottom-20">
                    <button onclick="window.location = '?route=fmra/client/insert'" type="button" class="btn btn-default btn-bg btn-success"><span class="fa fa-plus"></span> Add account</button>
                </div>
                <?php } ?>
                <div id="client-list"></div>

            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<script type="application/javascript">
function Client()
{
    this.id = 0;
    this.search = function()
    {
        showLoading();
        $.get("?route=fmra/client/loadData",$('#frmClientSearch').serialize(),function(html){
            endLoading();
            $('#client-list').html(html);
        });
    }
    this.showDeleteDialog = function(id)
    {
        $('#modal-client-delete').modal();
        this.id = id;
        $.getJSON("?route=fmra/client/getClient&id="+id,function(data){
            $('#modal-client-delete .modal-header').html("Do you want to delete " + data.fullname + "?");
        })
    }
    this.delete = function()
    {
        $.get('?route=fmra/client/delete&id=' + this.id,function(data){
            if(data == 'true')
            {
                toastr.options.onHidden = function() { client.search() }
                toastr.success('Client has been deleted', 'Delete success', {timeOut: 1000})
            }
        });
    }
    this.showResetPassForm = function(id)
    {
        $('#modal-client-reset').modal();
        this.id = id;
        $.getJSON("?route=fmra/client/getClient&id="+id,function(data){
            $('#modal-client-reset #fullname').html(data.fullname);
            $('#modal-client-reset #username').html(data.username);

        })
    }
    this.resetPassword = function()
    {
        $.post("?route=fmra/client/resetPassword",{
            id:this.id,
            password:$('#modal-client-reset #password').val(),
            confirmpassword:$('#modal-client-reset #confirmpassword').val()
        },function(data){
            var obj = $.parseJSON(data);
            if(obj.errorstext!= '')
            {
                toastr.error(obj.errorstext, 'Errors', {timeOut: 5000})
            }
            else
            {
                toastr.success('Client has been change password success', 'Reset password success', {timeOut: 5000});
                $('#modal-client-reset').modal("hide");
            }
        });
    }
    this.autoLogin = function(id)
    {
        $.getJSON("?route=fmra/client/getClient&id="+id,function(data){
            window.open('http://localhost:81/FMRA/client/?route=page/logi&username='+data.username+'&password='+data.password);
        })
    }
}
var client = new Client();
$(document).ready(function(){
    client.search();
    $('#frmClientSearch .form-control').change(function () {
        client.search();
    });
});
</script>
<!-- MODAL SMALL -->
<div class="modal fade" id="modal-client-delete" tabindex="-1" role="dialog" aria-labelledby="modal-small-header">
    <div class="modal-dialog modal-sm" role="document">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="icon-cross"></span>
        </button>
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="modal-small-header"></h4>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default btn-bg btn-info" data-dismiss="modal" onclick="client.delete()">OK</button>
                <button type="button" class="btn btn-default btn-bg" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal-client-reset" tabindex="-1" role="dialog" aria-labelledby="modal-default-header">
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="modal-default-header">Reset password</h4>
            </div>
            <div class="modal-body">
                <label class="control-label" id="fullname"></label>
                <div class="form-group">
                    <label class="col-md-3 control-label">User name</label>
                    <div class="col-md-9">
                        <label id="username"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Password</label>
                    <div class="col-md-9">
                        <input type="password" class="form-control" name="password" id="password">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Confirm Password</label>
                    <div class="col-md-9">
                        <input type="password" class="form-control" name="confirmpassword" id="confirmpassword">
                    </div>
                </div>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default btn-bg btn-info" onclick="client.resetPassword()">OK</button>
                <button type="button" class="btn btn-default btn-bg" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<!-- END MODAL SMALL -->