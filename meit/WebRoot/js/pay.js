;(function($){
	this.pay=function(){
		//tab的js
		var tab=function(){
			//获取所有的tab选项卡作为一个集合。然后遍历循环，在循环中给定每个子tab绑定一个click事件
			var $tabs=$(".payment_menu").children();
			var $plists=$(".payment_list");
			$tabs.bind("click",function(){
				var flag=$(this).attr("lang");
				$plists.not($plists[flag]).hide();
				$($plists[flag]).show();
				$tabs.not($tabs[flag]).removeClass('current')
				$tabs.not($tabs[flag]).addClass('notcurrent');
				$($tabs[flag]).addClass('current');
			});		
		}
		//支付帮助处，鼠标浮动到此处，具体帮助内容显示；离开则隐藏
		var paymentHelp=function(){
			$(".tips_help,.payment_help").bind("mouseover",function(){
				$(".payment_help").show();
				$(".tips_help span").addClass('rotate');
			}).bind("mouseout",function(){
				$(".payment_help").hide();
				$(".tips_help span").removeClass('rotate');
			});
		}
		//箭头转动的Js
		var arrow=function(){
			$(".tips_help,.payment_help").bind("mouseenter",function(){
				$(".tips_help span").addClass('rotate');
				$(".tips_help span").css({"color":"#2CBFB0"});
			}).bind("mouseleave",function(){
				$(".tips_help span").removeClass('rotate');
				$(".tips_help span").css({"color":"#666666"});
			});
		}
		//支付帮助具体内容里，点击箭头，更具体的帮助内容显示或隐藏
		var paymentHelpDetail=function(){
			$(".help_list span").toggle(function() {
				$(this).parent(".help_list").next("p").show();
				$(this).addClass('rotate');
			}, function() {
				$(this).parent(".help_list").next("p").hide();
				$(this).removeClass('rotate');
			});
		}
		return{
			initTab:function(){tab();},
			initHelp:function(){paymentHelp();},
			initArrow:function(){arrow();},
			initPayDetail:function(){paymentHelpDetail();}
		}
	}();
})(jQuery);