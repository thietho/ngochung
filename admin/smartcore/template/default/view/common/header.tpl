<a href="<?php echo MAIN_HTTP_SERVER?>" class="app-header-logo app-header-logo-light app-header-logo-condensed">Project</a>

<ul class="app-header-buttons pull-right">
    <li>
        <div class="contact contact-rounded contact-bordered contact-lg contact-ps-controls">
            <img src="<?php echo DIR_IMAGE ?>no-image.png" alt="John Doe">
            <div class="contact-container"><a href="?route=core/user/update&userid=<?php echo $this->user->getId()?>"><?php echo $this->user->getUserName()?></a> <span></span></div>
            <div class="contact-controls">
                <div class="dropdown">
                    <button type="button" class="btn btn-default btn-icon" data-toggle="dropdown"><span class="icon-cog"></span></button>
                    <ul class="dropdown-menu dropdown-left">

                        <li><a href="?route=core/user/changepassword"><span class="icon-key"></span> Change Password </a></li>
                        <li class="divider"></li>
                        <li><a href="<?php echo ROOT_HTTP_SERVER ?>logout.php"><span class="icon-exit-right"></span> Log Out</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </li>
</ul>

