<?php

/**
 * Class ControllerCoreUser
 *
 * @property ModelCoreUser model_core_user
 * @property ModelCoreUsertype model_core_usertype
 *
 */
class ControllerCoreUser extends Controller
{
    private $errors = array();
    private $itemsPerPage = 12;

    function __construct()
    {
        $this->load->model("core/user");
        $this->load->model("core/usertype");
        $this->language->load("core/user");
    }

    public function index()
    {
        $this->checkPermisson();
        $this->getList();
    }


    private function getList()
    {
        /*** get, set pagination session ***/
        if (isset($this->request->get['page'])) {
            $page = preg_replace('#[^0-9]#i', '', $this->request->get['page']);
        } else {
            if (isset($this->session->data['CMS_ControllerCoreUser'])) {
                $page = $this->session->data['CMS_ControllerCoreUser'];
            } else {
                $page = 1;
            }
        }
        $this->session->set('CMS_ControllerCoreUser', $page);


        /*** compose where of query ***/
        $where = "";

        /*** compose filter for paging ***/
        $filterPaging = "";


        /*** get news list ***/
        $total = $this->model_core_user->countTotal($where);
        $from = ($page - 1) * $this->itemsPerPage;
        $to = $this->itemsPerPage;
        $this->data['users'] = $this->model_core_user->getList($where, $from, $to);


        /*** generate paging ***/
        $pagination = new Pagination();
        $pagination->total = $total;
        $pagination->page = $page;
        $pagination->limit = $this->itemsPerPage;
        $pagination->url = "";
        $pagination->filter = $filterPaging;
        $this->data['pagination'] = $pagination->ajaxRender();



        $this->template = "core/user_list.tpl";
        $this->layout = "page/home";
        $this->render();
    }


    public function update()
    {
        $this->getForm();
    }

    public function insert()
    {
        $this->data['isInsert'] = true;
        $this->getForm();
    }

    private function getForm()
    {
        $this->checkPermisson();


        if(isset($this->request->get['userid'])) {
            $this->data['user'] = $this->model_core_user->getItem($this->request->get['userid']);
        }

        $this->data['usertypes'] = $this->model_core_usertype->getAllUsertype();


        $this->template = "core/user_form.tpl";
        $this->layout = "page/home";
        $this->render();
    }

    public function save() {
        $data = $this->request->post;
        $data['email'] = strtolower($data['email']);

        $data['siteid'] = SITEID;
        //validate
        $response = array();
        $response['status'] = 'failed';
        $response['title'] = $this->language->get("lang_text_notification");
        $response['message'] = $this->language->get("lang_text_save_failed");

        if (!$this->validate($data)) {
            $response['status'] = 'failed';
            $response['errors'] = $this->errors;

        } else {
            //update user
            if("" == $data['userid']) {
                $this->model_core_user->insertUser($data);
            } else {
                $this->model_core_user->updateUser($data);
            }
            $response['status'] = 'ok';
            $response['message'] = $this->language->get("lang_text_save_success");
        }

        $this->data['output'] = json_encode($response, true);
        $this->template = 'common/output.tpl';
        $this->render();
    }


    private function validate($data)
    {
        $this->errors = array();
        if ("" == $data['username']) {
            $this->errors['username'] = $this->language->get("lang_err_username_required");
        }
        if ("" == $data['fullname']) {
            $this->errors['fullname'] = $this->language->get("lang_err_fullname_required");
        }
        if ("" == $data['email']) {
            $this->errors['email-required'] = $this->language->get("lang_err_email_required");
        } else {
            //check email
            if(!$this->validation->checkEmail($data['email'])) {
                $this->errors['email-invalid'] = $this->language->get("lang_err_email_invalid");
            }
        }

        //validate password
        if("" == $data['userid']) {
            if("" !== $data['username']) {
                $user = $this->model_core_user->getItemByUserName($data['username']);
                if (count($user) > 0) {
                    $this->errors['username-used'] = $this->data['lang_err_username_used'];
                }
            }

            if("" == $data['password']) {
                $this->errors['password-required'] = $this->language->get("lang_err_password_required");
            } else if(strlen($data['password']) < 5) {
                $this->errors['password-length'] = $this->language->get("lang_err_password_length");
            }

            if("" == $data['confirmpassword']) {
                $this->errors['confirmpassword-required'] = $this->language->get("lang_err_password_required");
            }

            if(strlen($data['password']) >= 5 && strlen($data['confirmpassword']) >= 5) {
                if($data['confirmpassword'] != $data['password']) {
                    $this->errors['confirmpassword-match'] = $this->language->get("lang_err_password_match");
                }
            }
        }


        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }


