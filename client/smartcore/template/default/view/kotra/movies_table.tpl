<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <th class="sort-asc id-title">No.</th>
        <th class="sort-asc">Movies name</th>
        <th class="sort-asc">File name</th>
        <th class="sort-asc">Image</th>
        <th class="sort-asc">Status</th>
        <th class="tool-title-3">Control</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach($movies as $key => $item){ ?>
    <tr>
        <td class="text-center"><?php echo $key + 1 ?></td>
        <td><?php echo $item['moviesname']?></td>
        <td><?php echo $item['filename']?></td>
        <td>
            <img width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $item['image'] ?>" />
        </td>
        <td>

            <span class="label <?php echo ($item['status'] == 'active')? 'label-success':'label-primary';?> label-bordered"><?php echo $this->document->status[$item['status']]?></span>
        </td>
        <td class="text-center">
            <?php if($_GET['type'] == 'popup'){ ?>
            <button class="btn btn-sm btn-primary btnClientSelect"
                    moviesid="<?php echo $item['id']?>"
                    moviesname="<?php echo $item['moviesname']?>"
                    filename="<?php echo $item['filename']?>"
                    image="<?php echo $item['image']?>"
                    ><span class="fa fa-check"></span> Select</button>
            <?php }else{ ?>
            <button onclick="window.location.href='?route=kotra/movies/update&id=<?php echo $item['id']?>'" type="button" class="btn btn-sm btn-default btn-icon btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
            <button type="button" class="btn btn-sm btn-default btn-icon btn-danger margin-0 margin-right-5" onclick="movies.showDeleteDialog(<?php echo $item['id']?>,'<?php echo $item['moviesname']?>')"><span class="fa fa-trash"></span></button>

            <?php } ?>
        </td>
    </tr>
    <?php } ?>
    </tbody>
</table>
<?php echo $pagination?>
