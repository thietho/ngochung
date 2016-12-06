<?php

/**
 * Class ControllerCommonHeader
 * @property ModelCoreUser model_core_user
 * @property User user
 *
 */
class ControllerCommonHeader extends Controller
{
    public function __construct() {
        //load language
        $this->load->model("core/user");
        $this->language->load("common/header");
    }

    public function index()
    {
        //process owner data
        $this->data['logo'] = $this->config->get('config_logo');
        $this->data['user'] = $this->model_core_user->getItem($this->user->getId());

        //render html
        $this->template = "common/header.tpl";
        $this->render();
    }
}