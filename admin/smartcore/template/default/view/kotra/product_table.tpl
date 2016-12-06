<div class="desktop-show">
    <table class="table"></table>
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <tr>
                <th>No.</th>
                <th class="sort-default" sortcol="productname">Movies name</th>
				<th class="sort-default" sortcol="price">Price</th>
				<th class="sort-default" sortcol="pricediscount">Price discount</th>
				<th class="sort-default" sortcol="discountpercent">Discountpercent</th>
				<th>Summary</th>

				<th class="sort-default" sortcol="viewcout">View count</th>
				<th>Image</th>
				
                <th class="tool-title">Tool</th>
            </tr>
            <?php $index = ($objPage['pape']-1) * $objPage['itemsPerPage'];?>
            <?php if(isset($products)) { foreach($products as $product) { ?>
            <tr>
                <td class="text-center"><?php echo ++$index; ?></td>
                <td><?php echo $product['productname'] ?></td>
				<td class="number"><?php echo $product['price'] ?></td>
				<td class="number"><?php echo $product['pricediscount'] ?></td>
				<td class="text-right"><?php echo $product['discountpercent'] ?>%</td>
				<td><?php echo $product['summary'] ?></td>

				<td><?php echo $product['viewcout'] ?></td>
				<td><img width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $product['image'] ?>" /></td>
				
                <td class="text-center">
                    <?php if($_GET['type'] == 'popup'){ ?>
                    <button class="btn btn-sm btn-primary btnProductSelect"
                            productid="<?php echo $product['id']?>"
							productname="<?php echo $product['productname']?>"
							price="<?php echo $product['price']?>"
							pricediscount="<?php echo $product['pricediscount']?>"
							discountpercent="<?php echo $product['discountpercent']?>"
							summary="<?php echo $product['summary']?>"
							description="<?php echo $product['description']?>"
							viewcout="<?php echo $product['viewcout']?>"
							image="<?php echo $product['image']?>"
							
                            ><span class="fa fa-check"></span> Select</button>
                    <?php }else{ ?>
                    <button type="button" class="btn btn-sm btn-default btn-icon btn-danger btn-warning margin-0 margin-right-5" onclick="elife_Product.showDeleteDialog(<?php echo $product['id']?>, '<?php echo $product['productname'] ?>')"><span class="fa fa-trash"></span></button>
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=kotra/product/update&id=<?php echo $product[id] ?>'" type="button" class="btn btn-sm btn-default btn-icon btn-edit btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
                    <?php } ?>
                </td>
            </tr>
            <?php } } ?>
        </table>
    </div>
</div>

<div class="mobile-show">
    <div class="block" id="fitermobileProduct">
        <div class="form-group">

            <div class="col-md-6">
                <select id="sortcol" class="form-control">
                    <option value="">Sort</option>
                    <option value="productname">Movies name</option>
					<option value="price">Price</option>
					<option value="pricediscount">Price discount</option>
					<option value="discountpercent">Discountpercent</option>
					<option value="summary">Summary</option>

					<option value="viewcout">View count</option>
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
                <button type="button" class="btn btn-success form-control" id="btnSortProduct"><span class="fa fa-sort"></span> Sort</button>
            </div>
        </div>
    </div>
    <?php $index = 1;?>
    <?php if(isset($products)) { foreach($products as $product) { ?>
    <div class="itemrow">
        <label>#</label> <?php echo $index++ ?><br>
        <label>Movies name:</label> <?php echo $product['productname'] ?><br>
		<label>Price:</label> <span class="number"><?php echo $product['price'] ?></span><br>
		<label>Price discount:</label> <span class="number"><?php echo $product['pricediscount'] ?></span><br>
		<label>Discountpercent:</label> <?php echo $product['discountpercent'] ?><br>
		<label>Summary:</label> <?php echo $product['summary'] ?><br>

		<label>View count:</label> <?php echo $product['viewcout'] ?><br>
		<label>Image:</label> <img width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $product['image'] ?>" /><br>
		
        <div class="clear-mobile"></div>
        <div class="pull-right">
            <?php if($_GET['type'] == 'popup'){ ?>
                <button class="btn btn-sm btn-primary btnProductSelect"
                        productid="<?php echo $product['id']?>"
							productname="<?php echo $product['productname']?>"
							price="<?php echo $product['price']?>"
							pricediscount="<?php echo $product['pricediscount']?>"
							discountpercent="<?php echo $product['discountpercent']?>"
							summary="<?php echo $product['summary']?>"
							description="<?php echo $product['description']?>"
							viewcout="<?php echo $product['viewcout']?>"
							image="<?php echo $product['image']?>"
							
                        ><span class="fa fa-check"></span> Select</button>
                <?php }else{ ?>
            <button type="button" class="btn btn-default btn-icon btn-danger btn-warning margin-0 margin-right-5" onclick="elife_Product.showDeleteDialog(<?php echo $product['id']?>, '<?php echo $product['productname'] ?>')"><span class="fa fa-trash"></span></button>
            <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=kotra/product/update&id=<?php echo $product[id] ?>'" type="button" class="btn btn-default btn-icon btn-edit btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
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
    $('#fitermobileProduct #sortcol').val(sortcol);
        $('#fitermobileProduct #sorttype').val(sorttype);
    
        $('#fitermobileProduct #btnSortProduct').click(function(){
            $('#frmProductSearch #sorttype').val($('#fitermobileProduct #sorttype').val());
            $('#frmProductSearch #sortcol').val($('#fitermobileProduct #sortcol').val());
            elife_Product.search();
        });
    $('#product-list th').each(function(e){
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
        $('#frmProductSearch #sorttype').val('asc');
        $('#frmProductSearch #sortcol').val($(this).attr('sortcol'));
        elife_Product.search();
        $(this).removeClass('sort-asc');
        $(this).addClass('sort-desc');
    });
    $('.sort-asc').click(function(){
        $('#frmProductSearch #sorttype').val('desc');
        $('#frmProductSearch #sortcol').val($(this).attr('sortcol'));
        elife_Product.search();
        $(this).removeClass('sort-asc');
        $(this).addClass('sort-desc');
    });
    $('.sort-desc').click(function(){
        $('#frmProductSearch #sorttype').val('asc');
        $('#frmProductSearch #sortcol').val($(this).attr('sortcol'));
        elife_Product.search();
        $(this).removeClass('sort-desc');
        $(this).addClass('sort-asc');

    });
$(document).ready(function(){
    numberReady()
});

</script>