<?php

/**
 * Class ControllerPageHome
 *
 *
 */
class ControllerPageHome extends Controller
{
    public function index()
    {

        $this->data['header'] = $this->load->controller("common/header");
        $this->data['footer'] = $this->load->controller("common/footer");

        $this->data['layoutid'] = $this->smartweb->layoutid;

        $this->template = "page/base.tpl";
        $this->render();
    }
}