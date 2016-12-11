<?php
/**
 * Class ControllerModulePagedetail
 * @property ModelCoreSitemap model_core_sitemap
 *
 */
class ControllerModulePagedetail extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {
        $this->load->model('core/sitemap');
        $sitemapid = $this->request->get['sitemapid'];
        $arr = explode('-',$sitemapid);
        $sitemap = $this->model_core_sitemap->getItem($arr[0]);
        switch($sitemap['module'])
        {
            case '':
                $this->data['content'] = $this->load->controller("addon/".$sitemapid);
                break;
            default:
                //echo $sitemap['module'];
                $this->data['content'] = $this->load->controller($sitemap['module']);
                break;
        }
        $this->data['sitebar'] = $this->load->controller('module/sitebar');

        $this->template = "module/pagedetail.tpl";
        $this->layout = "page/home";

        $this->render();
    }


}