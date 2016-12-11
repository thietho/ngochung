<?php
/**
 * Class ControllerModuleSitebar
 * @property ModelCoreSitemap model_core_sitemap
 *
 */
class ControllerModuleSitebar extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("core/sitemap");
    }
    public function index()
    {
        $sitemaps = $this->model_core_sitemap->getChild(27);

        $this->data['blocks'] = array();
        foreach($sitemaps as $key => $sitemap)
        {

            $arr = array($sitemap);
            $this->data['blocks'][] = $this->load->controller("module/sitebar","getBlock",$arr);
        }
        $this->template = "module/sitebar.tpl";
        $this->render();
    }

    public function getBlock($sitemap)
    {

        $this->data['sitemap'] = $sitemap;
        $childs = $this->model_core_sitemap->getChild($sitemap['id']);

        if(count($childs))
        {
            foreach($childs as $key => $sitemap)
            {
                $childs[$key]['link'] = $this->document->createLinkBySiteMap($sitemap);
            }
        }
        else
            $childs = array();

        $this->data['sitemap']['childs'] = $childs;
        $this->template = "sitebar/block.tpl";
        $this->render();
    }
}