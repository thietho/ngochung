<?php
final class String
{
    public function getTextLength($str, $from, $len)
    {
        $str = strip_tags($str);
        $words = explode(' ', $str);
        $result = implode(' ', array_slice($words, $from, $len));
        if(count($words) > $len) {
            $result .= "...";
        }
		return $result;
    }

    public function numberFormate($num, $n = 0)
    {
        /** @var Config $config */
        $config = Registry::get('config');
        if($n == 0) {
            $n = $config->get('config_number_decimal');
        }
        $dec_point = $config->get('config_dec_point');
        $thousands_sep = $config->get('config_thousands_sep');
        return number_format($num, $n, $dec_point, $thousands_sep);
    }

    public function toNumber($str)
    {
        return str_replace(",", "", $str);
    }

    public function numberToString($num, $leng)
    {
        $str = "" . $num;
        $arr = array();
        for ($i = strlen($str) - 1; $i >= 0; $i--) {
            array_push($arr, $str[$i]);
        }

        while (count($arr) < $leng) {
            array_push($arr, 0);
        }
        $s = "";
        while (count($arr)) {
            $s .= array_pop($arr);
        }
        return $s;
    }
    public function toUrlPara($data)
    {
        $str = '';
        foreach($data as $key => $val)
        {
            $str.="&$key=$val";
        }
        return $str;
    }
    public function matrixToArray($data,$col)
    {
        $arr = array();
        foreach($data as $item)
            $arr[]=$item[$col];
        return $arr;
    }

    public function array_Filter($data,$col,$value)
    {
        $arr = array();
        foreach($data as $item)
        {
            if($item[$col] == $value)
                $arr[]=$item;
        }
        return $arr;
    }

    function rrmdir($dir)
    {
        if (is_dir($dir))
        {
            $objects = scandir($dir);
            foreach ($objects as $object)
            {
                if(@$object != "." && $object != "..")
                {
                    if (filetype($dir."/".$object) == "dir")
                        @$this->rrmdir($dir."/".$object);
                    else
                        unlink($dir."/".$object);
                }
            }
            reset($objects);
            rmdir($dir);
        }
    }

    function stringToArray($refersitemap)
    {
        if($refersitemap =="")
            return array();
        $refersitemap = str_replace("][","@",$refersitemap);
        $refersitemap = str_replace("[","",$refersitemap);
        $refersitemap = str_replace("]","",$refersitemap);
        @$arr = explode("@",$refersitemap);
        return $arr;
    }

    function arrayToString($arr)
    {
        $s="";
        if(count($arr))
            foreach($arr as $item)
                if(trim($item)!="")
                    $s.="[".$item."]";
        return $s;
    }
    function generateRandStr($length)
    {
        $randstr = "";
        for($i=0; $i<$length; $i++)
        {
            $randnum = mt_rand(0,61);
            if($randnum < 10){
                $randstr .= chr($randnum+48);
            }else if($randnum < 36){
                $randstr .= chr($randnum+55);
            }else{
                $randstr .= chr($randnum+61);
            }
        }
        return $randstr;
    }
}