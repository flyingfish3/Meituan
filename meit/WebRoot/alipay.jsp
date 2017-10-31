<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>08支付宝支付页面</title>
	<link rel="stylesheet" href="css/alipay.css">
</head>
<body>
	<div class="top">
		<div class="topbar">
			<a href="#">常见问题</a>
			<span>你好，欢迎使用支付宝付款！</span>
		</div>
		<div class="header">
			<span class="log"><img src="images/alipay/log.png" alt=""/></span>
			<span class="title">我的收银台</span>
		</div>
	</div>
	<div class="container">
		<div class="orderDetail-base">
			<p>
				正在使用即时到账交易
				<a href="#" class="help">[?]</a>
				交易将在
				<span class="timeout">59</span>
				分钟后关闭，请及时付款！
			</p>
			<p>
				<span class="ordernum">美团订单-48310317631461861548 </span>
				 &nbsp;收款方：北京三快科技有限公...
				<span class="count">
					<span class="countM">85.00</span>
					元
				</span>
			</p>
		</div>
		<div class="view_top">
			<div class="vf">订单详情</div>
		</div>
		<!-- 操作区 -->
		<div class="forhide">
			<div class="cashier_center_view">
				<div class="phone_pay">
					<div class="phone_left">
						<div class="phone_left_ctx">
							<p class="paytip">扫一扫付款（元）</p>
							<p class="pay">85.00</p>
							<div class="mark">
								<img src="images/alipay/mark.png" alt="">
								<div class="paymarktip">
									<div class="markimg">
										<img src="images/alipay/wap.png" alt="">
									</div>
									<p class="marktip">
										打开手机支付宝
										扫一扫继续付款
									</p>
								</div>
							</div>
							<a href="javascript:;">首次使用请下载手机支付宝</a>
						</div>
						<ul >
							<li>
								<img src="images/alipay/1.png" alt=""/>
							</li>
							<li>
								<img src="images/alipay/2.png" alt="" />
							</li>
						</ul>
					</div>
					<div class="phone_right">
						<img src="images/alipay/pay.png" alt="">
						<a href="#">&lt;登录账户付款</a>
					</div>
				</div>
				<div class="web_pay">
					<div class="web_left">
						<img src="images/alipay/phonePay.png" alt="">
						<a href="#">&lt;登录账户付款</a>
					</div>
					<div class="web_right">
						<form action="#">
							<h3>
								<span>登录支付宝账户付款</span>
								<a href="register.html">新用户注册</a>
							</h3>
							<div class="loginname lp">
								<h5>
									<span>账户名：</span>
									<a href="#">忘记账户名？</a>
								</h5>
								<input type="text" placeholder="手机号码/邮箱" />
							</div>
							
							<div class="password lp">
								<h5>
									<span>支付密码：</span>
									<a href="#">忘记密码？</a>
								</h5>
								<input type="text"/>
								<p>请输入账户的<b>支付密码</b>，不是登录密码。</p>
							</div>
							<input type="submit" value="下一步" class="submit"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="partner">
		<p>
			支付宝版权所有 2004-2016 ICP证：沪B2-20150087
		</p>
		<img src="images/alipay/p1.png" alt="">
	</div>

	<script type="text/javascript" src="framework/bootstrap/scripts/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/alipay.js"></script>
	<script type="text/javascript">
		;(function($){
			alipay.initTimeout();
			alipay.initPhoneTip();
			alipay.initLeft();
			alipay.initRight();
			alipay.initFloatLeft();
			alipay.initFloatRight();
		})(jQuery);
	</script>
</body>
</html>