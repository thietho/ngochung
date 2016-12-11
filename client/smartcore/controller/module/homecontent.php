<?php
/**
 * Class ControllerModuleSetting
 * @property ModelModuleMovies model_module_movies
 * @property ModelModuleSetting model_module_setting
 * @property ModelCoreSitemap model_core_sitemap
 *
 */
class ControllerModuleHomecontent extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {

        $this->load->model('module/setting');
        $this->load->model('core/sitemap');
        $this->data['banner'] = $this->load->controller('home/banner');
        $sitemaphome = $this->model_module_setting->getItemName('sitemaphome');
        $listid = json_decode($sitemaphome['settingvalue'],true);
        $this->data['sitemaps'] = array();
        foreach($listid as $key => $id)
        {
            $this->data['sitemaps'][$key] = $this->model_core_sitemap->getItem($id);
            $this->data['sitemaps'][$key]['summary'] = $this->model_core_sitemap->getItemValue($id,'summary');
            $this->data['sitemaps'][$key]['image'] = $this->model_core_sitemap->getItemValue($id,'image');
        }

        $this->template = "module/homeconent.tpl";

        $this->render();
    }


}