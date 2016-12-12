<?php

/**
 * Class ControllerCoreMessage
 * @property ModelCoreMessage model_core_message
 *
 */
class ControllerCoreMessage extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;

    function __construct()
    {
        $this->load->model("core/message");
    }

    public function index()
    {
        $this->getList();
    }

    public function getList()
    {
        $this->template = "core/message_list.tpl";
        $this->layout = "page/home";
        $type = $this->request->get['type'];
        if ($type == 'popup')
            $this->layout = "";
        $this->render();

    }

    public function loadData()
    {
        $where = " ";
        $datasearch = $this->request->get;
        if ($datasearch['title']) {
			$where .= " AND `title` like '%" . $datasearch['title'] . "%'";
		}
		if ($datasearch['desscriptions']) {
			$where .= " AND `desscriptions` like '%" . $datasearch['desscriptions'] . "%'";
		}
		if ($datasearch['createdatefrom']) {
			$where .= " AND `createdate` >= '" . $this->date->formatViewDate($datasearch['createdatefrom']) . "'";
		}
        if ($datasearch['createdateto']) {
            $where .= " AND `createdate` <= '" . $this->date->formatViewDate($datasearch['createdateto']) . " 23:59:59'";
        }
		if ($datasearch['fullname']) {
			$where .= " AND `fullname` like '%" . $datasearch['fullname'] . "%'";
		}
		if ($datasearch['phone']) {
			$where .= " AND `phone` like '%" . $datasearch['phone'] . "%'";
		}
		if ($datasearch['email']) {
			$where .= " AND `email` like '%" . $datasearch['email'] . "%'";
		}
		if ($datasearch['status']) {
			$where .= " AND `status` like '%" . $datasearch['status'] . "%'";
		}
		


        $page = preg_replace('#[^0-9]#i', '', $this->request->get['page']);
        if ($page == '')
            $page = 1;
        $this->data['page'] = $page;


        $from = ($page - 1) * $this->itemsPerPage;
        $to = $this->itemsPerPage;
        $orderby = "";
        if($datasearch['sortcol']!="")
        {
            $orderby = " ORDER BY `".$datasearch['sortcol']."` ".$datasearch['sorttype'];
        }
        $this->data['messages'] = $this->model_core_message->getList($where.$orderby, $from, $to);

        $total = $this->model_core_message->countTotal($where);


        /*** generate paging ***/
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $this->itemsPerPage;
        $pagination->url = $this->string->toUrlPara($datasearch);
        $pagination->filter = '';
        $pagination->eid = 'message-list';
        $this->data['pagination'] = $pagination->ajaxRenderNew();
        $this->data['objPage'] = array(
                    'pape' => $page,
                    'itemsPerPage' => $this->itemsPerPage
                );

        $this->template = "core/message_table.tpl";
        $this->render();
    }


    private function getForm()
    {
        $id = $this->request->get['id'];
        if ($id) {
            $this->data['item'] = $this->model_core_message->getItem($id);
        }

        $this->template = "core/message_form.tpl";
        $this->layout = "page/home";
        $type = $this->request->get['type'];
        if ($type == 'popup')
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

        $this->model_core_message->delete($id);
        $this->data['output'] = "true";
        $this->template = "common/output.tpl";
        $this->render();
    }

    public function save()
    {
        $data = $this->request->post;
        if ($this->validate($data)) {
            $data['id'] = $this->model_core_message->save($data);
            $data['errors'] = array();
            $data['errorstext'] = '';

        } else {
            $data['errors'] = $this->errors;
            $data['errorstext'] = '';
            foreach ($this->errors as $error) {
                $data['errorstext'] .= $error . "<br>";
            }
        }
        $this->data['output'] = json_encode($data);
        $this->template = "common/output.tpl";
        $this->render();
    }

    private function validate($data)
    {
        $this->errors = array();

        if ("" == $data['title']) {
			$this->errors['title'] = "title not empty";
		}
		if ("" == $data['desscriptions']) {
			$this->errors['desscriptions'] = "desscriptions not empty";
		}
		if ("" == $data['createdate']) {
			$this->errors['createdate'] = "createdate not empty";
		}
		if ("" == $data['fullname']) {
			$this->errors['fullname'] = "fullname not empty";
		}
		if ("" == $data['phone']) {
			$this->errors['phone'] = "phone not empty";
		}
		if ("" == $data['email']) {
			$this->errors['email'] = "email not empty";
		}
		if ("" == $data['status']) {
			$this->errors['status'] = "status not empty";
		}
		

        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }
}