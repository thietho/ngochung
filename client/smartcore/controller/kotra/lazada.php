<?php
/**
 * Class ControllerKotraLazada
 * @property ModelKotraMovies model_kotra_movies
 *
 *
 */
class ControllerKotraLazada extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index()
    {
        $this->template = "kotra/lazada.tpl";
        $this->layout = "page/home";
        $this->render();
    }



}