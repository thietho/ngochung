<div id="elife-header">

</div>
<div id="elife-menu">
    <ul class="elife-left">
        <?php foreach($sitemaps as $sitemap){ ?>
        <li><a href="<?php echo $sitemap['link']?>"><?php echo $sitemap['sitemapname']?></a></li>
        <?php } ?>

    </ul>
    <div id="elife-search" class="elife-right">
        <input type="text" placeholder="Tìm kiếm"><button type="button" ><span class="fa fa-search"></span></button>
    </div>
    <div class="elife-clear"></div>
</div>
