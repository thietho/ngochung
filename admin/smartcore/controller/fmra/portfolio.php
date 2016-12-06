<?php
/**
 * Class ControllerFmraPortfolio
 * @property ControllerFmraPortfolio model_fmra_portfolio
 * @property ModelFmraClient model_fmra_client
 *
 */
class ControllerFmraPortfolio extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("fmra/portfolio");
        $this->load->model("fmra/client");
    }
    public function index()
    {
        $this->getList();
    }

    public function getList()
    {
        $this->template = "fmra/portfolio_list.tpl";
        $this->layout = "page/home";
        $this->render();
    }
    public function loadData()
    {
        $where = "";
        $datasearch = $this->request->get;
        if($datasearch['portfolioname'])
        {
            $where .= " AND `portfolioname` like '%".$datasearch['portfolioname']."%'";
        }
        if($datasearch['clientname'])
        {
            $where .= " AND `clientid` in (SELECT `id`
                                            FROM  `client` WHERE `fullname` like '%".$datasearch['clientname']."%' )";
        }
        if($datasearch['status'])
        {
            $where .= " AND `status` like '".$datasearch['status']."'";
        }

        $page = preg_replace('#[^0-9]#i', '', $this->request->get['page']);
        if($page == '')
            $page =1;
        $this->data['page'] = $page;
        $from = ($page - 1) * $this->itemsPerPage;
        $to = $this->itemsPerPage;
        $this->data['portfolios'] = $this->model_fmra_portfolio->getList($where,$from, $to);
        foreach($this->data['portfolios'] as $key => $item)
        {
            $client = $this->model_fmra_client->getItem($item['clientid']);
            $this->data['portfolios'][$key]['clientname'] = $client['fullname'];
        }

        $data = $this->model_fmra_portfolio->getList($where);
        $total = count($data);


        /*** generate paging ***/
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $this->itemsPerPage;
        $pagination->url = $this->string->toUrlPara($datasearch);
        $pagination->filter = '';
        $pagination->eid = 'portfolio-list';
        $this->data['pagination'] = $pagination->ajaxRenderNew();

        $this->template = "fmra/portfolio_table.tpl";
        $this->render();
    }
    private function getForm()
    {
        $id = $this->request->get['id'];
        if($id)
        {
            $this->data['item'] = $this->model_fmra_portfolio->getItem($id);
            $client = $this->model_fmra_client->getItem($this->data['item']['clientid']);
            $this->data['item']['clientname'] = $client['fullname'];
        }
        $this->template = "fmra/portfolio_form.tpl";
        $this->layout = "page/home";
        $this->render();
    }
    public function insert()
    {
        $this->getForm();
    }
    public function update()
    {
        $this->getForm();
    }
    public function delete()
    {
        $id = $this->request->get['id'];
        //Check portfolio
        //Check child
        $this->model_fmra_portfolio->delete($id);
        $this->data['output'] = "true";
        $this->template = "common/output.tpl";
        $this->render();
    }
    public function save()
    {
        $data = $this->request->post;
        if($this->validate($data))
        {
            $data['numofyear'] = $data['toyear'] - $data['fromyear']+1;
            $data['id'] = $this->model_fmra_portfolio->save($data);
            $data['errors'] = array();
            $data['errorstext'] = '';

        }
        else
        {
            $data['errors'] = $this->errors;
            $data['errorstext'] = '';
            foreach($this->errors as $error)
            {
                $data['errorstext'] .= $error."<br>";
            }
        }
        $this->data['output'] = json_encode($data);
        $this->template = "common/output.tpl";
        $this->render();
    }
    private function validate($data)
    {
        $this->errors = array();
        if ("" == $data['portfolioname']) {
            $this->errors['portfolioname'] = "Portfolio name not null";
        }
        if ("" == $data['clientid']) {
            $this->errors['clientid'] = "You not select client";
        }

        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }
    
    public function getPortfolio()
    {
        $id = $this->request->get['id'];
        $item = $this->model_fmra_portfolio->getItem($id);
        $this->data['output'] = json_encode($item);
        $this->template = "common/output.tpl";
        $this->render();
    }
}