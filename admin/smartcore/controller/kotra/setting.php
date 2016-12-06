<?php
/**
 * Class ControllerKotraSetting
 * @property ModelKotraMovies model_kotra_movies
 * @property ModelKotraSetting model_kotra_setting
 *
 */
class ControllerKotraSetting extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("kotra/movies");
        $this->load->model("kotra/setting");
    }
    public function index()
    {
        $this->data['banner'] = $this->model_kotra_setting->getItemName('banner');
        $this->data['banner']['listfile'] = $this->string->stringToArray($this->data['banner']['settingvalue']);

        $this->template = "kotra/setting.tpl";
        $this->layout = "page/home";
        $this->render();
    }
    public function save()
    {
        $data = $this->request->post;
        //Save banner
        $setting['settingname'] = 'banner';
        $setting['settingvalue'] = $data['banner'];
        $this->model_kotra_setting->save($setting);
        $data['errors'] = array();
        $data['errorstext'] = '';

        $this->data['output'] = json_encode($data);
        $this->template = "common/output.tpl";
        $this->render();
    }


}