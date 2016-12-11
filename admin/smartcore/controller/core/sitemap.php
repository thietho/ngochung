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
        $data_childs = @$this->model_core_sitemap->getChild(0);
        @$this->data['tree'] ="";
        foreach($data_childs as $child)
        {
            @$this->data['tree'] .= @$this->getTree($child['id']);
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
        $str ='<li class="dd-item" data-id="'.$sitemap['id'].'">';
        $str .= '<div class="dd-handle hl-cat" data-toggle="modal" data-target="#myModal" id="'.$sitemap['id'].'" sitemapid="'.$sitemap['id'].'" sitemapname="'.$sitemap['sitemapname'].'" module="'.$sitemap['module'].'">'.$sitemap['sitemapname'].' - '. $this->document->module[$sitemap['module']] .'</div>';
        if(count($data_childs))
        {

            $str .= '<ol>';
            foreach($data_childs as $child)
            {

                $str .= @$this->getTree($child['id']);

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
            $this->model_core_sitemap->updateCol($obj->id,'sitemapparent',0);
            $this->model_core_sitemap->updateCol($obj->id,'pos',$key);
            @$this->travelTree($obj);
        }
        @$this->id='content';
        @$this->template='common/output.tpl';
        @$this->render();
    }
    private function travelTree($note)
    {
        if(count($note->children))
        {
            foreach($note->children as $key => $child)
            {
                echo $child->id."-".$note->id."<br>";
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
        $this->data['readonly'] = '';
        if ($id) {
            $this->data['item'] = $this->model_core_sitemap->getItem($id);
            $this->data['readonly'] = 'readonly';
            $this->data['item']['summary'] = $this->model_core_sitemap->getItemValue($id,'summary');
            $this->data['item']['image'] = $this->model_core_sitemap->getItemValue($id,'image');
            $this->data['item']['description'] = $this->model_core_sitemap->getItemValue($id,'description');
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
        $sitemapid = $this->request->get['sitemapid'];

        $fdel = $this->model_core_sitemap->delete($sitemapid);
        if($fdel)
            $this->data['output'] = "Xóa thành công!";
        else
            $this->data['output'] = "Không xóa được, bạn phải xóa con trước!";
        $this->template = "common/output.tpl";
        $this->render();
    }

    public function save()
    {
        $data = $this->request->post;
        if ($this->validate($data)) {
            $id = $data['id'];
            $data['id'] = $this->model_core_sitemap->save($data);
            //Save info
            $this->model_core_sitemap->saveItemInfo($data['id'],'summary',$data['summary']);
            $this->model_core_sitemap->saveItemInfo($data['id'],'image',$data['image']);
            $this->model_core_sitemap->saveItemInfo($data['id'],'description',$data['description']);

            if($id == '')
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
                $this->model_core_sitemap->updateCol($data['id'],'image',$newfile);

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

        if ("" == $data['sitemapid']) {
			$this->errors['sitemapid'] = "Site Map ID not empty";
		}
        else
        {
            if($data['id'] == '')
            {
                $sitemap = $this->model_core_sitemap->getItem($data['sitemapid']);
                if(count($sitemap))
                    $this->errors['sitemapid'] = "Site Map ID has used";
            }

        }
		if ("" == $data['sitemapname']) {
			$this->errors['sitemapname'] = "Site Map Name not empty";
		}

		

        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }
    public function createID()
    {
        $sitemapname = urldecode($this->request->get['sitemapname']);
        $sitemapid = $this->common->utf8_to_ascii($sitemapname);
        $arr = explode(' ',strtolower($sitemapid));
        foreach($arr as $key => $str)
        {
            $arr[$key] = preg_replace('/[^A-Za-z0-9\-]/', '', $str);
        }
        $sitemapid = implode('-',$arr);
        $this->data['output'] = $sitemapid;
        $this->template = "common/output.tpl";
        $this->render();
    }
}