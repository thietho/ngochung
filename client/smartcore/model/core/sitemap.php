<?php
class ModelCoreSitemap extends Model
{
    private $arr_col = array(
        'sitemapid', 
		'sitemapname', 
		'sitemapparent', 
		'module', 
		'pos'
    );
    public function getItem($id)
    {
        $query = $this->db->query("Select `sitemap`.*
									from `sitemap`
									where id ='" . $id . "' ");
        return $query->row;
    }

    /**
     * @param string $where
     * @param int $from
     * @param int $to
     * @return mixed
     */
    public function countTotal($where)
    {
        $sql = "Select count(*) as total
                from `sitemap`
				where 1=1 ". $where;

        $query = $this->db->query($sql);
        return $query->row['total'];
    }

    public function getList($where = "", $from = 0, $to = 0)
    {
        $sql = "Select *
                from `sitemap`
				where 1=1 ";

        $sql .= $where;
        if ($to > 0) {
            $sql .= " Limit " . $from . "," . $to;
        }

        $query = $this->db->query($sql);
        return $query->rows;
    }
    public function getChild($sitemapparent ,$order = " Order by pos")
    {
        $where = " AND sitemapparent = '".$sitemapparent."'";

        return @$this->getList($where.$order);
    }
    public function nextposition($sitemapparent)
    {
        $sql = "Select max(pos) as max From sitemap where sitemapparent='".$sitemapparent."'";
        $query = @$this->db->query($sql);
        return $query->rows[0]['max'] +1 ;
    }
    public function updateCol($id, $col, $val)
    {
        $id = $this->db->escape($id);
        $col = $this->db->escape($col);
        $val = $this->db->escape($val);

        $field = array(
            $col
        );
        $value = array(
            $val
        );

        $where = "id = '" . $id . "'";
        $this->db->updateData("sitemap", $field, $value, $where);
    }

    public function save($data)
    {
        $obj = $this->getItem($data['id']);
        $value = array();
        if (count($obj)) {
            //update old item
            foreach ($obj as $col => $val) {
                if (isset($data[$col]))
                    $obj[$col] = $data[$col];
            }
            $data = $obj;
        } else {
            //insert new item
            $data['pos'] = $this->nextposition($data['sitemapparent']);
        }


        foreach ($this->arr_col as $col) {
            $value[] = $this->db->escape(@$data[$col]);
        }

        $field = $this->arr_col;

        if ($data['id'] == '') {
            $data['id'] = $this->db->insertData("sitemap", $field, $value);
        } else {
            $where = "id = '" . $data['id'] . "'";
            $this->db->updateData("sitemap", $field, $value, $where);
        }
        return $data['id'];
    }

    //Tree
    function getTree($id, &$data, $level=-1, $path="", $parentpath="")
    {
        $arr=@$this->getItem($id);

        $rows = @$this->getChild($id);

        @$arr['countchild'] = count($rows);

        if(@$arr['parent'] != "")
            $parentpath .= "-".$arr['parent'];

        if(@$id!=0 )
        {
            $level += 1;
            $path .= "-".$id;

            @$arr['level'] = $level;
            @$arr['path'] = $path;
            @$arr['parentpath'] = $parentpath;

            array_push($data,$arr);
        }


        if(count($rows))
            foreach($rows as $row)
            {
                @$this->getTree($row['id'], $data, $level, $path, $parentpath);
            }
    }
    public function delete($id)
    {
        $childs = $this->getChild($id);
        if(count($childs) == 0)
        {
            $where = "id = '" . $id . "'";
            $this->db->deleteData("sitemap", $where);
            $list = $this->getItemInfoList($id);
            foreach($list as $info)
                $this->deleteInfo($info['id']);
            return true;
        }
        else
            return false;
    }
    //Infomation
    public function deleteInfo($id)
    {
        $where="id = '".$id."'";
        $this->db->deleteData("sitemap_info",$where);

    }
    public function getItemValue($sitemapid,$infoname)
    {
        $sql = "SELECT *
                FROM  `sitemap_info`
                WHERE `sitemapid` = '$sitemapid' AND `infoname` = '$infoname'";
        $query = $this->db->query($sql);
        return @$query->row['infovalue'];
    }

    public function getItemInfoList($sitemapid)
    {
        $sql = "SELECT *
                FROM  `sitemap_info`
                WHERE `sitemapid` = '$sitemapid'";
        $query = $this->db->query($sql);
        return $query->rows;
    }

    public function saveItemInfo($sitemapid,$infoname,$infovalue)
    {
        $sql = "SELECT *
                FROM  `sitemap_info`
                WHERE `sitemapid` = '$sitemapid' AND `infoname` = '$infoname'";
        $query = $this->db->query($sql);
        $info = $query->row;
        $field=array(
            "sitemapid",
            "infoname",
            "infovalue"
        );

        $value=array(
            $sitemapid,
            $infoname,
            $infovalue,
        );
        if(count($info) > 0)
        {
            $where="sitemapid = '".$sitemapid."' AND infoname = '".$infoname."'";
            @$this->db->updateData('sitemap_info',$field,$value,$where);
        }
        else
        {
            @$this->db->insertData("sitemap_info",$field,$value);
        }
    }
}
?>