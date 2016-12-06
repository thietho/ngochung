<div class="desktop-show">
    <table class="table"></table>
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <tr>
                <th class="text-center">No.</th>
                <th class="sort-default" sortcol="moviesname">Movies name</th>
				<th class="sort-default" sortcol="description">Description</th>
				<th class="sort-default" sortcol="image">Image</th>
				<th class="sort-default" sortcol="filename">Movies path</th>
				<th class="sort-default" sortcol="status">Status</th>
				
                <th class="tool-title">Tool</th>
            </tr>
            <?php $index = ($objPage['pape']-1) * $objPage['itemsPerPage'];?>
            <?php if(isset($moviess)) { foreach($moviess as $movies) { ?>
            <tr>
                <td class="text-center"><?php echo ++$index; ?></td>
                <td><?php echo $movies['moviesname'] ?></td>
				<td><?php echo $movies['description'] ?></td>
				<td><img width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $movies['image'] ?>" /></td>
				<td><?php echo $movies['filename'] ?></td>
				<td><span class="label <?php echo ($movies['status'] == 'active')? 'label-success':'label-primary';?> label-bordered"><?php echo $this->document->status[$movies['status']]?></span></td>
				
                <td class="text-center">
                    <?php if($_GET['type'] == 'popup'){ ?>
                    <button class="btn btn-sm btn-primary btnMoviesSelect"
                            moviesid="<?php echo $movies['id']?>"
							moviesname="<?php echo $movies['moviesname']?>"
							description="<?php echo $movies['description']?>"
							image="<?php echo $movies['image']?>"
							filename="<?php echo $movies['filename']?>"
							status="<?php echo $movies['status']?>"
							
                            ><span class="fa fa-check"></span> Select</button>
                    <?php }else{ ?>
                    <button type="button" class="btn btn-sm btn-default btn-icon btn-danger btn-warning margin-0 margin-right-5" onclick="elife_Movies.showDeleteDialog(<?php echo $movies['id']?>, '<?php echo $movies['moviesname'] ?>')"><span class="fa fa-trash"></span></button>
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=module/movies/update&id=<?php echo $movies[id] ?>'" type="button" class="btn btn-sm btn-default btn-icon btn-edit btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
                    <?php } ?>
                </td>
            </tr>
            <?php } } ?>
        </table>
    </div>
</div>

<div class="mobile-show">
    <div class="block" id="fitermobileMovies">
        <div class="form-group">

            <div class="col-md-6">
                <select id="sortcol" class="form-control">
                    <option value="">Sort</option>
                    <option value="moviesname">Movies name</option>
					<option value="description">Description</option>
					<option value="image">Image</option>
					<option value="filename">Movies path</option>
					<option value="status">Status</option>
					
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
                <button type="button" class="btn btn-success form-control" id="btnSortMovies"><span class="fa fa-sort"></span> Sort</button>
            </div>
        </div>
    </div>
    <?php $index = 1;?>
    <?php if(isset($moviess)) { foreach($moviess as $movies) { ?>
    <div class="itemrow">
        <label>#</label> <?php echo $index++ ?><br>
        <label>Movies name:</label> <?php echo $movies['moviesname'] ?><br>
		<label>Description:</label> <?php echo $movies['description'] ?><br>
		<label>Image:</label> <img width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $movies['image'] ?>" /><br>
		<label>Movies path:</label> <?php echo $movies['filename'] ?><br>
		<label>Status:</label> <?php echo $movies['status'] ?><br>
		
        <div class="clear-mobile"></div>
        <div class="pull-right">
            <?php if($_GET['type'] == 'popup'){ ?>
                <button class="btn btn-sm btn-primary btnMoviesSelect"
                        moviesid="<?php echo $movies['id']?>"
							moviesname="<?php echo $movies['moviesname']?>"
							description="<?php echo $movies['description']?>"
							image="<?php echo $movies['image']?>"
							filename="<?php echo $movies['filename']?>"
							status="<?php echo $movies['status']?>"
							
                        ><span class="fa fa-check"></span> Select</button>
                <?php }else{ ?>
            <button type="button" class="btn btn-default btn-icon btn-danger btn-warning margin-0 margin-right-5" onclick="elife_Movies.showDeleteDialog(<?php echo $movies['id']?>, '<?php echo $movies['moviesname'] ?>')"><span class="fa fa-trash"></span></button>
            <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=module/movies/update&id=<?php echo $movies[id] ?>'" type="button" class="btn btn-default btn-icon btn-edit btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
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
    $('#fitermobileMovies #sortcol').val(sortcol);
        $('#fitermobileMovies #sorttype').val(sorttype);
    
        $('#fitermobileMovies #btnSortMovies').click(function(){
            $('#frmMoviesSearch #sorttype').val($('#fitermobileMovies #sorttype').val());
            $('#frmMoviesSearch #sortcol').val($('#fitermobileMovies #sortcol').val());
            elife_Movies.search();
        });
    $('#movies-list th').each(function(e){
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
        $('#frmMoviesSearch #sorttype').val('asc');
        $('#frmMoviesSearch #sortcol').val($(this).attr('sortcol'));
        elife_Movies.search();
        $(this).removeClass('sort-asc');
        $(this).addClass('sort-desc');
    });
    $('.sort-asc').click(function(){
        $('#frmMoviesSearch #sorttype').val('desc');
        $('#frmMoviesSearch #sortcol').val($(this).attr('sortcol'));
        elife_Movies.search();
        $(this).removeClass('sort-asc');
        $(this).addClass('sort-desc');
    });
    $('.sort-desc').click(function(){
        $('#frmMoviesSearch #sorttype').val('asc');
        $('#frmMoviesSearch #sortcol').val($(this).attr('sortcol'));
        elife_Movies.search();
        $(this).removeClass('sort-desc');
        $(this).addClass('sort-asc');

    });


</script>