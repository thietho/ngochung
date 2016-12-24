<?php
/**
 * Class ControllerAddonActive
 * @property ModelCoreUser model_core_user
 *
 */
class ControllerAddonActivelink extends Controller
{
	private $error = array();
	public function index()
	{
		if(@$this->member->isLogged())
			$this->response->redirect($this->document->createLink('member'));
		$this->document->breadcrumb .= " » Kích hoạt tài khoản";
		$this->document->title = $this->config->get('config_sitename')." - Kích hoạt tài khoản";
		$this->data['active']=$this->active();
		
		$this->id="content";
		$this->template="addon/activelink.tpl";
		$this->render();
	}
	
	public function active()
	{
		$data = $this->request->get;
		print_r($data);
		$this->load->model("core/user");
		echo $activecode = $this->model_core_user->getInformation($data['user'], "activecode");
		if(@$data['code'] == md5($activecode))
		{
			//Kich hoat tai khoang
			$user['userid'] = $data['user'];
			$user['status'] = "active";
			$this->model_core_user->updatestatus($user);
			$this->model_core_user->saveInformation($data['user'], "activecode", "");
			return true;
		}
		else
		{
			return false;
		}
			
	
		
	}
	
	
}
?>