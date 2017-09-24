<?php
/**
 * 微信购房模块微站定义
 *
 * @author lostfish
 * @url http://bbs.we7.cc/
 */

defined('IN_IA') or exit('Access Denied');

define('ROOT_PATH', str_replace('site.php', '', str_replace('\\', '/', __FILE__)));
define('INC_PATH',ROOT_PATH.'inc/');
define('MOBILE_STYLE',$_W['siteroot'].'/addons/wx_house/style');
defined('IN_IA') or exit('Access Denied');
include 'config.php';
 // 用户定义的错误处理函数
 
 // 设置用户定义的错误处理函数


 
class wx_houseModuleSite extends WeModuleSite {
	
	function __construct()
	{
		 //
	}
	
	public function dd($data)
	{
		var_dump($data);
		exit;
	}

	/*自动加载类*/
	public function load($classNames) {
		if(is_array($classNames)){
			foreach ($classNames as $class){
				$filePath = MODULE_ROOT."/class/{$class}.class.php";
				if (is_readable($filePath)) {
					require_once ($filePath);
				}
			}
		}else{
			$filePath = MODULE_ROOT."/class/{$classNames}.class.php";
			if (is_readable($filePath)) {
			   require_once ($filePath);
		    }
		}
	}
	
 
	
 
 
 

}