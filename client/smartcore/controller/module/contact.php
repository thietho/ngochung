<?php
/**
 * Class ControllerModulePagedetail
 * @property ModelCoreSitemap model_core_sitemap
 *
 */
class ControllerModuleContact extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index($id)
    {
        $this->load->model('core/sitemap');
        $this->data['sitemap'] = $this->model_core_sitemap->getItem($id);
        $this->data['sitemap']['summary'] = $this->model_core_sitemap->getItemValue($id,'summary');
        $this->data['sitemap']['image'] = $this->model_core_sitemap->getItemValue($id,'image');
        $this->data['sitemap']['description'] = html_entity_decode($this->model_core_sitemap->getItemValue($id,'description'));

        $this->template = "module/contact.tpl";
        $this->render();
    }


}