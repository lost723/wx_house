function timer(intDiff){
		sh = window.setInterval(function(){
		var day=0,
			hour=0,
			minute=0,
			second=0;       
		if(intDiff > 0){ 
			day = Math.floor(intDiff / (60 * 60 * 24));
			hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
			minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
			second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
		}
		if(day <= 9 ) day = '0' + day;
		if(hour <= 9 ) hour = '0' + hour;
		if (minute <= 9) minute = '0' + minute;
		if (second <= 9) second = '0' + second;
		$('.couttime').html(day+"天"+hour+"时"+minute+"分"+second+"秒");

		intDiff--;
		if(intDiff<0)
		{	
			clearInterval(sh);
			$(".common-head p").html("微信抢房开始了");
			
		}
		}, 1000);
}
