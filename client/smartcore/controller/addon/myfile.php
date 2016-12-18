<?php
/**
 * Class ControllerAddonMyfile
 * @property ModelCoreUser model_core_user
 *
 */
class ControllerAddonMyfile extends Controller
{
    private $error = array();
    public function index()
    {
        if(!$this->member->isLogged())
            $this->response->redirect($this->document->createLink('member'));
        $this->data['myfile'] = $this->load->controller("core/uploadfile");
        $this->id="content";
        $this->template="addon/myfile.tpl";
        $this->render();
    }
}
?>