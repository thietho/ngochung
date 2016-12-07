<div id="elife-banner">

</div>
<div id="srcbanner" style="display: none">
    <?php foreach($listfile as $file){ ?>
    <div>
        <img src="<?php echo DIR_USERIMAGE ?>fixsize-629x212/<?php echo $file?>">
    </div>

    <?php } ?>
</div>
<script type="application/javascript">
function Banner()
{
    this.index = 0;
    this.count = 0;
    this.listimage = new Array();
    this.getList = function()
    {
        $('#srcbanner div').each(function(){
            banner.listimage.push($(this).html());
            banner.count++;
        });
    }
    this.show = function()
    {
        $('#elife-banner').html(this.listimage[this.index++]);
        if(this.index > this.count-1)
            this.index = 0;
    }
}
    var banner = new Banner();
    banner.getList();
    banner.show();
    var timer = setInterval(function(){

        banner.show();
    },5000)

</script>