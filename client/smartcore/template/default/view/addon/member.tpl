<h1 class="title">
    Tài khoản
</h1>
	
    <div class="ben-section-content">
    	<p>
    		<?php echo @$member['fullname']?> (<?php echo @$member['username']?>)
    	</p>
        <p>
        	<a href="<?php echo @$this->document->createLink('memberinfor')?>">Thông tin cá nhân</a>
        </p>
        <p>
        	<a href="<?php echo @$this->document->createLink('changepass')?>">Đổi mật khẩu</a>
        </p>
        <p>
        	<a href="<?php echo @$this->document->createLink('myfile')?>">File của tôi</a>
        </p>

        <p>
        	<a href="#" onclick="logout()">Đăng xuất</a>
        </p>
    </div>
