<div class="desktop-show">
    <table class="table"></table>
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <tr>
                <th>No.</th>
                <th class="sort-default" sortcol="title">Title</th>
				<th class="sort-default" sortcol="desscriptions">Desscriptions</th>
				<th class="sort-default" sortcol="createdate">Date</th>
				<th class="sort-default" sortcol="fullname">Full Name</th>
				<th class="sort-default" sortcol="phone">Phone</th>
				<th class="sort-default" sortcol="email">Email</th>
				<th class="sort-default" sortcol="status">Status</th>
				
                <th class="tool-title">Tool</th>
            </tr>
            <?php $index = ($objPage['pape']-1) * $objPage['itemsPerPage'];?>
            <?php if(isset($messages)) { foreach($messages as $message) { ?>
            <tr>
                <td class="text-center"><?php echo ++$index; ?></td>
                <td><?php echo $message['title'] ?></td>
				<td><?php echo $message['desscriptions'] ?></td>
				<td><?php echo $message['createdate'] ?></td>
				<td><?php echo $message['fullname'] ?></td>
				<td><?php echo $message['phone'] ?></td>
				<td><?php echo $message['email'] ?></td>
				<td><?php echo $message['status'] ?></td>
				
                <td class="text-center">
                    <?php if($_GET['type'] == 'popup'){ ?>
                    <button class="btn btn-sm btn-primary btnMessageSelect"
                            messageid="<?php echo $message['id']?>"
							title="<?php echo $message['title']?>"
							desscriptions="<?php echo $message['desscriptions']?>"
							createdate="<?php echo $message['createdate']?>"
							fullname="<?php echo $message['fullname']?>"
							phone="<?php echo $message['phone']?>"
							email="<?php echo $message['email']?>"
							status="<?php echo $message['status']?>"
							
                            ><span class="fa fa-check"></span> Select</button>
                    <?php }else{ ?>
                    <button type="button" class="btn btn-sm btn-default btn-icon btn-danger btn-warning margin-0 margin-right-5" onclick="elife_Message.showDeleteDialog(<?php echo $message['id']?>, '<?php echo $message['title'] ?>')"><span class="fa fa-trash"></span></button>
                    <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=core/message/update&id=<?php echo $message[id] ?>'" type="button" class="btn btn-sm btn-default btn-icon btn-edit btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
                    <?php } ?>
                </td>
            </tr>
            <?php } } ?>
        </table>
    </div>
</div>

<div class="mobile-show">
    <div class="block" id="fitermobileMessage">
        <div class="form-group">

            <div class="col-md-6">
                <select id="sortcol" class="form-control">
                    <option value="">Sort</option>
                    <option value="title">Title</option>
					<option value="desscriptions">Desscriptions</option>
					<option value="createdate">Date</option>
					<option value="fullname">Full Name</option>
					<option value="phone">Phone</option>
					<option value="email">Email</option>
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
                <button type="button" class="btn btn-success form-control" id="btnSortMessage"><span class="fa fa-sort"></span> Sort</button>
            </div>
        </div>
    </div>
    <?php $index = 1;?>
    <?php if(isset($messages)) { foreach($messages as $message) { ?>
    <div class="itemrow">
        <label>#</label> <?php echo $index++ ?><br>
        <label>Title:</label> <?php echo $message['title'] ?><br>
		<label>Desscriptions:</label> <?php echo $message['desscriptions'] ?><br>
		<label>Date:</label> <?php echo $message['createdate'] ?><br>
		<label>Full Name:</label> <?php echo $message['fullname'] ?><br>
		<label>Phone:</label> <?php echo $message['phone'] ?><br>
		<label>Email:</label> <?php echo $message['email'] ?><br>
		<label>Status:</label> <?php echo $message['status'] ?><br>
		
        <div class="clear-mobile"></div>
        <div class="pull-right">
            <?php if($_GET['type'] == 'popup'){ ?>
                <button class="btn btn-sm btn-primary btnMessageSelect"
                        messageid="<?php echo $message['id']?>"
							title="<?php echo $message['title']?>"
							desscriptions="<?php echo $message['desscriptions']?>"
							createdate="<?php echo $message['createdate']?>"
							fullname="<?php echo $message['fullname']?>"
							phone="<?php echo $message['phone']?>"
							email="<?php echo $message['email']?>"
							status="<?php echo $message['status']?>"
							
                        ><span class="fa fa-check"></span> Select</button>
                <?php }else{ ?>
            <button type="button" class="btn btn-default btn-icon btn-danger btn-warning margin-0 margin-right-5" onclick="elife_Message.showDeleteDialog(<?php echo $message['id']?>, '<?php echo $message['title'] ?>')"><span class="fa fa-trash"></span></button>
            <button onclick="window.location.href='<?php echo HTTP_WEB ?>?route=core/message/update&id=<?php echo $message[id] ?>'" type="button" class="btn btn-default btn-icon btn-edit btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
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
    $('#fitermobileMessage #sortcol').val(sortcol);
        $('#fitermobileMessage #sorttype').val(sorttype);
    
        $('#fitermobileMessage #btnSortMessage').click(function(){
            $('#frmMessageSearch #sorttype').val($('#fitermobileMessage #sorttype').val());
            $('#frmMessageSearch #sortcol').val($('#fitermobileMessage #sortcol').val());
            elife_Message.search();
        });
    $('#message-list th').each(function(e){
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
        $('#frmMessageSearch #sorttype').val('asc');
        $('#frmMessageSearch #sortcol').val($(this).attr('sortcol'));
        elife_Message.search();
        $(this).removeClass('sort-asc');
        $(this).addClass('sort-desc');
    });
    $('.sort-asc').click(function(){
        $('#frmMessageSearch #sorttype').val('desc');
        $('#frmMessageSearch #sortcol').val($(this).attr('sortcol'));
        elife_Message.search();
        $(this).removeClass('sort-asc');
        $(this).addClass('sort-desc');
    });
    $('.sort-desc').click(function(){
        $('#frmMessageSearch #sorttype').val('asc');
        $('#frmMessageSearch #sortcol').val($(this).attr('sortcol'));
        elife_Message.search();
        $(this).removeClass('sort-desc');
        $(this).addClass('sort-asc');

    });


</script>