    public function active()
    {
        $userid = $this->request->post['userid'];
        $user = $this->model_core_user->getItem($userid);

        $response = array();
        $response['status'] = 'failed';
        $response['title'] = $this->language->get("lang_text_notification");
        $response['message'] = $this->language->get("lang_text_save_failed");
        if (count($user) == 0) {
            $response['status'] = 'failed';
            $response['errors'] = $this->errors;

        } else {
            $data['userid'] = $userid;
            if ($user['status'] == "lock") {
                $data['status'] = "active";
            } else {
                $data['status'] = "lock";
            }
            $this->model_core_user->updatestatus($data);

            $response['status'] = 'ok';
            $response['message'] = $this->language->get("lang_text_save_success");
        }

        $this->data['output'] = json_encode($response, true);
        $this->template = "common/output.tpl";
        $this->render();
    }


    public function delete()
    {
        $listuserid = $this->request->post['delete'];
        $response = array();
        $response['status'] = 'failed';
        $response['title'] = $this->language->get("lang_text_notification");
        $response['message'] = $this->language->get("lang_text_save_failed");

        if (count($listuserid)) {
            $this->model_core_user->deleteUsers($listuserid);
            $this->data['output'] = $this->data['announ_del'];

            $response['status'] = 'ok';
            $response['message'] = $this->language->get("lang_text_save_success");
        }


        $this->data['output'] = json_encode($response, true);
        $this->template = "common/output.tpl";
        $this->render();
    }
    public function changepassword()
    {
        $this->data['item'] = $this->model_core_user->getItem($this->user->getId());
        $this->template = "core/user_changepassword.tpl";
        $this->layout = "page/home";
        $this->render();
    }
    public function actionchangepass()
    {
        $data = $this->request->post;
        if($this->validateChangePass($data))
        {
            $user['userid'] = $this->user->getId();
            $user['password'] = md5($data['password']);
            $user['updateddate'] = $this->date->getToday();
            $user['updatedby'] = $this->user->getId();
            $this->model_core_user->changePassword($user);
            $data['errors'] = array();
            $data['errorstext'] = '';

        }
        else
        {
            $data['errors'] = $this->errors;
            $data['errorstext'] = '';
            foreach($this->errors as $error)
            {
                $data['errorstext'] .= $error."<br>";
            }
        }
        $this->data['output'] = json_encode($data);
        $this->template = "common/output.tpl";
        $this->render();
    }

    private function validateChangePass($data)
    {
        $this->errors = array();
        //validate password
        if("" == $data['password']) {
            $this->errors['password-required'] = $this->language->get("lang_err_password_required");
        } else if(strlen($data['password']) < 5) {
            $this->errors['password-length'] = $this->language->get("lang_err_password_length");
        }

        if("" == $data['confirmpassword']) {
            $this->errors['confirmpassword-required'] = $this->language->get("lang_err_password_required");
        }

        if(strlen($data['password']) >= 5 && strlen($data['confirmpassword']) >= 5) {
            if($data['confirmpassword'] != $data['password']) {
                $this->errors['confirmpassword-match'] = $this->language->get("lang_err_password_match");
            }
        }



        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }
}