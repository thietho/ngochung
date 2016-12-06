<div class="container">
    <div class="block">
        <div class="row">
            <form id="frmPortfolioSearch">
                <div class="col-md-3">
                    <label class="control-label">Portfolio name</label>
                    <input type="text" class="form-control input-control" placeholder="Portfolio name" name="portfolioname">
                </div>
                <div class="col-md-3">
                    <label class="control-label">Client name</label>
                    <input type="text" class="form-control input-control" placeholder="Client name" name="clientname">
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
                <div class="col-md-12 text-right">
                    <button id="btnSearch" class="btn btn-primary" type="button" onclick="portfolio.search()"><span class="fa fa-search"></span> Search</button>
                </div>
            </form>
        </div>
    </div>
    <!-- START BLOCk -->
    <div class="block">
        <div class="row">
            <div class="col-md-12">
                <div class="pull-left margin-bottom-20">
                    <button onclick="window.location = '?route=fmra/portfolio/insert'" type="button" class="btn btn-default btn-bg btn-success"><span class="fa fa-plus"></span> Add portfolio</button>
                </div>
                <div id="portfolio-list"></div>

            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>
<script type="application/javascript">
    function Portfolio()
    {
        this.id = 0;
        this.search = function()
        {
            showLoading();
            $.get("?route=fmra/portfolio/loadData",$('#frmPortfolioSearch').serialize(),function(html){
                endLoading();
                $('#portfolio-list').html(html);
            });
        }
        this.showDeleteDialog = function(id)
        {
            $('#modal-portfolio-delete').modal();
            this.id = id;
            $.getJSON("?route=fmra/portfolio/getPortfolio&id="+id,function(data){
                $('#modal-portfolio-delete .modal-header').html("Do you want to delete " + data.portfolioname + "?");
            })
        }
        this.delete = function()
        {
            $.get('?route=fmra/portfolio/delete&id=' + this.id,function(data){
                if(data == 'true')
                {
                    toastr.options.onHidden = function() { portfolio.search() }
                    toastr.success('Portfolio has been deleted', 'Delete success', {timeOut: 1000})
                }
            });
        }
       
    }
    var portfolio = new Portfolio();
    $(document).ready(function(){
        portfolio.search();
        $('#frmPortfolioSearch .form-control').change(function () {
            portfolio.search();
        });
    });
</script>
<!-- MODAL SMALL -->
<div class="modal fade" id="modal-portfolio-delete" tabindex="-1" role="dialog" aria-labelledby="modal-small-header">
    <div class="modal-dialog modal-sm" role="document">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="icon-cross"></span>
        </button>
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title" id="modal-small-header"></h4>
            </div>
            <div class="modal-footer text-center">
                <button type="button" class="btn btn-default btn-bg btn-info" data-dismiss="modal" onclick="portfolio.delete()">OK</button>
                <button type="button" class="btn btn-default btn-bg" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
<!-- END MODAL SMALL -->