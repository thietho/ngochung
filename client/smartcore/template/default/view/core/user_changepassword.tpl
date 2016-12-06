<div class="container container-boxed">
    <!-- START BLOCk -->
    <div class="block">
        <div class="row margin-top-15">

            <form class="form-horizontal" id="frmUserChangePassword">
                <input type="hidden" name="id" id="id" value="<?php echo $item['id']?>">
                <div class="col-md-6 col-md-offset-3">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Full name</label>
                        <div class="col-md-9">
                            <label class="control-label"><?php echo $item['fullname']?></label>
                        </div>

                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label">Username</label>
                        <div class="col-md-9">
                            <label class="control-label"><?php echo $this->user->getUserName()?></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Password</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control input-control" placeholder="Password" name="password" id="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Confirm Password</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control input-control" placeholder="Confirm Password" name="confirmpassword" id="confirmpassword">
                        </div>
                    </div>


                </div>
            </form>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3 margin-top-30">
                <div class="text-center">
                    <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnChangePassword"><span class="fa fa-save"></span> Change password</button>
                    <button onclick="window.history(-1)" type="button" class="btn btn-sm btn-default btn-bg"><span class="fa fa-backward"></span> Cancel</button>
                </div>
            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<script type="application/javascript">


$('#btnChangePassword').click(function(){
    showLoading();
    $.post("?route=core/user/actionchangepass",$('#frmUserChangePassword').serialize(),function(data){
        endLoading();
        var obj = $.parseJSON(data)
        if(obj.errorstext != '')
        {
            toastr.error(obj.errorstext,"Errors");
        }
        else
        {
            toastr.options.onHidden = function() { window.location = '?route=fmra/client' }
            toastr.success('Client has been save', 'Save success', {timeOut: 1000})
        }

    });
});


</script>