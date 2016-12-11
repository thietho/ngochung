<div id="elife-news-list">
    <?php foreach($data_news as $item){ ?>
    <div class="news-item">
        <?php if($item['image']){ ?>
        <a href="<?php echo $item['link']?>" class="elife-left">
            <img src="<?php echo DIR_USERIMAGE ?>autosize-100x0/<?php echo $item['image'] ?>">
        </a>
        <?php } ?>
        <a class="title" href="<?php echo $item['link']?>">
            <?php echo $item['title']?>
        </a>
        <p>
            <?php echo $item['summary']?>
        </p>





        <div class="elife-clear"></div>
    </div>
    <?php } ?>
    <div class="elife-clear"></div>
</div>