<?php
/**
 * Class ModelFmraClient
 *
 * @property db db
 * @property date date
 * @property user user
 *
 *
 */
class ModelFmraClient extends Model
{
    private $arr_col = array(
        'username',
        'password',
        'fullname',
        'fistname',
        'lastname',
        'phone',
        'address',
        'city',
        'state',
        'country',
        'postcode',
        'email',
        'parent',
        'createdate',
        'createby',
        'status'
    );
    public function getItem($id)
    {
        $query = $this->db->query("Select `client`.*
									from `client`
									where id ='".$id."' ");
        return $query->row;
    }
    public function getItemByUserName($username)
    {
        $query = $this->db->query("Select `client`.*
									from `client`
									where username ='".$username."' ");
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

        $sql = "Select `client`.*
									from `client`
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
        $this->db->updateData("client",$field,$value,$where);
    }

    public function save($data)
    {
        $client = $this->getItem($data['id']);

        $value = array();
        if(count($client))
        {
            foreach($client as $col => $val)
            {
                if(isset($data[$col]))
                    $client[$col] = $data[$col];
            }
            $data = $client;
        }
        else
        {
            $data['password'] = md5($data['password']);
            $data['createdate'] = $this->date->getToday();
            $data['createby'] = $this->user->getUserName();
        }
        foreach($this->arr_col as $col)
        {
            $value[] = $this->db->escape(@$data[$col]);
        }

        $field=$this->arr_col;

        if($data['id'] == '')
        {

            $data['id'] = $this->db->insertData("client",$field,$value);

        }
        else
        {
            $where="id = '".$data['id']."'";
            $this->db->updateData("client",$field,$value,$where);
        }
        return $data['id'];
    }

    public function delete($id)
    {
        $where="id = '".$id."'";
        $this->db->deleteData("client",$where);
    }


}
?>