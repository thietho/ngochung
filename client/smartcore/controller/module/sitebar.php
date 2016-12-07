<?php
class ControllerModuleSitebar extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {

        $this->template = "module/sitebar.tpl";

        $this->render();
    }


}