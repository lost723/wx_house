<?php
	global $_W,$_GPC;
	load()->func('tpl');
	
	
	if(checksubmit('submit')){
		if(!empty($_GPC['logo']))
			$res = $this->file_cos_upload($_GPC['logo']);
		 
	}
	include $this->template('houseinfo');
