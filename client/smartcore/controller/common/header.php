<?php

/**
 * Class ControllerCommonHeader
 * @property ModelCoreUser model_core_user
 * @property ModelCoreSitemap model_core_sitemap
 * @property User user
 *
 */
class ControllerCommonHeader extends Controller
{
    public function __construct() {
        //load language
        $this->load->model("core/user");
        //$this->language->load("common/header");
    }

    public function index()
    {
        //process owner data
        //$this->data['logo'] = $this->config->get('config_logo');
        //$this->data['user'] = $this->model_core_user->getItem($this->user->getId());
        $this->data['sitemaps'] = $this->model_core_sitemap->getChild(26);
        foreach($this->data['sitemaps'] as $key => $sitemap)
        {
            $this->data['sitemaps'][$key]['link'] = $this->document->createLinkBySiteMap($sitemap);
            /*if($key == 1)
            {
                $this->data['sitemaps']['login']['sitemapname'] = "Đăng nhập";
                $this->data['sitemaps']['login']['link'] = $this->document->createLink('login');
            }*/
        }
        $this->load->model('module/setting');
        $this->data['header'] = $this->model_module_setting->getItemName('header');
        //render html
        $this->template = "common/header.tpl";
        $this->render();
    }
}