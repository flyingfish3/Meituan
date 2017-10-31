;(function($){
	this.category=function(){
		/*头部过滤条件，鼠标浮动到上面：
		  1、箭头旋转；
		  2、显示此过滤条件所有的同类过滤条件（已存放在application中）*/
		var filterTop=function(){
			$(".ctx_title").bind("mouseover",function(){
				$(this).children('.ctx_detail_wrapper').show();
				//$(".ctx_detail_wrapper").show();
				$(this).children('img').addClass('rotate');
				//$(".ctx_title img").addClass('rotate');
				$(this).children('.ctx_detail_wrapper').children('.left_wrapper').hide();
				//$(".left_wrapper").hide();
			}).bind("mouseout",function(){
				$(".ctx_detail_wrapper").hide();
				$(".ctx_title img").removeClass('rotate');
			});
		}
		/*点击具体的筛选条件(通过ajax从数据库读取数据)：
		1、把该具体过滤条件添加显示到大的筛选条件上；
		2、把与此同类型的筛选条件隐藏；
		3、在被点击选中的过滤条件后append此过滤条件所有的同类过滤条件*/
		var addFilterTop=function(){
			$(".filter_section_wrapper .sorts li").bind("click",function(){
				//改变用来触发提交的input元素标签的值
				var inp=$(".forchange").val();
				$(".forchange").val(parseInt(inp)+1);
				//被点击的元素的html()
				var s_sort=$(this).children('a').html();
				//获取被点击元素的父元素的样式
				var p_sort=$(this).parent('ul').parent('.sorts').attr('class');
				//取出被点击元素的父元素的后一种样式
				var pl_sort=p_sort.substr(6);
				
				//取出querytype类型
				var querytype=$(this).children('a').attr("lan");
				//取出querytypeid
				var querytypeid=$(this).children('a').attr("lang");
				
				var ctx="<li class='ctx'><span class='rightArrow'>></span>"
						+"<span class='ctx_title'><input type='text' class='s_sort' value='"
						+s_sort
						+"'/>"
				        +"<input type='hidden' value='"
				        +pl_sort
				        +"'/>"	
				        +"<input type='hidden' class='hid' value='"
				        +querytypeid
				        +"' name='"
				        +querytype
				        +"'/></span><span class='close'>×</span></li>";	
				$(".filter_breadcrumb form ul").append(ctx);
				$(this).parent('ul').parent('.sorts').hide();
				//注意jquery动态添加到页面的元素，不能直接就可以绑定事件。若要绑定事件，则在元素生成时，就给元素绑定
				closeSsort();
				/*表单里面的li的长度一旦发生改变，就触发提交表单，到数据库查询*/
				$(".forchange").parent("form").submit();
			});
		}
		/*点击close按钮：
		1、此小过滤功能删除
		2、下面的详细过滤条件出增加
		3、判断增加的详细过滤条件所放置位置*/
		var closeSsort=function(){
			$(".filter_breadcrumb ul").children('.ctx').children('.close').bind("click",function(){
				var inp=$(".forchange").val();
				$(".forchange").val(parseInt(inp)-1);
				//取出小类的下面的隐藏域input中的值，把其值对应的详细分类显示出来
				var p_sort=$(this).parent("li").children().eq(1).children().eq(1).val();
				//把此过滤条件删除
				$(this).parent('.ctx').remove();
				//获取被删除的条件的属性名及值，放到.recordDeleteFilters内。并传递至前台？？此功能未实现。待定
				
				//取出该小分类的名称，并通过ajax到数据库中查询出其父分类下的所有分类，然后追加
				$('.'+p_sort).show();
				/*表单里面的li的长度一旦发生改变，就触发提交表单，到数据库查询*/
				$(".forchange").parent("form").submit();
			});
		}
		
		/*点击过滤条件中的销量、价格、好评等样式发生变化。并且通过AJAX从数据库读取最新数据*/
		var $sorts=$(".filter_sort ul").children('li');
		var withsort=function(){
			$(".filter_sort .withsort").bind('click',function(){
				//当前点击的附加样式
				$(this).addClass('current');
					//字段样式
					$(this).children().children('.sortby').css({'color':'#2BB8AA'});
					//箭头样式
					$(this).children().children('span').css({'color':'#2BB8AA'});
				//非当前的去除current样式
				$sorts.not($(this)).removeClass('current');
					//字段样式
					$sorts.not(this).children().children('.sortby').css({'color':'grey'});
					//箭头样式
					$sorts.not(this).children().children('span').css({'color':'grey'});
				//获取隐藏域中value的值。奇数次和偶数次点击时样式不同
				var $inp=$(this).children('a').children('input');
				//获取箭头元素对象。
				var $arrow=$(this).children().children('span');
				if(parseInt($inp.val())==0){//则为第奇数次点击
					//修改伪类即箭头的样式
					$arrow.removeClass('changesort2');
					$arrow.addClass('changesort');
					$inp.val(1);
				}else if(parseInt($inp.val())==1){//则为第偶数次点击
					$arrow.removeClass('changesort');
					$arrow.addClass('changesort2');
					$inp.val(0);
				}
			});
		}
		/*鼠标放到单个商品上时，整个块样式发生变化*/
		var bo=function(){
			$(".pageData ul").children('li').bind("mouseover",function(){
				$(this).addClass('bo');
			}).bind("mouseout",function(){
				$(this).removeClass('bo');
			})
		}
		/*浏览器的滚动条滚到了一定的距离之后，右侧侧边栏固定在浏览器顶部*/
		var sidebar=function(){
			$(window).bind("scroll",function(){
				var top=$(this).scrollTop();
				if(top<=720){
        			$(".sidebar .rec").css({"position":"relative","top":"0"});
        		}
				if(top>=720&&top<5800){
					$(".sidebar .rec").css({"position":"fixed","top":"-20px"});
				}
				if(top>=5800){
        			$(".sidebar .rec").css({"position":"relative","top":"5110px"});
        		}
			});
		}
		/*关闭狗皮膏药*/
		var closefixadv=function(){
			$(".closeadv").bind("click",function(){
				$(".fixadv").hide();
			});
		}
		return{
			initFilterTop:function(){filterTop();},
			initAddFilterTop:function(){addFilterTop()},
			initCloseSsort:function(){closeSsort()},
			initWithsort:function(){withsort()},
			initUnderline:function(){bo();},
			initSideBar:function(){sidebar();},
			initclosefixadv:function(){closefixadv();}
		}
	}();
})(jQuery);