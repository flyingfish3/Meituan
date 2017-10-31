<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String url = request.getHeader("Referer");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>03登录页面</title>
	<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<div class="container">
		<div class="header">
			<a href="index.jsp" target="_blank"><img src="images/register/meituan.png" alt=""></a>
		</div>
		<div class="main">
			<div class="frank">
				<img src="images/login/frank.png" alt="">
			</div>
			<!-- 登录部分 -->
			<div class="login">
				<form action="login.do" method="post">
					<div class="title">
						<span>账号登录</span>
						<a href="#">手机动态码登录
						<img src="images/login/phone.png" alt="">
						</a>
					</div>
					<div class="inp">
						<i><img src="images/login/username.png" alt=""></i>
						<input type="text" placeholder="手机号/用户名/邮箱" id="loginName" name="loginname"/>
					</div>
					<div class="inp">
						<i><img src="images/login/pwd.png" alt=""></i>
						<input type="password" placeholder="密码" name="password"/>
					</div>
					
					<div class="tip">
						<span class="tip_detail">
							<input type="checkbox" value="7day"/>
							<span class="sdays">7天内自动登录</span>
						</span>
						<a href="#">忘记密码？</a>
					</div>
					<div class="loginin">
						<input type="submit" value="登录"/>
					</div>
					<input type="hidden" value="<%=url %>" name="beforeurl"/>
					<p class="reg">还没有账号？<a href="register.jsp">免费注册</a></p>
				</form>
				<div class="logininOther">
					<p><span>用合作网站账号登录</span></p>
					<span class="cor">
						<img src="images/login/qq.png" alt="">
						<img src="images/login/zhizhi.png" alt="">
						<img src="images/login/weibo.png" alt="">
					</span>
				</div>
			</div>
		</div>
		<div class="serve">
			<ul>
				<li class="ali"><a href="#">关于美团</a></li>
				<li class="ali"><a href="#">美团承诺</a></li>
				<li class="ali"><a href="#">加入我们</a></li>
				<li class="ali"><a href="#">商家入驻</a></li>
				<li class="ali"><a href="#">帮助中心</a></li>
				<li><a href="#">美团手机版</a></li>
				
			</ul>
			<img src="images/login/footer-commitment.png" alt="">
		</div>
		<div class="footer">
			©2016
			<a href="#">美团网团购</a>
			meituan.com
			<a href="#">京ICP证070791号</a> 
			京公网安备11010502025545号
			<a href="#">电子公告服务规则</a>
		</div>
	</div>
</body>
</html>