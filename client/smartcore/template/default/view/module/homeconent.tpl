<?php echo $banner?>
<?php foreach($sitemaps as $sitemap){ ?>
<div class="item-block elife-left">
    <div class="item-image">
        <a href="<?php echo $this->document->createLink($sitemap['id'].'-'.$sitemap['sitemapid'])?>">
            <img src="<?php echo DIR_USERIMAGE ?>fixsize-297x194/<?php echo $sitemap['image']?>">
        </a>
    </div>
    <div class="item-info">
        <div class="item-title">
            <a href="#"><?php echo $sitemap['summary']?></a>
        </div>
        <div class="item-summary"><?php echo $sitemap['sitemapname']?></div>
    </div>
</div>
<?php } ?>
