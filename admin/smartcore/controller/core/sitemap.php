<?php

/**
 * Class ControllerCoreSitemap
 * @property ModelCoreSitemap model_core_sitemap
 *
 */
class ControllerCoreSitemap extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;

    function __construct()
    {
        $this->load->model("core/sitemap");
        $data_childs = @$this->model_core_sitemap->getChild('');
        @$this->data['tree'] ="";
        foreach($data_childs as $child)
        {
            @$this->data['tree'] .= @$this->getTree($child['sitemapid']);
        }
    }

    public function index()
    {
        $this->getList();
    }
    private function getTree($id)
    {

        $data_childs = @$this->model_core_sitemap->getChild($id);
        $sitemap = @$this->model_core_sitemap->getItem($id);
        $str ='<li class="dd-item" data-id="'.$sitemap['sitemapid'].'">';
        //$btnEdit = '<a href="?route=core/sitemap/update&sitemapid='.$sitemap['sitemapid'].'">Edit</a>';
        //$btnAddChild = '<a href="?route=core/sitemap/insert&sitemapparent='.$sitemap['sitemapid'].'">Add child</a>';
        //$btnEditContent = '<a href="?route=module/information&sitemapid=cat'.$sitemap['sitemapid'].'">Edit content</a>';
        //$btnRemove = '<a>Remove</a>';
        //$str .= '<div class="dd-handle">'.$sitemap['sitemapname']." ".$btnEdit." ".$btnAddChild." ".$btnEditContent." ".$btnRemove.'</div>';
        $str .= '<div class="dd-handle hl-cat" data-toggle="modal" data-target="#myModal" sitemapid="'.$sitemap['sitemapid'].'" sitemapname="'.$sitemap['sitemapname'].'">'.$sitemap['sitemapname'].'</div>';
        //$str .= '<div class="dd-handle dd3-handle"></div><div class="dd3-content">'.$sitemap['sitemapname']." ".$btnEdit." ".$btnAddChild." ".$btnEditContent." ".$btnRemove.'</div>';

        if(count($data_childs))
        {

            $str .= '<ol>';
            foreach($data_childs as $child)
            {

                $str .= @$this->getTree($child['sitemapid']);

            }
            $str.='</ol>';

        }
        $str .= '</li>';
        return $str;
    }
    public function updateTree()
    {
        $data = urldecode($this->request->post['data']);
        $dataobj = json_decode($data);
        print_r($dataobj);
        foreach($dataobj as $key => $obj)
        {
            $this->model_core_sitemap->updateCol($obj->id,'sitemapparent','');
            $this->model_core_sitemap->updateCol($obj->id,'pos',$key);
            @$this->travelTree($obj);
        }
        @$this->id='content';
        @$this->template='common/output.tpl';
        @$this->render();
    }
    private function travelTree($note)
    {
        echo "id:".$note->id;
        if(count($note->children))
        {
            echo "<br>childs:";
            foreach($note->children as $key => $child)
            {
                echo $child->id;
                @$this->model_core_sitemap->updateCol($child->id,'sitemapparent',$note->id);
                @$this->model_core_sitemap->updateCol($child->id,'pos',$key);
                @$this->travelTree($child);
            }
        }

    }
    public function getList()
    {
        $this->template = "core/sitemap_list.tpl";
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
        if ($datasearch['sitemapid']) {
			$where .= " AND `sitemapid` like '%" . $datasearch['sitemapid'] . "%'";
		}
		if ($datasearch['sitemapname']) {
			$where .= " AND `sitemapname` like '%" . $datasearch['sitemapname'] . "%'";
		}
		if ($datasearch['sitemapsitemapparent']) {
			$where .= " AND `sitemapsitemapparent` like '%" . $datasearch['sitemapsitemapparent'] . "%'";
		}
		if ($datasearch['module']) {
			$where .= " AND `module` like '%" . $datasearch['module'] . "%'";
		}
		if ($datasearch['pos']) {
			$where .= " AND `pos` like '%" . $datasearch['pos'] . "%'";
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
        $this->data['sitemaps'] = $this->model_core_sitemap->getList($where.$orderby, $from, $to);

        $total = $this->model_core_sitemap->countTotal($where);


        /*** generate paging ***/
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $this->itemsPerPage;
        $pagination->url = $this->string->toUrlPara($datasearch);
        $pagination->filter = '';
        $pagination->eid = 'sitemap-list';
        $this->data['pagination'] = $pagination->ajaxRenderNew();
        $this->data['objPage'] = array(
                    'pape' => $page,
                    'itemsPerPage' => $this->itemsPerPage
                );

        $this->template = "core/sitemap_table.tpl";
        $this->render();
    }


    private function getForm()
    {
        $id = $this->request->get['sitemapid'];
        if ($id) {
            $this->data['item'] = $this->model_core_sitemap->getItem($id);
        }
        else
        {
            $parent = $this->request->get['parent'];
            $this->data['item']['sitemapparent'] = $parent;
        }

        $this->template = "core/sitemap_form.tpl";
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

        $this->model_core_sitemap->delete($id);
        $this->data['output'] = "true";
        $this->template = "common/output.tpl";
        $this->render();
    }

    public function save()
    {
        $data = $this->request->post;
        if ($this->validate($data)) {
            $data['id'] = $this->model_core_sitemap->save($data);
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

        if ("" == $data['sitemapid']) {
			$this->errors['sitemapid'] = "sitemapid not empty";
		}
		if ("" == $data['sitemapname']) {
			$this->errors['sitemapname'] = "sitemapname not empty";
		}

		

        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }
}