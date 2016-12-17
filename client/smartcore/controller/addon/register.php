<?php
/**
 * Class ControllerModuleRegister
 * @property ModelCoreSitemap model_core_sitemap
 *
 */
class ControllerAddonRegister extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {
        $this->template = "addon/register.tpl";
        $this->render();
    }


}