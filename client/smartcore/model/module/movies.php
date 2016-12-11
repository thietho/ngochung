<?php
/**
 * Class ModelModuleMovies
 *
 * @property db db
 * @property date date
 * @property user user
 *
 *
 */
class ModelModuleMovies extends Model
{
    private $arr_col = array(
        'moviesname',
        'description',
        'filename',
        'image',
        'status'
    );
    public function getItem($id)
    {
        $query = $this->db->query("Select `movies`.*
									from `movies`
									where id ='".$id."' ");
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
                from `movies`
				where 1=1 ". $where;

        $query = $this->db->query($sql);
        return $query->row['total'];
    }
    public function getList($where="", $from=0, $to=0)
    {

        $sql = "Select `movies`.*
									from `movies`
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
        $this->db->updateData("movies",$field,$value,$where);
    }

    public function save($data)
    {
        $movies = $this->getItem($data['id']);

        $value = array();
        if(count($movies))
        {
            foreach($movies as $col => $val)
            {
                if(isset($data[$col]))
                    $movies[$col] = $data[$col];
            }
            $data = $movies;
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

            $data['id'] = $this->db->insertData("movies",$field,$value);

        }
        else
        {
            $where="id = '".$data['id']."'";
            $this->db->updateData("movies",$field,$value,$where);
        }
        return $data['id'];
    }

    public function delete($id)
    {
        $where="id = '".$id."'";
        $this->db->deleteData("movies",$where);
    }


}
?>