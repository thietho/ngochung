<?php
/**
 * Class ControllerModuleProduct
 * @property ModelModuleProduct model_module_product
 * @property ModelCoreSitemap model_core_sitemap
 *
 */
class ControllerModuleProduct extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("module/product");
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
        $this->data['products'] = $this->model_module_product->getList($where);
        $sitemap = $this->model_core_sitemap->getItem($id);
        foreach($this->data['products'] as $key => $item)
        {
            $data_summary = json_decode(base64_decode($item['summary']),true);
            $arr = array();
            foreach($data_summary['title'] as $k => $title)
            {
                $arr[] = $title.":".$data_summary['value'][$k];
            }
            $this->data['products'][$key]['summary'] = implode("<br>",$arr);
            $this->data['products'][$key]['link'] = $this->document->createLink($sitemap['id']."-".$sitemap['sitemapid'],'detail',$item['id']."-".$this->common->createSeoText($item['productname']));
        }
        //print_r($this->data['products']);
        $this->template = "module/product_list.tpl";
        $this->render();
    }
    public function detail($id)
    {

        $this->data['product'] = $this->model_module_product->getItem($id);
        $data_summary = json_decode(base64_decode($this->data['product']['summary']),true);
        $arr = array();
        if(count($data_summary['title']))
        {
            foreach($data_summary['title'] as $k => $title)
            {
                $arr[] = "<div class='title'><p>".$title."</p></div><div class='value'><p>".$data_summary['value'][$k]."</p></div>";
            }
            $this->data['product']['summary'] = implode("<div class='elife-clear'></div>",$arr);
        }
        else
        {
            $this->data['product']['summary'] = "";
        }

        $this->data['product']['description'] = html_entity_decode($this->data['product']['description']);
        //Update viewcount
        $this->model_module_product->updateCol($this->data['product']['id'],'viewcout',$this->data['product']['viewcout'] + 1);
        $this->template = "module/product_detail.tpl";
        $this->render();
    }
}