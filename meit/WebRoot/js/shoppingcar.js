;(function($){
	this.car=function(){
		/*收藏美团星星样式*/
		var saveStar=function(){
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
		var downMenu1=function(){
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
		var downMark=function(){
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
		var downMenu2=function(name){
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
		var menuColor=function(){
			$(".dnMe ul li").bind("mouseover",function(){
				$(this).css({"background":"#F9F9F9"});
			}).bind("mouseout",function(){
				$(this).css({"background":"#FFFFFF"});
			});
		}
/************************************我的购物车的选择订单的js***********************************/
		/*单个选择按钮的js*/
		var countCho=0;
		var choose=function(name){
			$(name).bind("click",function(){
					var flag=$(this).prev().val();
					var $arrs=$(".selectSingle");
					var len=$(".selectSingle").length;

					if(flag==0){
						$(this).css({"backgroundColor":"#2BB8AA"});
						$(this).prev().val(1);

					}else if(flag==1){
						$(this).css({"backgroundColor":"white"});
						$(this).prev().val(0);
					}
					//如果子选择都被选中，那就勾上全选；子选择有一个没选择，那就把全选去掉？？
					var $arrs=$(".forchoose");
					var count=0;
					for(var i=0;i<$arrs.length;i++){
						count=count+parseInt($($arrs[i]).val());
					}
					if(count==$arrs.length){
						$(".selectAll").css({"backgroundColor":"#2BB8AA"});
						$(".selectAll").prev().val(1);
					}
					if(count!=$arrs.length){
						$(".selectAll").css({"backgroundColor":"white"});
						$(".selectAll").prev().val(0);
					}
			});
		}
		/*全选按钮的Js*/
		var chooseAllOrNot=function(name){
			$(name).bind("click",function(){
				var flag=$(this).prev().val();
				if(flag==0){
					$(this).css({"backgroundColor":"#2BB8AA"});
					$(this).prev().val(1);
					$(".selectSingle").css({"backgroundColor":"#2BB8AA"});
				}else if(flag==1){
					$(this).css({"backgroundColor":"white"});
					$(this).prev().val(0);
					$(".selectSingle").css({"backgroundColor":"white"});
				}
				countall();
			});
			
		}
		/*单击+,input里面的值+1；单击-,input里面的值-1;并且，小计中的值发生改变*/
		var changeNum=function(){
			$("div[class='minus']").bind("click",function(){
				var inp=parseInt($(this).next().val());
				$(this).next().val(inp>1?(inp-1):1);
				var $price=$(this).parent('div').parent('td').prev().children('i');
				var $count=$(this).parent('div').parent('td').next().children('i');
				$count.html(($price.html()*(inp>1?(inp-1):1)).toFixed(2));
				countall();
			});
			$("div[class='add']").bind("click",function(){
				var inp=parseInt($(this).prev().val());
				$(this).prev().val(inp+1);
				var $price=$(this).parent('div').parent('td').prev().children('i');
				var $count=$(this).parent('div').parent('td').next().children('i');
				$count.html(($price.html()*(inp+1)).toFixed(2));
				countall();
			});
			
		}
		//计算总金额
		var countall=function(){
			//计算总价
			var $counts=$(".singlecount");
			var eco=0;
			for (var i=0; i< $counts.length; i++) {
				eco=eco+parseInt($($counts[i]).html());
			}
			$(".countAllMoney").html(eco.toFixed(2));
		}
		/*使用券的click的Js*/
		var discount=function(){
			$(".discount").bind("click",function(){
				var flag=$(this).prev().val();
				if(flag==0){
					$(this).css({"backgroundColor":"#2BB8AA"});
					$(this).prev().val(1);
					$(this).parent().next().show();
				}else if(flag==1){
					$(this).css({"backgroundColor":"white"});
					$(this).prev().val(0);
					$(this).parent().next().hide();
				}
			})
		}
		return{
			initSaveStar:function(){saveStar()},
			initDownMenu1:function(){downMenu1()},
			initDownMark:function(){downMark()},
			initDownMenu2:function(){downMenu2(".dnMe")},
			initMenuColor:function(){menuColor()},
			initChoose:function(){choose(".selectSingle")},
			initChooseAll:function(){chooseAllOrNot(".selectAll")},
			initChangeNum:function(){changeNum()},
			initDiscount:function(){discount()},
			initNews:function(){news()}
		}
	}();
	
})(jQuery);
