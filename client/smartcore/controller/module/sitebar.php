<?php
/**
 * Class ControllerModuleSitebar
 * @property ModelCoreSitemap model_core_sitemap
 * @property ModelModuleNews model_module_news
 *
 */
class ControllerModuleSitebar extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("core/sitemap");
        $this->load->model("module/news");
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
        $sitemap = $this->model_core_sitemap->getItem(23);
        $arr = array($sitemap);
        $this->data['blocknews'] = $this->load->controller("module/sitebar","getBlockNews",$arr);
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

    public function getBlockNews($sitemap)
    {
        $this->data['sitemap'] = $sitemap;
        $where = " AND sitemapid = ".$sitemap['id'];
        $data_news = $this->model_module_news->getList($where);
        foreach($data_news as $key => $news)
        {
            $data_news[$key]['link'] = $this->document->createLink($sitemap['id']."-".$sitemap['sitemapid'],'detail',$news['id']."-".$this->common->createSeoText($news['title']));
        }
        $this->data['sitemap']['data_news'] = $data_news;
        $this->template = "sitebar/blocknews.tpl";
        $this->render();
    }
}