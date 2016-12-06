<?php

/**
 * Class Document
 *
 * @property Config config
 *
 */
final class Document
{
    public $title;
    public $description = '';
    public $keywords = '';
    public $languages = array();
    public $links = array();
    public $styles = array();
    public $pageStyles = array();
    public $scripts = array(); //common javascript library
    public $pageScripts = array(); //javascript for each tpl

    public $sitemapid = '';
    public $breadcrumbs = '';
    public $route = '';
    public $module = array(
        'homepage' => 'Home page',
        'module/infomation' => 'Infomation',
        'module/product' => 'Product',
        'module/news' => 'News',
        'module/contact' => 'Contact',
        'addon' => 'Add on'
    );
    public $status = array(
        'active' => 'Active',
        'deactive' => 'Deactive'
    );
    public function __construct()
    {
        $this->config = Registry::get('config');
        $this->language = Registry::get('language');

        $arr_language = explode(",", $this->config->get("config_language"));
        $languagelist = $this->language->getLanguages();
        foreach ($arr_language as $item) {
            $item = trim($item);
            $this->languages[trim($item)] = $languagelist[$item]["name"];
        }
    }

    public function getLanguage()
    {
        return $this->languages;
    }


    public function getTitle()
    {
        return $this->title;
    }

    public function setTitle($title)
    {
        $this->title = $title;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function setDescription($description)
    {
        $this->description = $description;
    }

    public function getKeywords()
    {
        return $this->keywords;
    }

    public function setKeywords($keywords)
    {
        $this->keywords = $keywords;
    }

    public function addLink($href, $rel = "canonical")
    {
        $this->links[md5($href)] = array(
            'href' => $href,
            'rel' => $rel
        );
    }

    public function getLinks()
    {
        return $this->links;
    }

    public function addStyle($href, $rel = 'stylesheet', $media = 'screen')
    {
        if (!$this->config->get('config_web_publish')) {
            $this->styles[md5($href)] = array(
                'href' => $href,
                'rel' => $rel,
                'media' => $media
            );
        }
    }

    public function getStyles()
    {
        return $this->styles;
    }


    public function addPageStyle($path)
    {
        if (!$this->config->get('config_web_publish')) {
            $file = DIR_TEMPLATE_CSS . $path;
            if(file_exists(DIR_USERTEMPLATE_CSS . $path)) {
                $file = DIR_USERTEMPLATE_CSS . $path;
            }
            $csscontent = file_get_contents($file);
            $cssMin = new CSSmin();
            $mincsscontent = $cssMin->run($csscontent);

            $filename = substr($file, 0, -4);
            file_put_contents($filename . ".min.css", $mincsscontent);
        }

        $pathWithoutExt = substr($path, 0, -4);
        $filecss = DIR_TEMPLATE_CSS . $pathWithoutExt . ".min.css";
        if(file_exists(DIR_USERTEMPLATE_CSS . $path)) {
            $filecss = DIR_USERTEMPLATE_CSS . $pathWithoutExt . ".min.css";
        }
        $this->pageStyles[md5($path)] = $filecss;
    }

    public function getPageStyles()
    {
        return $this->pageStyles;
    }


    public function addLibraryScripts($scripts)
    {
        if (!$this->config->get('config_web_publish')) {
            $scripts = array_reverse($scripts);
            foreach($scripts as $script) {
                array_unshift($this->scripts, $script);
            }
        }
    }

    public function addScript($script)
    {
        if (!$this->config->get('config_web_publish')) {
            $this->scripts[] = $script;
        }
    }

    public function getScripts()
    {
        return $this->scripts;
    }

    public function addPageScript($path)
    {
        if(!isset($this->pageScripts[md5($path)])) {
            if (!$this->config->get('config_web_publish')) {
                $file = DIR_TEMPLATE_JS . $path;
                if(file_exists(DIR_USERTEMPLATE_JS . $path)) {
                    $file = DIR_USERTEMPLATE_JS . $path;
                }
                $jscontent = file_get_contents($file);
                $minjscontent = Minifier::minify($jscontent);
                $filename = substr($file, 0, -3);
                file_put_contents($filename . ".min.js", $minjscontent);
            }

            $pathWithoutExt = substr($path, 0, -3);
            $filejs = DIR_TEMPLATE_JS . $pathWithoutExt . ".min.js";
            if(file_exists(DIR_USERTEMPLATE_JS . $path)) {
                $filejs = DIR_USERTEMPLATE_JS . $pathWithoutExt . ".min.js";
            }
            $this->pageScripts[md5($path)] = $filejs;
        }
    }

    public function getPageScripts()
    {
        return $this->pageScripts;
    }
}