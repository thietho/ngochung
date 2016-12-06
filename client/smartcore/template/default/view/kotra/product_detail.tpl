<div id="elife-product-detail">
    <div class="image elife-left">
        <img src="<?php echo DIR_USERIMAGE ?>autosize-450x0/<?php echo $product['imagedetail'] ?>">
    </div>
    <div class="detail elife-right">

        <div class="productname elife-left"><p><?php echo $product['productname'] ?></p></div>
        <div class="elife-clear"></div>
        <div class="elife-line"></div>

        <div class="title elife-left">Giá</div>
        <div class="price-show elife-left">
            <div class="price"><?php echo $this->string->numberFormate($product['price']) ?>VNĐ</div>
            <div class="pricediscount"><?php echo $this->string->numberFormate($product['pricediscount']) ?>VNĐ</div>
        </div>
        <div class="discountpercent elife-right"><?php echo $this->string->numberFormate($product['discountpercent']) ?>%</div>
        <div class="elife-clear"></div>
        <div style="height: 16px"></div>
        <div class="elife-line"></div>
        <?php echo $product['summary']?>
    </div>
    <div class="elife-clear"></div>
    <div class="elife-editor">
        <?php echo $product['description']?>
    </div>

</div>