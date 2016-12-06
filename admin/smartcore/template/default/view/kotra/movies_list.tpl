<div class="block">
    <div class="title">
        <h2>Movies management list</h2>
        <p>Client Movies management</p>
    </div>
</div>
<div class="container">
    <div class="block">
        <div class="row">
            <form id="frmMoviesSearch">
                <div class="col-md-3">
					<label class="control-label">Movies name</label>
					<input type="text" class="form-control input-control" placeholder="Movies name" id="moviesname" name="moviesname">
				</div>
				<div class="col-md-3">
					<label class="control-label">Description</label>
					<input type="text" class="form-control input-control" placeholder="Description" id="description" name="description">
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
				
                <input type="hidden" id="sorttype" name="sorttype" value="">
                <input type="hidden" id="sortcol" name="sortcol" value="">
                <input type="hidden" name="type" value="<?php echo $_GET['type']?>">
                <div class="col-md-12 text-right">
                    <button id="btnSearch" class="btn btn-primary" type="button" onclick="elife_Movies.search()"><span class="fa fa-search"></span> Search</button>
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
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=kotra/movies/insert'" type="button" class="btn btn-default btn-bg btn-success"><span class="fa fa-plus"></span> Add movies</button>
                </div>
                <?php } ?>
                <div class="clear-mobile"></div>
                <div id="movies-list"></div>

            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<!-- END PAGE CONTAINER -->


<script type="application/javascript">
    function Movies()
    {
        this.id = 0;
        this.search = function()
        {
            showLoading();
            $.get("?route=kotra/movies/loadData", $('#frmMoviesSearch').serialize(), function(html){
                endLoading();
                $('#movies-list').html(html);
            });
        };

        this.showDeleteDialog = function(id, name)
        {
            this.id = id;
            var jModalLocationDelete = $('#modal-movies-delete');
            jModalLocationDelete.modal();
            jModalLocationDelete.find('.modal-header').html("Do you want to delete " + name + "?");
        };

        this._delete = function()
        {
            $.get('?route=kotra/movies/delete&id=' + this.id,function(data){
                if(data == 'true')
                {
                    toastr.options.onHidden = function() { elife_Movies.search(); };
                    toastr.success('Movies has been deleted', 'Delete success', {timeOut: 1000})
                }
            });
        };
    }


    var jFrmMoviesSearch = $('#frmMoviesSearch');
    var elife_Movies = new Movies();
    $(document).ready(function(){
        elife_Movies.search();

        jFrmMoviesSearch.submit(function(e){
            e.preventDefault();
        });

        jFrmMoviesSearch.find('.form-control').change(function () {
            elife_Movies.search();
        });
    });

</script>

<!-- MODAL SMALL -->
<div class="modal fade" id="modal-movies-delete" tabindex="-1" role="dialog" aria-labelledby="modal-small-header">
    <div class="modal-dialog modal-sm" role="document">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="icon-cross"></span>
        </button>
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="modal-small-header"></h4>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default btn-bg btn-info" data-dismiss="modal" onclick="elife_Movies._delete()">OK</button>
                <button type="button" class="btn btn-default btn-bg" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>