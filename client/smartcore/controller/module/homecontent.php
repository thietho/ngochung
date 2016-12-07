<?php
class ControllerModuleHomecontent extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {
        $this->data['banner'] = $this->load->controller('home/banner');
        $this->template = "module/homeconent.tpl";

        $this->render();
    }


}