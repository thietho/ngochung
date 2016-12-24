<?php
/**
 * Class ControllerModulePagedetail
 * @property ModelCoreSitemap model_core_sitemap
 * @property ModelCoreMessage model_core_message
 *
 */
class ControllerModuleContact extends Controller
{
    private $errors = array();
    private $itemsPerPage = 20;
    public function index($id)
    {
        $this->load->model('core/sitemap');
        $this->data['sitemap'] = $this->model_core_sitemap->getItem($id);
        $this->data['sitemap']['summary'] = $this->model_core_sitemap->getItemValue($id,'summary');
        $this->data['sitemap']['image'] = $this->model_core_sitemap->getItemValue($id,'image');
        $this->data['sitemap']['description'] = html_entity_decode($this->model_core_sitemap->getItemValue($id,'description'));

        $this->template = "module/contact.tpl";
        $this->render();
    }

    public function send()
    {
        $this->load->model('core/message');
        $data = $this->request->post;

        if($this->validate($data))
        {
            $data['title'] = "Thông tin liên hệ";
            $data['id'] = $this->model_core_message->save($data);
            //
            $description = "";
            $description.="Họ tên: ".$data['fullname']."<br>";
            $description.="Email: ".$data['email']."<br>";
            $description.="Điện thoại: ".$data['phone']."<br>";
            $description.="Ghi chú: ".$data['desscriptions']."<br>";

            $mail['to'] = $this->config->get('config_contactemail');;
            $mail['name'] = "";
            $mail['subject'] =  $data['title'];
            $arr = array($description);
            $mail['body'] =  $this->load->controller('module/contact','createEmailTemplate',$arr);

            $this->mailsmtp->sendMail($mail);

            $data['errors'] = array();
            $data['errorstext'] = '';
        } else {
            $data['errors'] = $this->errors;
            $data['errorstext'] = '';
            foreach ($this->errors as $error) {
                $data['errorstext'] .= $error . "<br>";
            }
        }
        $this->data['output'] = json_encode($data);

        $this->template = "common/output.tpl";
        $this->render();
    }
    private function validate($data)
    {
        $this->errors = array();
        if ("" == $data['fullname']) {
            $this->errors['fullname'] = "Bạn chưa nhập tên";
        }
        if ("" == $data['phone']) {
            $this->errors['phone'] = "Bạn chưa nhập số điện thoại";
        }
        if ("" == $data['email']) {
            $this->errors['email'] = "Bạn chưa nhập email";
        }
        else
        {
            if(!$this->validation->checkEmail($data['email']))
            {
                $this->errors['email'] = "Email không đúng định dạng";
            }
        }

        if ("" == $data['desscriptions']) {
            $this->errors['desscriptions'] = "Bạn chưa nhập lời nhắn";
        }

        if (count($this->errors) > 0) {
            return false;
        }
        return true;
    }
    public function createEmailTemplate($description)
    {
        $this->data['description'] = $description;
        $this->id="content";
        $this->template="common/email.tpl";
        $this->render();
    }
}