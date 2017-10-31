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
	<title>01美团网首页</title>
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/header.css">
</head>
<body>
	<div class="custom-adv">
		<div class="advbcg"></div>
		<div class="advmain">
		</div>
	</div>
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
							<li><a href="exit.do">退出</a></li>
							<li>
								<a href="#" class="news">
									消息
									<img src="images/header/down.png" class="menuArrow" alt="5*3">
								</a>
							</li>
						</c:if>
						<li>
							<a href="#" class="app">
								<img class="phone" src="images/header/phone.png" alt="10*15">
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
						<li><a href="myorders.html" target="_blank">我的订单</a></li>
						<li class="dnMe" style="width:84px">
							<a href="myhomepage.html" target="_blank">我的美团
								<img src="images/header/down.png"  class="menuArrow" alt="5*3">
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
								<img src="images/header/down.png"  class="menuArrow" alt="5*3">
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
						<li  class="dnMe" style="width:96px">
							<a href="shoppingcar.jsp" target="_blank">
								<img src="images/header/shopcar.png" alt="20*15">购物车<span style="color:red;"><c:if test="${basket==null}">0</c:if><c:if test="${basket!=null}">${basket.size }</c:if></span>件<img src="images/header/down.png" class="menuArrow" alt="5*3">
							</a>
							<ul class="shopping_car_menu">
								<li>暂时没有商品</li>
							</ul>
						</li>
						<li  class="dnMe" style="width:84px">
							<a href="#">联系客服
								<img src="images/header/down.png"  class="menuArrow" alt="20*15"></a>
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
								<img src="images/header/down.png"  class="menuArrow" alt="20*15"></a>
							<ul class="merchant_menu">
								<li><a href="#">登录商家中心</a></li>
								<li><a href="#">我想合作</a></li>
								<li><a href="#">手机免费开店</a></li>
								<li><a href="#">商家营销平台</a></li>
							</ul>
						</li>
						<li  class="dnMe" style="width:60px">
							<a href="#">更多
								<img src="images/header/down.png"  class="menuArrow" alt="20*15"></a>
							<ul class="more_menu">
								<li><a href="#">手机版</a></li>
								<li><a href="#">邮件订阅</a></li>
								<li><a href="#">邀请好友</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="adv">
				<ul class="adv_content">
					<li><img src="images/header/header_adv1.jpg"></li>
					<li><img src="images/header/header_adv2.jpg"></li>
				</ul>
				<div class="error"><a href="#" ><abbr title="关闭"><img src="images/header/close.png" alt=""></abbr></a></div>
				<ul class="adv_icon">
					<li lang="0"></li>
					<li lang="1"></li>
				</ul>
			</div>
			<div class="server">
				<div class="log">
					<a href="#"><img src="images/header/meituan.png" alt=""></a>
				</div>
				<div class="city">
					<strong style="font-size:16px;">&nbsp;${areaname }</strong>
					<input type="hidden" value="${areaid }" name="areaid"/>
					<div class="change_city"><a href="pro.do">切换城市</a></div>
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
							<a href="categoryAll.html" target="_blank">搜索</a>
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
		<!-- 全部分类 -->
		<div class="sort">
			<div class="sort_left">
				<dl>
					<dt class="sort_left_top">全部分类</dt>
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
				</dl>
			</div>
			<div class="sort_center">
				<div class="sort_center_top">
					<ul>
						<li><a href="#">首页</a></li>
						<li><a href="#">今日新单</a></li>
						<li><a href="#">购物</a></li>
						<li><a href="#">身边外卖</a></li>
						<li><a href="#">名店抢购</a></li>
					</ul>
				</div>
				<div class="sort_center_mid">
					<ul>
						<!-- 热门团购分类 -->
						<li class="sort_center_midInfo">
							<ul>
								<!-- 热门团购分类循环开始 -->
								<li class="midInfo_title"><img src="images/index/hot.png" alt="">
								热门团购</li>
								<li><a href="#" style="color:red;">自助餐</a></li>
								<li><a href="#">小吃快餐</a></li>
								<li><a href="#" style="color:red;">火锅</a></li>
								<li><a href="#">景点门票</a></li>
								<li><a href="#" style="color:red;">KTV</a></li>
								<li><a href="#">烧烤烤肉</a></li>
								<li><a href="#">甜点饮品</a></li>
								<li><a href="#">足疗按摩</a></li>
								<li><a href="#">江浙菜</a></li>
								<!-- 热门团购分类循环结束 -->
							</ul>
						</li>
						<!-- 全部区域分类 -->
						<li class="sort_center_midInfo">
							<ul>
								<!-- 区域循环开始 -->
								<li class="midInfo_title"><img src="images/index/location.png" alt="">
								全部区域</li>
								<li><a href="#">江宁区</a></li>
								<li><a href="#">鼓楼区</a></li>
								<li><a href="#">玄武区</a></li>
								<li><a href="#">建邺区</a></li>
								<li><a href="#">秦淮区</a></li>
								<li><a href="#">栖霞区</a></li>
								<li><a href="#">六合区</a></li>
								<li><a href="#">雨花台区</a></li>
								<li><a href="#">浦口区</a></li>
								<li><a href="#">更多</a></li>
								<!-- 区域循环结束 -->
							</ul>
						</li>
						<!-- 热门商圈分类 -->
						<li class="sort_center_midInfo">
							<ul>
								<!-- 热门商圈循环开始 -->
								<li class="midInfo_title"><img src="images/index/district.png" alt="">
								热门商圈</li>
								<li><a href="#">新街口地区</a></li>
								<li><a href="#">建邺万达</a></li>
								<li><a href="#">夫子庙/水游城</a></li>
								<li><a href="#">六合</a></li>
								<li><a href="#">江宁大学城</a></li>
								<li><a href="#">东山镇</a></li>
								<li><a href="#">弘阳广场/新一城</a></li>
								<!-- 热门商圈循环结束 -->
							</ul>
						</li>
						<!-- 直通车广告部分 -->
						<li class="sort_center_midImgs" >
							<!-- 广告读取循环开始 -->
							<div class="sort_center_midImgs_detail" >
								<ul class="sort_center_midImg">
									<c:forEach var="goods" items="${cargoods }">
										<c:choose>
										<c:when test="${goods.rownum<=2}">
											<li class="midImg_left">
												<dl>
													<dt><a href="single.do?goodsid=${goods.goodsid}" target="_blank"><img src="images/index/${goods.defaultpic }" width="330px" height="230px" alt=""></a></dt>
													<dd class="adv_title">
													<h3>
														<c:if test="${fn:length(goods.goodsname)<=10 }">
																${goods.goodsname }
														</c:if>
														<c:if test="${fn:length(goods.goodsname)>10}">
																${fn:substring(goods.goodsname,0,10)}..
														</c:if>
													</h3></dd>
													<dd class="adv_detail" >
														<c:if test="${fn:length(goods.goodsadv)<=19 }">
															${goods.goodsadv}
														</c:if>
														<c:if test="${fn:length(goods.goodsadv)>19}">
															${fn:substring(goods.goodsadv,0,19)}..
														</c:if>
													</dd>
													<dd class="adv_sale" >￥${goods.groprice}</dd>
												</dl>
											</li>
										</c:when>
										</c:choose>
									</c:forEach>
								</ul>
								<ul class="sort_center_midImg">
										<li class="midImg_left">
											<dl>
												<dt><a href="#" target="_blank"><img src="images/index/adv1.jpg" alt=""/></a></dt>
												<dd></dd>
											</dl>
										</li>
										<li class="midImg_right">
											<dl>
												<dt><a href="#" target="_blank"><img src="images/index/adv2.png" alt=""></a></dt>
												<dd></dd>
											</dl>
										</li>
								</ul>
								<ul class="sort_center_midImg">
									<c:forEach var="goods" items="${cargoods }">
										<c:choose>
										<c:when test="${goods.rownum<=4&&goods.rownum>2}">
											<li class="midImg_left">
												<dl>
													<dt><a href="single.do?goodsid=${goods.goodsid}" target="_blank"><img src="images/index/${goods.defaultpic }" width="330px" height="230px" alt=""></a></dt>
													<dd class="adv_title">
													<h3>
														<c:if test="${fn:length(goods.goodsname)<=10 }">
																${goods.goodsname }
														</c:if>
														<c:if test="${fn:length(goods.goodsname)>10}">
																${fn:substring(goods.goodsname,0,10)}..
														</c:if>
													</h3></dd>
													<dd class="adv_detail" >
														<c:if test="${fn:length(goods.goodsadv)<=19 }">
															${goods.goodsadv}
														</c:if>
														<c:if test="${fn:length(goods.goodsadv)>19}">
															${fn:substring(goods.goodsadv,0,19)}..
														</c:if>
													</dd>
													<dd class="adv_sale" >￥${goods.groprice}</dd>
												</dl>
											</li>
										</c:when>
										</c:choose>
									</c:forEach>
								</ul>
								<ul class="sort_center_midImg">
									<c:forEach var="goods" items="${cargoods }">
										<c:choose>
										<c:when test="${goods.rownum<=6&&goods.rownum>4}">
											<li class="midImg_left">
												<dl>
													<dt><a href="single.do?goodsid=${goods.goodsid}" target="_blank"><img src="images/index/${goods.defaultpic }" width="330px" height="230px" alt=""></a></dt>
													<dd class="adv_title">
													<h3>
														<c:if test="${fn:length(goods.goodsname)<=10 }">
																${goods.goodsname }
														</c:if>
														<c:if test="${fn:length(goods.goodsname)>10}">
																${fn:substring(goods.goodsname,0,10)}..
														</c:if>
													</h3></dd>
													<dd class="adv_detail" >
														<c:if test="${fn:length(goods.goodsadv)<=19 }">
															${goods.goodsadv}
														</c:if>
														<c:if test="${fn:length(goods.goodsadv)>19}">
															${fn:substring(goods.goodsadv,0,19)}..
														</c:if>
													</dd>
													<dd class="adv_sale" >￥${goods.groprice}</dd>
												</dl>
											</li>
										</c:when>
										</c:choose>
									</c:forEach>
								</ul>
								<ul class="sort_center_midImg">
									<c:forEach var="goods" items="${cargoods }">
										<c:choose>
										<c:when test="${goods.rownum<=8&&goods.rownum>6}">
											<li class="midImg_left">
												<dl>
													<dt><a href="single.do?goodsid=${goods.goodsid}" target="_blank"><img src="images/index/${goods.defaultpic }" width="330px" height="230px" alt=""></a></dt>
													<dd class="adv_title">
													<h3>
														<c:if test="${fn:length(goods.goodsname)<=10 }">
																${goods.goodsname }
														</c:if>
														<c:if test="${fn:length(goods.goodsname)>10}">
																${fn:substring(goods.goodsname,0,10)}..
														</c:if>
													</h3></dd>
													<dd class="adv_detail" >
														<c:if test="${fn:length(goods.goodsadv)<=19 }">
															${goods.goodsadv}
														</c:if>
														<c:if test="${fn:length(goods.goodsadv)>19}">
															${fn:substring(goods.goodsadv,0,19)}..
														</c:if>
													</dd>
													<dd class="adv_sale" >￥${goods.groprice}</dd>
												</dl>
											</li>
										</c:when>
										</c:choose>
									</c:forEach>
								</ul>
								<ul class="sort_center_midImg">
									<c:forEach var="goods" items="${cargoods }">
										<c:choose>
										<c:when test="${goods.rownum<=10&&goods.rownum>8}">
											<li class="midImg_left">
												<dl>
													<dt><a href="single.do?goodsid=${goods.goodsid}" target="_blank"><img src="images/index/${goods.defaultpic }" width="330px" height="230px" alt=""></a></dt>
													<dd class="adv_title">
													<h3>
														<c:if test="${fn:length(goods.goodsname)<=10 }">
																${goods.goodsname }
														</c:if>
														<c:if test="${fn:length(goods.goodsname)>10}">
																${fn:substring(goods.goodsname,0,10)}..
														</c:if>
													</h3></dd>
													<dd class="adv_detail" >
														<c:if test="${fn:length(goods.goodsadv)<=19 }">
															${goods.goodsadv}
														</c:if>
														<c:if test="${fn:length(goods.goodsadv)>19}">
															${fn:substring(goods.goodsadv,0,19)}..
														</c:if>
													</dd>
													<dd class="adv_sale" >￥${goods.groprice}</dd>
												</dl>
											</li>
										</c:when>
										</c:choose>
									</c:forEach>
								</ul>
							</div>
							<!-- 广告读取循环结束 -->
							<!-- 左右指向箭头 -->
							<a href="javascript:;" class="go_left">&lt;</a>
							<a href="javascript:;" class="go_right">
								<span><span class="flag">1</span>/6&gt;</span>
							</a>	
						</li>
					</ul>
				</div>
			</div>
			<div class="sort_right">
				<div class="sort_ringht_top"></div>
				<div class="sort_right_main">
					<div class="QR">
						<img src="images/index/QR.png" alt="">
					</div>
					<div class="new">
						<a href="#">
							<p class="new_title">每日上新</p>
							<p class="new_detail">吃喝玩乐最低价</p>
							<img src="images/index/new.png" alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 名品抢购 -->
		<c:if test="${specgoods!=null }">
		<div class="spec">	
			<!-- 名品抢购部分标题 -->
			<div class="spec_title">
				<div class="log">
					<img src="images/index/log.png" alt="">
				</div>
				<!-- 标题部分的倒计时 -->
				<div class="timeout">
					<h3>距开始</h3>
					<div class="remainTime">
					</div>
				</div>
			</div>
			<div class="spec_advs">
				<div class="spec_adv" >
					<!-- 名品抢购部分轮播广告循环开始 -->
					<ul>
						<c:forEach var="goods" items="${specgoods }">
							<c:choose>
							<c:when test="${goods.rownum<=5}">
								<li>
									<dl>
										<dt><a href="single.do?goodsid=${goods.goodsid}"><img src="images/index/${goods.defaultpic}" alt=""/></a></dt>
										<dd class="specName">
											<c:if test="${fn:length(goods.goodsname)<=10 }">
													${goods.goodsname }
											</c:if>
											<c:if test="${fn:length(goods.goodsname)>10}">
													${fn:substring(goods.goodsname,0,10)}..
											</c:if>
										</dd>
										<dd class="specCount"><span>¥${goods.groprice}</span>已售${goods.sales}</dd>
										<dd class="specCut"><span>手机购买立减¥${goods.cut}</span></dd>
									</dl>
								</li>
							</c:when>
							</c:choose>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach var="goods" items="${specgoods }">
							<c:choose>
							<c:when test="${goods.rownum>5&&goods.rownum<=10}">
								<li>
									<dl>
										<dt><a href="single.do?goodsid=${goods.goodsid}"><img src="images/index/${goods.defaultpic}" alt=""/></a></dt>
										<dd class="specName">
											<c:if test="${fn:length(goods.goodsname)<=10 }">
													${goods.goodsname }
											</c:if>
											<c:if test="${fn:length(goods.goodsname)>10}">
													${fn:substring(goods.goodsname,0,10)}..
											</c:if>
										</dd>
										<dd class="specCount"><span>¥${goods.groprice}</span>已售${goods.sales}</dd>
										<dd class="specCut"><span>手机购买立减¥${goods.cut}</span></dd>
									</dl>
								</li>
							</c:when>
							</c:choose>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach var="goods" items="${specgoods }">
							<c:choose>
							<c:when test="${goods.rownum>10&&goods.rownum<=15}">
								<li>
									<dl>
										<dt><a href="single.do?goodsid=${goods.goodsid}"><img src="images/index/${goods.defaultpic}" alt=""/></a></dt>
										<dd class="specName">
											<c:if test="${fn:length(goods.goodsname)<=10 }">
													${goods.goodsname }
											</c:if>
											<c:if test="${fn:length(goods.goodsname)>10}">
													${fn:substring(goods.goodsname,0,10)}..
											</c:if>
										</dd>
										<dd class="specCount"><span>¥${goods.groprice}</span>已售${goods.sales}</dd>
										<dd class="specCut"><span>手机购买立减¥${goods.cut}</span></dd>
									</dl>
								</li>
							</c:when>
							</c:choose>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach var="goods" items="${specgoods }">
							<c:choose>
							<c:when test="${goods.rownum>15&&goods.rownum<=20}">
								<li>
									<dl>
										<dt><a href="single.do?goodsid=${goods.goodsid}"><img src="images/index/${goods.defaultpic}" alt=""/></a></dt>
										<dd class="specName">
											<c:if test="${fn:length(goods.goodsname)<=10 }">
													${goods.goodsname }
											</c:if>
											<c:if test="${fn:length(goods.goodsname)>10}">
													${fn:substring(goods.goodsname,0,10)}..
											</c:if>
										</dd>
										<dd class="specCount"><span>¥${goods.groprice}</span>已售${goods.sales}</dd>
										<dd class="specCut"><span>手机购买立减¥${goods.cut}</span></dd>
									</dl>
								</li>
							</c:when>
							</c:choose>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach var="goods" items="${specgoods }">
							<c:choose>
							<c:when test="${goods.rownum>20&&goods.rownum<=25}">
								<li>
									<dl>
										<dt><a href="single.do?goodsid=${goods.goodsid}"><img src="images/index/${goods.defaultpic}" alt=""/></a></dt>
										<dd class="specName">
											<c:if test="${fn:length(goods.goodsname)<=10 }">
													${goods.goodsname }
											</c:if>
											<c:if test="${fn:length(goods.goodsname)>10}">
													${fn:substring(goods.goodsname,0,10)}..
											</c:if>
										</dd>
										<dd class="specCount"><span>¥${goods.groprice}</span>已售${goods.sales}</dd>
										<dd class="specCut"><span>手机购买立减¥${goods.cut}</span></dd>
									</dl>
								</li>
							</c:when>
							</c:choose>
						</c:forEach>
					</ul>
					<!-- 名品抢购部分轮播广告循环结束 -->
				</div>
				<div class="go_left"><</div>
				<div class="go_right">
					<span>
						<span class="inde">1</span>/5
					</span>
					>
				</div>
			</div>
		</div>
		</c:if>
		<!-- 导航栏 -->
		<div class="left_menu">
			<!-- 左侧导航对应各层内容循环开始 -->
			<ul>
				<c:forEach var="singlelist" items="${goodsVO }">
					<c:set var="str" value="${singlelist.sign }${singlelist.nickname }"></c:set>
					<c:if test="${singlelist.typename!='KTV'}">
						<li class="${singlelist.nickname }_icon"><a href="${str}"><i class="bg"></i><span>${singlelist.typename}</span></a></li>
					</c:if>
				</c:forEach>
			</ul>
			<!-- 左侧导航对应各层内容循环结束-->
		</div>
		<!-- 各楼层商品展示 -->
		<div class="formenu">
			<!-- 楼层循环开始 -->
			<c:forEach var="singlelist" items="${goodsVO }">
			<c:if test="${singlelist.typename!='KTV'}">
				<div class="${singlelist.nickname }">
					<div class="header">
						<div class="header_left" >
							<img src="images/index/icons/${singlelist.nickname }_title_icon.png"/>
							<a name="${singlelist.nickname }" >${singlelist.typename}</a>
						</div>
						<div class="header_right">
							<ul>
								<c:forEach var="goodstype" items="${singlelist.typelist }">
									<li class="header_right_li"><a href="#">${goodstype.typename }</a></li>
								</c:forEach>
								<li><a href="#">全部&gt;&nbsp;</a></li>
							</ul>
						</div>
					</div>
					<div class="main">
						<ul>
						<c:forEach var="goods" items="${singlelist.goodslist}">
							<li>
								<div class="deal_td">
										<div class="deal_img">
											<a href="single.do?goodsid=${goods.goodsid}"><img src="images/index/${goods.defaultpic}" alt=""></a>
										</div>
										<h3 class="deal_title">
											<a href="productDetail.jsp?goodsid=${goods.goodsid }">
												<span class="xtitle">
												<c:if test="${fn:length(goods.goodsname)<=14 }">
													${goods.goodsname }
												</c:if>
												<c:if test="${fn:length(goods.goodsname)>14}">
													${fn:substring(goods.goodsname,0,14)}..
												</c:if>
												</span><br/>
												<span class="short_title">	
												<c:if test="${fn:length(goods.goodsadv)<=19 }">
													${goods.goodsadv}
												</c:if>
												<c:if test="${fn:length(goods.goodsadv)>19}">
													${fn:substring(goods.goodsadv,0,19)}..
												</c:if>
												</span>
											</a>
										</h3>
										<p class="deal_detail">
											<span class="price">¥${goods.groprice}</span>
											<span class="value">&nbsp;门店价<del>¥${goods.storeprice}</del></span>
											<span class="sales">已售${goods.sales}</span>
										</p>
										<div class="deal_extra">
											<p>
												<span class="campaign">立减${goods.cut }</span>
												<a href="productDetail.jsp?goodsid=${goods.goodsid }#rat" class="productRate">
													<span class="rate_info_bar">
														<span class="bgstar">
															<span class="fgstar" style="width:${goods.evaluation}px;"></span>
														</span>
													</span>
													<span class="rate_info">${goods.evalnums}人评价</span>
												</a>
											</p>
										</div>
								</div>	
							</li>
						</c:forEach>
						</ul>
					</div>
					<div class="footer">
						<a href="#">更多美食团购，请点击查看&gt;</a>
					</div>
				</div>
			</c:if>
			</c:forEach>
			<!-- 楼层循环结束 -->
		</div>
		<div style="margin-top: 40px" class="bottom">
			<iframe src="forCall/footer.html" frameborder="0" scrolling="no" width="100%" height="450px"></iframe>
		</div>
	</div>
	<script src="framework/bootstrap/scripts/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="js/index.js" type="text/javascript"></script>
	<script src="js/header.js" type="text/javascript"></script>

	<script type="text/javascript">
		index.initMenu();
		index.initPointer();
		index.initGoLeft();
		index.initGoRight();
		index.initSpecPointer();
		index.initSpecLeft();
		index.initSpecRight();
		index.initMenubar1();
		index.initMenubar2();
		index.initMenubar3();
		/* index.initFirstadv(); */
	</script>
</body>
</html>