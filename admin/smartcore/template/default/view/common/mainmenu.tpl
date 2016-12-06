<nav>
    <ul>
        <li class="<?php echo $this->request->get['route'] == 'core/sitemap' ? 'active' : '' ?>">
            <a href="<?php echo HTTP_WEB ?>?route=core/sitemap"><span class="icon-home"></span>&nbsp;Site map</a>
            <ul></ul>
        </li>
        <li class="<?php echo $this->request->get['route'] == 'kotra/product' ? 'active' : '' ?>">
            <a href="<?php echo HTTP_WEB ?>?route=kotra/product"><span class="icon-box"></span>&nbsp;Products</a>
            <ul></ul>
        </li>
        <li class="<?php echo $this->request->get['route'] == 'kotra/news' ? 'active' : '' ?>">
            <a href="<?php echo HTTP_WEB ?>?route=kotra/news"><span class="icon-bullhorn"></span>&nbsp;News</a>
            <ul></ul>
        </li>
        <li class="<?php echo $this->request->get['route'] == 'kotra/setting' ? 'active' : '' ?>">
            <a href="<?php echo HTTP_WEB ?>?route=kotra/setting"><span class="icon-cog"></span>&nbsp;Setting</a>
            <ul></ul>
        </li>

    </ul>
</nav>