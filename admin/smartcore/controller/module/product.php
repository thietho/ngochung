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
        $where = " AND module = 'module/product'";
        $this->data['sitemaps'] = $this->model_core_sitemap->getList($where);
    }

    public function index()
    {
        $this->getList();
    }

    public function getList()
    {
        $this->data['sitemapid'] = $this->request->get['sitemapid'];
        $this->data['insert'] = HTTP_WEB."?route=module/product/insert";
        if($this->data['sitemapid']!='')
        {
            $this->data['insert'].="&sitemapid=".$this->data['sitemapid'];
        }
        $this->template = "module/product_list.tpl";
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
        if ($datasearch['productname']) {
			$where .= " AND `productname` like '%" . $datasearch['productname'] . "%'";
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
        $this->data['products'] = $this->model_module_product->getList($where.$orderby, $from, $to);
        foreach($this->data['products'] as $key => $item)
        {
            $data_summary = json_decode(base64_decode($item['summary']),true);
            $arr = array();
            if(count($data_summary['title']))
            {
                foreach($data_summary['title'] as $k => $title)
                {
                    $arr[] = $title.":".$data_summary['value'][$k];
                }
                $this->data['products'][$key]['summary'] = implode("<br>",$arr);
            }
            else
                $this->data['products'][$key]['summary'] = '';
            $sitemap = $this->model_core_sitemap->getItem($item['sitemapid']);
            $this->data['products'][$key]['sitemapname'] = $sitemap['sitemapname'];
        }

        $total = $this->model_module_product->countTotal($where);


        /*** generate paging ***/
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $this->itemsPerPage;
        $pagination->url = $this->string->toUrlPara($datasearch);
        $pagination->filter = '';
        $pagination->eid = 'product-list';
        $this->data['pagination'] = $pagination->ajaxRenderNew();
        $this->data['objPage'] = array(
                    'pape' => $page,
                    'itemsPerPage' => $this->itemsPerPage
                );

        $this->template = "module/product_table.tpl";
        $this->render();
    }


    private function getForm()
    {
        $id = $this->request->get['id'];
        $this->data['sitemapid'] = $this->request->get['sitemapid'];
        if ($id) {
            $this->data['item'] = $this->model_module_product->getItem($id);
            $this->data['item']['summary'] = json_decode(base64_decode($this->data['item']['summary']),true);
        }
        else
        {
            $this->data['item']['sitemapid'] = $this->data['sitemapid'];
        }

        $this->template = "module/product_form.tpl";
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

        $this->model_module_product->delete($id);
        $path = DIR_FILE."upload/product/".$id;
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
            $data['price'] = $this->string->toNumber($data['price']);
            $data['pricediscount'] = $this->string->toNumber($data['pricediscount']);
            $data['discountpercent'] = $this->string->toNumber($data['discountpercent']);
            $data['viewcout'] = $this->string->toNumber($data['viewcout']);
            $data['summary'] = base64_encode(json_encode($data['summary']));
            $data['id'] = $this->model_module_product->save($data);
            if($id == '')
            {
                if($data['image']!='')
                {
                    //Move file vo dung thu muc
                    $oldname = DIR_FILE.$data['image'];
                    $file = pathinfo($oldname);
                    $path = DIR_FILE."upload/product/".$data['id'];
                    if(!is_dir($path))
                        mkdir($path);
                    $newfile = $path."/".$file['basename'];
                    rename($oldname,$newfile);
                    rmdir($file['dirname']);
                    $newfile = str_replace(DIR_FILE,'',$newfile);
                    $this->model_module_product->updateCol($data['id'],'image',$newfile);
                }
                if($data['imagedetail'])
                {
                    //Move file vo dung thu muc
                    $oldname = DIR_FILE.$data['imagedetail'];
                    $file = pathinfo($oldname);
                    $path = DIR_FILE."upload/product/".$data['id'];
                    if(!is_dir($path))
                        mkdir($path);
                    $newfile = $path."/".$file['basename'];
                    rename($oldname,$newfile);
                    rmdir($file['dirname']);
                    $newfile = str_replace(DIR_FILE,'',$newfile);
                    $this->model_module_product->updateCol($data['id'],'imagedetail',$newfile);
                }

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

        if ("" == $data['productname']) {
			$this->errors['productname'] = "Product name not empty";
		}

		

        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }
}