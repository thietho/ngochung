<div class="block">
    <div class="title">
        <?php echo $sitemap['sitemapname']?>
    </div>
    <div class="content">
        <ul>
            <?php foreach($sitemap['data_news'] as $news){ ?>
            <li><a href="<?php echo $news['link']?>"><?php echo $news['title']?></a></li>
            <?php } ?>

        </ul>
    </div>
</div>