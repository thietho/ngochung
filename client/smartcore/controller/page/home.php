<?php

/**
 * Class ControllerPageHome
 *
 *
 */
class ControllerPageHome extends Controller
{
    public function index()
    {

        $this->data['header'] = $this->load->controller("common/header");
        $this->data['footer'] = $this->load->controller("common/footer");
        //Web General Setting
        $this->data['title'] = $this->document->title;
        if ($this->data['title'] == "") {
            $this->data['title'] = $this->config->get('config_sitename');
        }
        $this->data['title'] = htmlspecialchars_decode($this->data['title']);
        $this->data['title'] = strip_tags($this->data['title']);

        $this->data['base'] = HTTP_SERVER;
        $this->data['meta_description'] = $this->document->getDescription();
        if ($this->data['meta_description'] == "") {
            $this->data['meta_description'] = htmlspecialchars_decode($this->config->get('config_description'));
        }
        $this->data['meta_keywords'] = $this->document->getKeywords();
        if ($this->data['meta_keywords'] == "") {
            $this->data['meta_keywords'] = htmlspecialchars_decode($this->config->get('config_keywords'));
        }
        //OG
        $this->data['og_title'] = $this->smartweb->og_title;
        if ($this->data['og_title'] == "") {
            $this->data['og_title'] = $this->config->get('config_sitename');
        }
        $this->data['og_title'] = htmlspecialchars_decode($this->data['og_title']);
        $this->data['og_title'] = strip_tags($this->data['og_title']);
        $this->data['og_url'] = $this->smartweb->og_url;
        if ($this->data['og_url'] == "") {
            $this->data['og_url'] = $this->config->get('config_siteurl');
        }
        $this->data['og_image'] = $this->smartweb->og_image;
        if ($this->data['og_image'] == "") {
            $this->data['og_image'] = IMAGE_SERVER . "images/smartweb_" . SKINID . "/root/" . $this->config->get('config_logo');
        }
        $this->data['og_description'] = $this->smartweb->og_description;
        if ($this->data['og_description'] == "") {
            $this->data['og_description'] = $this->config->get('config_description');
        }
        $this->data['og_description'] = htmlspecialchars_decode($this->data['og_description']);
        $this->data['og_description'] = strip_tags($this->data['og_description']);
        $this->data['og_publicdate'] = $this->smartweb->og_publicdate;
        $this->data['og_revisiondate'] = $this->smartweb->og_revisiondate;

        $this->data['links'] = $this->document->getLinks();
        $this->data['layoutid'] = $this->smartweb->layoutid;

        $this->template = "page/base.tpl";
        $this->render();
    }
}