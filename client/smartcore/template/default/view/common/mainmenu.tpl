<nav>
    <ul>
        <li class="<?php echo $this->request->get['route'] == 'kotra/movies' ? 'active' : '' ?>">
            <a href="<?php echo HTTP_WEB ?>?route=kotra/movies"><span class="icon-home"></span>&nbsp;Movies</a>
            <ul></ul>
        </li>
        <li class="<?php echo $this->request->get['route'] == 'kotra/setting' ? 'active' : '' ?>">
            <a href="<?php echo HTTP_WEB ?>?route=kotra/setting"><span class="icon-users2"></span>&nbsp;Setting</a>
            <ul></ul>
        </li>

    </ul>
</nav>