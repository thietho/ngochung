<?php
class ModelCoreSite extends Model
{
    private $arr_col = array(
        'siteid',
        'slogan',
        'logo',
        'symbol',
        'currency',
        'contactemail',
        'contactemail2',
        'sitename',
        'siteurl',
        'language',
        'pagetopic',
        'description',
        'keywords',
        'googleanalytics',
        'skinid',
        'status',
        'exchange_point',
        'paypal_emailmerchant',
        'paypal_standard_currency',
        'paypal_standard_transaction',
        'paypal_standard_test',
        'eway_api_key',
        'eway_api_password',
        'eway_api_currency',
        'eway_api_transaction',
        'eway_api_test',

    );

    public function getItem($id)
    {
        $query = $this->db->query("Select `site`.*
									from `site`
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
                from `site`
				where 1=1 ". $where;

        $query = $this->db->query($sql);
        return $query->row['total'];
    }

    public function getList($where = "", $from = 0, $to = 0)
    {
        $sql = "Select *
                from `site`
				where 1=1 ";

        $sql .= $where;
        if ($to > 0) {
            $sql .= " Limit " . $from . "," . $to;
        }

        $query = $this->db->query($sql);
        return $query->rows;
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
        $this->db->updateData("site", $field, $value, $where);
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
            $data['createdate'] = $this->date->getToday();
        }


        foreach ($this->arr_col as $col) {
            $value[] = $this->db->escape(@$data[$col]);
        }

        $field = $this->arr_col;

        if ($data['id'] == '') {
            $data['id'] = $this->db->insertData("site", $field, $value);
        } else {
            $where = "id = '" . $data['id'] . "'";
            $this->db->updateData("site", $field, $value, $where);
        }
        return $data['id'];
    }


    public function delete($id)
    {
        $where = "id = '" . $id . "'";
        $this->db->deleteData("site", $where);
    }
}
?>