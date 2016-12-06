<?php
/**
 * Class ControllerKotraNews
 * @property ModelKotraNews model_kotra_news
 *
 *
 */
class ControllerKotraNews extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("kotra/news");
    }
    public function index()
    {
        $this->getList();
    }

    private function getList()
    {
        $this->data['data_news'] = $this->model_kotra_news->getList();
        //print_r($this->data['products']);
        $this->template = "kotra/news_list.tpl";
        $this->layout = "page/blank";
        $this->render();
    }
    public function detail()
    {
        $id = $this->request->get['id'];
        $this->data['item'] = $this->model_kotra_news->getItem($id);
        $this->data['item']['description'] = html_entity_decode($this->data['item']['description']);
        $this->template = "kotra/news_detail.tpl";
        $this->layout = "page/blank";
        $this->render();
    }
}