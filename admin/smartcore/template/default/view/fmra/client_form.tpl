<div class="container container-boxed">
    <!-- START BLOCk -->
    <div class="block">
        <div class="row margin-top-15">

            <form class="form-horizontal" id="frmClient">
                <input type="hidden" name="id" id="id" value="<?php echo $item['id']?>">
                <div class="col-md-6 col-md-offset-3">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Full name</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="Fullname" name="fullname" id="fullname" value="<?php echo $item['fullname']?>">
                        </div>

                    </div>
                    <?php if($item[id] == ''){ ?>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Username</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="Username" name="username" id="username">
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
                    <?php } ?>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Email</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="Email" name="email" id="email" value="<?php echo $item['email']?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Phone number</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="Phone number" name="phone" id="phone" value="<?php echo $item['phone']?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Address</label>
                        <div class="col-md-9">
                            <textarea class="form-control" rows="3" name="address" id="address"><?php echo $item['address']?></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">City/Province</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="City/Province" name="city" id="city" value="<?php echo $item['city']?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">State</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="State" name="state" id="state" value="<?php echo $item['state']?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Country</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="Country" name="country" id="country" value="<?php echo $item['country']?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Postcode</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="Postcode" name="postcode" id="postcode" value="<?php echo $item['postcode']?>" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Active</label>
                        <div class="col-md-9">
                            <select class="form-control" name="status" id="status">
                                <?php foreach($this->document->status as $status => $statustext){ ?>
                                <option value="<?php echo $status?>"><?php echo $statustext?></option>
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
                    <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSaveClient"><span class="fa fa-save"></span> Save</button>
                    <button onclick="window.location.href='admin-client-list.php'" type="button" class="btn btn-sm btn-default btn-bg"><span class="fa fa-backward"></span> Cancel</button>
                </div>
            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<script type="application/javascript">
$(document).ready(function(){
    $('#frmClient #status').val("<?php echo $item['status']?>");
});
<?php if($_GET['type'] != 'popup'){ ?>
$('#btnSaveClient').click(function(){
    showLoading();
    $.post("?route=fmra/client/save",$('#frmClient').serialize(),function(data){
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

<?php } ?>
</script>