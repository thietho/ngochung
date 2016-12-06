<?php

/**
 * Class ControllerPageHome
 *
 *
 */
class ControllerPageLogin extends Controller
{
    public function index()
    {
        $this->data['header'] = $this->load->controller("common/header");
        $this->data['footer'] = $this->load->controller("common/footer");
        $this->data['mainmenu'] = $this->load->controller("common/mainmenu");

        if($this->data['pagecontent'] == "") {
            if($this->smartweb->moduleroute == '') {
                $this->smartweb->moduleroute = 'common/login';
            }
            $this->data['pagecontent'] = $this->load->controller($this->smartweb->moduleroute);
        }

        //javascript in each tpl file
        $this->data['layoutid'] = $this->smartweb->layoutid;

        $this->template = "page/base_login.tpl";
        $this->render(true);
    }


    public function checkLogin() {
        if (!$this->user->isLogged()) {
            //$route = $this->getRoute();
            //$part = explode('/', $route);
            //$ignore = array('common/forgotpassword');
            return $this->forward('page/login/index');
        }
    }
}