<?php
/**
 * Class ControllerFmraPortfolio
 *
 * @property db db
 * @property date date
 * @property user user
 *
 *
 */
class ModelFmraPortfolio extends Model
{
    private $arr_col = array(
        'portfolioname',
        'status',
        'clientid',
        'planningyear',
        'fromyear',
        'toyear',
        'numofyear',

    );
    public function getItem($id)
    {
        $query = $this->db->query("Select `portfolio`.*
									from `portfolio`
									where id ='".$id."' ");
        return $query->row;
    }

    /**
     * @param string $where
     * @param int $from
     * @param int $to
     * @return mixed
     */
    public function getList($where="", $from=0, $to=0)
    {

        $sql = "Select `portfolio`.*
									from `portfolio`
									where 1=1";
        $sql.=$where;
        if(@$to > 0)
        {
            $sql .= " Limit ".$from.",".$to;
        }
        //echo $sql;
        $query = $this->db->query($sql);
        return $query->rows;
    }

    public function updateCol($id,$col,$val)
    {
        $id = $this->db->escape($id);
        $col = $this->db->escape($col);
        $val = $this->db->escape($val);

        $field=array(
            $col
        );
        $value=array(
            $val
        );

        $where="id = '".$id."'";
        $this->db->updateData("portfolio",$field,$value,$where);
    }

    public function save($data)
    {
        $portfolio = $this->getItem($data['id']);

        $value = array();
        if(count($portfolio))
        {
            foreach($portfolio as $col => $val)
            {
                if(isset($data[$col]))
                    $portfolio[$col] = $data[$col];
            }
            $data = $portfolio;
        }
        else
        {
            $data['status'] = "active";
        }
        foreach($this->arr_col as $col)
        {
            $value[] = $this->db->escape(@$data[$col]);
        }

        $field=$this->arr_col;

        if($data['id'] == '')
        {

            $data['id'] = $this->db->insertData("portfolio",$field,$value);

        }
        else
        {
            $where="id = '".$data['id']."'";
            $this->db->updateData("portfolio",$field,$value,$where);
        }
        return $data['id'];
    }

    public function delete($id)
    {
        $where="id = '".$id."'";
        $this->db->deleteData("portfolio",$where);
        $where="portfolioid = '".$id."'";
        $this->db->deleteData("portfoliopermission",$where);
    }

    public function getPermission($portfolioid,$clientid)
    {
        $sql = "SELECT *
                FROM  `portfoliopermission`
                WHERE `portfolioid` = '$portfolioid' AND `infoname` = '$clientid'";
        $query = $this->db->query($sql);
        return @$query->row['infovalue'];
    }

    public function getPermissionList($portfolioid)
    {
        $sql = "SELECT *
                FROM  `portfoliopermission`
                WHERE `portfolioid` = '$portfolioid'";
        $query = $this->db->query($sql);
        return $query->rows;
    }

    public function savePermission($portfolioid,$clientid,$permission)
    {
        $sql = "SELECT *
                FROM  `portfoliopermission`
                WHERE `portfolioid` = '$portfolioid' AND `clientid` = '$clientid'";
        $query = $this->db->query($sql);
        $info = $query->row;
        $field=array(
            "portfolioid",
            "clientid",
            "permission"
        );

        $value=array(
            $portfolioid,
            $clientid,
            $permission,
        );
        if(count($info) > 0)
        {
            $where="portfolioid = '".$portfolioid."' AND clientid = '".$clientid."'";
            @$this->db->updateData('portfoliopermission',$field,$value,$where);
        }
        else
        {
            @$this->db->insertData("portfoliopermission",$field,$value);
        }
    }
}
?>