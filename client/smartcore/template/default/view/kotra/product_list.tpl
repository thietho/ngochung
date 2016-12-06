<div id="elife-product-list">
    <?php foreach($products as $product){ ?>
    <div class="product-item elife-left">
        <a href="?route=kotra/product/detail&id=<?php echo $product['id']?>">
            <div class="discountpercent"><?php echo $this->string->numberFormate($product['discountpercent']) ?>%</div>
            <img src="<?php echo DIR_USERIMAGE ?>fixsize-503x236/<?php echo $product['image'] ?>">
            <div class="info">
                <div class="viewcout"><?php echo $this->string->numberFormate($product['viewcout']) ?> lược xem</div>
                <div class="detail">Chi tiết ></div>
                <div class="productname elife-left"><?php echo $product['productname'] ?></div>
                <div class="price-show elife-right">
                    <div class="price text-right"><?php echo $this->string->numberFormate($product['price']) ?>VNĐ</div>
                    <div class="pricediscount text-right"><?php echo $this->string->numberFormate($product['pricediscount']) ?>VNĐ</div>
                </div>


                <div class="elife-clear"></div>

            </div>

        </a>


    </div>
    <?php } ?>
    <div class="elife-clear"></div>
</div>