<div class="container">
    <h3 class="text-standard text-uppercase"><strong><?php echo $lang_text_user_mangament ?></strong></h3>
    <div class="block">
        <div class="row">
            <form id="frmClientSearch">
                <div class="col-md-3">
                    <label class="control-label">Accout</label>
                    <input type="text" class="form-control input-control" placeholder="Name">
                </div>
                <div class="col-md-3">
                    <label class="control-label">Username</label>
                    <input type="text" class="form-control input-control" placeholder="Client">
                </div>
                <div class="col-md-3">
                    <label class="control-label">Status</label>
                    <select class="form-control">
                        <option value=""></option>
                        <?php foreach($this->document->portfolioStatus as $status => $statustext){ ?>
                        <option value="<?php echo $status?>"><?php echo $statustext?></option>
                        <?php } ?>
                    </select>
                </div>
                <div class="col-md-12 text-right">
                    <button id="btnSearch" class="btn btn-primary"><span class="fa fa-search"></span> Search</button>
                </div>
            </form>
        </div>
    </div>
    <!-- START BLOCk -->
    <div class="block">
        <div class="row">
            <div class="col-md-12">
                <div class="pull-left margin-bottom-20">
                    <button onclick="window.location = '?route=core/user/insert'" type="button" class="btn btn-default btn-bg btn-success"><span class="fa fa-plus"></span> <?php echo $lang_text_add ?></button>
                    <button onclick="confirmDeleteList()" type="button" class="btn btn-danger"><span class="fa fa-trash"></span> <?php echo $lang_text_delete ?></button>

                    <input type="hidden" name="type" value=""/>
                </div>
                <form id="formlist" name="formlist" method="post">
                    <table class="table table-striped table-bordered">
                        <tr>
                            <th class="sort-asc" width="5%"><input class="inputchk" type="checkbox" onclick="$('input[name*=\'delete\']').attr('checked', this.checked);"></th>
                            <th class="sort-asc" width="10%"><?php echo $lang_text_user_account ?></th>
                            <th class="sort-asc" width="15%"><?php echo $lang_text_user_name ?></th>
                            <th class="sort-asc" width="20%"><?php echo $lang_text_user_email ?></th>
                            <th class="sort-asc" width="10%"><?php echo $lang_text_user_image ?></th>
                            <th class="sort-asc" width="10%"><?php echo $lang_text_user_phone ?></th>
                            <th class="sort-asc" width="10%"><?php echo $lang_text_user_status ?></th>
                            <th class="tool-title-3" width="15%"><?php echo $lang_text_news_action ?></th>
                        </tr>


                        <?php foreach($users as $user) { ?>
                        <tr>
                            <td class="v-middle">
                                <?php if($user['username'] != 'admin') { ?>
                                <input class="<?php echo $user['username'] ?>" type="checkbox" name="delete[<?php echo $user['userid']?>]" value="<?php echo $user['userid']?>">
                                <?php } ?>
                            </td>
                            <td class="v-middle"><?php echo $user['username']?></td>
                            <td class="v-middle"><?php echo $user['fullname'] ?></td>
                            <td class="v-middle"><?php echo $user['email'] ?></td>
                            <td class="v-middle">
                                <?php if($user['imagepath'] != "") { ?>
                                <img class="img-rounded" width="48" height="48" src="<?php echo DIR_USERIMAGE ?>fixsize-48x48/<?php echo $user['imagepath'] ?>" />
                                <?php } else { ?>
                                <img class="img-rounded" width="48" height="48" src="<?php echo DIR_IMAGE ?>default-avatar.png" />
                                <?php } ?>
                            </td>
                            <td class="v-middle"><?php echo $user['phone'] ?></td>
                            <td class="v-middle">
                                <?php
                                            if($user['status'] == 'active') {
                                                echo $lang_text_status_active;
                                            } else {
                                                echo $lang_text_status_lock;
                                            }
                                            ?>
                            </td>
                            <td class="v-middle">
                                <a class="btn btn-default" href="?route=core/user/update&userid=<?php echo $user['userid']?>"><?php echo $lang_text_edit?></a>
                                <?php if($user['username'] != 'admin') { ?>
                                <?php if($user['status'] == 'lock') { ?>
                                <a class="btn btn-default" onclick="activeUser('<?php echo $user[userid]?>')"><?php echo $lang_text_status_active ?></a>
                                <?php } else { ?>
                                <a class="btn btn-default" onclick="activeUser('<?php echo $user[userid]?>')"><?php echo $lang_text_status_lock ?></a>
                                <?php } ?>
                                <?php } ?>
                            </td>
                        </tr>
                        <?php } ?>

                        <!--
                        <?php foreach($news as $item) { ?>
                        <tr>
                            <td class="v-middle"><input name="delete[<?php echo $item['mediaid'] ?>]" type="checkbox" value="<?php echo $item['mediaid'] ?>" /></td>
                            <td class="v-middle"><input type="text" name="position[<?php echo $item['mediaid']?>]" class="form-control control-width-tiny text-center" value="<?php echo $item['position']?>"   /></td></td>
                            <td class="v-middle"><?php echo $item['title'] ?></td>
                            <td class="v-middle">
                                <?php if($item['imagepath'] == '') { ?>
                                <img width="92" height="64" src="<?php echo DIR_IMAGE ?>noimage_92x64.jpg" />
                                <?php } else { ?>
                                <a class="fancybox-preview-image" href="<?php echo DIR_USERIMAGE ?>autosize-0x600/<?php echo $item['imagepath'] ?>">
                                    <img width="auto" height="64" src="<?php echo DIR_USERIMAGE ?>autosize-0x64/<?php echo $item['imagepath'] ?>" />
                                </a>
                                <?php } ?>
                                </a>
                            </td>
                            <td class="v-middle">
                                <a class="btn btn-default" href="<?php echo $item['edit_link'] ?>"><?php echo $lang_text_edit ?></a>
                                <a class="btn btn-default" href="<?php echo $item['preview_link']?>" target="_blank"><?php echo $lang_text_preview ?></a>
                                <?php
                                if($this->user->getUserTypeId() == "admin") {
                                if($items[$i]['status'] == "pending") {
                                ?>
                                <a class="btn btn-default" onclick="publish('<?php echo $item[mediaid] ?>','active')"><?php echo $lang_text_publish?></a>
                                <?php } else { ?>
                                <a class="btn btn-default" onclick="publish('<?php echo $item[mediaid] ?>','pending')"><?php echo $lang_text_hidden?></a>
                                <?php } } ?>
                            </td>
                        </tr>

                        <?php } ?>
                        -->
                    </table>
                    <div class="text-center">
                        <?php echo $pagination ?>
                    </div>
                </form>



            </div>
        </div>

    </div>
    <!-- END BLOCk -->
