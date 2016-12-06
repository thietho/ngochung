<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <th class="sort-asc id-title">No.</th>
        <th class="sort-asc">Client / Account</th>
        <th class="sort-asc">Username</th>
        <th class="sort-asc">Portfolio</th>
        <th class="sort-asc">Status</th>
        <th class="tool-title-3">Control</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach($clients as $key => $item){ ?>
    <tr>
        <td class="text-center"><?php echo $key + 1 ?></td>
        <td><?php echo $item['fullname']?></td>
        <td><?php echo $item['username']?></td>
        <td><?php echo $item['listportfolioname']?></td>
        <td>

            <span class="label <?php echo ($item['status'] == 'active')? 'label-success':'label-primary';?> label-bordered"><?php echo $this->document->status[$item['status']]?></span>
        </td>
        <td class="text-center">
            <?php if($_GET['type'] == 'popup'){ ?>
            <button class="btn btn-sm btn-primary btnClientSelect"
                    clientid="<?php echo $item['id']?>"
                    fullname="<?php echo $item['fullname']?>"
                    username="<?php echo $item['username']?>"
                    ><span class="fa fa-check"></span> Select</button>
            <?php }else{ ?>
            <button onclick="window.location.href='?route=fmra/client/update&id=<?php echo $item['id']?>'" type="button" class="btn btn-sm btn-default btn-icon btn-info margin-0 margin-right-5"><span class="fa fa-edit"></span></button>
            <button type="button" class="btn btn-sm btn-default btn-icon btn-danger margin-0 margin-right-5" onclick="client.showDeleteDialog(<?php echo $item['id']?>)"><span class="fa fa-trash"></span></button>
            <?php if($item['status'] == 'active'){ ?>
            <a type="button" class="btn btn-sm btn-warning btn-default margin-0 margin-right-5" target="_blank" href="http://localhost:81/FMRA/client/?route=page/login&username=<?php echo $item['username']?>&password=<?php echo $item['password']?>&safemode=fmra@@"><span class="fa fa-sign-in"> </span> Auto login</a>
            <?php }else{ ?>
            <a type="button" class="btn btn-sm btn-warning btn-default margin-0 margin-right-5" href="#"><span class="fa fa-sign-in"> </span> Auto login</a>
            <?php } ?>
            <button type="button" class="btn btn-sm btn-primary btn-default margin-0 margin-right-5" onclick="client.showResetPassForm(<?php echo $item['id']?>)"><span class="fa fa-key"></span> Reset password</button>
            <?php } ?>
        </td>
    </tr>
    <?php } ?>
    </tbody>
</table>
<?php echo $pagination?>
