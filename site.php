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
//print_r($this->module);
//include 'funciton/upload.php'
 // 用户定义的错误处理函数
 
 // 设置用户定义的错误处理函数


 
class wx_houseModuleSite extends WeModuleSite {
	
	private $settings;

	function __construct()
	{	
		 
		 
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
	
	public function file_cos_upload($filename){
		global $_W,$_GPC;
		if($filename != "")
		{
			$cos = $this->module['config']['cos'];
			$config = array(
				'app_id' => $cos['appid'],
				'secret_id' => $cos['secretid'],
				'secret_key' => $cos['secretkey'],
				'region' => 'cd',   // bucket所属地域：华北 'tj' 华东 'sh' 华南 'gz'
				'timeout' => 60
			);
			
			require_once(IA_ROOT.'/framework/library/cos/include.php'); 
			date_default_timezone_set('PRC');
			$cosApi = new QCloud\Cos\Api($config);
			
			$uploadRet = $cosApi->upload($cos['bucket'], ATTACHMENT_ROOT . $filename, '/' . $filename,'',3 * 1024 * 1024, 0);
			
			/* 
			if ($uploadRet['code'] != 0) {
				switch ($uploadRet['code']) {
					case -62:
						$message = '输入的appid有误';
						break;
					case -79:
						$message = '输入的SecretID有误';
						break;
					case -97:
						$message = '输入的SecretKEY有误';
						break;
					case -166:
						$message = '输入的bucket有误';
						break;
					case -133:
						$message = '请确认你的bucket是否存在';
						break;
					default:
						$message = $uploadRet['message'];
				}
				return error(-1,$message);
			}*/
		 
			return $uploadRet;
			 
		}
		else
			return error(-1,"空文件");
	}
	public function doWebIndex(){
		$res  = $this->sms_send('18561638620','1234321');
		 
	}
	
	/*
		阿里大鱼短信验证码接口发送接口
	*/
	
	public function sms_send($tel,$content,$type='')
	{
		global $_W,$_GPC;
		include 'alidayu/TopSdk.php';
		 
		$dayu = $this->module['config']['dayu'];
		date_default_timezone_set('Asia/Shanghai'); 
	 
		$sign = $dayu['sign'];
		if($type==''){
			$templateCode = $dayu['verifycode'];
			$content = json_encode(array('verifyCode'=>$content));
		}
		else
			$templateCode = $dayu['sms'];
		 
		$c = new TopClient;
		$c->appkey = strval($dayu['appkey']) ;
 		 ////$c ->secretKey = strval($dayu['secret']) ;
		 $c ->secretKey = 'e1d6518ee5aa3212e3786e702e5caac0' ;
	 	 print_r($c);				 
		$req = new AlibabaAliqinFcSmsNumSendRequest;
		$req ->setExtend( "" );
		$req ->setSmsType( "normal" );
		$req ->setSmsFreeSignName($sign);
		$req ->setSmsParam( $content );
		$req ->setRecNum($tel);
		$req ->setSmsTemplateCode( $templateCode  );
		$resp = $c->execute( $req );
		 
		print_r($resp);die;
		
	}
	
	 public function verifycard(){
			global $_W,$_GPC;
			 $host = "http://verifycard.market.alicloudapi.com";
			$path = "/Verification4";
			$method = "POST";
			$appcode = "你自己的AppCode";
			$headers = array();
			array_push($headers, "Authorization:APPCODE " . $appcode);
			//根据API的要求，定义相对应的Content-Type
			array_push($headers, "Content-Type".":"."application/x-www-form-urlencoded; charset=UTF-8");
			$querys = "";
			$bodys = "cardNo=cardNo&certNo=certNo&name=name&phone=phone";
			$url = $host . $path;

			$curl = curl_init();
			curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
			curl_setopt($curl, CURLOPT_URL, $url);
			curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
			curl_setopt($curl, CURLOPT_FAILONERROR, false);
			curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($curl, CURLOPT_HEADER, true);
			if (1 == strpos("$".$host, "https://"))
			{
				curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
				curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
			}
			curl_setopt($curl, CURLOPT_POSTFIELDS, $bodys);
			var_dump(curl_exec($curl));
	 }
	
	
	
	
 
	
 
 
 

}