<div id="elife-news-detail">
    <div class="title">
        <?php echo $item['title']?>
    </div>
    <div class="elife-editor">
        <?php echo $item['description']?>
    </div>

</div>
<div id="oldernews">
    <ul>
        <?php foreach($oldernews as $news){ ?>
        <li><a href="<?php echo $news['link']?>"><?php echo $news['title']?></a></li>
        <?php } ?>
    </ul>

</div>