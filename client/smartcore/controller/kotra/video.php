<?php
/**
 * Class ControllerKotraVideo
 * @property ModelKotraMovies model_kotra_movies
 *
 *
 */
class ControllerKotraVideo extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    function __construct()
    {
        $this->load->model("kotra/movies");
    }
    public function index()
    {
        $type = $this->request->get['type'];
        $this->data['movies'] = $this->model_kotra_movies->getList();
        switch($type)
        {
            case "":
                $this->template = "kotra/video.tpl";
                break;
            case "json":
                $data = array();
                foreach($this->data['movies'] as $key => $video)
                {
                    $data['listvideo'][$key]['name'] = $video['moviesname'];
                    $data['listvideo'][$key]['path'] = DIRECT_FILE_SERVER . $video['filename'];
                }
                $this->data['output'] = json_encode($data);
                $this->template = "common/output.tpl";
                break;
        }

        $this->render();
    }



}