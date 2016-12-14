<?php
/**
 * Class ControllerModuleLogin
 * @property ModelCoreSitemap model_core_sitemap
 *
 */
class ControllerAddonLogin extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {
        $this->template = "addon/login.tpl";
        $this->render();
    }


}