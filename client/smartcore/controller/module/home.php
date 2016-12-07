<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 12/7/2016
 * Time: 11:31 PM
 */
/**
 * Class ControllerModuleHome
 *
 *
 */
class ControllerModuleHome extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {
        $this->data['content'] = $this->load->controller('module/homecontent');
        $this->data['sitebar'] = $this->load->controller('module/sitebar');

        $this->template = "module/home.tpl";
        $this->layout = "page/home";

        $this->render();
    }


}