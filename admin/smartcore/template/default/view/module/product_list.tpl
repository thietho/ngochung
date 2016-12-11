<div class="block">
    <div class="title">
        <h2>Product management list</h2>
        <p>Client Product management</p>
    </div>
</div>
<div class="container">
    <div class="block">
        <div class="row">
            <form id="frmProductSearch">
                <div class="col-md-3">
					<label class="control-label">Product name</label>
					<input type="text" class="form-control input-control" placeholder="Movies name" id="productname" name="productname">
				</div>
                <div class="col-md-3">
                    <label class="control-label">Site map</label>
                    <select id="sitemapid" name="sitemapid" class="form-control">
                        <option value=""></option>
                        <?php foreach($sitemaps as $sitemap){ ?>
                        <option value="<?php echo $sitemap['id']?>"><?php echo $sitemap['sitemapname']?></option>
                        <?php } ?>
                    </select>
                </div>

				
                <input type="hidden" id="sorttype" name="sorttype" value="">
                <input type="hidden" id="sortcol" name="sortcol" value="">
                <input type="hidden" name="type" value="<?php echo $_GET['type']?>">
                <div class="col-md-12 text-right">
                    <button id="btnSearch" class="btn btn-primary" type="button" onclick="elife_Product.search()"><span class="fa fa-search"></span> Search</button>
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
                    <button onclick="window.location.href='<?php echo $insert?>'" type="button" class="btn btn-default btn-bg btn-success"><span class="fa fa-plus"></span> Add product</button>
                </div>
                <?php } ?>
                <div class="clear-mobile"></div>
                <div id="product-list"></div>

            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<!-- END PAGE CONTAINER -->


<script type="application/javascript">
    function Product()
    {
        this.id = 0;
        this.search = function()
        {
            showLoading();
            $.get("?route=module/product/loadData", $('#frmProductSearch').serialize(), function(html){
                endLoading();
                $('#product-list').html(html);
            });
        };

        this.showDeleteDialog = function(id, name)
        {
            this.id = id;
            var jModalLocationDelete = $('#modal-product-delete');
            jModalLocationDelete.modal();
            jModalLocationDelete.find('.modal-header').html("Do you want to delete " + name + "?");
        };

        this._delete = function()
        {
            $.get('?route=module/product/delete&id=' + this.id,function(data){
                if(data == 'true')
                {
                    toastr.options.onHidden = function() { elife_Product.search(); };
                    toastr.success('Product has been deleted', 'Delete success', {timeOut: 1000})
                }
            });
        };
    }

    $('#frmProductSearch #sitemapid').val("<?php echo $sitemapid?>");
    var jFrmProductSearch = $('#frmProductSearch');
    var elife_Product = new Product();
    $(document).ready(function(){

        elife_Product.search();

        jFrmProductSearch.submit(function(e){
            e.preventDefault();
        });

        jFrmProductSearch.find('.form-control').change(function () {
            elife_Product.search();
        });
    });

</script>

<!-- MODAL SMALL -->
<div class="modal fade" id="modal-product-delete" tabindex="-1" role="dialog" aria-labelledby="modal-small-header">
    <div class="modal-dialog modal-sm" role="document">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="icon-cross"></span>
        </button>
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="modal-small-header"></h4>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default btn-bg btn-info" data-dismiss="modal" onclick="elife_Product._delete()">OK</button>
                <button type="button" class="btn btn-default btn-bg" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>