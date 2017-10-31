;(function($){
	//绘制图形
	var draw=function(){
		var custObj;
		//构建插件
		var build=function(param){
			/*创建一个分页的插件。根据用户传入的当前页和总页数量设置li信息
				1、如果总页数maxPage小于显示页数7，则全部显示：1 2 3 4（数量为maxPage） 
				2、如果总页数maxPage大于显示页数7则：
					当前的页数是第1时显示：1 2 3 4 5 6 7 下一页 
					当前的页数是第2 3 4时显示：上一页 1 2 3 4 5 6 7 下一页
					当前的页数是第5 时显示：首页 上一页 2 3 4 5 6 7 8 下一页
					当前的页数是第6 7 8时显示：首页 上一页 3 4 5 6 7 8 9 下一页
					当前的页数是第9时显示：首页 上一页 3 4 5 6 7 8 9
				*/
			var str="<ul class='pager_plug'>";
			if(param.maxPage<=param.disnum){
				//如果总页数maxPage小于显示页数7，则全部显示：1 2 3 4（数量为maxPage）
				for(var i=1;i<=param.maxPage;i++){
					//str+="<li><a href='init.do?currentPage=1&typeid=1' lang='1'>"+1+"</a></li>";
					str+="<li><a href='"+param.url+"?currentPage="+i+"&typeid="+param.typeid+"' lang='"+i+"'>"+i+"</a></li>";
				}
			}else{
				if(param.currentPage==1){
					//当前的页数是第1时显示：1 2 3 4 5 6 7 下一页 
					for(var i=1;i<=param.disnum;i++){
						str+="<li><a href='"+param.url+"?currentPage="+i+"&&typeid="+param.typeid+"' lang='"+i+"'>"+i+"</a></li>";
					}
					str+="<li><a href='"+param.url+"?currentPage="+(param.currentPage+1)+"&&typeid="+param.typeid+"' lang='"+(param.currentPage+1)+"'>下一页</a></li>";
				}else if(param.currentPage>=2&&param.currentPage<=4){
					//当前的页数是第2 3 4时显示：上一页 1 2 3 4 5 6 7 下一页
					str+="<li><a href='"+param.url+"?currentPage="+(param.currentPage-1)+"&&typeid="+param.typeid+"' lang='"+(param.currentPage-1)+"'>上一页</a></li>";
					for(var i=1;i<=param.disnum;i++){
						str+="<li><a href='"+param.url+"?currentPage="+i+"&&typeid="+param.typeid+"' lang='"+i+"'>"+i+"</a></li>";
					}
					str+="<li><a href='"+param.url+"?currentPage="+(param.currentPage+1)+"&&typeid="+param.typeid+"' lang='"+(param.currentPage+1)+"'>下一页</a></li>";
				}else if(param.currentPage==5){
					//当前的页数是第5 时显示：首页 上一页 2 3 4 5 6 7 8 下一页
					str+="<li><a href='"+param.url+"?currentPage=1&&typeid='"+param.typeid+" lang='1'>首页</a></li>";
					str+="<li><a href='"+param.url+"?currentPage="+(param.currentPage-1)+"&&typeid="+param.typeid+"' lang='"+(param.currentPage-1)+"'>上一页</a></li>";
					for(var i=1;i<=param.disnum;i++){
						str+="<li><a href='"+param.url+"?currentPage="+(i+1)+"&&typeid="+param.typeid+"' lang='"+(i+1)+"'>"+(i+1)+"</a></li>";
					}
					str+="<li><a href='"+param.url+"?currentPage="+(param.currentPage+1)+"&&typeid="+param.typeid+"' lang='"+(param.currentPage+1)+"'>下一页</a></li>";

				}else if(param.currentPage>=6&&param.currentPage<=8){
					//当前的页数是第6 7 8时显示：首页 上一页 3 4 5 6 7 8 9 下一页
					str+="<li><a href='"+param.url+"?currentPage=1&&typeid='"+param.typeid+" lang='1'>首页</a></li>";
					str+="<li><a href='"+param.url+"?currentPage="+(param.currentPage-1)+"&&typeid="+param.typeid+"' lang='"+(param.currentPage-1)+"'>上一页</a></li>";
					for(var i=1;i<=param.disnum;i++){
						str+="<li><a href='"+param.url+"?currentPage="+(i+2)+"&&typeid="+param.typeid+"' lang='"+(i+2)+"'>"+(i+2)+"</a></li>";
					}
					str+="<li><a href='"+param.url+"?currentPage="+(param.currentPage+1)+"&&typeid="+param.typeid+"' lang='"+(param.currentPage+1)+"'>下一页</a></li>";
				}else if(param.currentPage==9){
					str+="<li><a href='"+param.url+"?currentPage=1&&typeid='"+param.typeid+" lang='1'>首页</a></li>";
					str+="<li><a href='"+param.url+"?currentPage="+(param.currentPage-1)+"&&typeid="+param.typeid+"' lang='"+(param.currentPage-1)+"'>上一页</a></li>";
					for(var i=1;i<=param.disnum;i++){
						str+="<li><a href='"+param.url+"?currentPage="+(i+2)+"&&typeid="+param.typeid+"' lang='"+(i+2)+"'>"+(i+2)+"</a></li>";
					}
				}
			}
			str+="</ul>";
			$(custObj).append(str);
			//搜索当前页面然后附上样式表
			$(".pager_plug li a[lang="+param.currentPage+"]").addClass("active");
		}
		return{
			init:function(obj,param){
				custObj=obj;
				build(param);
			}
		}
	}();
	//构建jquery插件
	$.fn.extend({
		'pagination':function(opt){
			var setting={
				url:'default',
				currentPage:1,
				maxPage:20,
				disnum:7,
				typeid:1
			}
			if(opt){ 
				$.extend(setting,opt);
			}
			draw.init(this,setting);
		}
	});
})(jQuery);