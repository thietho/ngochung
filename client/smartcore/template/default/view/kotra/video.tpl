<div id="elife-video">
    <div id="event" class="elife-left">

        <a href="?route=kotra/lazada"><img src="<?php echo DIR_IMAGE?>icon-lazada.png"></a>
        <a href="?route=kotra/lazada"><img src="<?php echo DIR_IMAGE?>icon-product.png"></a>
        <a href="?route=kotra/lazada"><img src="<?php echo DIR_IMAGE?>icon-event.png"></a>
    </div>
    <div id="video" class="elife-right">

        <!--<img src="<?php echo DIR_USERIMAGE?>fixsize-100x100/upload/movies/1/banner 1.jpg">-->

        <video id="player" width="679px" height="444px" controls="controls"></video>
    </div>
</div>
<div class="elife-clear"></div>

<ul id="playlist" style="display: none">
    <?php foreach($movies as $key => $item){ ?>
    <li id="item<?php echo $key?>">
        <span id="name"><?php echo $item['moviesname']?></span>
        <span id="path"><?php echo DIRECT_FILE_SERVER . $item['filename']?></span>
    </li>
    <?php } ?>
</ul>
<script type="application/javascript">
function Player(eid)
{
    this.player =document.getElementById(eid);
    this.index = 0;
    this.count = <?php echo count($movies)?>;

    this.setSrc = function(url)
    {
        this.player.src = url;
    }
    this.play = function()
    {
        this.player.play();
    }
    this.pause = function()
    {
        this.player.pause();
    }
}
var player = new Player('player');
player.setSrc($('#playlist #item0 #path').html());
//var VideoURL = "http://techslides.com/demos/sample-videos/small.webm";
//player.setSrc(VideoURL);
$(document).ready(function(){

    player.play();
    /*$('#elife-footer #home').click(function(){
        if($('#lazadaconn').css('display')== 'none')
        {
            $('#lazadaconn').css('display','block');
            player.pause();
            $('#iflazada').attr('src','http://www.lazada.vn/kotra/');
        }
        else
        {
            $('#lazadaconn').css('display','none');
            player.play();
            $('#iflazada').attr('src','');
        }
    });*/


});

player.player.addEventListener('ended',function(){
    if(player.index >= player.count - 1)
        player.index = 0;
    else
        player.index++;
    player.setSrc($('#playlist #item'+ player.index +' #path').html());
    player.play();
});

</script>