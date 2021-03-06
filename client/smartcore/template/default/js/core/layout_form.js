var $jLayoutId = $('#layoutid');

function save() {
    //validate form
    if(validate_form()) {
        showloading();
        $.post("?route=core/layout/save", $("#frmform").serialize(), function($data) {
            endloading();
            var $response = JSON.parse($data);
            var $errors = $response['errors'];
            if($response['status'] == 'failed') {
                for (var $error_code in $errors) {
                    if ($errors.hasOwnProperty($error_code)) {
                        if($error_code == 'layoutid') {
                            showError($jLayoutId, 'layoutid');
                        }
                        if($error_code == 'layoutid_duplicated') {
                            showError($jLayoutId, 'layoutid_duplicated');
                        }
                    }
                }
                $("html, body").animate({ scrollTop: 0 }, "fast");
                toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

            } else {
                toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
                if($response['updatetype'] == 'insert') {
                    window.location.href = "<?php echo $cancel_link ?>";
                }
            }
        });
    }
}

function showError($jSelector, $classHelp) {
    $jSelector.parent().addClass('has-error');
    $jSelector.siblings("." + $classHelp).css('display', 'inline-block');
}

function hideError($jSelector, $classHelp) {
    $jSelector.parent().removeClass('has-error');
    $jSelector.siblings("." + $classHelp).css('display', 'none');
}


function validate_form() {
    var $isValid = true;
    var $layoutid = $jLayoutId.val().trim();

    if(0 == $layoutid.length) {
        showError($jLayoutId, 'layoutid');
        $isValid = false;
    } else {
        hideError($jLayoutId, 'layoutid');
    }

    return $isValid;
}


function deleteAddon(owner) {
    $(owner).parent().parent().remove();
}


//class Splash
function Splash()
{
    this.index = 0;
    this.addAddon=function($addonid, $addonname, $sortorder){
        var $row = '<tr>';
        $row += '<td class="v-middle">';
        $row += $addonid + '<input type="hidden" name="layout_component[splash]['+ splash.index +'][addonid]" value="'+ $addonid +'" />';
        $row += '</td>';
        $row += '<td class="v-middle">'+ $addonname +'</td>';
        $row += '<td class="v-middle"><input type="text" name="layout_component[splash]['+ splash.index +'][sortorder]" class="form-control control-width-tiny text-center" value="'+ $sortorder +'" /></td>';
        $row += '<td class="v-middle"><a class="btn btn-default" onclick="deleteAddon(this)" ><?php echo $lang_text_delete ?></a></td>';
        $row += '</tr>';

        splash.index++;
        $('#splash-addon-list').append($row);
    }
}
var splash = new Splash();
splash.index = $countSplash;


function addAddonSplash() {
    var $addonid = $('#splash-addon-source').val();
    var $addonname = $("#splash-addon-source option:selected").text();
    splash.addAddon($addonid, $addonname, 1);
}


//Dashboard
function Dashboard()
{
    this.index = 0;
    this.addAddon=function($addonid, $addonname, $sortorder){
        var $row = '<tr>';
        $row += '<td class="v-middle">';
        $row += $addonid + '<input type="hidden" name="layout_component[dashboard]['+ dashboard.index +'][addonid]" value="'+ $addonid +'" />';
        $row += '</td>';
        $row += '<td class="v-middle">'+ $addonname +'</td>';
        $row += '<td class="v-middle"><input type="text" name="layout_component[dashboard]['+ dashboard.index +'][sortorder]" class="form-control control-width-tiny text-center" value="'+ $sortorder +'" /></td>';
        $row += '<td class="v-middle"><a class="btn btn-default" onclick="deleteAddon(this)" ><?php echo $lang_text_delete ?></a></td>';
        $row += '</tr>';

        dashboard.index++;
        $('#dashboard-addon-list').append($row);
    }
}
var dashboard = new Dashboard();
dashboard.index = $countDashboard;


function addAddonDashboard() {
    var $addonid = $('#dashboard-addon-source').val();
    var $addonname = $("#dashboard-addon-source option:selected").text();
    dashboard.addAddon($addonid, $addonname, 1);
}



//Sidebar Left
function SidebarLeft()
{
    this.index = 0;
    this.addAddon=function($addonid, $addonname, $sortorder){
        var $row = '<tr>';
        $row += '<td class="v-middle">';
        $row += $addonid + '<input type="hidden" name="layout_component[sidebarleft]['+ sidebarLeft.index +'][addonid]" value="'+ $addonid +'" />';
        $row += '</td>';
        $row += '<td class="v-middle">'+ $addonname +'</td>';
        $row += '<td class="v-middle"><input type="text" name="layout_component[sidebarleft]['+ sidebarLeft.index +'][sortorder]" class="form-control control-width-tiny text-center" value="'+ $sortorder +'" /></td>';
        $row += '<td class="v-middle"><a class="btn btn-default" onclick="deleteAddon(this)" ><?php echo $lang_text_delete ?></a></td>';
        $row += '</tr>';

        sidebarLeft.index++;
        $('#sidebarleft-addon-list').append($row);
    }
}
var sidebarLeft = new SidebarLeft();
sidebarLeft.index = $countSidebarLeft;


function addAddonSidebarLeft() {
    var $addonid = $('#sidebarleft-addon-source').val();
    var $addonname = $("#sidebarleft-addon-source option:selected").text();
    sidebarLeft.addAddon($addonid, $addonname, 1);
}


//Sidebar Right
function SidebarRight()
{
    this.index = 0;
    this.addAddon=function($addonid, $addonname, $sortorder){
        var $row = '<tr>';
        $row += '<td class="v-middle">';
        $row += $addonid + '<input type="hidden" name="layout_component[sidebarright]['+ sidebarRight.index +'][addonid]" value="'+ $addonid +'" />';
        $row += '</td>';
        $row += '<td class="v-middle">'+ $addonname +'</td>';
        $row += '<td class="v-middle"><input type="text" name="layout_component[sidebarright]['+ sidebarRight.index +'][sortorder]" class="form-control control-width-tiny text-center" value="'+ $sortorder +'" /></td>';
        $row += '<td class="v-middle"><a class="btn btn-default" onclick="deleteAddon(this)" ><?php echo $lang_text_delete ?></a></td>';
        $row += '</tr>';

        sidebarRight.index++;
        $('#sidebarright-addon-list').append($row);
    }
}
var sidebarRight = new SidebarRight();
sidebarRight.index = $countSidebarRight;


function addAddonSidebarRight() {
    var $addonid = $('#sidebarright-addon-source').val();
    var $addonname = $("#sidebarright-addon-source option:selected").text();
    sidebarRight.addAddon($addonid, $addonname, 1);
}




