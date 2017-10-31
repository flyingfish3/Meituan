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
	<title>切换城市</title>
	<link rel="stylesheet" href="css/aheader.css">
	<link rel="stylesheet" href="css/position.css">
</head>
<body>
	<div class="container">
		<!-- 头部 -->
		<div class="header_container">
			<div class="master">
					<div class="master_left">
						<ul>
							<li>
								<img class="savemei" src="images/header/star.png" alt="15*15"/>
								收藏美团
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
									<li><a href="myorders.html" target="_blank">我的订单</a></li>
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
					<div class="city">
						<strong style="font-size:16px;">&nbsp;${areaname }</strong>
						<div  class="change_city"><a href="position.jsp">切换城市</a></div>
					</div>
					<div class="search">
						<div class="search_top">
							<div class="method">
								<select name="" id="">
									<option value="1" selected="selected">团购</option>
									<option value="2">商家</option>
								</select>
							</div>
							<div class="search_content">
								<input type="text" placeholder ="请输入商品名称、地址等"/>
							</div>
							<div class="do">
								<a href="#">搜索</a>
							</div>
						</div>
						<div class="search_foot">
							<ul>
								<li><a href="#">花甲</a></li>
								<li><a href="#">披萨</a></li>
								<li><a href="#">鸭脖</a></li>
								<li><a href="#">自助餐</a></li>
								<li><a href="#">傣妹</a></li>
								<li><a href="#">颐尚</a></li>
								<li><a href="#">鱼尚鲜</a></li>
								<li><a href="#">九市浦</a></li>
								<li><a href="#">蛋糕</a></li>
								<li><a href="#">猫山王</a></li>
							</ul>
						</div>
					</div>
					<div class="ensure">
							<a href="#" >
								<img src="images/header/header_ensure.png" alt=""/>
							</a>
					</div>
			</div>
		</div>
		<!-- 分类导航 -->
		<div class="sort">
			<div class="sort_left" >
				<dl>
					<dt class="sort_left_top">全部分类</dt>
					<div class="alllist">
						<c:forEach var="goods" items="${goodsVO}">
						<dd class="sort_left_list">
						<div class="Title">
							<div class="someMain">
								<a href="category.do?typeid=${goods.typeid }">${goods.typename }</a>
							</div>
							<div class="someMore">
								<c:forEach var="sec" items="${goods.secTypes}">
									<c:forEach var="thir" items="${sec.thirdTypes }">
										<c:if test="${goods.typeid!=3&&goods.typeid!=6}">
											<c:choose>
												<c:when test="${thir.rownum<=2}">
													<a href="category.do?typeid=${thir.typeid }">${thir.typename }</a>
												</c:when>
											</c:choose>
										</c:if>
										<c:if test="${goods.typeid==3||goods.typeid==6}">
											<c:choose>
												<c:when test="${thir.rownum<=1}">
													<a href="category.do?typeid=${thir.typeid }">${thir.typename }</a>
												</c:when>
											</c:choose>
										</c:if>
									</c:forEach>
								</c:forEach>
								<span>&gt;</span>
							</div>
						</div>
						<div class="${goods.nickname }Menu sortMenu">
							<c:forEach var="sec" items="${goods.secTypes}">
								<ul>
									<li class="toptype">
										<a href="category.do?typeid=${sec.typeid }">${sec.typename }</a>
									</li>
									<c:forEach var="thir" items="${sec.thirdTypes}">
										<li><a href="category.do?typeid=${thir.typeid }">${thir.typename }</a></li>
									</c:forEach>
								</ul>
							</c:forEach>
						</div>
						</dd>
						</c:forEach>
					</div>
				</dl>
			</div>
		
			<div class="sort_center">
					<div class="sort_center_top">
						<ul>
							<li><a href="index.jsp">首页</a></li>
							<li><a href="#">今日新单</a></li>
							<li><a href="#">购物</a></li>
							<li><a href="#">身边外卖</a></li>
						</ul>
					</div>
			</div>
		</div>
		<!-- 主要内容 -->
		<div class="ctx">
		    <a href="#">
		    	<!-- 用于往action中传城市名称的隐藏表单域 -->
				<input type="hidden" class="choosePosition"/>
		    </a>
			<div class="top">
			    <div class="top_ctx">
					<h4>按省份选择：</h4>
					<div class="mychoose">
					<!-- <form action="" class="myform"> -->
						<select name="" class="prov">
							<c:forEach items="${provinces}" var="pro">
								<option value="${pro.areaid }">${pro.areaname}</option>
							</c:forEach>
						</select>
						<select name="" id="" class="citys">
							 <c:if test="${citys==null}">
								<option value="35">北京市</option>
							</c:if>
						</select>
						<button class="sure">确定</button>
						<h4>直接搜索：</h4>
						<input type="text" placeholder="请输入城市中文或拼音">
					<!-- </form> -->
					</div>
				</div>
			</div>
			<div class="often">
				<h4>常用城市：</h4>
				<ul>
					<li><a href="javascript:;">上海</a></li>
					<li><a href="javascript:;">北京</a></li>
					<li><a href="javascript:;">广州</a></li>
					<li><a href="javascript:;">深圳</a></li>
					<li><a href="javascript:;">武汉</a></li>
					<li><a href="javascript:;">天津</a></li>
					<li><a href="javascript:;">西安</a></li>
					<li><a href="javascript:;">南京</a></li>
					<li><a href="javascript:;">杭州</a></li>
					<li><a href="javascript:;">成都</a></li>
					<li><a href="javascript:;">重庆</a></li>
					<li><a href="javascript:;">鞍山</a></li>
					<li><a href="javascript:;">大连</a></li>
					<li><a href="javascript:;">辽阳</a></li>
					<li><a href="javascript:;">营口</a></li>
					<li><a href="javascript:;">海城</a></li>
					<li><a href="javascript:;">马鞍山</a></li>
					<li><a href="javascript:;">锦州</a></li>
					<li><a href="javascript:;">丹东</a></li>
				</ul>
			</div>
			<div class="recvisit">
				<h4>最近访问：</h4>
				<ul>
					<li><a href="javascript:;">鞍山</a></li>
					<li><a href="javascript:;">南京</a></li>
					<li><a href="javascript:;">广州</a></li>
				</ul>
			</div>
			<div class="letterOrder">
				<div class="title">
					<h4>
						按拼音首字母选择
						<p>▼</p>
					</h4>
				</div>
				<c:forEach var="la" items="${letterAreas}">
					<div class="a letterlist">
						<h4 class="letter">
							<span>${la.letter }</span>
						</h4>
						<ul>
							<c:forEach var="area" items="${la.areas }">
								<li><a href="init.do?areaid=${area.areaid }">${area.areaname }</a></li>
							</c:forEach>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 尾部 -->
		<div style="margin-top: 80px;">
			<iframe src="forCall/afooter.html" frameborder="0" scrolling="no" width="100%" height="450px"></iframe>
		</div>
	</div>
	<script type="text/javascript" src="framework/bootstrap/scripts/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/aheader.js"></script>
	<script type="text/javascript" src="js/productDetail.js"></script>
	<script type="text/javascript" src="js/position.js"></script>
	<script type="text/javascript">
		;(function(){
			aheader.initStar();
			aheader.initApp();
			aheader.initAppMark();
			aheader.initRightDownMenu();
			aheader.initMenuStyle();
			aheader.initSortAll();
			aheader.initRightMenu();
			aheader.initMenuStyle2();
			adv.initRemainTime();
			adv.initTimeoShow();
			adv.initSideBar();
			adv.initCurrentImg();
			pos.initCitys();
			pos.initchosenCity();
		})(jQuery);
	</script>
</body>
</html>