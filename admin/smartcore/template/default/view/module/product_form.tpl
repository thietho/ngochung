<div class="block">
        <div class="title">
        <?php if($item['id'] == ""){ ?>
        <h2 >Add product</h2>
        <?php } else { ?>
        <h2 >Edit product</h2>
        <?php }?>
        <p>Product management</p>
    </div>
</div>
<div class="container container-boxed">
    <!-- START BLOCk -->
    <div class="block">
        <div class="row">
            <form class="form-horizontal" id="frmProduct">
                <input type="hidden" id="id" name="id" value="<?php echo $item['id'] ?>">
                
                <div class="col-md-6">

                    <div class="form-group">
                        <label class="col-md-3 control-label">Product name</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control"
                                   name="productname" placeholder="Product name"
                                   value="<?php echo $item['productname'] ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Price</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control number"
                                   name="price" id="price" placeholder="Price"
                                   value="<?php echo $item['price'] ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Discountpercent</label>

                        <div class="col-md-9">
                            <div class="input-group">
                                <input type="text" class="form-control input-sm number"
                                       name="discountpercent" id="discountpercent" placeholder="Discountpercent"
                                       value="<?php echo $item['discountpercent'] ?>">
                                <span class="input-group-addon icon-percent"></span>
                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Price discount</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control number"
                                   name="pricediscount" id="pricediscount" placeholder="Price discount"
                                   value="<?php echo $item['pricediscount'] ?>">
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
                        <label class="col-md-3 control-label">View count</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control input-control number"
                                   name="viewcout" placeholder="View count"
                                   value="<?php echo $item['viewcout'] ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Image(297x194)</label>
                        <div class="col-md-9">
                            <input type="hidden" name="image" id="image" value="<?php echo $item['image']?>">
                            <img id="imgimage" width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $item['image'] ?>" />

                            <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSelectImage">Select</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">Image detail</label>
                        <div class="col-md-9">
                            <input type="hidden" name="imagedetail" id="imagedetail" value="<?php echo $item['imagedetail']?>">
                            <img id="imgimagedetail" width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $item['imagedetail'] ?>" />

                            <button type="button" class="btn btn-sm btn-default btn-bg btn-success" id="btnSelectImageDetail">Select</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <h2>Summary</h2>
                    <div id="summarylist">
                        <?php if(count($item['summary']['title']))
                        foreach($item['summary']['title'] as $key => $title){ ?>
                        <div>
                            <div class="col-md-5">
                                <input type="text" class="form-control input-control"
                                       name="summary[title][]" placeholder="Title"
                                       value="<?php echo $title?>">
                            </div>
                            <div class="col-md-5">
                                <input type="text" class="form-control input-control"
                                       name="summary[value][]" placeholder="Value"
                                       value="<?php echo $item['summary']['value'][$key]?>">
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-danger form-control btnRemoveSummaryItem"><span class="fa fa-trash"></span></button>
                            </div>
                        </div>
                        <?php } ?>

                    </div>
                    <button type="button" id="btnAddSummary" class="btn btn-success form-control">Add row</button>
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
                    <button type="button" class="btn btn-sm btn-default btn-bg <?php echo $item['id'] == '' ? 'btn-success' : 'btn-info' ?>" id="btnSaveProduct">
                        <?php echo $item['id'] == '' ? 'Insert' : 'Update' ?>
                    </button>
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=module/product'" type="button" class="btn btn-sm btn-default btn-bg">Cancel</button>
                </div>
            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<!-- END PAGE CONTAINER -->
<div id="summarytemplate" style="display: none">
    <div>
        <div class="col-md-5">
            <input type="text" class="form-control input-control"
                   name="summary[title][]" placeholder="Title"
                   value="">
        </div>
        <div class="col-md-5">
            <input type="text" class="form-control input-control"
                   name="summary[value][]" placeholder="Value"
                   value="">
        </div>
        <div class="col-md-2">
            <button type="button" class="btn btn-danger form-control btnRemoveSummaryItem"><span class="fa fa-trash"></span></button>
        </div>
    </div>



