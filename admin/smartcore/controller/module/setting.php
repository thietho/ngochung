<?php
/**
 * Class ControllerModuleSetting
 * @property ModelModuleMovies model_module_movies
 * @property ModelModuleSetting model_module_setting
 *
 */
class ControllerModuleSetting extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("module/movies");
        $this->load->model("module/setting");
    }
    public function index()
    {
        $this->data['banner'] = $this->model_module_setting->getItemName('banner');
        $this->data['banner']['listfile'] = $this->string->stringToArray($this->data['banner']['settingvalue']);

        $this->template = "module/setting.tpl";
        $this->layout = "page/home";
        $this->render();
    }
    public function save()
    {
        $data = $this->request->post;
        //Save banner
        $setting['settingname'] = 'banner';
        $setting['settingvalue'] = $data['banner'];
        $this->model_module_setting->save($setting);
        $data['errors'] = array();
        $data['errorstext'] = '';

        $this->data['output'] = json_encode($data);
        $this->template = "common/output.tpl";
        $this->render();
    }


}