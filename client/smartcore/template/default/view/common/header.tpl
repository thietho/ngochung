<div id="elife-btn-menu-mobile">
    <img src="<?php echo DIR_IMAGE?>btn-mobile-menu.png" width="40px">
</div>
<div id="elife-header">
    <img src="<?php echo DIR_USERIMAGE ?>autosize-946x148/<?php echo $header['settingvalue']?>">
</div>
<div id="elife-menu">
    <ul class="elife-left">
        <?php foreach($sitemaps as $key => $sitemap){ ?>
        <li><a href="<?php echo $sitemap['link']?>"><?php echo $sitemap['sitemapname']?></a></li>
        <?php if($key == 1){ ?>
        <li>
            <?php if($this->member->getUserName() == ''){ ?>
            <a href="<?php echo $this->document->createLink('login')?>">Đăng nhập</a>
            <?php } else { ?>
            <a href="<?php echo $this->document->createLink('member')?>">Tài khoản</a>
            <?php } ?>
        </li>
        <?php } ?>
        <?php } ?>

    </ul>
    <div id="elife-search" class="elife-right">
        <input type="text" placeholder="Tìm kiếm"><button type="button" ><span class="fa fa-search"></span></button>
    </div>
    <div class="elife-clear"></div>
</div>
<div id="elife-menu-mobile">
    <ul>
        <?php foreach($sitemaps as $key => $sitemap){ ?>
        <li><a href="<?php echo $sitemap['link']?>"><?php echo $sitemap['sitemapname']?></a></li>
        <?php if($key == 1){ ?>
        <li><a href="<?php echo $this->document->createLink('login')?>">Đăng nhập</a></li>
        <?php } ?>
        <?php } ?>
        <?php echo $menusitebar?>
    </ul>
</div>
<script language="JavaScript">
    $('#elife-btn-menu-mobile').click(function(){
        $('#elife-menu-mobile').toggle('slow','swing',function(){

            if($('#elife-menu-mobile').css('display')!='none')
            {
                $('#elife-btn-menu-mobile').css('right',$('#elife-menu-mobile').width());
            }
            else
                $('#elife-btn-menu-mobile').css('right','15px');
        });

    });
</script>