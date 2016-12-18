<?php

/**
 * Class ControllerCoreUploadfile
 *
 *
 */
class ControllerCoreUploadfile extends Controller
{
    private $errors = array();
    private $itemsPerPage = 12;



    public function index()
    {
        $folder = $this->member->getUserName();
        $this->data['type'] = $this->request->get['type'];
        $this->data['folder'] = $folder;
        $this->template = "core/uploadfile.tpl";
        $this->render();
    }

    public function getList()
    {
        $folder = $this->request->get['folder'];
        $path = DIR_FILE."upload/".$folder."/";
        $files = glob($path . '*');
        $this->data['files'] = array();
        if(count($files))
        {
            foreach ($files as $key => $file)
            {
                $this->data['files'][$key] = pathinfo($file);
                $this->data['files'][$key]['link'] = DIRECT_FILE_SERVER.str_replace(DIR_FILE,"",$file);
            }
        }

        $this->template = "core/file_list.tpl";
        $this->render();
    }
    public function delFile()
    {
        $data = $this->request->post;
        $filepath = $data['filepath'];
        unlink($filepath);
        $this->data['output'] = 'true';
        $this->template = "common/output.tpl";
        $this->render();
    }
}