<?php
/**
 * Class ControllerAddonActive
 * @property ModelCoreUser model_core_user
 *
 */
class ControllerAddonActive extends Controller
{
	private $error = array();
	public function index()
	{
		if(@$this->member->isLogged())
			$this->response->redirect($this->document->createLink('member'));
		$this->document->breadcrumb .= " » Kích hoạt tài khoản";
		$this->document->title .= " - Kích hoạt tài khoản";
		
		$this->id="content";
		$this->template="addon/active.tpl";
		$this->render();
	}
	
	public function active()
	{
		@$data = $this->request->post;
		if(@$this->validateForm($data))
		{
			$this->load->model("core/user");
			$activecode = $this->model_core_user->getInformation($data['username'], "activecode");
			if(@$data['activecode'] == $activecode)
			{
				//Kich hoat tai khoang
				$user['userid'] = $data['username'];
				$user['status'] = "active";
				$this->model_core_user->updatestatus($user);
				@$this->data['output'] = "true";
				$this->model_core_user->saveInformation($data['username'], "activecode", "");
			}
			else
			{
				@$this->data['output'] = "Mã kích hoạt không đúng";
			}
			
		}
		else
		{
			foreach($this->error as $item)
			{
				@$this->data['output'] .= $item."<br>";
			}
		}
		$this->id='content';
		$this->template='common/output.tpl';
		$this->render();
	}
	
	private function validateForm($data)
	{
		
		
    	if(trim($data['username']) == "")
		{
      		$this->error['username'] = "Bạn chưa nhập tên đăng nhập";
    	}
		
		if(trim($data['activecode']) =="")
		{
      		$this->error['activecode'] = "Bạn chưa nhập mã kích hoạt";
    	}
		else
		{
			$this->load->model("core/user");
			$activecode = $this->model_core_user->getInformation($data['username'], "activecode");
			if(@$activecode == "")
				$this->error['activecode'] = "tài khoản của bạn đã kích hoạt rồi";
		}
		
		if (count($this->error)==0) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}
	}

    public function resendActiveCode()
    {
        @$data = $this->request->post;
        if(@$this->validateReSend($data))
        {
            $this->load->model("core/user");
            $user = $this->model_core_user->getItemByUserName($data['username']);
            //Gui ma kich hoat vo email cua member
            $activecode = $this->string->generateRandStr(10);

            $arr = array($data,$activecode);
            $description = $this->load->controller('addon/register','emailActive',$arr);


            $mail['to'] = $user['email'];
            $mail['name'] = $user['fullname'];
            $mail['subject'] =  "Gửi lại mã kích hoạt tài khoản";
            //$mail['body'] = "Mã kích hoạt: ".$activecode;
            //$mail['body'].= "<br>Hoặc bạn click vào <a href='".$this->document->createLink('activelink')."?user=".$data['username']."&code=".md5($activecode)."'>link để kích hoạt tài khoản</a>";
            $arr = array($description);
            $mail['body'] = $this->load->controller('module/contact','createEmailTemplate',$arr);

            $this->model_core_user->saveInformation($user['username'], "activecode", $activecode);
            $this->mailsmtp->sendMail($mail);

            $this->data['output'] = "true";
        }
        else
        {
            foreach($this->error as $item)
            {
                @$this->data['output'] .= $item."<br>";
            }
        }
        $this->id='content';
        $this->template='common/output.tpl';
        $this->render();
    }
    private function validateReSend($data)
    {
        if(trim($data['username']) == "")
        {
            $this->error['username'] = "Bạn chưa nhập tên đăng nhập";
        }
        else
        {
            $this->load->model("core/user");
            $user = $this->model_core_user->getItemByUserName($data['username']);
            if(count($user) == 0)
            {
                $this->error['username'] = "Tài khoản không tồn tại";
            }
            else
            {
                $activecode = $this->model_core_user->getInformation($data['username'], "activecode");
                if(@$activecode == "")
                    $this->error['activecode'] = "Tài khoản của bạn đã kích hoạt rồi";
            }

        }



        if (count($this->error)==0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
}
?>