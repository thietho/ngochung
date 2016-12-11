<?php
class ControllerModuleInfomation extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {

        $this->template = "module/infomation.tpl";

        $this->render();
    }


}