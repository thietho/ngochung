<div class="block">
    <div class="title">
        <?php echo $sitemap['sitemapname']?>
    </div>
    <div class="content">
        <ul>
            <?php foreach($sitemap['childs'] as $child){ ?>
            <li><a href="<?php echo $child['link']?>"><?php echo $child['sitemapname']?></a></li>
            <?php } ?>

        </ul>
    </div>
</div>