</div>

<script type="application/javascript">
    function confirmDeleteList() {
        var $param = $("#formlist").serialize();
        if($param.length == 0) {
            toastr.error('<div class="toast-title">' + '<?php echo $lang_text_notification ?>' + '</div><div class="toast-messsage">' + '<?php echo $lang_text_select_user_item ?>' + '</div>');
        } else {
            showSimpleModal("<?php echo $lang_text_delete_data ?>", "<?php echo $lang_text_confirm_delete ?>", "deleteUser()", "<?php echo $lang_text_cancel?>", "<?php echo $lang_text_delete ?>");
        }

    }

    function deleteUser() {
        closeSimpleModal();

        showloading();
        $.post("?route=core/user/delete", $("#formlist").serialize(),
                function ($data) {
                    endloading();
                    var $response = JSON.parse($data);
                    var $errors = $response['errors'];
                    if($response['status'] == 'failed') {
                        $("html, body").animate({ scrollTop: 0 }, "fast");
                        toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

                    } else {
                        toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                        window.location.reload();
                    }
                }
        );

    }

    function activeUser($userid) {
        showloading();
        $.post("?route=core/user/active", {userid: $userid}, function($data) {
            endloading();
            var $response = JSON.parse($data);
            var $errors = $response['errors'];
            if($response['status'] == 'failed') {
                $("html, body").animate({ scrollTop: 0 }, "fast");
                toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

            } else {
                toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                window.location.reload();
            }
        });
    }
</script>