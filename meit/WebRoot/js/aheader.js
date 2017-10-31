;(function($){
	this.aheader=function(){
		/*收藏美团星星样式*/
		var changeStar=function(){
			$("img[src='images/header/star.png']").hover(
				function(){
					$(this).attr("src","images/header/star2.png");
				},
				function(){
					$(this).attr("src","images/header/star.png");
				}
			);
		}
		/*消息下拉菜单*/
		var news=function(){
			$(".news").hover(
				function(){
					$(".news .menuArrow").addClass('rotate');
				},
				function(){
					$(".news .menuArrow").removeClass('rotate');
			});
		}
		/*手机美团下拉菜单*/
		var appMenu=function(){
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
		}
		/*手机美团下拉菜单中二维码样式*/
		var appMark=function(){
			$(".QR").hover(
				function(){
					$(this).css({"display":"block","background":"#F9F9F9"});
				},
				function(){
					$(this).css({"display":"block","background":"#FFFFFF"});
				}
			);	
		}
		/*Master右侧下拉菜单*/
		var rightDownMenu=function(name){
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
		/*右侧下拉菜单中详细内容js*/
		var menuStyle=function(name){
			$(name).bind("mouseover",function(){
				$(this).css({"background":"#F9F9F9"});
			}).bind("mouseout",function(){
				$(this).css({"background":"#FFFFFF"});
			});
		}
		/*轮播大广告*/
		var $arrli=$(".adv_content").children();
		var $arli=$(".adv_icon").children();
		var timer;
		var flag=0;
		var qie=function(){
			$arrli.not($arrli[flag]).stop(true).animate({"opacity":0},1000);
			$arli.not($arli[flag]).css({"background":"#CCCCCC"});
			$($arrli[flag]).stop(true).animate({"opacity":1},1000);
			$($arli[flag]).css({"background":"#2BB8AA"});
		}
		var change=function(){
			if(flag>=2){flag=0;}
			qie();
			flag++;
			timer=setTimeout(change,4000);
		}
		var point=function(){
			$arli.bind("mouseover",function(){
				clearTimeout(timer);
				flag=$(this).attr("lang");
				qie();
			}).bind("mouseout",function(){
				change();
			})
			change();
		}
		/*鼠标浮动到全部分类上面，分类显示出来，离开则隐藏*/
		var sortAll=function(){
			$(".sort_left").bind("mouseover",function(){
				$(".sort_left_list").show();
			}).bind("mouseout",function(){
				$(".sort_left_list").hide();
			});
		} 
		/*鼠标浮动到具体分类时，右侧显示出该分类下更多详细分类*/
		var rightMenu=function(name){
			$(name).bind("mouseover",function(){
				$(this).children().eq(1).show();
				$(this).css({"background-color":"white","border-right":"1px solid white"});
				$(this).children('.Title').children('.someMore').children('span').css({"color":"white"});
				//$(this).parents(".alllist").children('dd:last').css({"border-bottom":"0"});
				$(this).parents(".sort_left").css({"border-left":"1px solid #BCBCBC"});
				$(this).parents("dl").css({"border-bottom":"1px solid #BCBCBC"});
			}).bind("mouseout",function(){
				$(this).children().eq(1).hide();
				$(this).css({"background-color":"#FAFAFA","border-right":"1px solid #EEEEEE"});
				$(this).children('.Title').children('.someMore').children('span').css({"color":"#ddd"});
				$(this).parents("dl").children(".alllist").children('dd:last').css({"border-bottom":"1px solid #EEEEEE"});
				$(this).parents(".sort_left").css({"border-left":"1px solid #eee"});
			//	$(this).parents(".alllist").css({"border-bottom":"1px solid #eee"});
			});
		}
		/*分类的中间部分标题，鼠标浮动时js*/
		var menuStyle2=function(name){
			$(name).bind("mouseover",function(){
				$(this).css({"background-color":"#2EC5B6"});
			}).bind("mouseout",function(){
				$(this).css({"background-color":"#2BB8AA"});
			})
		}
		/*关闭广告按钮控制*/
		$(".error").bind("click",function(){
			$(".adv").hide();
			$(".header_container").css({"height":"122px"});
		})
		return{
			initStar:function(){changeStar();},
			initApp:function(){appMenu();},
			initAppMark:function(){appMark();},
			initRightDownMenu:function(){rightDownMenu(".dnMe");},
			initMenuStyle:function(){menuStyle(".dnMe ul li");},
			initSortAll:function(){sortAll();},
			initRightMenu:function(){rightMenu(".sort_left_list");},
			initMenuStyle2:function(){menuStyle2(".sort_center_top li");},
			initPoint:function(){point();},
			initNews:function(){news()}
		}
	}();
})(jQuery);