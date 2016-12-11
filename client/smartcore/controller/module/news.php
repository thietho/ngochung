<?php
/**
 * Class ControllerModuleNews
 * @property ModelModuleNews model_module_news
 * @property ModelCoreSitemap model_core_sitemap
 *
 *
 */
class ControllerModuleNews extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("module/news");
        $this->load->model("core/sitemap");
    }
    public function index($id)
    {
        $detail = $this->request->get['detail'];
        if($detail !="")
        {
            $arr = explode('-',$detail);
            $this->detail($arr[0]);
        }
        else
        {
            $this->getList($id);
        }
    }

    private function getList($id)
    {
        $where = " AND sitemapid = " .$id;
        $this->data['data_news'] = $this->model_module_news->getList($where. " ORDER BY  `createdate` DESC LIMIT 0 , 20");
        $sitemap = $this->model_core_sitemap->getItem($id);
        foreach($this->data['data_news'] as $key => $item)
        {
            $this->data['data_news'][$key]['link'] = $this->document->createLink($sitemap['id']."-".$sitemap['sitemapid'],'detail',$item['id']."-".$this->common->createSeoText($item['title']));
        }
        //print_r($this->data['products']);
        $this->template = "module/news_list.tpl";
        $this->render();
    }
    public function detail($id)
    {
        $this->data['item'] = $this->model_module_news->getItem($id);
        $this->data['item']['description'] = html_entity_decode($this->data['item']['description']);
        $sitemap = $this->model_core_sitemap->getItem($this->data['item']['sitemapid']);
        $where = " AND sitemapid ='".$sitemap['id']."' AND createdate < '".$this->data['item']['createdate']."' ORDER BY  `createdate` DESC LIMIT 0 , 10";
        $this->data['oldernews'] = $this->model_module_news->getList($where);
        foreach($this->data['oldernews'] as $key => $item)
        {
            $this->data['oldernews'][$key]['link'] = $this->document->createLink($sitemap['id']."-".$sitemap['sitemapid'],'detail',$item['id']."-".$this->common->createSeoText($item['title']));
        }
        $this->template = "module/news_detail.tpl";
        $this->render();
    }
}