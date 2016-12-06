<?php
/**
 * Class ControllerFmraClient
 * @property ModelFmraClient model_fmra_client
 * @property ModelFmraPortfolio model_fmra_portfolio
 *
 */
class ControllerFmraClient extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("fmra/client");
        $this->load->model("fmra/portfolio");
    }
    public function index()
    {
        $this->getList();
    }

    public function getList()
    {

        $this->template = "fmra/client_list.tpl";
        $this->layout = "page/home";
        $type = $this->request->get['type'];
        if($type == 'popup')
            $this->layout = "";
        $this->render();
    }
    public function loadData()
    {
        $where = "";
        $datasearch = $this->request->get;
        if($datasearch['fullname'])
        {
            $where .= " AND `fullname` like '%".$datasearch['fullname']."%'";
        }
        if($datasearch['username'])
        {
            $where .= " AND `username` like '%".$datasearch['username']."%'";
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
        $this->data['clients'] = $this->model_fmra_client->getList($where,$from, $to);
        foreach($this->data['clients'] as $key => $item)
        {
            $w = " AND clientid = ".$item['id'];
            $portfolios = $this->model_fmra_portfolio->getList($w);
            $arrportfolioname = $this->string->matrixToArray($portfolios,'portfolioname');
            $this->data['clients'][$key]['listportfolioname'] = implode(', ',$arrportfolioname);
        }

        $data = $this->model_fmra_client->getList($where);
        $total = count($data);


        /*** generate paging ***/
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $this->itemsPerPage;
        $pagination->url = $this->string->toUrlPara($datasearch);
        $pagination->filter = '';
        $pagination->eid = 'client-list';
        $this->data['pagination'] = $pagination->ajaxRenderNew();

        $this->template = "fmra/client_table.tpl";
        $this->render();
    }
    private function getForm()
    {
        $id = $this->request->get['id'];
        if($id)
        {
            $this->data['item'] = $this->model_fmra_client->getItem($id);
        }
        $this->template = "fmra/client_form.tpl";
        $this->layout = "page/home";
        $type = $this->request->get['type'];
        if($type == 'popup')
            $this->layout = "";
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
        $this->model_fmra_client->delete($id);
        $this->data['output'] = "true";
        $this->template = "common/output.tpl";
        $this->render();
    }
    public function save()
    {
        $data = $this->request->post;
        if($this->validate($data))
        {
            $data['id'] = $this->model_fmra_client->save($data);
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
        if ("" == $data['fullname']) {
            $this->errors['fullname'] = "Full name not null";
        }
        if($data['id'] == '')
        {
            if ("" == $data['username']) {
                $this->errors['username'] = "User name not null";
            }
            //validate password
            if("" !== $data['username']) {
                $user = $this->model_fmra_client->getItemByUserName($data['username']);
                if (count($user) > 0) {
                    $this->errors['username-used'] = "User name has used";
                }
            }
            if("" == $data['password']) {
                $this->errors['password'] = "Password not null";
            } else if(strlen($data['password']) < 5) {
                $this->errors['password'] = "Password more than 5 chart letter";
            }

            if("" == $data['confirmpassword']) {
                $this->errors['confirmpassword'] = "Confirm password not null";
            }

            if(strlen($data['password']) >= 5 && strlen($data['confirmpassword']) >= 5) {
                if($data['confirmpassword'] != $data['password']) {
                    $this->errors['confirmpassword'] = "Confirm password not correct";
                }
            }
        }
        if ("" == $data['email']) {
            $this->errors['email-required'] = "Email not null";
        } else {
            //check email
            if(!$this->validation->checkEmail($data['email'])) {
                $this->errors['email-invalid'] = "Email not formate";
            }
        }

        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }
    public function resetPassword()
    {
        $data = $this->request->post;
        if($this->validateResetPassword($data))
        {
            $this->model_fmra_client->updateCol($data['id'],'password',md5($data['password']));
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
    private function validateResetPassword($data)
    {
        if('' == trim($data['password']))
        {
            $this->errors['password'] = "Password not null";
        }
        else
        {
            if(strlen($data['password'])<5)
            {
                $this->errors['password'] = "Password more than 5 chart letter";
            }
        }
        if($data['confirmpassword'] != $data['password'])
        {
            $this->errors['confirmpassword'] = "Confirm Password not match";
        }
        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }
    public function getClient()
    {
        $id = $this->request->get['id'];
        $item = $this->model_fmra_client->getItem($id);
        $this->data['output'] = json_encode($item);
        $this->template = "common/output.tpl";
        $this->render();
    }
}