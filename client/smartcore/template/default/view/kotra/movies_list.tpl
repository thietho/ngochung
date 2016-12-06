<div class="container">
    <div class="block">
        <div class="row">
            <form id="frmMoviesSearch">
                <div class="col-md-3">
                    <label class="control-label">Name</label>
                    <input type="text" class="form-control input-control" placeholder="Name" name="moviesname">
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
                    <button id="btnSearch" class="btn btn-primary" type="button" onclick="movies.search()"><span class="fa fa-search"></span> Search</button>
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
                    <button onclick="window.location = '?route=kotra/movies/insert'" type="button" class="btn btn-default btn-bg btn-success"><span class="fa fa-plus"></span> Add movies</button>
                </div>
                <?php } ?>
                <div id="movies-list"></div>

            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<script type="application/javascript">
function Movies()
{
    this.id = 0;
    this.search = function()
    {
        showLoading();
        $.get("?route=kotra/movies/loadData",$('#frmMoviesSearch').serialize(),function(html){
            endLoading();
            $('#movies-list').html(html);
        });
    }
    this.showDeleteDialog = function(id,name)
    {
        $('#modal-movies-delete').modal();
        this.id = id;
        $.getJSON("?route=kotra/movies/getMovies&id="+id,function(data){
            $('#modal-movies-delete .modal-header').html("Do you want to delete " + name + "?");
        })
    }
    this.delete = function()
    {
        $.get('?route=kotra/movies/delete&id=' + this.id,function(data){
            if(data == 'true')
            {
                toastr.options.onHidden = function() { movies.search() }
                toastr.success('Movies has been deleted', 'Delete success', {timeOut: 1000})
            }
        });
    }


}
var movies = new Movies();
$(document).ready(function(){
    movies.search();
    $('#frmMoviesSearch .form-control').change(function () {
        movies.search();
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
                <button type="button" class="btn btn-default btn-bg btn-info" data-dismiss="modal" onclick="movies.delete()">OK</button>
                <button type="button" class="btn btn-default btn-bg" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<!-- END MODAL SMALL -->