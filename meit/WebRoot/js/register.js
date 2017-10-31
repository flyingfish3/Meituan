;(function($){
	this.register=function(){
		/*当用户选择订阅美团网团购信息，提示用户，感谢其使用*/
		var book=function(){
			$("#book").bind("click",function(){
				if($(this).is(":checked")){alert("感谢您的支持，请你继续使用！")};
			});
		}
		
		/*鼠标到浮动到菜单栏上面的时候，this的样式发生变化(主要是导航中小图标的定位变化)*/
		var navbar=function(){
			$(".nav").children().eq(0).bind("mouseover",function(){
				$(".e_i").css({"backgroundPosition":"center -11px"});
				$(".e_f").css({"color":"#2EC8B9"});
			}).bind("mouseout",function(){
				$(".e_i").css({"backgroundPosition":"center 0px"});
				$(".e_f").css({"color":"black"});
			});
			$(".nav").children().eq(1).bind("mouseover",function(){
				$(".p_i").css({"backgroundPosition":"center -13px"});
				$(".p_f").css({"color":"#2EC8B9"});
			}).bind("mouseout",function(){
				$(".p_i").css({"backgroundPosition":"center 0px"});
				$(".p_f").css({"color":"black"});
			});
		}
		/*必填标志*/
		var require=function(){
			$("form input.required").each(
				function(){
					var $str=$("<strong style='color:red;position:absolute;top:8px;left:275px;font-size:18px'>*</strong>");
					$(this).parent().append($str);
				}
			);
		}
		/*使用ajax调用省市*/
		var getpro=function(){
			$("select[name=prov]").bind("click",function(){
				$.ajax({
					url:"getpro.do",
					dataType:"JSON",
					success:function(provs){
						$.each(provs,function(ind){
							$("select[name=prov]").append("<option value='"+provs[ind].areaid+"'>"+provs[ind].areaname+"</option>");
						});
					}
				});
			});
		}
		var getcitys=function(){
			$(".prov").bind("change",function(){
				var pid=$(".prov").val();
				if(parseInt(pid)==0){
					$ckr=$(this).parent('div').next('.forPromt').children('.checkResult');
					$ckr.html("请选择省份");
				}
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
			});
		}
		
/*	*******************************表单验证************************************** *************/
		/*************************公共方法****************/
		/*邮箱、用户名、创建密码等校验的时候，对合法性校验的结果给与相关样式的公共Js*/
		var validateCheck=function(id,name,reg){
			$(id).bind("blur",function(){
				var inv=$(this).val();
				$ckr=$(this).parent('div').next('.forPromt').children('.checkResult');
				$ic=$(this).parent('div').next('.forPromt').children('.imgcontainer');
				if(inv==''){
					$ckr.html(name+"不能为空");
					$ckr.addClass('errorP');
					$ic.addClass('errorImg');
					return false;
				}else if(!reg.test(inv)){
					$ckr.html(name+"不合法");
					$ckr.addClass('errorP');
					$ic.addClass('errorImg');
					return false;
				}else{
					$ckr.html(name+"合法");
					$ckr.addClass('okP');
					$ic.addClass('okImg');
					return true;
				}
			});
		}
		/*密码校验，包括密码强度*/
		var pwdCheck=function(id){
			$(id).bind("blur",function(){
				var pwd=$(this).val();
				var reg=new RegExp(/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/);
				$ckr=$(this).parent('div').next('.forPromt').children('.checkResult');
				$ic=$(this).parent('div').next('.forPromt').children('.imgcontainer');
				if(pwd==''){
					$ckr.html("密码不能为空");
					$ckr.addClass('errorP');
					$ic.addClass('errorImg');
					$(".pwdbar .level").removeClass('low');
					$(".pwdbar .level").removeClass('mediu');
					$(".pwdbar .level").removeClass('high');
					return false;
				}else if(!reg.test(pwd)){
					$ckr.html("密码不合法");
					$ckr.addClass('errorP');
					$ic.addClass('errorImg');
					$(".pwdbar .level").removeClass('low');
					$(".pwdbar .level").removeClass('mediu');
					$(".pwdbar .level").removeClass('high');
					return false;
				}else{
					if(pwd.length<=10){
						$ckr.html("密码安全等级低");
						$ckr.addClass('okP');
						$ic.addClass('okImg');
						$(".pwdbar .level").addClass('low');
						$(".pwdbar .level").removeClass('mediu');
						$(".pwdbar .level").removeClass('high');
						return true;
					}else if(pwd.length>10&&pwd.length<=15){
						$ckr.html("密码安全等级中");
						$ckr.addClass('okP');
						$ic.addClass('okImg');
						$(".pwdbar .level").addClass('mediu');
						$(".pwdbar .level").removeClass('low');
						$(".pwdbar .level").removeClass('high');
						return true;
					}else{
						$ckr.html("密码安全等级高");
						$ckr.addClass('okP');
						$ic.addClass('okImg');
						$(".pwdbar .level").addClass('high');
						$(".pwdbar .level").removeClass('mediu');
						$(".pwdbar .level").removeClass('low');
						return true;
					}
				}
			}).bind("keyup",function(){
				$(this).triggerHandler('blur');
			}).bind("focus",function(){
				$(this).triggerHandler('blur');
			});
		}
		/*确认密码*/
		var rePwdCheck=function(rid,id){
			$(rid).bind("blur",function(){
				var reg=new RegExp(/^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/);
				var rpwd=$(this).val();
				var pwd=$(id).val();
				$ckr=$(this).parent('div').next('.forPromt').children('.checkResult');
				$ic=$(this).parent('div').next('.forPromt').children('.imgcontainer');
				if(rpwd==''){
					$ckr.html("密码不能为空");
					$ckr.addClass('errorP');
					$ic.addClass('errorImg');
					return false;
				}else if(pwd!=rpwd){
					$ckr.html("两次输入密码不一致");
					$ckr.addClass('errorP');
					$ic.addClass('errorImg');
					return false;
				}else if(!reg.test(rpwd)){
					$ckr.html("密码不合法");
					$ckr.addClass('errorP');
					$ic.addClass('errorImg');
					return false;
				}else{
					$ckr.html("密码一致");
					$ckr.addClass('okP');
					$ic.addClass('okImg');
					return true;
				}
			});
		}
	/*************************邮箱注册表单验证****************/
		/*邮箱名校验*/
		var emailNameCheck=function(){
			var reg=new RegExp(/^[a-zA-Z0-9]+@[a-zA-A0-9_]+\.com$/);
			validateCheck("#email","邮箱名",reg);
		}
		/*用户名校验*/
		var usernameCheck=function(){
			var reg=new RegExp(/^[a-zA-Z0-9_]{3,16}$/);
			validateCheck("#username","用户名",reg);
		}
		/*密码的校验*/
		var emailPwdCheck=function(){
			pwdCheck("#pwd");
		}
		/*确认密码*/
		var emailRePwd=function(){
			rePwdCheck("#rpwd","#pwd");
		}
		/*邮箱注册提交校验*/
		var emailCheck=function(){
			$("#eca").bind("click",function(){
				var $inputs=$("form.emailform input.required");
				/*$("form.emailform input.required").trigger('blur');
				var arrs=["emailNameCheck()","usernameCheck()","emailPwdCheck()","emailRePwd()"];*/
				var sum=0;
				for(var i=0;i<$inputs.length;i++){
					if(eval($($inputs[i]).trigger('blur'))){
						sum++;
					};
				}
				if(sum==$inputs.length){
					return true;
				}else{
					return false;
				}
			});
		}
	/*************************手机注册表单验证****************/
		/*手机号码验证*/
		var phoneNumCheck=function(){
			var reg=new RegExp(/^[1][34578][0-9]{9}$/);
			validateCheck("#tel","手机号码",reg);
		}
		/*密码验证*/
		var phonePwdCheck=function(){
			pwdCheck("#pa");
		}
		/*再次输入密码验证*/
		var phoneRePwdCheck=function(){
			rePwdCheck("#rp","#pa");
		}

		var phoneCheck=function(){
			var arrs=["phoneNumCheck()","phonePwdCheck()","phoneRePwdCheck()"];
			var sum=0;
			for(var i=0;i<arrs.length;i++){
				if(eval(arrs[i])) sum++;
			}
			if(sum==arrs.length){
				return true;	
			}else{
				return false;
			}
		}
		/*"phoneNumCheck()","phonePwdCheck()","phoneRePwdCheck()"*/
		return{
			initBook:function(){book()},
			initNavbar:function(){navbar()},
			initRequire:function(){require()},
			initEmailNameCheck:function(){emailNameCheck()},
			initUsernameCheCK:function(){usernameCheck()},
			initEmailPwdCheck:function(){emailPwdCheck()},
			initEmailRePwdCheck:function(){emailRePwd()},
			initEmailCheck:function(){emailCheck()},
			initPhoneNumCheck:function(){phoneNumCheck()},
			initPhonePwdCheck:function(){phonePwdCheck()},
			initPhoneRePwdCheck:function(){phoneRePwdCheck()},
			initphoneCheck:function(){phoneCheck()},
			initgetpro:function(){getpro()},
			initgetcitys:function(){getcitys()}
		}
	}();
})(jQuery);

