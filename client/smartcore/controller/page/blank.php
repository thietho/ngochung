<?php

/**
 * Class ControllerPageBlank
 *
 *
 */
class ControllerPageBlank extends Controller
{
    public function index()
    {
        $this->data['layoutid'] = $this->smartweb->layoutid;

        $this->template = "page/blank.tpl";
        $this->render();
    }
}