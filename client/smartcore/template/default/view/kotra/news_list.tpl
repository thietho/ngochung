<div id="elife-news-list">
    <?php foreach($data_news as $item){ ?>
    <div class="news-item elife-left">
        <a href="?route=kotra/news/detail&id=<?php echo $item['id']?>">
            <img src="<?php echo DIR_USERIMAGE ?>fixsize-503x333/<?php echo $item['image'] ?>">
        </a>
    </div>
    <?php } ?>
    <div class="elife-clear"></div>
</div>