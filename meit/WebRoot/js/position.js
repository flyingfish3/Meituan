;(function($){
	this.pos=function(){
		/*一旦选择了省就获取市的数据到.citys里*/
		var getCitys=function(){
			$(".prov").bind("change",function(){
				var pid=$(".prov").val();
				$.ajax({
					url:"city.do",
					type:"get",
					data:{"areaid":pid},
					dataType:"JSON",
					success:function(citys){
						$(".citys").children("option").remove();
						$.each(citys,function(ind){
							$(".citys").append("<option value='"+citys[ind].areaid+"'>"+citys[ind].areaname+"</option>");
						});
					}
				});
				chosenCity();
			});
		}
		/*选择完城市，就把form表单里面的action值改变*/
		var chosenCity=function(){//注意绑定的是change事件，必须change才进入此函数方法
			$(".sure").bind("click",function(){
				var chosen=$(".citys").val();
				window.location="init.do?areaid="+chosen;
			});
		}
		return{
			initCitys:function(){getCitys();},
			initchosenCity:function(){chosenCity();}
		}
	}();
})(jQuery);