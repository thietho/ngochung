<?php
/**
 * Class ControllerKotraHome
 * @property ModelKotraMovies model_kotra_movies
 *
 *
 */
class ControllerKotraHome extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {
        $this->data['banner'] = $this->load->controller('kotra/banner');
        $this->data['video'] = $this->load->controller('kotra/video');
        $this->data['camera'] = $this->load->controller('kotra/camera');
        $this->template = "kotra/home.tpl";
        $this->layout = "page/home";

        $this->render();
    }


}