<?php
/**
 * Class ModelModuleSetting
 *
 * @property db db
 * @property date date
 * @property user user
 *
 *
 */
class ModelModuleSetting extends Model
{
    private $arr_col = array(
        'settingname',
        'settingvalue'

    );
    public function getItem($id)
    {
        $query = $this->db->query("Select `setting`.*
									from `setting`
									where id ='".$id."' ");
        return $query->row;
    }
    public function getItemName($settingname)
    {
        $query = $this->db->query("Select `setting`.*
									from `setting`
									where settingname ='".$settingname."' ");
        return $query->row;
    }
    public function getSettingValue($settingname)
    {
        $query = $this->db->query("Select `setting`.*
									from `setting`
									where settingname ='".$settingname."' ");
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

        $sql = "Select `setting`.*
									from `setting`
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
        $this->db->updateData("setting",$field,$value,$where);
    }

    public function save($data)
    {
        $setting = $this->getItemName($data['settingname']);

        $value = array();
        if(count($setting))
        {
            foreach($setting as $col => $val)
            {
                if(isset($data[$col]))
                    $setting[$col] = $data[$col];
            }
            $data = $setting;
        }
        else
        {
            //insert
        }
        foreach($this->arr_col as $col)
        {
            $value[] = $this->db->escape(@$data[$col]);
        }

        $field=$this->arr_col;

        if($data['id'] == '')
        {

            $data['id'] = $this->db->insertData("setting",$field,$value);

        }
        else
        {
            $where="id = '".$data['id']."'";
            $this->db->updateData("setting",$field,$value,$where);
        }
        return $data['id'];
    }

    public function delete($id)
    {
        $where="id = '".$id."'";
        $this->db->deleteData("setting",$where);
    }


}
?>