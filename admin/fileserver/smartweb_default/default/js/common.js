function escapeUnicode(str) {
    str= str.toLowerCase();
    str= str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a");
    str= str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e");
    str= str.replace(/ì|í|ị|ỉ|ĩ/g,"i");
    str= str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o");
    str= str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u");
    str= str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y");
    str= str.replace(/đ/g,"d");
    str= str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'| |\"|\&|\#|\[|\]|~|$|_/g,"-");
    /* tìm và thay thế các kí tự đặc biệt trong chuỗi sang kí tự - */
    str= str.replace(/-+-/g,"-"); //thay thế 2- thành 1-
    str= str.replace(/^\-+|\-+$/g,"");
    //cắt bỏ ký tự - ở đầu và cuối chuỗi
    return str;
}

/****************** CKEDITOR ******************/
function setCKEditorType(strID, intType, ckheight) {
    switch (intType) {
        case 0: // giao dien full
            CKEDITOR.replace(strID,
                {
                    toolbar: [
                        ['Source'],
                        ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript'],
                        ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'],
                        ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
                        ['Link', 'Unlink', 'Anchor'],
                        ['Image', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar'],['Print'],
                        '/',
                        ['Styles', 'Format', 'Font', 'FontSize'],
                        ['TextColor', 'BGColor'],
                        ['Maximize'],
                        ['RemoveFormat'],
                    ], height: ckheight
                });
            break;

        case 1: //Giao dien simply nhat
            CKEDITOR.replace(strID,
                {
                    toolbar: [
                        ['Source'],
                        ['Bold', 'Italic', 'Underline'],
                        ['Styles', 'Format', 'Font', 'FontSize', 'TextColor', 'BGColor'],
                        ['Image', 'Smiley'],
                        ['Link', 'Unlink'],
                        ['NumberedList', 'BulletedList'],
                        ['Outdent', 'Indent'],
                        ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
                        ['Iframe'],
                        ['RemoveFormat'],
                        ['Maximize']
                    ], height: ckheight
                });
            break;
    }
}
/*******************************************************************/
/***************************** VALIDATION **************************/
function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
/*******************************************************************/
/***************************** END VALIDATION **************************/
function showLoading()
{
    $('#loading').removeClass('hidden');
}
function endLoading()
{
    $('#loading').addClass('hidden');
}
function goPage(url,eid) {
    $('#'+eid).load(url);
}
function stringtoNumber(str)
{
    str = (""+str).replace(/,/g,"");
    var num = str*1;
    return num;
}
function formateNumber(num)
{
    if(num =="")
        return 0;

    num = String(num).replace(/,/g,"");
    num = Number(num);
    ar = (""+num).split("\.");
    div = ar[0];
    mod = ar[1];

    arr = new Array();
    block = "";

    for(i=div.length-1; i>=0 ; i--)
    {

        block = div[i] + block;

        if(block.length == 3)
        {
            arr.unshift(block);
            block ="";
        }

    }
    arr.unshift(block);

    divnum = arr.join(",");
    divnum = trim(divnum,",")
    divnum = divnum.replace("-,","-")
    if(mod == undefined)
        return divnum;
    else
        return divnum+"\."+mod;
}
function isNumber(char)
{
    if( char!=8 && char!=0 && (char<45 || char>57) )
    {
        //display error message
        //$("#errmsg").html("Digits Only").show().fadeOut("slow");
        return false;
    }
    else true
}
function trim(str, chars) {
    return ltrim(rtrim(str, chars), chars);
}
function ltrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}

function rtrim(str, chars) {
    chars = chars || "\\s";
    return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}
function numberReady()
{
    $(".number").change(function (e)
    {
        num = formateNumber($(this).val().replace(/,/g,""));
        $(this).val(num)
    });
    $(".number").keypress(function (e)
    {

        return isNumber(e.which);
    });

    $('.number').focus(function(e) {
        if(this.value == 0)
            this.value = "";
    });
    $('.number').blur(function(e) {
        if(this.value == "")
            this.value = 0;
    });

    $(".number").each(function(index){
        //alert(formateNumber($(this).val()))
        $(this).val(formateNumber($(this).val()));
        $(this).html(formateNumber($(this).html()))

    });
}
toastr.options.timeOut = 30000; // How long the toast will display without user interaction
toastr.options.extendedTimeOut = 60; // How long the toast will display after a user hovers over it
toastr.options.closeButton = true;
function addItemFile(eid,filepath)
{
    var s = DIR_USERIMAGE+"autosize-0x64/"+filepath;
    $("#"+eid).append('<div class="listfile" filepath="'+ filepath +'"><img src="'+s+'"> <button type="button" class="btn btn-sm btn-default btn-icon btn-danger margin-0 margin-right-5 btnDelFileList"><span class="fa fa-trash"></span></button></div>');
    $('#modal-select-file').modal('hide');
    $('.btnDelFileList').click(function(){
        $(this).parent().remove();
    });
}