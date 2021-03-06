function initialize()
{
    var jLocationX = $('#location_x');
    var jLocationY = $('#location_y');
    var jLocationZoom = $('#location_zoom');

    var locationX = jLocationX.val().trim() == '' ? '14.058324' : jLocationX.val().trim();
    var locationY = jLocationY.val().trim() == '' ? '108.277199' : jLocationY.val().trim();
    var locationZoom = jLocationZoom.val().trim() == '' ? '6' : jLocationZoom.val().trim();

    var x = parseFloat(locationX);
    var y = parseFloat(locationY);
    var zoom = parseInt(locationZoom);


    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(x, y);
    var myOptions =
    {
        zoom: zoom,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel: true
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    markerobj = new google.maps.Marker({
        map: map,
        position: latlng,
        draggable:true
    });

    markerobj.addListener('drag',function(event) {
        document.frmform.location_x.value = event.latLng.lat();
        document.frmform.location_y.value = event.latLng.lng();
    });

    google.maps.event.addListener(map, 'zoom_changed',changeZoom);
}

function codeAddress(address)
{
    if (geocoder)
    {
        geocoder.geocode( { 'address': address}, function(results, status)
        {
            if (status == google.maps.GeocoderStatus.OK)
            {
                map.panTo(results[0].geometry.location);
                markerobj.setPosition(results[0].geometry.location)
                setPosition(results[0].geometry.location)
            }
            else
            {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
    }
}


function setPosition(latLng)
{
    document.frmform.location_x.value = latLng.lat()
    document.frmform.location_y.value = latLng.lng()
}

function loadPosition()
{
    var x = parseFloat(document.frmform.location_x.value);
    var y = parseFloat(document.frmform.location_y.value);
    var latlng = new google.maps.LatLng(x, y);
    map.panTo(latlng);
    markerobj.setPosition(latlng)
}

function changeZoom()
{
    document.frmform.location_zoom.value=map.zoom;
}








$(document).ready(function(){
    initialize();

    for(var $languageid in $languages){
        setCKEditorType('summary' + $languageid, 0, '150px');
        setCKEditorType('description' + $languageid, 0, '500px');
        setCKEditorType('seo_content' + $languageid, 0, '150px');
    }

    $('#demo-date').datetimepicker({
        pickTime: false
    });
});


function save() {
    var jErrorMessage = $('.error-message');
    jErrorMessage.html('');
    jErrorMessage.hide();

    for(var x in $languages){
        var pageValue;
        var summary = CKEDITOR.instances['summary'+x] ;
        pageValue = summary.getData();
        $('textarea#summary'+x).val(pageValue);

        var description = CKEDITOR.instances['description'+x] ;
        pageValue = description.getData();
        $('textarea#description'+x).val(pageValue);

        var seo_content = CKEDITOR.instances['seo_content'+x] ;
        pageValue = seo_content.getData();
        $('textarea#seo_content'+x).val(pageValue);
    }

    showloading();
    $.post("?route=module/contactmap/save", $("#frmform").serialize(), function($data) {
        endloading();

        var $response = JSON.parse($data);
        var $errors = $response['errors'];
        if($response['status'] == 'failed') {
            var $error_panel = '<div class="alert alert-danger" role="alert">';
            $error_panel += '<a class="close" title="close" aria-label="close" data-dismiss="alert" href="#">×</a>';
            for (var $error_code in $errors) {
                if ($errors.hasOwnProperty($error_code)) {
                    $error_panel += '<p>-&nbsp;'+ $errors[$error_code] +'</p>';
                }
            }
            $error_panel += '</div>';
            jErrorMessage.append($error_panel);
            jErrorMessage.show();

            $("html, body").animate({ scrollTop: 0 }, "fast");
            toastr.error('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');

        } else {
            jErrorMessage.html('');
            jErrorMessage.hide();

            toastr.success('<div class="toast-title">'+ $response['title'] +'</div><div class="toast-messsage">'+ $response['message'] +'</div>');
        }
    });

}
