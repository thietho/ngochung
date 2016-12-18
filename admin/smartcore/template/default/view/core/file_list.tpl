<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <th>File name</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <?php foreach($files as $file){ ?>
    <tr>
        <td><img src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo str_replace(DIR_FILE,'',$file['dirname']).'/'.$file['basename']?>"><?php echo $file['basename']?></td>
        <td class="text-center">
            <?php if($eid != ''){ ?>
            <button type="button" class="btn btn-sm btn-default btn-bg btn-success btnSelectFile"
                    filepath="<?php echo str_replace(DIR_FILE,'',$file['dirname']).'/'.$file['basename']?>"
                    filename="<?php echo $file['basename']?>"><span class="fa fa-check"></span>Select</button>
            <?php } else{ ?>
            <button type="button" class="btn btn-sm btn-default btn-bg btn-success btnDownloadFile"
                    filepath="<?php echo str_replace(DIR_FILE,'',$file['dirname']).'/'.$file['basename']?>"
                    filename="<?php echo $file['basename']?>" link="<?php echo $file['link']?>"><span class="fa fa-download"></span>Download</button>
            <?php } ?>
            <button class="btn btn-sm btn-default btn-bg btn-danger btnDeleteFile"
                    filepath="<?php echo $file['dirname'].'/'.$file['basename']?>"
                    filename="<?php echo $file['basename']?>"><span class="fa fa-trash"></span> Delete</button>
        </td>
    </tr>

    <?php } ?>
    </tbody>
</table>

