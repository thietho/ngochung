<?php
/**
 * Class ControllerKotraCamera
 *
 *
 *
 */
class ControllerKotraCamera extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {

    }
    public function index()
    {
        $this->template = "kotra/camera.tpl";
        $this->render();
    }



}