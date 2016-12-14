<div id="elife-header">
    <img src="<?php echo DIR_USERIMAGE ?>autosize-964x148/<?php echo $header['settingvalue']?>">
</div>
<div id="elife-menu">
    <ul class="elife-left">
        <?php foreach($sitemaps as $key => $sitemap){ ?>
        <li><a href="<?php echo $sitemap['link']?>"><?php echo $sitemap['sitemapname']?></a></li>
        <?php if($key == 1){ ?>
        <li><a href="<?php echo $this->document->createLink('login')?>">Đăng nhập</a></li>
        <?php } ?>
        <?php } ?>

    </ul>
    <div id="elife-search" class="elife-right">
        <input type="text" placeholder="Tìm kiếm"><button type="button" ><span class="fa fa-search"></span></button>
    </div>
    <div class="elife-clear"></div>
</div>
