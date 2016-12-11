<div class="desktop-show">
    <table class="table"></table>
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <tr>
                <th>No.</th>
                <th class="sort-default" sortcol="title">Title</th>
				<th class="sort-default" sortcol="summary">Summary</th>
				<th>Image</th>
                <th>Site map</th>
                <th class="tool-title">Tool</th>
            </tr>
            <?php $index = ($objPage['pape']-1) * $objPage['itemsPerPage'];?>
            <?php if(isset($newss)) { foreach($newss as $news) { ?>
            <tr>
                <td class="text-center"><?php echo ++$index; ?></td>
                <td><?php echo $news['title'] ?></td>
				<td><?php echo $news['summary'] ?></td>

				<td><img width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $news['image'] ?>" /></td>
				<td><?php echo $news['sitemapname']?></td>
                <td class="text-center">
                    <?php if($_GET['type'] == 'popup'){ ?>
                    <button class="btn btn-sm btn-primary btnNewsSelect"
                            newsid="<?php echo $news['id']?>"
							title="<?php echo $news['title']?>"
							summary="<?php echo $news['summary']?>"
							description="<?php echo $news['description']?>"
							image="<?php echo $news['image']?>"
							
                            ><span class="fa fa-check"></span> Select</button>
                    <?php }else{ ?>
                    <button type="button" class="btn btn-sm btn-default btn-icon btn-danger btn-warning margin-0 margin-right-5" onclick="elife_News.showDeleteDialog(<?php echo $news['id']?>, '<?php echo $news['title'] ?>')"><span class="fa fa-trash"></span></button>
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=module/news/update&id=<?php echo $news[id] ?>'" type="button" class="btn btn-sm btn-default btn-icon btn-edit btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
                    <?php } ?>
                </td>
            </tr>
            <?php } } ?>
        </table>
    </div>
</div>

<div class="mobile-show">
    <div class="block" id="fitermobileNews">
        <div class="form-group">

            <div class="col-md-6">
                <select id="sortcol" class="form-control">
                    <option value="">Sort</option>
                    <option value="title">Title</option>
					<option value="summary">Summary</option>
					<option value="description">Description</option>
					<option value="image">Image</option>
					
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
                <button type="button" class="btn btn-success form-control" id="btnSortNews"><span class="fa fa-sort"></span> Sort</button>
            </div>
        </div>
    </div>
    <?php $index = 1;?>
    <?php if(isset($newss)) { foreach($newss as $news) { ?>
    <div class="itemrow">
        <label>#</label> <?php echo $index++ ?><br>
        <label>Title:</label> <?php echo $news['title'] ?><br>
		<label>Summary:</label> <?php echo $news['summary'] ?><br>
		<label>Image:</label> <img width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $news['image'] ?>" /><br>
		<label>Site map name:</label> <?php echo $news['sitemapname']?>
        <div class="clear-mobile"></div>
        <div class="pull-right">
            <?php if($_GET['type'] == 'popup'){ ?>
                <button class="btn btn-sm btn-primary btnNewsSelect"
                        newsid="<?php echo $news['id']?>"
							title="<?php echo $news['title']?>"
							summary="<?php echo $news['summary']?>"
							description="<?php echo $news['description']?>"
							image="<?php echo $news['image']?>"
							
                        ><span class="fa fa-check"></span> Select</button>
                <?php }else{ ?>
            <button type="button" class="btn btn-default btn-icon btn-danger btn-warning margin-0 margin-right-5" onclick="elife_News.showDeleteDialog(<?php echo $news['id']?>, '<?php echo $news['productname'] ?>')"><span class="fa fa-trash"></span></button>
            <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=module/news/update&id=<?php echo $news[id] ?>'" type="button" class="btn btn-default btn-icon btn-edit btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
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
    $('#fitermobileNews #sortcol').val(sortcol);
        $('#fitermobileNews #sorttype').val(sorttype);
    
        $('#fitermobileNews #btnSortNews').click(function(){
            $('#frmNewsSearch #sorttype').val($('#fitermobileNews #sorttype').val());
            $('#frmNewsSearch #sortcol').val($('#fitermobileNews #sortcol').val());
            elife_News.search();
        });
    $('#news-list th').each(function(e){
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
        $('#frmNewsSearch #sorttype').val('asc');
        $('#frmNewsSearch #sortcol').val($(this).attr('sortcol'));
        elife_News.search();
        $(this).removeClass('sort-asc');
        $(this).addClass('sort-desc');
    });
    $('.sort-asc').click(function(){
        $('#frmNewsSearch #sorttype').val('desc');
        $('#frmNewsSearch #sortcol').val($(this).attr('sortcol'));
        elife_News.search();
        $(this).removeClass('sort-asc');
        $(this).addClass('sort-desc');
    });
    $('.sort-desc').click(function(){
        $('#frmNewsSearch #sorttype').val('asc');
        $('#frmNewsSearch #sortcol').val($(this).attr('sortcol'));
        elife_News.search();
        $(this).removeClass('sort-desc');
        $(this).addClass('sort-asc');

    });


</script>