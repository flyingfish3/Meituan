;(function($){
	/*收藏美团星星样式*/
	$("img[src='images/header/star.png']").hover(
		function(){
			$(this).attr("src","images/header/star2.png");
		},
		function(){
			$(this).attr("src","images/header/star.png");
		}
	);
	/*手机美团下拉菜单*/
	$("li:contains('手机美团')").hover(
		function(){
			$(".app").css({"background":"#FFFFFF"});
			$(".app_menu").show();
			$(".app_menu").css({"color":"#2BB8AA"});
			$(".app .menuArrow").addClass('rotate');
		},
		function(){
			$(".app").css({"background":"#F9F9F9"});
			$(".app_menu").hide();
			$(".app_menu").css({"color":"#666"});
			$(".app .menuArrow").removeClass('rotate');
		}
	);
		/*手机美团下拉菜单中二维码样式*/
	$(".QR").hover(
		function(){
			$(this).css({"display":"block","background":"#F9F9F9"});
		},
		function(){
			$(this).css({"display":"block","background":"#FFFFFF"});
		}
	);
	
	/*Master右侧下拉菜单*/
	function downMenu(name){
		$(name).bind("mouseover",function(){
			$(this).children().eq(1).show();
			$(this).css({"background":"#FFFFFF"});
			$(this).children().eq(0).css({"background":"#FFFFFF"});
			$(this).children('a').children('.menuArrow').addClass('rotate');
		}).bind("mouseout",function(){
			$(this).children().eq(1).hide();
			$(this).children().eq(0).css({"background":"#F9F9F9"});
			$(this).children('a').children('.menuArrow').removeClass('rotate');
		});
	}
	downMenu(".dnMe");

		/*右侧下拉菜单中详细内容js*/
		function menuColor(name){
			$(name).bind("mouseover",function(){
				$(this).css({"background":"#F9F9F9"});
			}).bind("mouseout",function(){
				$(this).css({"background":"#FFFFFF"});
			});
		}
		menuColor(".my_meituan_menu li");
		menuColor(".rec_menu li");
		menuColor(".shopping_car_menu li");
		menuColor(".contact_menu li");
		menuColor(".merchant_menu li");
		menuColor(".more_menu li");

		/*关闭广告按钮控制*/
	$(".error").bind("click",function(){
		$(".adv").hide();
		$(".header_container").css({"height":"122px"});
	})
	
	/**********************************轮播广告开始*********************************/
	var $arrli=$(".adv_content").children();
	var $arli=$(".adv_icon").children();
	var timer;
	var flag=0;
	//定时器循环调用，形成轮播广告
	function change(){
		if(flag>=2){flag=0;}
		qie();
		flag++;
		timer=setTimeout(change,4000);
	}
	//广告和右下方指示原点的样式变化
	function qie(){
		$arrli.not($arrli[flag]).stop(true).animate({"opacity":0},1000);
		$arli.not($arli[flag]).css({"background":"#CCCCCC"});
		$($arrli[flag]).stop(true).animate({"opacity":1},1000);
		$($arli[flag]).css({"background":"#2BB8AA"});
	}
	//鼠标浮动后样式的变化
	function point(){
		$arli.bind("mouseover",function(){
			clearTimeout(timer);
			flag=$(this).attr("lang");
			qie();
		}).bind("mouseout",function(){
			change();
		})
		change();
	}
	point();
})(jQuery);
