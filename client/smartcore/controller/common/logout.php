<?php

/**
 * Class ControllerCommonFooter
 *
 *
 * @property User user
 */
class ControllerCommonLogout extends Controller
{
    public function __construct() {

    }

    public function index()
    {
        $this->user->logout();
        $this->redirect(HTTP_WEB);
    }
}