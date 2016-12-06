<?php
/**
 * Class ControllerKotraProduct
 * @property ModelKotraProduct model_kotra_product
 *
 *
 */
class ControllerKotraProduct extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("kotra/product");
    }
    public function index()
    {
        $this->getList();
    }

    private function getList()
    {
        $this->data['products'] = $this->model_kotra_product->getList();
        foreach($this->data['products'] as $key => $item)
        {
            $data_summary = json_decode(base64_decode($item['summary']),true);
            $arr = array();
            foreach($data_summary['title'] as $k => $title)
            {
                $arr[] = $title.":".$data_summary['value'][$k];
            }
            $this->data['products'][$key]['summary'] = implode("<br>",$arr);
        }
        //print_r($this->data['products']);
        $this->template = "kotra/product_list.tpl";
        $this->layout = "page/blank";
        $this->render();
    }
    public function detail()
    {
        $id = $this->request->get['id'];
        $this->data['product'] = $this->model_kotra_product->getItem($id);
        $data_summary = json_decode(base64_decode($this->data['product']['summary']),true);
        $arr = array();
        foreach($data_summary['title'] as $k => $title)
        {
            $arr[] = "<div class='title elife-left'><p>".$title."</p></div><div class='value elife-left'><p>".$data_summary['value'][$k]."</p></div>";
        }
        $this->data['product']['summary'] = implode("<div class='elife-clear'></div>",$arr);
        $this->data['product']['description'] = html_entity_decode($this->data['product']['description']);
        //Update viewcount
        $this->model_kotra_product->updateCol($this->data['product']['id'],'viewcout',$this->data['product']['viewcout'] + 1);
        $this->template = "kotra/product_detail.tpl";
        $this->layout = "page/blank";
        $this->render();
    }
}