<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>07提交订单支付页面</title>
	<link rel="stylesheet" href="css/shoppingcar.css">
	<link rel="stylesheet" href="css/pay.css">
</head>
<body>
	<!-- 头部 -->
	<div class="header_container">
		<div class="master">
				<div class="master_left">
					<ul>
						<li>
							<a href="javascript:;"><img class="savemei" src="images/header/star.png" alt="15*15"/>
							收藏美团</a>
						</li>
						<c:if test="${user==null }">
							<li><a href="login.jsp" target="_blank">登录</a></li>
							<li><a href="register.jsp" target="_blank">注册</a></li>
						</c:if>
						<c:if test="${user!=null }">
							<li>
								<a href="myhomepage.jsp" target="_blank">${user.nickname }<img src="images/header/vip.png" class="vip" alt=""></a>
							</li>
							<li><a href="javascript:;">退出</a></li>
							<li>
								<a href="#" class="news">
									消息
									<img src="images/header/down.png" class="menuArrow" alt="5*3">
								</a>
							</li>
						</c:if>
						<li>
							<a href="#" class="app">
								<img class="phone"src="images/header/phone.png" alt="10*15">
								手机美团
								<img src="images/header/down.png" class="menuArrow" alt="5*3">
							</a>
							<div class="app_menu">
								<a href="#" class="QR">
									<span class="QR_f">
										<strong style="color:#2BB8AA">|</strong>&nbsp;免费下载美团手机版
									</span>
									<span class="QR_p">
										<img src="images/header/qr1.png" alt="90*90"/>
									</span>
									<i class="QR_a">
										<img src="images/header/arrow.png" alt="10*20">
									</i>
								</a>
								<div style="width:100%;border-top:1px solid #DDDDDD;"></div>
								<a href="#" class="QR">
									<span class="QR_f">
										<strong style="color:#2BB8AA">|</strong>&nbsp;免费下载猫眼电影手机版
									</span>
									<span class="QR_p">
										<img src="images/header/qr2.png" alt="90*90"/>
									</span>
									<i class="QR_a">
										<img src="images/header/arrow.png" alt="10*20">
									</i>
								</a>
							</div>
						</li>
					</ul>
				</div>
				<div class="master_right">
					<ul>
						<li><a href="myorders.jsp" target="_blank">我的订单</a></li>
						<li class="dnMe" style="width:84px">
							<a href="myhomepage.jsp" target="_blank">我的美团
								<img src="images/header/down.png" class="menuArrow" alt="5*3">
							</a>
							<ul class="my_meituan_menu">
								<li><a href="#">我的订单</a></li>
								<li><a href="#">我的评价</a></li>
								<li><a href="#">我的收藏</a></li>
								<li><a href="#">我的积分</a></li>
								<li><a href="#">抵用券</a></li>
								<li><a href="#">美团金额</a></li>
								<li><a href="#">账户充值</a></li>
								<li><a href="#">账户设置</a></li>
							</ul>
						</li>
						<li class="dnMe" style="width:84px">
							<a href="#">最近浏览
								<img src="images/header/down.png" class="menuArrow" alt="5*3">
							</a>
							<ul class="rec_menu">
								<li>
									<a href="#">
										<img src="images/header/a.jpg" alt="80*50"/>
										<span class="rec">
											<span>江南小镇无锡小笼包代金券1张</span><br/>
											<span class="new_price">￥8.9</span>
											<span class="old_price">10</span>
										</span>
									</a>
								</li>
								<li>
									<a href="#">
										<img src="images/header/b.jpg" alt="80*50"/>
										<span class="rec"> 
											<span >颐尚温泉度假村门票1张</span><br/>
											<span class="new_price">￥128</span>
											<span class="old_price">218</span>
										</span>
									</a>
								</li>
								<li>
									<p class="cls_rec">清空最近浏览项目</p>
								</li>
							</ul>
						</li>
						<li  class="dnMe" style="width:108px">
							<a href="shoppingcar.jsp" target="_blank">
								<img src="images/header/shopcar.png" alt="20*15">购物车<span style="color:red;"><c:if test="${basket==null}">0</c:if><c:if test="${basket!=null}">${basket.size }</c:if></span>件<img src="images/header/down.png" class="menuArrow" alt="5*3">
							</a>
							<ul class="shopping_car_menu">
								<li>暂时没有商品</li>
							</ul>
						</li>
						<li  class="dnMe" style="width:84px">
							<a href="#">联系客服
								<img src="images/header/down.png" class="menuArrow" alt="5*3"></a>
							<ul class="contact_menu">
								<li><a href="#">申请退款</a></li>
								<li><a href="#">申请退换货</a></li>
								<li><a href="#">查看美团券</a></li>
								<li><a href="#">绑定手机号</a></li>
								<li><a href="#">查看问题</a></li>
							</ul>
						</li>
						<li  class="dnMe" style="width:84px">
							<a href="#">我是商家
								<img src="images/header/down.png" class="menuArrow" alt="5*3"></a>
							<ul class="merchant_menu">
								<li><a href="#">登录商家中心</a></li>
								<li><a href="#">我想合作</a></li>
								<li><a href="#">手机免费开店</a></li>
								<li><a href="#">商家营销平台</a></li>
							</ul>
						</li>
						<li  class="dnMe" style="width:60px">
							<a href="#">更多
								<img src="images/header/down.png" class="menuArrow" alt="5*3"></a>
							<ul class="more_menu">
								<li><a href="#">手机版</a></li>
								<li><a href="#">邮件订阅</a></li>
								<li><a href="#">邀请好友</a></li>
							</ul>
						</li>
					</ul>
				</div>
		</div>
		<div class="server">
				<div class="log">
					<a href="index.jsp" target="_blank"><img src="images/header/meituan.png" alt=""></a>
				</div>
				<div class="menubar">
					<ol>
						<li>提交订单</li>
						<li class="press_current">选择支付方式</li>
						<li>购买成功</li>
					</ol>
					<div class="press">
						<div class="pressbar2">
						</div>
					</div>
				</div>
				<div class="ensure">
						<a href="#" >
							<img src="images/header/header_ensure.png" alt=""/>
						</a>
				</div>
		</div>
	</div>
	<!-- 订单详情部分 -->
	
	<div class="order">
		<ul>
			<c:forEach items="${cgoodsVO }" var="g" varStatus="row">
				<li>
					项目${row.index+1 }：<a href="productDetail.jsp?goodsid=${g.goodsid }">${g.goodsadv }</a>	
				</li>
			</c:forEach>
		</ul>
		<div class="ordercount">
			应付金额
			<span class="countMoney">¥161.20</span>
		</div>
	</div>
	<!-- 支付部分 -->
	<div class="payment">
		<div class="payment_type">
			<div class="payment_top">
				<ul class="payment_menu">
					<li class="current" lang="0" style="width:130px">支付宝/财付通/微信</li>
					<li lang="1" style="width:43px">储蓄卡</li>
					<li lang="2" style="width:43px">信用卡</li>
				</ul>
				<ul class="payment_tips">
					<li class="tips_help">支付帮助<span>▼</span></li>
					<li>意见反馈</li>
				</ul>
				<ul class="payment_help">
					<li>
						<div class="help_list">
							<span>▼</span>没有开通网上银行如何购买？
						</div>
						<p>
							各银行已有支持无需网银的小额支付产品，可直接选择付款。或者，可选择银联在线支付或快捷支付（只支持信用卡）付款。
						</p>
					</li>
					<li>
						<div class="help_list">
							<span>▼</span>没找到我常用的网上银行？
						</div>
						<p>
							建议选择银联在线支付付款，支持超过180家银行，包括主流银行和地方银行，例如华夏银行，江苏银行，南京银行等。
						</p>
					</li>
					<li>
						<div class="help_list">
							<span>▼</span>什么是地方银行？
						</div>
						<p>
							地方银行主要指注册和经营在当地的城市商业银行、农村合作银行、村镇银行等中小金融机构，例如江苏银行，南京银行，华夏银行等。
						</p>
					</li>
					<li>
						<div class="help_list">
							<span>▼</span>无法跳转到对应的支付页面支付？
						</div>
						<p>
							建议刷新当前页面，如果没恢复正常建议重启或更换到IE浏览器。
						</p>
					</li>
					<li>
						<div class="help_list">
							<span>▼</span>网上银行扣款口，订单仍显示“未付款”怎么办？
						</div>
						<p>
							可能是由于银行的数据没有即时传输，请您不要担心，稍后刷新页面查看。如较长时间仍显示未付款，可先向银行或支付平台获取支付凭证（扣款订单号/第三方交易号），联系美团客服(400-660-5335)为您解决。
						</p>
					</li>
					<li class="helpMore">
						<a href="#">更多</a>
					</li>
				</ul>
			</div>
			<div class="payment_list payment_list_0">
				<ul>
					<li>
						<input type="radio" name="payradio" id="payradio1"/>
						<label for="payradio1">
							<img src="images/pay/alipay2.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="payradio" id="payradio2"/>
						<label for="payradio2">
							<img src="images/pay/tenpay2.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="payradio" id="payradio3"/>
						<label for="payradio3">
							<img src="images/pay/pc_wxqrpay.png" alt="">
						</label>
					</li>
				</ul>
			</div>
			<div class="payment_list payment_list_1">
				<div class="payment_bank_tip">
					网上银行支付
				</div>
				<ul>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio1"/>
						<label for="paybankradio1">
							<img src="images/pay/paybank/icbc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio2"/>
						<label for="paybankradio2">
							<img src="images/pay/paybank/cmb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio3"/>
						<label for="paybankradio3">
							<img src="images/pay/paybank/ccb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio4"/>
						<label for="paybankradio4">
							<img src="images/pay/paybank/abc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio5"/>
						<label for="paybankradio5">
							<img src="images/pay/paybank/boc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio6"/>
						<label for="paybankradio6">
							<img src="images/pay/paybank/bofc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio7"/>
						<label for="paybankradio7">
							<img src="images/pay/paybank/cib.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio8"/>
						<label for="paybankradio8">
							<img src="images/pay/paybank/cebb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio9"/>
						<label for="paybankradio9">
							<img src="images/pay/paybank/spdb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio10"/>
						<label for="paybankradio10">
							<img src="images/pay/paybank/gfyh.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio11"/>
						<label for="paybankradio11">
							<img src="images/pay/paybank/zxyh.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio12"/>
						<label for="paybankradio12">
							<img src="images/pay/paybank/cmbc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio13"/>
						<label for="paybankradio13">
							<img src="images/pay/paybank/pingan.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio14"/>
						<label for="paybankradio14">
							<img src="images/pay/paybank/bjrcb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio15"/>
						<label for="paybankradio15">
							<img src="images/pay/paybank/pspc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio16"/>
						<label for="paybankradio16">
							<img src="images/pay/paybank/shrcb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio17"/>
						<label for="paybankradio17">
							<img src="images/pay/paybank/hzcb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paybankradio" id="paybankradio18"/>
						<label for="paybankradio18">
							<img src="images/pay/paybank/bob.png" alt="">
						</label>
					</li>
				</ul>
			</div>
			<div class="payment_list payment_list_2">
				<div class="payment_credit_tip">
					网上银行支付
				</div>
				<ul>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio1"/>
						<label for="paycreditradio1">
							<img src="images/pay/paybank/icbc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio2"/>
						<label for="paycreditradio2">
							<img src="images/pay/paybank/cmb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio3"/>
						<label for="paycreditradio3">
							<img src="images/pay/paybank/ccb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio4"/>
						<label for="paycreditradio4">
							<img src="images/pay/paybank/abc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio5"/>
						<label for="paycreditradio5">
							<img src="images/pay/paybank/boc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio6"/>
						<label for="paycreditradio6">
							<img src="images/pay/paybank/bofc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio7"/>
						<label for="paycreditradio7">
							<img src="images/pay/paybank/cib.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio8"/>
						<label for="paycreditradio8">
							<img src="images/pay/paybank/cebb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio9"/>
						<label for="paycreditradio9">
							<img src="images/pay/paybank/spdb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio10"/>
						<label for="paycreditradio10">
							<img src="images/pay/paybank/gfyh.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio11"/>
						<label for="paycreditradio11">
							<img src="images/pay/paybank/zxyh.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio12"/>
						<label for="paycreditradio12">
							<img src="images/pay/paybank/cmbc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio13"/>
						<label for="paycreditradio13">
							<img src="images/pay/paybank/pingan.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio14"/>
						<label for="paycreditradio14">
							<img src="images/pay/paybank/bjrcb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio15"/>
						<label for="paycreditradio15">
							<img src="images/pay/paybank/pspc.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio16"/>
						<label for="paycreditradio16">
							<img src="images/pay/paybank/shrcb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio17"/>
						<label for="paycreditradio17">
							<img src="images/pay/paybank/hzcb.png" alt="">
						</label>
					</li>
					<li>
						<input type="radio" name="paycreditradio" id="paycreditradio18"/>
						<label for="paycreditradio18">
							<img src="images/pay/paybank/bob.png" alt="">
						</label>
					</li>
				</ul>
			</div>
		</div>
		<div class="payment_amount">
			支付：<span>¥161.20</span>
		</div>
		<div class="payment_submit">
			<a href="pay.do" target="_blank" class="btn">去付款</a>
		</div>
		<div class="payment_back">
			<a href="shoppingcar.html" target="_blank">返回修改订单</a>
		</div>
	</div>
	<!-- 尾部 -->
	<div style="margin-top: 80px;">
		<iframe src="forCall/afooter.html" frameborder="0" scrolling="no" width="100%" height="450px"></iframe>
	</div>
	<script type="text/javascript" src="framework/bootstrap/scripts/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="framework/bootstrap/scripts/jquery.min.js"></script>
	<script type="text/javascript" src="js/shoppingcar.js"></script>
	<script type="text/javascript" src="js/pay.js"></script>
	<script type="text/javascript">
		;(function($){
			car.initSaveStar();
			car.initDownMenu1();
			car.initDownMark();
			car.initDownMenu2();
			car.initMenuColor();
			car.initNews();
			/*car.initChoose();
			car.initChooseAll();
			car.initChangeNum();
			car.initDiscount();*/
			pay.initTab();
			pay.initHelp();
			pay.initArrow();
			pay.initPayDetail();
		})(jQuery);
	</script>
</body>
</html>