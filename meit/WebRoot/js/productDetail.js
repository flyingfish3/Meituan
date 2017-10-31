;(function($){
	this.adv=function(){
		/*********************************商品广告*********************/
	/*当前大图对应的缩略图给与样式*/
		var currentImg=function(){
			//获取当前的大图中的src
			var xImgsrc=$(".cover a img").attr('src');
			//获取所有缩略图的src
			var $arrs=$(".deal_thumb").children('li');
			//遍历循环缩略图的src数组，找到到大图对应的缩略图，并附加样式
			for(var i=0;i<$arrs.length;i++){
				var sImgsrc=$($arrs[i]).children('img').attr('src');
				if(xImgsrc==sImgsrc){
					$($arrs[i]).children('img').addClass('current');
				}
				if(xImgsrc!=sImgsrc){
					$($arrs[i]).children('img').removeClass('current');
				}
			}
		}
	/*点击缩略图，对应的大图显示--通过attr获取Img标签的src属性改变*/
		var showCover=function(){
			//先获取所点击的图片的src路径，再把该路径赋给大图
			$(".deal_thumb").children().bind("mouseover",function(){
				var imgsrc=$(this).children('img').attr('src');
				$(".cover a img").attr('src',imgsrc);
				$(this).children('img').addClass('current');
				currentImg();
			}).bind("mouseout",function(){
				$(this).children('img').removeClass('current');
				currentImg();
			});
		}
	/**************************倒计时*********************/
		var timeo=function(){
			var SysSecond=4200;//这里我是在服务端算好了剩余的秒数，并保存到客户端，如果过期则返回0
			var InterValObj= window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
			 //代理,接单的时间+1小时减去当前时间的秒数
			function SetRemainTime() {
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
			SetRemainTime();
		}

	/*倒计时上的js效果*/
		var timeoShow=function(){
			$(".to").bind("mouseover",function(){
				$(".to_ctx").next().show();
			//	$(".to_ctx .arrdown").addclass({'transform':'rotateZ(180deg)'});    
				  $(".to_ctx .arrdown").addClass("sss");    
			}).bind("mouseout",function(){
				$(".to_ctx").next().hide();
				//$(".to_ctx .arrdown").addclass({'transform':'rotateZ(360deg)'});
				$(".to_ctx .arrdown").removeClass("sss"); 
			});
		}

	/*被选择的套餐颜色变蓝色*/
	var choosenPackage=function(){
		//所有input
		var $inps=$(".deal_order_scheme input");
		//所有套餐内容的Input
		var $pacs=$(".deal_order_scheme .pac");
		$pacs.bind('click',function(){
			//对于每个单个文本域，奇数次点击赋予选中的样式，偶数次则去除
			var $inp=$(this).next();
			if(parseInt($inp.val())==0){
				$(this).addClass('choosenPackage');
				$pacs.not($(this)).removeClass('choosenPackage');//对于所有文本域，只有一个可以被选择
				$inp.val(1);
				$pacs.not($(this)).next().val(0);//非当前选择的套餐的下面隐藏域值更改
			}else if(parseInt($inp.val())==1){
				$(this).removeClass('choosenPackage');
				$inp.val(0);
			}
		});
	}

	/*数量点击+和-*/
	var changeNum=function(){
		$("input[id='a1']").bind("click",function(){
				var inp=parseInt($(this).next().val());
				$(this).next().val(inp>1?(inp-1):1);
		});
		$("input[id='a3']").bind("click",function(){
				var inp=parseInt($(this).prev().val());
				$(this).prev().val(inp+1);
		});
	}
	/*点击加入购物车样式变化*/
		var addCar=function(){
			$(".car").bind('click',function(){
				//点击加入购物车，购物车中商品数量发生变化。此功能通过ajax实现
				var goodsid=$(".hidgoods").val();
				var buynum=$(".buynum").val();
				$.ajax({
					url:"car.do",
					data:{"goodsid":goodsid,"buynum":buynum},
					success:function(num){
						//alert(num);
						//把Num放入页面
						$(".carshopnum").html(num);
						//页面js效果
						$(".carbox").show();
					}
				});
				
			});
		}

	/*点击关闭按钮，加入购物车成功的提示框隐藏*/
		var hideCar=function(){
			$(".closeCarbox").bind("click",function(){
				$(".carbox").hide();
			});
			$(".con").bind('click',function(){
				$(".carbox").hide();
			});
		}
	/*浏览器的滚动条滚到了一定的距离之后，横向导航条固定在浏览器顶部*/
		var menubar=function(){
			$(window).bind("scroll",function(){
				var top=$(this).scrollTop();
				if(top>=1020){
					$(".navbar").css({"position":"fixed","top":"0","z-index":"1"});
					$(".navbar").stop(true).animate({"width":"978px"});
					$(".navbuy").css({"display":"block"});
					$(".navbuy").stop(true).animate({"left":"708px"});
				}
				if(top<=1020){
        			$(".navbar").css({"position":"relative","top":"0","z-index":"1"});
        			$(".navbar").stop(true).animate({"width":"710px"});
        			$(".navbuy").css({"display":"none"});
        			$(".navbuy").stop(true).animate({"left":"450px"});
        		}
			});
		}
	/*浏览器的滚动条滚到了一定的距离之后，右侧侧边栏固定在浏览器顶部*/
		var sidebar=function(){
			$(window).bind("scroll",function(){
				var top=$(this).scrollTop();
				//alert(top);
				if(top<=1000){
        			$(".more_sidebar .rec").css({"position":"relative","top":"0","z-index":"-1"});
        		}
				if(top>=1000&&top<4700){
					$(".more_sidebar .rec").css({"position":"fixed","top":"34px","z-index":"1"});
				}
        		if(top>=4700){
        			$(".more_sidebar .rec").css({"position":"relative","top":"3685px","z-index":"-1"});
        		}
			});
		}
	/*关闭狗皮膏药*/
	var closefixadv=function(){
		$(".closeadv").bind("click",function(){
			$(".fixadv").hide();
		});
	}
	/*该商家其他团购，鼠标放上去就变色*/
	var line=function(){
		$(".other_purchase ul li").hover(function(){
			$(this).addClass("licolor");
			$(this).children("a").children("span").addClass("spancolor");
		},
		function(){
			$(this).removeClass("licolor");
			$(this).children("a").children("span").removeClass("spancolor");
		});
	}
		return{
			initThumb:function(){showCover();},
			initMenuBar:function(){menubar();},
			initRemainTime:function(){timeo();},
			initTimeoShow:function(){timeoShow();},
			initSideBar:function(){sidebar();},
			initCurrentImg:function(){currentImg();},
			initChoosenPackage:function(){choosenPackage();},
			initChangeNum:function(){changeNum()},
			initAddCar:function(){addCar()},
			initHideCar:function(){hideCar()},
			initclosefixadv:function(){closefixadv()},
			initline:function(){line()}
		}
	}();
})(jQuery);
