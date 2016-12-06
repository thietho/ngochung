<?php

/**
 * Class ModelElifeDictionary
 *
 *
 */
class ModelElifeDictionary extends Model
{
    private $data = array();
    private $filepath;

    function __construct()
    {
        $dir_lang = 'smartcore/language/';
        $dir_userlang = 'smartcore_setting/' . SKINID . '/language/';

        $this->filepath = $dir_userlang . "language.json";
        if(!file_exists($this->filepath)) {
            $this->filepath = $dir_lang . "language.json";
            if (!is_file($this->filepath)) {
                $fp = fopen($this->filepath, 'w');
                fwrite($fp, '');
                fclose($fp);
            }
        }
        $this->getData();
    }

    protected function getData()
    {
        $filename = $this->filepath;
        $contents = file_get_contents($filename);
        $obj = json_decode($contents);
        if (count($obj)) {
            foreach ($obj as $key => $item) {
                $array = get_object_vars($item);
                $this->data[$key] = $array;
            }
        }
    }

    public function getList()
    {
        return $this->data;
    }

    public function getItem($languagekey)
    {
        foreach ($this->data as $item) {
            if ($languagekey == $item['languagekey']) {
                return $item;
            }
        }
        return null;
    }

    public function save($data)
    {
        $pos = $this->update($data);
        if ($pos == -1) {
            $this->insert($data);
        }
    }

    public function update($datarow)
    {
        $posIndex = -1;
        if (count($this->data)) {
            foreach ($this->data as $pos => $item) {
                if ($datarow['languagekey'] == $item['languagekey']) {
                    $this->data[$pos] = $datarow;
                    $posIndex = (int)$pos;
                    break;
                }
            }
            if($posIndex >= 0) {
                $this->saveData();
            }
        }
        return $posIndex;
    }

    private function saveData()
    {
        $str = json_encode($this->data);
        $fp = fopen($this->filepath, 'w');
        fwrite($fp, $str);
        fclose($fp);
    }

    public function insert($datarow)
    {
        $this->data[] = $datarow;
        $this->saveData();
    }

    public function delete($languagekey)
    {
        foreach ($this->data as $key => $item) {
            if ($languagekey == $item['languagekey']) {
                unset($this->data[$key]);
            }
        }
        $this->saveData();
    }
}