<div id="elife-news-list">
    <?php foreach($data_news as $item){ ?>
    <div class="news-item">
        <div class="image elife-left">
            <a href="<?php echo $item['link']?>">
                <img src="<?php echo DIR_USERIMAGE ?>autosize-100x0/<?php echo $item['image'] ?>">
            </a>
        </div>
        <div class="elife-left">
            <a class="title" href="<?php echo $item['link']?>">
                <?php echo $item['title']?>
            </a>
            <div>
                <?php echo $item['summary']?>
            </div>



        </div>

        <div class="elife-clear"></div>
    </div>
    <?php } ?>
    <div class="elife-clear"></div>
</div>