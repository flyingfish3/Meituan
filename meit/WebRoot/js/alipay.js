;(function($){
	this.alipay=function(){
		/**************************倒计时********************************/
		var timeout=function(){
			var SysSecond=3600;//在服务端算好了剩余的秒数，并保存到客户端，如果过期则返回0
			var InterValObj= window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
			 //代理,接单的时间+1小时减去当前时间的秒数
			function SetRemainTime() {
				  if (SysSecond > 0) {
				   SysSecond = SysSecond - 1;
				   var second = Math.floor(SysSecond % 60);             // 计算秒    
				   var minite = Math.floor((SysSecond / 60) % 60);      //计算分
				   var hour = Math.floor((SysSecond / 3600) % 24);      //计算小时

				   $(".orderDetail-base .timeout").html( minite);
				  } else {//剩余时间小于或等于0的时候，就停止间隔函数
				    clearInterval(InterValObj);
				  }
			}
			SetRemainTime();
		}

		/**************************提示如何用手机付费的Js**************************/
		//点击当前的则隐藏，非当前的显示
		var phonePayTip=function(){
			$arrs=$(".phone_left ul li");
			var flag=1;
			$(".phone_left ul").children('li').bind("click",function(){
				$($arrs[flag]).animate({opacity:0},'normal');
				$arrs.not($arrs[flag]).animate({opacity:1},'normal');
				if(flag==1){
					flag=0;
				}else if(flag==0){
					flag=1;
				}
			});
			var times=0;//用来控制第一次鼠标浮动到上面则显示第二个
			$(".phone_left ul").children('li').bind("mouseover",function(){
				if(times==0){
					$($arrs[flag]).animate({opacity:0},'normal');
					$arrs.not($arrs[flag]).animate({opacity:1},'normal');
					if(flag==1){
						flag=0;
					}else if(flag==0){
						flag=1;
					}
				}
				times++;
			});
		}
		/******************************鼠标放到phone_right上时，整体向左移动10px**************/
		var left=function(){
			$(".phone_right").bind("mouseover",function(){
				$(this).animate({"left":"780px","width":"170px"},'slow');

			});
		}
		/******************************鼠标放到web_left上时，整体向右移动10px**************/
		var right=function(){
			$(".web_left").bind("mouseover",function(){
				$(this).animate({"left":"0px","width":"170px"},'slow');

			});
		}
		/********************************点击则往左漂****************************/
		var floatLeft=function(){
			$(".phone_right").bind("click",function(){
				$(".cashier_center_view").animate({'left':'-950px'}, 'slow');
			});
		}
		/********************************点击则往右漂****************************/
		var floatRight=function(){
			$(".web_left").bind("click",function(){
				$(".cashier_center_view").animate({'left':'0px'}, 'slow');
			});
		}
		return{
			initTimeout:function(){timeout()},
			initPhoneTip:function(){phonePayTip()},
			initLeft:function(){left()},
			initRight:function(){right()},
			initFloatLeft:function(){floatLeft()},
			initFloatRight:function(){floatRight()}
		}
	}();
})(jQuery);