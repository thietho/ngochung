<div class="desktop-show">
    <table class="table"></table>
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <tr>
                <th>No.</th>
                <th class="sort-default" sortcol="sitemapid">Site Map ID</th>
				<th class="sort-default" sortcol="sitemapname">Site Map Name</th>
				<th class="sort-default" sortcol="sitemapparent">Site Map Parent</th>
				<th class="sort-default" sortcol="module">Module</th>
				<th class="sort-default" sortcol="pos">Position</th>
				
                <th class="tool-title">Tool</th>
            </tr>
            <?php $index = ($objPage['pape']-1) * $objPage['itemsPerPage'];?>
            <?php if(isset($sitemaps)) { foreach($sitemaps as $sitemap) { ?>
            <tr>
                <td class="text-center"><?php echo ++$index; ?></td>
                <td><?php echo $sitemap['sitemapid'] ?></td>
				<td><?php echo $sitemap['sitemapname'] ?></td>
				<td><?php echo $sitemap['sitemapparent'] ?></td>
				<td><?php echo $sitemap['module'] ?></td>
				<td><?php echo $sitemap['pos'] ?></td>
				
                <td class="text-center">
                    <?php if($_GET['type'] == 'popup'){ ?>
                    <button class="btn btn-sm btn-primary btnSitemapSelect"
                            sitemapid="<?php echo $sitemap['id']?>"
							sitemapid="<?php echo $sitemap['sitemapid']?>"
							sitemapname="<?php echo $sitemap['sitemapname']?>"
							sitemapparent="<?php echo $sitemap['sitemapparent']?>"
							module="<?php echo $sitemap['module']?>"
							pos="<?php echo $sitemap['pos']?>"
							
                            ><span class="fa fa-check"></span> Select</button>
                    <?php }else{ ?>
                    <button type="button" class="btn btn-sm btn-default btn-icon btn-danger btn-warning margin-0 margin-right-5" onclick="elife_Sitemap.showDeleteDialog(<?php echo $sitemap['id']?>, '<?php echo $sitemap['sitemapname'] ?>')"><span class="fa fa-trash"></span></button>
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=core/sitemap/update&id=<?php echo $sitemap[id] ?>'" type="button" class="btn btn-sm btn-default btn-icon btn-edit btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
                    <?php } ?>
                </td>
            </tr>
            <?php } } ?>
        </table>
    </div>
</div>

<div class="mobile-show">
    <div class="block" id="fitermobileSitemap">
        <div class="form-group">

            <div class="col-md-6">
                <select id="sortcol" class="form-control">
                    <option value="">Sort</option>
                    <option value="sitemapid">Site Map ID</option>
					<option value="sitemapname">Site Map Name</option>
					<option value="sitemapparent">Site Map Parent</option>
					<option value="module">Module</option>
					<option value="pos">Position</option>
					
                </select>
            </div>
            <div class="col-md-6">
                <select id="sorttype" class="form-control">
                    <option value=""></option>
                    <option value="asc">ASC</option>
                    <option value="desc">DESC</option>
                </select>
            </div>
            <div class="col-md-6">
                <button type="button" class="btn btn-success form-control" id="btnSortSitemap"><span class="fa fa-sort"></span> Sort</button>
            </div>
        </div>
    </div>
    <?php $index = 1;?>
    <?php if(isset($sitemaps)) { foreach($sitemaps as $sitemap) { ?>
    <div class="itemrow">
        <label>#</label> <?php echo $index++ ?><br>
        <label>Site Map ID:</label> <?php echo $sitemap['sitemapid'] ?><br>
		<label>Site Map Name:</label> <?php echo $sitemap['sitemapname'] ?><br>
		<label>Site Map Parent:</label> <?php echo $sitemap['sitemapparent'] ?><br>
		<label>Module:</label> <?php echo $sitemap['module'] ?><br>
		<label>Position:</label> <?php echo $sitemap['pos'] ?><br>
		
        <div class="clear-mobile"></div>
        <div class="pull-right">
            <?php if($_GET['type'] == 'popup'){ ?>
                <button class="btn btn-sm btn-primary btnSitemapSelect"
                        sitemapid="<?php echo $sitemap['id']?>"
							sitemapid="<?php echo $sitemap['sitemapid']?>"
							sitemapname="<?php echo $sitemap['sitemapname']?>"
							sitemapparent="<?php echo $sitemap['sitemapparent']?>"
							module="<?php echo $sitemap['module']?>"
							pos="<?php echo $sitemap['pos']?>"
							
                        ><span class="fa fa-check"></span> Select</button>
                <?php }else{ ?>
            <button type="button" class="btn btn-default btn-icon btn-danger btn-warning margin-0 margin-right-5" onclick="elife_Sitemap.showDeleteDialog(<?php echo $sitemap['id']?>, '<?php echo $sitemap['sitemapname'] ?>')"><span class="fa fa-trash"></span></button>
            <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=core/sitemap/update&id=<?php echo $sitemap[id] ?>'" type="button" class="btn btn-default btn-icon btn-edit btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
            <?php } ?>
        </div>
        <div class="clear-mobile"></div>
    </div>
    <?php } } ?>
</div>

<?php echo $pagination?>
<script type="application/javascript">
    var sortcol = "<?php echo $_GET['sortcol']?>";
    var sorttype = "<?php echo $_GET['sorttype']?>";
    $('#fitermobileSitemap #sortcol').val(sortcol);
        $('#fitermobileSitemap #sorttype').val(sorttype);
    
        $('#fitermobileSitemap #btnSortSitemap').click(function(){
            $('#frmSitemapSearch #sorttype').val($('#fitermobileSitemap #sorttype').val());
            $('#frmSitemapSearch #sortcol').val($('#fitermobileSitemap #sortcol').val());
            elife_Sitemap.search();
        });
    $('#sitemap-list th').each(function(e){
        if($(this).attr('sortcol') == sortcol)
        {
            $(this).removeClass('sort-default');
            switch(sorttype)
            {
                case 'asc':
                    $(this).addClass('sort-asc');
                    break;
                case 'desc':
                    $(this).addClass('sort-desc');
                    break;
            }
        }
    });
    $('.sort-default').click(function(){
        $('#frmSitemapSearch #sorttype').val('asc');
        $('#frmSitemapSearch #sortcol').val($(this).attr('sortcol'));
        elife_Sitemap.search();
        $(this).removeClass('sort-asc');
        $(this).addClass('sort-desc');
    });
    $('.sort-asc').click(function(){
        $('#frmSitemapSearch #sorttype').val('desc');
        $('#frmSitemapSearch #sortcol').val($(this).attr('sortcol'));
        elife_Sitemap.search();
        $(this).removeClass('sort-asc');
        $(this).addClass('sort-desc');
    });
    $('.sort-desc').click(function(){
        $('#frmSitemapSearch #sorttype').val('asc');
        $('#frmSitemapSearch #sortcol').val($(this).attr('sortcol'));
        elife_Sitemap.search();
        $(this).removeClass('sort-desc');
        $(this).addClass('sort-asc');

    });


</script>