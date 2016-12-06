<?php

/**
 * Class User
 *
 * @property Session session
 * @property DB db
 *
 */
final class User
{
    private $userid;
    private $username;
    private $siteid;
    private $usertypeid;
    //private $permission = array();
    //private $Control = array();
    private $session;

    public function __construct()
    {
        $this->session = Registry::get('session');
        $this->db = Registry::get('db');
        $this->request = Registry::get('request');
        $this->session = Registry::get('session');
        $this->json = Registry::get('json');
        $this->string = Registry::get('string');


        /*
        if ($this->request->get['lang']) {
            $this->session->set('siteid', $this->request->get['lang']);
        } else {
            if (!isset($this->session->data['siteid'])) {
                $this->session->set('siteid', SITEID);
            }
        }
        */
        if (!isset($this->session->data['siteid'])) {
            $this->session->set('siteid', SITEID);
        }
        $this->siteid = $this->session->data['siteid'];
        if (isset($this->session->data['userid'])) {
            $query = $this->db->query("SELECT * FROM user WHERE userid = '" . $this->db->escape($this->session->data['userid']) . "'");

            if ($query->num_rows) {
                $this->usertypeid = $query->row['usertypeid'];
                $this->userid = $query->row['userid'];
                $this->username = $query->row['username'];

                //$this->db->query("UPDATE user SET userip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE userid = '" . (int)$this->session->data['userid'] . "'");
                //$sql = "SELECT permission FROM usertype where usertypeid = (Select usertypeid from user where userid = '" . $this->db->escape($this->session->data['userid']) . "')";
                //$query = $this->db->query($sql);
                //$this->setPermission($query->row['permission']);\
            } elseif (isset($this->session->data['safemode'])) {
                $this->usertypeid = $this->session->data['usertypeid'];
                $this->userid = $this->session->data['userid'];
                $this->username = $this->session->data['username'];
            } else {
                $this->logout();
            }
        }

    }


    public function isLogged()
    {
        if ($this->session->data['userid']) {
            $this->usertypeid = $this->session->data['usertypeid'];
            $this->userid = $this->session->data['userid'];
            $this->username = $this->session->data['username'];
            return true;
        } elseif ($this->session->data['safemode']) {
            $this->usertypeid = $this->session->data['usertypeid'];
            $this->userid = $this->session->data['userid'];
            $this->username = $this->session->data['username'];
            $this->siteid = $this->session->data['siteid'];
            return true;
        }
        return false;
    }


    public function login($username, $password)
    {
        if ($username == "" || $password == "") {
            return false;
        }
        $sql = "SELECT * FROM user WHERE username = '" . $this->db->escape($username) . "' AND password = '" . $this->db->escape(md5($password)) . "' AND status = 'active'";
        $query = $this->db->query($sql);



        if ($query->num_rows) {
            $this->session->set('usertypeid', $query->row['usertypeid']);
            $this->session->set('userid', $query->row['userid']);
            $this->session->set('username', $query->row['username']);
            $this->session->set('token', md5(SKINID . TOKE));

            $query = $this->db->query("Select * from site where siteid = 'default'");
            $this->session->set('sitename', $query->row['sitename']);
            $this->usertypeid = $query->row['usertypeid'];
            $this->userid = $query->row['userid'];
            $this->username = $query->row['username'];

            //$query = $this->db->query("SELECT DISTINCT ug.permission FROM user u LEFT JOIN usertype ug ON u.usertypeid = ug.usertypeid WHERE u.userid = '" . (int)$this->session->data['userid'] . "'");
            //$this->setPermission($query->row['permission']);
            return TRUE;
        } else {
            return FALSE;
        }
    }


    public function logout()
    {
        unset($_SESSION['safemode']);
        unset($_SESSION['userid']);
        unset($this->session->data['userid']);
        $this->userid = '';
        $this->username = '';
    }


    public function getId()
    {
        return $this->userid;
    }

    public function getUserTypeId()
    {
        return $this->usertypeid;
    }

    public function getSiteId()
    {
        return $this->siteid;
    }

    public function getUserName()
    {
        return $this->username;
    }

}