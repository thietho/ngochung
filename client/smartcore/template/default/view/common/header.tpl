<div id="elife-header">
    <div id="datetime" class="elife-right">
        DATE: <span id="date">26 Oct</span><br>
        TIME: <span id="time">08:00</span>
    </div>
    <div class="elife-clear"></div>
</div>
<script type="application/javascript">
    var arrmounth = new Array();
    arrmounth[0] = 'Jan';
    arrmounth[1] = 'Feb';
    arrmounth[2] = 'Mar';
    arrmounth[3] = 'Apr';
    arrmounth[4] = 'May';
    arrmounth[5] = 'Jun';
    arrmounth[6] = 'Jul';
    arrmounth[7] = 'Aug';
    arrmounth[8] = 'Sep';
    arrmounth[9] = 'Oct';
    arrmounth[10] = 'Nov';
    arrmounth[11] = 'Dec';

    var dt = new Date();

    $('#elife-header #date').html(numToString(dt.getDate(),2) + " "+ arrmounth[dt.getMonth()]);
    $('#elife-header #time').html(numToString(dt.getHours(),2) + ":"+ numToString(dt.getMinutes(),2));
    var mytime = setInterval(function(){
        $('#elife-header #time').html(numToString(dt.getHours(),2) + ":"+ numToString(dt.getMinutes(),2)+":"+numToString(dt.getSeconds(),2));
    },1000)
</script>