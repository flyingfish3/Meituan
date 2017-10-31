<%@ page language="java" import="java.util.*,java.awt.image.BufferedImage,java.awt.Graphics" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>02注册页面</title>
	<link rel="stylesheet" href="framework/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/register.css">
</head>
<body>
	<%!
		public String randStr(){
			String str="";
			Random rand=new Random();
			for(int i=0;i<4;i++){
				int ch=0;
				do{
					ch=rand.nextInt(122);
				}while(ch<48||(ch>57&&ch<65)||(ch>90&&ch<97));
				str+=(char)ch;
			}
			return str;
		}
	 %>
	 <%!
	 	BufferedImage image=new BufferedImage(80, 30,BufferedImage.TYPE_INT_RGB);
		Graphics g=image.getGraphics();
		
		/* g.setColor(new Color(255,255,255));
		g.fillRect(0, 0,80,30);
		g.setColor(new Color(255,0,0)); */
		String randomStr=randStr();
	 	
	  %>
	<!-- 头部 -->
	<div class="container" style="height:40px;">
		<div class="row">
			<div class="col-xs-offset-1 col-xs-2">
				<a href="index.html"  target="_blank">
					<img src="images/register/meituan.png" style="height:40px;width:60px;margin-top:10px;">
				</a>
			</div>	
			<div class="col-xs-offset-6 col-xs-2" style="line-height:60px;">
				<span>已有美团账号？</span>
				<a href="login.html" class="btn btn-info btn-xs " style="background-color:#2BB8AA;border-color: #2BB8AA;">登录</a>
			</div>
		</div>
	</div>
	<!-- 水平分割线 -->
	<hr style="border:solid 1px #2BB8AA;"/>
	<!-- 注册 -->
	<div class="container">
		<div class="row">
			<div class="col-xs-offset-1 col-xs-10">
				<!-- 导航栏(锚链接) -->
				<ul class="nav nav-tabs">
				   <li class="active">
				      <a href="#er" data-toggle="tab">
				      	<div class="e_i"></div>
				      	<span class="e_f">邮箱注册</span>
				      </a>
				   </li>
				   <li>
				   	 <a href="#pr" data-toggle="tab">
				   		<div class="p_i"></div>
				      	<span class="p_f">手机注册</span>
				   	</a>
				   </li>
				</ul>
				<div class="row">
					<div class="col-xs-7" >
						<div  class="tab-content">
							<!-- 邮箱注册 -->
						   <div class="tab-pane fade in active" id="er">
						      <form  class="form-horizontal emailform" role="form" action="#" method="post"  onsubmit="return emailCheck()">
						      	<!-- 输入邮箱 -->
						      	<div class="form-group">
						      		<label for="email" class="col-xs-2 control-label" >邮箱</label>
						      		<div class="col-xs-6">
						      			<input type="text" id="email" class="form-control required" placeholder="请输入邮箱">				      			
						      		</div>
						      		<div class="col-xs-4 forPromt">
						      			<span class="form-control-static imgcontainer"></span>
						      			<span id="checkResult" class="form-control-static checkResult"></span>
						      		</div>
						      	</div>
						      	<!-- 输入用户名 -->
						      	<div class="form-group">
									<label for="username" class="col-xs-2 control-label">用户名</label>
						      		<div class="col-xs-6">
						      			<input type="text" id="username" class="form-control required" placeholder="请输入用户名">
						      		</div>
						      		<div class="col-xs-4 forPromt">
						      			<span class="form-control-static imgcontainer"></span>
						      			<span id="checkResult" class="form-control-static checkResult"></span>
						      		</div>
						      	</div>
						       <!-- 创建密码 -->
						      	<div class="form-group">
									<label for="pwd" class="col-xs-2 control-label">创建密码</label>
						      		<div class="col-xs-6">
						      			<input type="text" id="pwd" class="form-control required" placeholder="请创建密码">
						      			<div class="pwdbar" style="height:8px;width:250px;background-color: #ddd;border-radius: 5px;margin-top:5px;border:1px solid #C5C5C5;">
						      				<div class="level">
						      				</div>
						      			</div>
						      		</div>
						      		<div class="col-xs-4 forPromt">
						      			<span class="form-control-static imgcontainer"></span>
						      			<span id="checkResult" class="form-control-static checkResult"></span>
						      		</div>
						      	</div>
						      	<!-- 确认密码!!!! -->
						      	<div class="form-group">
									<label for="rpwd" class="col-xs-2 control-label">确认密码</label>
						      		<div class="col-xs-6">
						      			<input type="text" id="rpwd" class="form-control required" placeholder="请再次输入密码">
						      		</div>
						      		<div class="col-xs-4 forPromt">
						      			<span class="form-control-static imgcontainer"></span>
						      			<span id="checkResult" class="form-control-static checkResult"></span>
						      		</div>
						      	</div>
						      	<!-- 选择所在城市 -->
								<div class="form-group">
									<label  class="col-xs-2 control-label">所在城市</label>
						      		<div class="col-xs-6" style="line-height: 30px">
						      			<select style="width:80px;height:25px;" name="prov" class="prov">
						      				<option value="0">-省-</option>
						      			</select>
						      			<select style="width:100px;height:25px;" name="citys" class="citys">
						      				<option>-市-</option>
						      			</select>
						      		</div>
						      		<div class="col-xs-4 forPromt">
						      			<span class="form-control-static imgcontainer"></span>
						      			<span id="checkResult" class="form-control-static checkResult"></span>
						      		</div>
						      	</div>
						      	<!-- 是否订阅 -->
						      	<div class="form-group">
									<label  class="col-xs-2"></label>
						      		<div class="col-xs-10" style="line-height: 20px;">
						      			<input type="checkbox" id="book" class="checkbox-inline">
						      			<span style="font:10px;">订阅每日最新团购信息，可随时退订</span>
						      		</div>
						      	</div>
						      	<!-- 验证码：在jsp页面用Java代码来实现 -->
								<div class="form-group">
									<label for="check"  class="col-xs-2 control-label">验证码</label>
						      		<div class="col-xs-6" >
						      			<input type="text" id="check" class="form-control required"  placeholder="请输入验证码">
						      		</div>
						      		<div class="col-xs-4 forPromt">
						      			<span class="form-control-static imgcontainer"></span>
						      			<span id="checkResult" class="form-control-static checkResult"></span>
						      		</div>
						      	</div>
						      	<!-- 同意并提交 -->
						      	<div class="form-group">
									<label class="col-xs-2"></label>
						      		<div class="col-xs-10" >
						      			<button  id="eca" style="border:none;padding:0">
						      				<img src="images/register/approve.png" style="width:180px;height:35px;"/>
						      			</button>
						      		</div>
						      	</div>
						      	<!-- 美团网协议超链接 -->
						      	<div class="col-xs-offset-2 col-xs-10">
						    			<a href="#" style="color:#2BB8AA;">《美团网用户协议》</a>
						    	</div>
						      </form>
						   </div>
						   <!-- 手机注册 -->
						   <div class="tab-pane fade" id="pr">
						    	<form action="#" role="form" class="form-horizontal phoneform" method="post" onsubmit="return phoneCheck()">
						    		<div class="form-group">
										<label for="tel" class="col-xs-2 control-label">手机号</label>
										<div class="col-xs-6">
											<input type="text" id="tel" class="form-control required" placeholder="请输入11位手机号">
										</div>
										<div class="col-xs-4 forPromt">
							      			<span class="form-control-static imgcontainer"></span>
							      			<span id="checkResult" class="form-control-static checkResult"></span>
							      		</div>
						    		</div>
						    		<div class="form-group">
						    			<div class="col-xs-offset-2 col-xs-10">
						    			<button type="button" class="btn" style="font-size:8px;">免费获取短信动态验证码</button>
						    			</div>
						    		</div>
						    		<div class="form-group">
						    			<label for="me" class="col-xs-2 control-label">短信动态码</label>
						    			<div class="col-xs-6">
						    				<input type="text" id="me" class="form-control required" placeholder="请输入短信动态码"/>
						    			</div>	
						    			<div class="col-xs-4 forPromt">
							      			<span class="form-control-static imgcontainer"></span>
							      			<span id="checkResult" class="form-control-static checkResult"></span>
							      		</div>			
						    		</div>
						    		<div class="form-group">
						    			<label for="pa" class="col-xs-2 control-label">创建密码</label>
						    			<div class="col-xs-6">
						    				<input type="text" id="pa" class="form-control required" placeholder="请创建密码"/>
						    			</div>
						    			<div class="col-xs-4 forPromt">
							      			<span class="form-control-static imgcontainer"></span>
							      			<span id="checkResult" class="form-control-static checkResult"></span>
							      		</div>
						    		</div>
						    		<div class="form-group">
						    			<label for="rp" class="col-xs-2 control-label">确认密码</label>
						    			<div class="col-xs-6">
						    				<input type="text" id="rp" class="form-control required" placeholder="请确认密码"/>
						    			</div>
						    			<div class="col-xs-4 forPromt">
							      			<span class="form-control-static imgcontainer"></span>
							      			<span id="checkResult" class="form-control-static checkResult"></span>
							      		</div>
						    		</div>
						    		<!-- 提交并注册 -->
						    		<div class="form-group">
						    			<div class="col-xs-offset-2 col-xs-10" >
						      				<button type='submit'  style="border:none;padding:0">
							      				<img src="images/register/approve.png" style="width:180px;height:35px;"/>
							      			</button>
						      			</div>
						    		</div>
						    		<div class="col-xs-offset-2 col-xs-10">
						    			<a href="#" style="color:#2BB8AA;">《美团网用户协议》</a>
						    		</div>
						    	</form>
						   </div>
					   </div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="framework/bootstrap/scripts/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="framework/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/register.js"></script>
	<script type="text/javascript">
		;(function(){
			register.initBook();
			register.initNavbar();
			register.initRequire();
			register.initEmailNameCheck();
			register.initUsernameCheCK();
			register.initEmailPwdCheck();
			register.initEmailRePwdCheck();
			register.initEmailCheck();
			register.initPhoneNumCheck();
			register.initPhonePwdCheck();
			register.initPhoneRePwdCheck();
			register.initphoneCheck();
			register.initgetpro();
			register.initgetcitys();
		})(jQuery);
	</script>
</body>
</html>
