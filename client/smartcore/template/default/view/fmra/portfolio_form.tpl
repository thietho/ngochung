<div class="container container-boxed">
    <!-- START BLOCk -->
    <div class="block">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form class="form-horizontal" id="frmPortfolio">
                    <input type="hidden" name="id" id="id" value="<?php echo $item['id']?>">
                    <div class="form-group">
                        <label class="col-md-3 control-label">Portfolio name</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="Portfolio name" name="portfolioname" id="portfolioname" value="<?php echo $item['portfolioname']?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Planning year</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="Pkaning year" name="planningyear" id="planningyear" value="<?php echo $item['planningyear']?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">From year</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="Form year" name="fromyear" id="fromyear" value="<?php echo $item['fromyear']?>">
                        </div>
                    </div><div class="form-group">
                        <label class="col-md-3 control-label">To year</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control" placeholder="To year" name="toyear" id="toyear" value="<?php echo $item['toyear']?>">
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
                    <div class="form-group">
                        <label class="col-md-3 control-label">Client</label>
                        <div class="col-md-9">
                            <input type="hidden" name="clientid" id="clientid" value="<?php echo $item['clientid']?>">
                            <label class="control-label" id="lblclientname"><?php echo $item['clientname']?></label>
                            <button type="button" class="btn btn-primary" id="btnSelectClient"><span class="fa fa-search"></span> Select client</button>
                            <button type="button" class="btn btn-success" id="btnAddClient"><span class="fa fa-plus"></span> Add client</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3 margin-top-30">
                <div class="text-center">
                    <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSavePortfolio"><span class="fa fa-save"></span> Save</button>
                    <button onclick="window.location.href='?route=fmra/portfolio'" type="button" class="btn btn-sm btn-default btn-bg"><span class="fa fa-backward"></span> Cancel</button>
                </div>
            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<script type="application/javascript">
$(document).ready(function(){
    $('#frmPortfolio #status').val("<?php echo $item['status']?>");
    $('#btnSelectClient').click(function () {
        $('#modal-client-list').modal();
        if($('#modal-client-list .modal-body').html() == '')
            $('#modal-client-list .modal-body').load('?route=fmra/client&type=popup',function(){
                $(document).ajaxComplete(function(){
                    $('.btnClientSelect').click(function () {
                        $('#frmPortfolio #clientid').val($(this).attr('clientid'));
                        $('#frmPortfolio #lblclientname').html($(this).attr('fullname'));
                        $('#modal-client-list').modal('hide');
                    });
                });

            });
    });
    $('#btnAddClient').click(function () {
        $('#modal-client-form').modal();
        if($('#modal-client-form .modal-body').html() == '')
        {
            $('#modal-client-form .modal-body').load('?route=fmra/client/insert&type=popup',function(){
                $(document).ajaxComplete(function(){
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
                                $('#frmPortfolio #clientid').val(obj.id);
                                $('#frmPortfolio #lblclientname').html(obj.fullname);
                                $('#modal-client-form').modal('hide');
                            }

                        });
                    });

                })
            });
        }
    });
});
$('#btnSavePortfolio').click(function () {
    showLoading();
    $.post("?route=fmra/portfolio/save",$('#frmPortfolio').serialize(),function(data){
        endLoading();
        var obj = $.parseJSON(data)
        if(obj.errorstext != '')
        {
            toastr.error(obj.errorstext,"Errors");
        }
        else
        {
            toastr.options.onHidden = function() { window.location = '?route=fmra/portfolio' }
            toastr.success('Portfoli has been save', 'Save success', {timeOut: 1000})
        }

    });
});

</script>
<div class="modal fade" id="modal-client-list" tabindex="-1" role="dialog" aria-labelledby="modal-default-header">
    <div class="modal-dialog modal-fw" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="modal-default-header">List client</h4>
            </div>
            <div class="modal-body"></div>

        </div>
    </div>
</div>
<div class="modal fade" id="modal-client-form" tabindex="-1" role="dialog" aria-labelledby="modal-default-header">
    <div class="modal-dialog modal-fw" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="modal-default-header">Client infomation</h4>
            </div>
            <div class="modal-body"></div>

        </div>
    </div>
</div>