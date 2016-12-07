<?php
/**
 * Class ControllerKotraBanner
 * @property ModelKotraSetting model_kotra_setting
 *
 *
 */
class ControllerHomeBanner extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {
        $type = $this->request->get['type'];
        $this->load->model('kotra/setting');
        $banner = $this->model_kotra_setting->getItemName('banner');
        $this->data['listfile'] = $this->string->stringToArray($banner['settingvalue']);
        switch($type)
        {
            case "":
                $this->template = "home/banner.tpl";
                break;
            case "json":
                $data = array();
                foreach($this->data['listfile'] as $file)
                {

                    $data['listfile'][]['path'] = DIR_USERIMAGE."fixsize-629x212/".$file;
                }
                $this->data['output'] = json_encode($data);
                $this->template = "common/output.tpl";
                break;
        }

        $this->render();
    }
}