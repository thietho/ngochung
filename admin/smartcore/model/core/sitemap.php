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

    public function getItem($sitemapid)
    {
        $query = $this->db->query("Select `sitemap`.*
									from `sitemap`
									where sitemapid ='" . $sitemapid . "' ");
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
    public function updateCol($sitemapid, $col, $val)
    {
        $sitemapid = $this->db->escape($sitemapid);
        $col = $this->db->escape($col);
        $val = $this->db->escape($val);

        $field = array(
            $col
        );
        $value = array(
            $val
        );

        $where = "sitemapid = '" . $sitemapid . "'";
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
    function getTree($sitemapid, &$data, $level=-1, $path="", $parentpath="")
    {
        $arr=@$this->getItem($sitemapid);

        $rows = @$this->getChild($sitemapid);

        @$arr['countchild'] = count($rows);

        if(@$arr['parent'] != "")
            $parentpath .= "-".$arr['parent'];

        if(@$sitemapid!="" )
        {
            $level += 1;
            $path .= "-".$sitemapid;

            @$arr['level'] = $level;
            @$arr['path'] = $path;
            @$arr['parentpath'] = $parentpath;

            array_push($data,$arr);
        }


        if(count($rows))
            foreach($rows as $row)
            {
                @$this->getTree($row['sitemapid'], $data, $level, $path, $parentpath);
            }
    }
    public function delete($sitemapid)
    {
        $childs = $this->getChild($sitemapid);
        if(count($childs) == 0)
        {
            $where = "sitemapid = '" . $sitemapid . "'";
            $this->db->deleteData("sitemap", $where);
        }

    }
}
?>