</div>
<script type="text/javascript">
$(document).ready(function(){
    $('#frmProduct #sitemapid').val("<?php echo $item['sitemapid']?>");
    numberReady();
    setCKEditorType('description', 0, '100%');
    $('.btnRemoveSummaryItem').click(function(){
        $(this).parent().parent().remove();
    });
});
    <?php if($_GET['type'] != 'popup'){ ?>
        $('#btnSaveProduct').click(function(){
            showLoading();
            var description = CKEDITOR.instances['description'];
            pageValue = description.getData();
            $('textarea#description').val(pageValue);
            $.post("?route=module/product/save",$('#frmProduct').serialize(),function(data){
                endLoading();
                var obj = $.parseJSON(data)
                if(obj.errorstext != '')
                {
                    toastr.error(obj.errorstext,"Errors");
                }
                else
                {
                    //toastr.options.onHidden = function() { window.location = '?route=module/product'};
                    toastr.options.onHidden = function() { history.back()};
                    toastr.success('Product has been save', 'Save success', {timeOut: 1000});
                }

            });
        });
    <?php } ?>
    $('#btnSelectImage').click(function(){
        $('#modal-select-file').modal();
        var folder = "product";
        if($('#frmProduct #id').val() == '')
            folder += "/temp"+ Date.now() ;
        else
            folder += "/"+$('#frmProduct #id').val();
        $('#modal-select-file .modal-body').load('?route=core/uploadfile&folder='+folder+"&eid=image",function(){

        });
    });
    $('#btnSelectImageDetail').click(function(){
        $('#modal-select-file').modal();
        var folder = "product";
        if($('#frmProduct #id').val() == '')
            folder += "/temp"+ Date.now() ;
        else
            folder += "/"+$('#frmProduct #id').val();
        $('#modal-select-file .modal-body').load('?route=core/uploadfile&folder='+folder+"&eid=imagedetail",function(){

        });
    });
    $('#btnSelectFileDescription').click(function(){
        $('#modal-select-file').modal();
        var folder = "product";
        if($('#frmProduct #id').val() == '')
            folder += "/temp"+ Date.now() ;
        else
            folder += "/"+$('#frmProduct #id').val();
        $('#modal-select-file .modal-body').load('?route=core/uploadfile&folder='+folder+"&eid=description&type=editor",function(){

        });
    });

    $('#frmProduct #btnAddSummary').click(function(){
        $('#frmProduct #summarylist').append($('#summarytemplate').html());
        $('.btnRemoveSummaryItem').click(function(){
            $(this).parent().parent().remove();
        });
    });
    $('#frmProduct #price').keyup(function(){
        var price = Number(stringtoNumber($('#frmProduct #price').val()));
        var discount = Number(stringtoNumber($('#frmProduct #pricediscount').val()));
        var percent = Number(stringtoNumber($('#frmProduct #discountpercent').val()));
        if(discount != 0)
        {
            percent = (price - discount)/price *100;
            $('#frmProduct #discountpercent').val(formateNumber(percent));
        }

    });
    $('#frmProduct #pricediscount').keyup(function(){
        var price = Number(stringtoNumber($('#frmProduct #price').val()));
        var discount = Number(stringtoNumber($('#frmProduct #pricediscount').val()));
        var percent = Number(stringtoNumber($('#frmProduct #discountpercent').val()));
        percent = (price - discount)/price *100;
        $('#frmProduct #discountpercent').val(formateNumber(percent));
    });
    $('#frmProduct #discountpercent').keyup(function(){
        var price = Number(stringtoNumber($('#frmProduct #price').val()));
        var discount = Number(stringtoNumber($('#frmProduct #pricediscount').val()));
        var percent = Number(stringtoNumber($('#frmProduct #discountpercent').val()));
        discount = (1 - percent/100)*price;
        $('#frmProduct #pricediscount').val(formateNumber(discount));
    });

</script>