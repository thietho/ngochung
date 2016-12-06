<div class="block">

    <div class="title">
        <h2>News management list</h2>
        <p>Client News management</p>
    </div>
</div>
<div class="container">
    <div class="block">
        <div class="row">
            <form id="frmNewsSearch">
                <div class="col-md-3">
					<label class="control-label">Title</label>
					<input type="text" class="form-control input-control" placeholder="Title" id="title" name="title">
				</div>
				<div class="col-md-3">
					<label class="control-label">Summary</label>
					<input type="text" class="form-control input-control" placeholder="Summary" id="summary" name="summary">
				</div>

				
                <input type="hidden" id="sorttype" name="sorttype" value="">
                <input type="hidden" id="sortcol" name="sortcol" value="">
                <input type="hidden" name="type" value="<?php echo $_GET['type']?>">
                <div class="col-md-12 text-right">
                    <button id="btnSearch" class="btn btn-primary" type="button" onclick="elife_News.search()"><span class="fa fa-search"></span> Search</button>
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
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=kotra/news/insert'" type="button" class="btn btn-default btn-bg btn-success"><span class="fa fa-plus"></span> Add news</button>
                </div>
                <?php } ?>
                <div class="clear-mobile"></div>
                <div id="news-list"></div>

            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<!-- END PAGE CONTAINER -->


<script type="application/javascript">
    function News()
    {
        this.id = 0;
        this.search = function()
        {
            showLoading();
            $.get("?route=kotra/news/loadData", $('#frmNewsSearch').serialize(), function(html){
                endLoading();
                $('#news-list').html(html);
            });
        };

        this.showDeleteDialog = function(id, name)
        {
            this.id = id;
            var jModalLocationDelete = $('#modal-news-delete');
            jModalLocationDelete.modal();
            jModalLocationDelete.find('.modal-header').html("Do you want to delete " + name + "?");
        };

        this._delete = function()
        {
            $.get('?route=kotra/news/delete&id=' + this.id,function(data){
                if(data == 'true')
                {
                    toastr.options.onHidden = function() { elife_News.search(); };
                    toastr.success('News has been deleted', 'Delete success', {timeOut: 1000})
                }
            });
        };
    }


    var jFrmNewsSearch = $('#frmNewsSearch');
    var elife_News = new News();
    $(document).ready(function(){
        elife_News.search();

        jFrmNewsSearch.submit(function(e){
            e.preventDefault();
        });

        jFrmNewsSearch.find('.form-control').change(function () {
            elife_News.search();
        });
    });

</script>

<!-- MODAL SMALL -->
<div class="modal fade" id="modal-news-delete" tabindex="-1" role="dialog" aria-labelledby="modal-small-header">
    <div class="modal-dialog modal-sm" role="document">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="icon-cross"></span>
        </button>
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="modal-small-header"></h4>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default btn-bg btn-info" data-dismiss="modal" onclick="elife_News._delete()">OK</button>
                <button type="button" class="btn btn-default btn-bg" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>