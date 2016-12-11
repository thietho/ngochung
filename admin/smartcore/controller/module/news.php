<?php

/**
 * Class ControllerModuleNews
 * @property ModelModuleNews model_module_news
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
        $where = " AND module = 'module/news'";
        $this->data['sitemaps'] = $this->model_core_sitemap->getList($where);
    }

    public function index()
    {
        $this->getList();
    }

    public function getList()
    {
        $this->data['sitemapid'] = $this->request->get['sitemapid'];
        $this->template = "module/news_list.tpl";
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
		if ($datasearch['summary']) {
			$where .= " AND `summary` like '%" . $datasearch['summary'] . "%'";
		}
		if ($datasearch['description']) {
			$where .= " AND `description` like '%" . $datasearch['description'] . "%'";
		}
        if ($datasearch['sitemapid']) {
            $where .= " AND `sitemapid` like '" . $datasearch['sitemapid'] . "'";
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
        $this->data['newss'] = $this->model_module_news->getList($where.$orderby, $from, $to);
        foreach($this->data['newss'] as $key => $item)
        {
            $sitemap = $this->model_core_sitemap->getItem($item['sitemapid']);
            $this->data['newss'][$key]['sitemapname'] = $sitemap['sitemapname'];
        }

        $total = $this->model_module_news->countTotal($where);


        /*** generate paging ***/
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $this->itemsPerPage;
        $pagination->url = $this->string->toUrlPara($datasearch);
        $pagination->filter = '';
        $pagination->eid = 'news-list';
        $this->data['pagination'] = $pagination->ajaxRenderNew();
        $this->data['objPage'] = array(
                    'pape' => $page,
                    'itemsPerPage' => $this->itemsPerPage
                );

        $this->template = "module/news_table.tpl";
        $this->render();
    }


    private function getForm()
    {
        $id = $this->request->get['id'];
        if ($id) {
            $this->data['item'] = $this->model_module_news->getItem($id);
        }

        $this->template = "module/news_form.tpl";
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

        $this->model_module_news->delete($id);
        $path = DIR_FILE."upload/news/".$id;
        $this->common->rrmdir($path);
        $this->data['output'] = "true";
        $this->template = "common/output.tpl";
        $this->render();
    }

    public function save()
    {
        $data = $this->request->post;
        if ($this->validate($data)) {
            $id=$data['id'];
            $data['id'] = $this->model_module_news->save($data);
            if($id == '' && $data['image']!='')
            {
                //Move file vo dung thu muc
                $oldname = DIR_FILE.$data['image'];
                $file = pathinfo($oldname);
                $path = DIR_FILE."upload/news/".$data['id'];
                if(!is_dir($path))
                    mkdir($path);
                $newfile = $path."/".$file['basename'];
                rename($oldname,$newfile);
                rmdir($file['dirname']);
                $newfile = str_replace(DIR_FILE,'',$newfile);
                $this->model_module_news->updateCol($data['id'],'image',$newfile);

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

        if ("" == $data['title']) {
			$this->errors['title'] = "title not empty";
		}

		

        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }
}