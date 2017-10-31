;(function($){
	this.index=function(){
		/*全部分类模块的左侧，鼠标浮动到右处的箭头，右边相应模块变化*/
		var menu=function(name){
			$(name).bind("mouseover",function(){
				$(this).children().eq(1).show();
				$(this).css({"background-color":"white","border-right":"1px solid white"});
				$(this).children('.Title').children('.someMore').children('span').css({"color":"white"});
				$(this).parents("dl").children('dd:last').css({"border-bottom":"0"});
				$(this).parents(".sort_left").css({"border-left":"1px solid #BCBCBC"});
				$(this).parents("dl").css({"border-bottom":"1px solid #BCBCBC"});
			}).bind("mouseout",function(){
				$(this).children().eq(1).hide();
				$(this).css({"background-color":"#FAFAFA","border-right":"1px solid #EEEEEE"});
				$(this).children('.Title').children('.someMore').children('span').css({"color":"#ddd"});
				$(this).parents("dl").children('dd:last').css({"border-bottom":"1px solid #EEEEEE"});
				$(this).parents(".sort_left").css({"border-left":"1px solid #eee"});
				$(this).parents("dl").css({"border-bottom":"1px solid #eee"});
			});
		}
	/****************************中间部分轮播广告*****************************/
		var advInterval;
		var flag=1;
		//定时器循环调用，形成轮播广告
		var changeAdv=function(){
			//alert($(".sort_center_midImgs_detail").css("left"));
			flag=$(".flag").html();
			flag++;
			if(flag==7){flag=1;}
			$(".flag").html(flag);
			$(".sort_center_midImgs_detail").stop(true).animate({"left":"-1420px"},1000,function(){
				$(".sort_center_midImgs_detail").css({"left":"-710px"});
				$(".sort_center_midImgs_detail ul:first").clone(true).appendTo('.sort_center_midImgs_detail');
				$(".sort_center_midImgs_detail ul:first").remove();
			});
		}
		/*鼠标浮动到广告上，左右指向 箭头显示*/
		var pointer=function(){
			$(".sort_center_midImgs").bind("mousemove",function(){
				clearInterval(advInterval);
				$("a.go_left,a.go_right").show();
			}).bind("mouseleave",function(){
				$("a.go_left,a.go_right").hide();
				advInterval=setInterval(changeAdv,4000);
			});
			advInterval=setInterval(changeAdv,4000);
		}

		/*分类部分轮播广告部分左右箭头指向*/
		var goLeft=function(){
			$("a.go_left").bind("click",function(){
				clearInterval(advInterval);
				/*需要在click之前复制广告*/
				//alert($(".sort_center_midImgs_detail").css("left"));
				$(".sort_center_midImgs_detail").stop(true).animate({"left":"0px"},1000,function(){
					$(".sort_center_midImgs_detail ul:last").clone(true).prependTo('.sort_center_midImgs_detail');
					$(".sort_center_midImgs_detail ul:last").remove();
					$(".sort_center_midImgs_detail").css({"left":"-710px"});
				});
				advInterval=setInterval(changeAdv,3000);
			});
		}
		var goRight=function(){
			$("a.go_right").bind("click",function(){
				clearInterval(advInterval);
				$(".sort_center_midImgs_detail").stop(true).animate({"left":"-1420px"},1000,function(){
					$(".sort_center_midImgs_detail ul:first").clone(true).appendTo('.sort_center_midImgs_detail');
					$(".sort_center_midImgs_detail ul:first").remove();
					$(".sort_center_midImgs_detail").css({"left":"-710px"});
				});
				advInterval=setInterval(changeAdv,3000);
			});
		}
	/****************************名品抢购部分*************************************/
		/***********************倒计时******************/
		 var SysSecond=18000;//这里我是在服务端算好了剩余的秒数，并保存到客户端，如果过期则返回0
		 var InterValObj= window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行.代理,接单的时间+1小时减去当前时间的秒数
		 function SetRemainTime(){
		 	if (SysSecond > 0) {
			   SysSecond = SysSecond - 1;
			   var second = Math.floor(SysSecond % 60);             // 计算秒    
			   var minite = Math.floor((SysSecond / 60) % 60);      //计算分
			   var hour = Math.floor((SysSecond / 3600) % 24);      //计算小时
			   var day = Math.floor((SysSecond / 3600) / 24);        //计算天

			   $(".remainTime").html( hour + ":" + minite + ":" + second);
			  } else {//剩余时间小于或等于0的时候，就停止间隔函数
			    clearInterval(InterValObj);
			  }
		 }
		 
		 /****************名品抢购部分轮播广告*****************/
		 var inde=1;
		 var specInterval;
		 var changeSpecAdv=function(){
		 	inde=$(".inde").html();
			inde++;
			if(inde==6){inde=1;}
			$(".inde").html(inde);
		 	$(".spec_adv").stop(true).animate({"left":"-2556px"},2000,function(){
				$(".spec_adv").css({"left":"-1278x"});
				$(".spec_adv ul:first").clone(true).appendTo('.spec_adv');
				$(".spec_adv ul:first").remove();
			});	
		 }

		 /************名品抢购部分广告鼠标浮动上去停止播放，并且指向箭头显示出来**********/
		 var specPointer=function(){
		 	//alert("轮播1");
		 	$(".spec_advs").bind("mousemove",function(){
		 		//alert("轮播2");
		 		clearInterval(specInterval);
		 		$("div.go_left,div.go_right").show();
		 	}).bind("mouseleave",function(){//alert("轮播3");
		 		$("div.go_left,div.go_right").hide();
		 		specInterval=setInterval(changeSpecAdv,4000);
		 	});
		 	specInterval=setInterval(changeSpecAdv,4000);//alert("轮播4");
		 }

		 /************名品抢购部分广告左右指向箭头**********/
		 var goLeftSpec=function(){
			$(".spec_advs .go_left").bind("click",function(){
				clearInterval(specInterval);
				$(".spec_adv").stop(true).animate({"left":"0px"},2000,function(){
					$(".spec_adv ul:last").clone(true).prependTo('.spec_adv');
					$(".spec_adv ul:last").remove();
					$(".spec_adv").css({"left":"-1278px"});
				});
				specInterval=setInterval(changeSpecAdv,4000);
			});
		}
		var goRightSpec=function(){
			$(".spec_advs .go_right").bind("click",function(){
				clearInterval(specInterval);
				$(".spec_adv").stop(true).animate({"left":"-2556px"},2000,function(){
					$(".spec_adv").css({"left":"-1278px"});
					$(".spec_adv ul:first").clone(true).appendTo('.spec_adv');
					$(".spec_adv ul:first").remove();
				});
				specInterval=setInterval(changeSpecAdv,4000);
			});
		}
	 /*******************左侧导航栏js1--导航栏定位**********************/
		 var menubar1=function(){
		 	$(window).bind("scroll", function(){ 
	        	var top = $(this).scrollTop();
	        	//alert(top);
	        	if(top>=1120&top<7000){
	        		$(".left_menu").css({"position":"fixed","top":"0","left":"20px"});
	        	}
	        	if(top<=1120){
	        		$(".left_menu").css({"position":"absolute","top":"1120px","left":"20px"});
	        	}
	        	if(top>=6800){
	        		$(".left_menu").css({"position":"absolute","top":"6790px","left":"20px"});
	        	}
	 		});
	 		/*导航栏在浏览器放大和缩小是，相对网页主体的位置不变*/
	 		$(window).resize(function() {
	 			$(".left_menu").css('left',($(window).width()-1170)/2-70);
	 		});
		 }

		 /*******************左侧导航栏js2**********************/
		 var $arrMain=$(".formenu").children();//console.log($arrMain);
		 var $arrMenu=$(".left_menu ul").children();//console.log($arrMenu);
		 var menubar2=function(){
		 	$arrMenu.bind("mouseover",function(){
		 		var $cur=$(this).children().eq(0).children().eq(0);
		 		$cur.css({"backgroundPosition":"center 0px"});
		 		$(this).css({"backgroundColor":"#2BB8AA"});
		 		$(this).children('a').children('span').css({"color":"white"});
		 	}).bind("mouseout",function(){
		 		var $cur=$(this).children().eq(0).children().eq(0);
		 		//获取背景图片的高度
		 		var bim=$cur.css("backgroundSize");
		 		var bw=bim.substr(5,2);
		 		var n=bw/2;
		 		$cur.css({"backgroundPosition":"center -npx"});
		 		$(this).css({"background":"white"});
		 		$(this).children('a').children('span').css({"color":"#666"});
		 	});
		 }
		/*******************左侧导航栏js3**********************/
		var menubar3=function(){
			$(window).bind("scroll", function(){
				//滚动条滚动距离浏览器顶部的高度
				var scrotop=$(window).scrollTop();
				//最后一个模块的底部距离浏览器顶部的高度
				var iframetop=$(".bottom").offset().top;
				
				//遍历循环模块集合，获取其距离浏览器顶部的高度。当滚动条距离浏览器顶部的高度在模块距离浏览器顶部高度的范围内时，赋予相应样式
				for(var i=0;i<$arrMain.length;i++){
					//主体中某个模块距离浏览器顶部的高度范围在offtop和offtop2之间
					var offtop=$($arrMain[i]).offset().top;
					var offtop2=(i==($arrMain.length-1))?(iframetop):($($arrMain[i+1]).offset().top);//如果是最后一个模块
					
					if(parseInt(scrotop)>=parseInt(offtop)&&parseInt(scrotop)<=parseInt(offtop2)){
						//当前对应的模块的导航修改背景色，并更改其内部图像的定位
						$($arrMenu[i]).css({"backgroundColor":"#2BB8AA"});
						var $cur=$($arrMenu[i]).children().eq(0).children().eq(0);
						$cur.css({"backgroundPosition":"center 0px"});	
						$($arrMenu[i]).children().eq(0).children().eq(1).css({"color":"white"});		 		
				 		//非当前的元素
						var $notcur=$arrMenu.not($arrMenu[i]);
						$notcur.css({"backgroundColor":"white"});
				 		//遍历循环所有不是当前模块的集合。依次给与图片背景
				 		for(var j=0;j<$notcur.length;j++){
				 			//获取背景图片的高度
				 			var bim=$($notcur[j]).css("backgroundSize");
				 			var bw=bim.substr(5,2);
					 		var n=bw/2;
					 		$($notcur[j]).children().eq(0).children().eq(1).css({"color":"#666"});
					 		$($notcur[j]).children().eq(0).children().eq(0).css({"backgroundPosition":"center npx"});
				 		}
					}
				}
				/*第一个模块*/
				if(parseInt(scrotop)<1075){
					$($arrMenu[0]).css({"backgroundColor":"#2BB8AA"});
					var $cur=$($arrMenu[0]).children().eq(0).children().eq(0);
					$cur.css({"backgroundPosition":"center 0px"});	
					$($arrMenu[0]).children().eq(0).children().eq(1).css({"color":"white"});		 		
				}
			});
		}
		/*首次进入首页的广告动画*/
		var firstAdv=function(){
			$(window).bind('load', function() {
				$(".custom-adv").animate({'left':'0px'},1000);
			});
			$(".custom-adv").bind('click',function() {
				$(this).animate({'left':'-1580px'},1000);
			});
		}
		return{
			initMenu:function(){menu(".sort_left_list");},
			/*initChangeAdv:function(){changeAdv();},*/
			initPointer:function(){pointer();},
			initGoLeft:function(){goLeft();},
			initGoRight:function(){goRight()},
			initSpecPointer:function(){specPointer();},
			initSpecLeft:function(){goLeftSpec();},
			initSpecRight:function(){goRightSpec();},
			initMenubar1:function(){menubar1()},
			initMenubar2:function(){menubar2()},
			initMenubar3:function(){menubar3()},
			initFirstadv:function(){firstAdv()}
		}
	}();
})(jQuery);