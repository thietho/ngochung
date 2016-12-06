<?php

/**
 * Class ControllerKotraMovies
 * @property ModelKotraMovies model_kotra_movies
 *
 */
class ControllerKotraMovies extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;

    function __construct()
    {
        $this->load->model("kotra/movies");
    }

    public function index()
    {
        $this->getList();
    }

    public function getList()
    {
        $this->template = "kotra/movies_list.tpl";
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
        if ($datasearch['moviesname']) {
			$where .= " AND `moviesname` like '%" . $datasearch['moviesname'] . "%'";
		}
		if ($datasearch['description']) {
			$where .= " AND `description` like '%" . $datasearch['description'] . "%'";
		}

		if ($datasearch['status']) {
			$where .= " AND `status` like '" . $datasearch['status'] . "'";
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
        $this->data['moviess'] = $this->model_kotra_movies->getList($where.$orderby, $from, $to);

        $total = $this->model_kotra_movies->countTotal($where);


        /*** generate paging ***/
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $this->itemsPerPage;
        $pagination->url = $this->string->toUrlPara($datasearch);
        $pagination->filter = '';
        $pagination->eid = 'movies-list';
        $this->data['pagination'] = $pagination->ajaxRenderNew();
        $this->data['objPage'] = array(
                    'pape' => $page,
                    'itemsPerPage' => $this->itemsPerPage
                );

        $this->template = "kotra/movies_table.tpl";
        $this->render();
    }


    private function getForm()
    {
        $id = $this->request->get['id'];
        if ($id) {
            $this->data['item'] = $this->model_kotra_movies->getItem($id);
        }

        $this->template = "kotra/movies_form.tpl";
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

        $this->model_kotra_movies->delete($id);
        $this->data['output'] = "true";
        $this->template = "common/output.tpl";
        $this->render();
    }

    public function save()
    {
        $data = $this->request->post;
        if ($this->validate($data)) {
            $id=$data['id'];
            $data['id'] = $this->model_kotra_movies->save($data);
            if($id == '')
            {
                //Move file vo dung thu muc
                $oldname = DIR_FILE.$data['image'];
                $file = pathinfo($oldname);
                $path = DIR_FILE."upload/movies/".$data['id'];
                if(!is_dir($path))
                    mkdir($path);
                $newfile = $path."/".$file['basename'];
                rename($oldname,$newfile);
                rmdir($file['dirname']);
                $newfile = str_replace(DIR_FILE,'',$newfile);

                $this->model_kotra_movies->updateCol($data['id'],'image',$newfile);
            }

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

        if ("" == $data['moviesname']) {
			$this->errors['moviesname'] = "moviesname not empty";
		}
		if ("" == $data['description']) {
			$this->errors['description'] = "description not empty";
		}
		if ("" == $data['image']) {
			$this->errors['image'] = "image not empty";
		}
		if ("" == $data['filename']) {
			$this->errors['filename'] = "filename not empty";
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