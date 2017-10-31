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
	<title>05商品详情页——碉堡烤鱼</title>
	<link rel="stylesheet" href="css/aheader.css">
	<link rel="stylesheet" href="css/productDetail.css">
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
								<li><a href="myorders.jsp" target="_blank">我的订单</a></li>
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
							<a href="shoppingcar.jsp">
								<img src="images/header/shopcar.png" alt="20*15">购物车<span style="color:red;" class="carshopnum"><c:if test="${basket==null}">0</c:if><c:if test="${basket!=null}">${basket.size }</c:if></span>件<img src="images/header/down.png" class="menuArrow" alt="5*3">
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
					<strong style="font-size:16px;">&nbsp;南京</strong>
					<div  class="change_city"><a href="#">切换城市</a></div>
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
								<a href="category.jsp?typeid=${goods.typeid }">${goods.typename }</a>
							</div>
							<div class="someMore">
								<c:forEach var="sec" items="${goods.secTypes}">
									<c:forEach var="thir" items="${sec.thirdTypes }">
										<c:if test="${goods.typeid!=3&&goods.typeid!=6}">
											<c:choose>
												<c:when test="${thir.rownum<=2}">
													<a href="category.jsp?typeid=${thir.typeid }">${thir.typename }</a>
												</c:when>
											</c:choose>
										</c:if>
										<c:if test="${goods.typeid==3||goods.typeid==6}">
											<c:choose>
												<c:when test="${thir.rownum<=1}">
													<a href="category.jsp?typeid=${thir.typeid }">${thir.typename }</a>
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
										<a href="category.jsp?typeid=${sec.typeid }">${sec.typename }</a>
									</li>
									<c:forEach var="thir" items="${sec.thirdTypes}">
										<li><a href="category.jsp?typeid=${thir.typeid }">${thir.typename }</a></li>
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
	<!-- 所在位置导航 -->
	<ul class="nav">
			<li><a href="index.jsp">${store.toparea}团购</a></li>
			<li>&gt;&gt;</li>
			<li><a href="#">${single.toptypename}</a></li>
			<li>&gt;&gt;</li>
			<li><a href="#">${single.typename}</a></li>
			<li>&gt;&gt;</li>
			<li><a href="#">${store.thirdarea }</a></li>
			<li>&gt;&gt;</li>
			<li><a href="#">${store.storename}</a></li>
			<li>&gt;&gt;</li>
			<li>${single.typename}</li>
	</ul>
	<hr width="100%" size="1" color="#EEEEEE" noshade="true"/>
	<!-- 商品购买详情 -->
	<div class="deal">
		<!-- 商品名称 -->
		<p class="deal_title">
			<c:if test="${fn:length(single.goodsname)<=20}">
				${single.goodsname }
			</c:if>
			<c:if test="${fn:length(single.goodsname)>20}">
				${fn:substring(single.goodsname,0,20)}
			</c:if>
		</p>
		<p class="deal_advice">
			<c:if test="${fn:length(single.goodsadv)<=70}">
				${single.goodsadv }
			</c:if>
			<c:if test="${fn:length(single.goodsadv)>70}">
				${fn:substring(single.goodsadv,0,70)}
			</c:if>
		</p>
		<!-- 商品详情 -->
		<div class="deal_detail">
			<!-- 左侧图片展示 -->
			<div class="deal_pic">
				<!-- 轮播广告图片 -->
				<div class="deal_cover_wrapper">
					<ul class="deal_cover">
						<li class="cover"><a href="#"><img src="images/index/${single.defaultpic }" width="470px" height="290px" alt=""></a></li>
					</ul>
					<div class="deal_pointer">
						<a href="javascript:;" class="poiLeft">&lt;</a>
						<a href="javascript:;"  id="ii" class="poiRight">&gt;</a>
					</div>
				</div>
				<!-- 鼠标触动的上面显示对应的图片 -->
				<ul class="deal_thumb">
					<c:forEach var="pics" items="${single.gpics }">
						<li><img src="images/productDetail/${pics.goodspath }" class="normal" width="80px" height="45px" alt=""></li>
					</c:forEach>
				</ul>
			</div>
			<!-- 右侧订单信息 -->
			<div class="deal_order">
				<div class="deal_order_price">
					<span class="order_leading">促销价
						<i class="pr1">
							<c:if test="${single.proprice!=0 }">￥${single.proprice }</c:if>
						</i>
					</span>
					<span><i class="prt2">&nbsp;团购价
					</i>
						<c:if test="${single.proprice!=0 }">
							<del class="pr2">
								￥${single.groprice }
							</del>
						</c:if>
						<c:if test="${single.proprice==0 }">
							<i class="pr2">
								￥${single.groprice }
							</i>
						</c:if>
					</span>
					<span>&nbsp;门店价
					<del class="pr3">￥${single.storeprice }</del></span>
				</div>
				<div class="deal_order_cut">
					<span class="order_leading">优惠</span>
					<span class="cut2">
						立减${single.cut }元，每人限购2张
					</span>
					<div class="to">
						<div class="to_ctx">
							<i>减￥${single.cut }</i>
							<span class="remind">距开始</span>
							<span class="remainTime"></span>
							<span class="arrdown"><img src="images/productDetail/down.png" alt=""></span>
						</div>
						<div class="to_way">
							<ul>
								<li><i>1</i><span>收藏该团购单</span></li>
								<li><i>2</i><span>扫描下载美团手机版</span></li>
								<li><i>3</i><span>在手机上“我的收藏”中购买</span></li>
							</ul>
							<img src="images/productDetail/mark.png" alt="">
						</div>
					</div>
				</div>
				<div class="deal_order_rate">
					<span class="rt1">已售<i>${single.sales }</i></span>
					<span class="rt2"><i>${single.evaluation }3</i>分</span>
					<span class="rt3"><i>${single.evalnums }2</i>人评价</span>
				</div>
				<div class="deal_order_expiry">
					<span class="exp1">有效期</span>
					<span class="exp2">截止日期到&nbsp;${single.expire }2016.07.10<i>周末、法定节假日通用</i></span>
				</div>
				<c:if test="${single.toptype==1 }">
					<c:if test="${fn:length(single.gpacks)!=0 }">
						<div class="deal_order_scheme">
							<span class="order_leading">套餐</span>
							<c:forEach var="pack" items="${single.gpacks }">
								<input type="text" value="${pack.packname }" readonly class="pac" name="packname">
								<input type="hidden" value="0">
							</c:forEach>
						</div>
					</c:if>
				</c:if>
				<div class="deal_order_amount">
					<form action="pay.do" method="post">
						<span class="amo1">数量</span>
						<span class="amount"><input id="a1" type="button" value="-"/><input id="a2" type="text" value="1" name="buynum" class="buynum"/><input id="a3" type="button" value="+"/></span>
						<div class="buy">
							<!-- 点击抢购，提交订单 -->
							<input type="submit" value="√立即抢购"/>
							<!-- 点击加入购物车，通过ajax把商品添加到购物车里 -->
							<img class="car" src="images/productDetail/car.png" width="60px" height="40px" alt="">&nbsp;
							<input type="hidden" value="${single.goodsid}" class="hidgoods"/>
							<span><img src="images/productDetail/star.png" alt="">收藏（1658）</span>&nbsp;
							<span class="share"><img src="images/productDetail/share.png" alt="">分享到</span>
						</div>
					</form>
				</div>
				<div class="deal_order_ensure">
					<span class="order_leading">服务承诺</span>
					<img src="images/productDetail/ensure.png" alt="">
				</div>
			</div>
		</div>
	</div>
	<!-- 更多介绍 -->
	<div class="more">
		<!-- 内容 -->
		<div class="more_ctx">
			<!-- 重要通知 -->
			<div class="attention">
				<div class="atten_log">
					<img src="images/productDetail/import.png" alt="">
				</div>
				<div class="attenCtx">
					<p>
						亲爱的用户，本次团购有效期延长至2016年08月18日，感谢您的支持，祝消费愉快~
					</p>
				</div>
			</div>
			<!-- 该商家的其他团购 -->
			<div class="other_purchase">
				<h2 class="purchase_title">
					<span>该商家的其他团购</span>
					<i class="subtitle">
						<i>团购价</i>
						<i>门店价</i>
						<i>已售</i>
					</i>
				</h2>
				<ul>
					<!-- 该商家的其他团购循环开始 -->
					<c:forEach var="goods" items="${store.stgoods }">
						<li>
							<a href="single.do?goodsid=${goods.goodsid}">
								<span class="pc_title">${goods.goodsname }</span>
								<span class="pc_price">￥<i>${goods.groprice}</i></span>
								<span class="value">￥${goods.storeprice }</span>
								<span class="pc_sale">${goods.sales }</span>
							</a>
						</li>
					</c:forEach>
					<!-- 该商家的其他团购循环结束 -->
				</ul>
			</div>
			<!-- *****下方内容导航栏（scrollTop定位） -->
			<div class="navbar">
				<ul>
					<li><a href="#locat">商家位置</a></li>
					<li><a href="#buyn">购买须知</a></li>
					<li><a href="#orde">本单详情</a></li>
					<li><a href="#selle">商家介绍</a></li>
					<li class="last"><a href="#rat">消费评价（1493）</a></li>
				</ul>
				 <div class="navbuy">
					<a href="#"><img src="images/productDetail/buy.png" alt=""></a>
					<a href="#"><img src="images/productDetail/addbuy.png" alt=""></a>
				</div>
			</div>
			<!-- ***********导航栏对应的主要内容 ************-->
			<div class="deal_stuff">
				<div class="mainbox">
					<div class="main">
						<div class="blk_detail">
							<!-- 商家位置 -->
							<div class="location" id="locat">
								<h2 class="content_title">商家位置</h2>
								<div class="location_detail">
									<div class="location_detail_map">
										<img src="images/productDetail/map.png" alt="">
									</div>
									<table cellpadding="0" cellpadding="0" border="0" class="location_detail_para">
											<tr>
												<th colspan="2"><a href="#">${store.storename }</a></th>
											</tr>
											<tr>
												<td class="loc_title">评价：</td>
												<td class="loc_detail">
													<a href="#">${store.evalnums}人评价</a><br/>
												</td>
											</tr>
											<tr>
												<td></td>
												<td class="loc_eavscores">${store.evalscores}分</td>
											</tr>
											<tr>
												<td class="loc_title" style="vertical-align: top">地址：</td>
												<td class="loca" >
													<span class="loc">${store.storeadd }</span><br/>
													<a href="#">查看地图</a>
													<a href="#">公交/驾车去这里</a>
												</td>
											</tr>
											<c:if test="${store.subwayadd!=null }">
												<tr>
													<td class="loc_title">地铁：</td>
													<td class="loc_detail">	
														${store.subwayadd }
													</td>
												</tr>
											</c:if>
											<tr>
												<td class="loc_title">电话：</td>
												<td class="loc_detail">
													${store.tel }
												</td>
											</tr>
									</table>
								</div>
							</div>
							<!-- 购买须知 -->
							<div class="buynotice" id="buyn">
								<h2 class="content_title">购买须知</h2>
								<dl>
									<dt>有效期</dt>
									<dd>2016.4.11 至 2016.7.10（周末、法定节假日通用）</dd>
									<dt>使用时间</dt>
									<dd>11:00-次日2:00</dd>
									<dt>预约提醒</dt>
									<dd>无需预约，消费高峰时可能需要等位</dd>
									<dt>限购限用提醒</dt>
									<dd>每张美团券建议2至4人使用</dd>
									<dt>包间</dt>
									<dd>可用包间，条件为：请咨询商家</dd>
									<dt>堂食外带</dt>
									<dd>仅限堂食，不提供餐前外带，餐毕未吃完可打包，打包费详情咨询商家
									</dd>
									<dt class="warmRemind">温馨提示</dt>
									<dd>团购用户不可同时享受商家其他优惠
										酒水饮料等问题，请致电商家咨询，以商家反馈为准
										如部分菜品因时令或其他不可抗因素导致无法提供，店内会用等价菜品替换，具体事宜请与店内协商
									</dd>
									<dt class="businessService">商家服务</dt>
									<dd>提供免费WiFi<br/>
										免费提供10个停车位</dd>
								</dl>
							</div>
							<!-- 本单详情 -->
							<div class="orderdetail" id="orde">
								<h2 class="content_title">本单详情</h2>
								<div class="orderdetail_content">
									<!-- 美味尽享 -->
									<div class="orderdetail_content_package">
										<!-- 标题 -->
										<h4 class="inner_content_title">
											<span class="title_bar"></span>
											<span class="title_ctx">美味尽享</span>
										</h4>
										<!-- 套餐内容 -->
										<div class="package_content">
											<table cellpadding="0" cellspacing="0">
												<tr>
													<th colspan="2" class="pack_ctx_title">套餐内容</th>
													<th class="pack_ctx_price">单价</th>
													<th class="pack_ctx_amount">数量/规格</th>
													<th class="pack_ctx_count">小计</th>
												</tr>
												<tr>
													<td rowspan="2" class="pack_ctx_name1">清江鱼套餐</td>
													<td class="pack_ctx_name2">炭火泡椒牛蛙</td>
													<td class="pack_ctx_price">¥148</td>
													<td class="pack_ctx_amount">1份</td>
													<td class="pack_ctx_count">¥148</td>
												</tr>
												<tr>
													<td class="pack_ctx_name2">配菜</td>
													<td class="pack_ctx_price">¥10</td>
													<td class="pack_ctx_amount">4份</td>
													<td class="pack_ctx_count">¥10</td>
												</tr>
												<tr>
													<td colspan="5" align="right" class="countall">
														价值：¥188&nbsp;&nbsp;
													</td>
												</tr>
											</table>
											<ul>
												<li>免费提供餐巾纸</li>
												<li>配菜：赠送4份素菜</li>
												<li>口味有：麻辣、香辣、豆鼓、荔枝</li>
											</ul>
										</div>
									</div>	
									<!-- 美团推荐 -->
									<div class="orderdetail_content_recommend">
										<!-- 标题 -->
										<h4 class="inner_content_title">
											<span class="title_bar"></span>
											<span class="title_ctx">美团推荐</span>
										</h4>
										<div class="introduce_detail">
											<h4>${single.goodsname }</h4>
											<img src="images/index/${single.defaultpic }" alt="">
										</div>
									</div>
								</div>	
							</div>
							<!-- 商家介绍 -->
							<div class="sellerIntroduction" id="selle">
								<h2 class="content_title">商家介绍</h2>
								<!-- 碉堡烤鱼 -->
								<div class="sellIntroduction_content">
									<!-- 标题 -->
									<h4 class="inner_content_title">
										<span class="title_bar"></span>
										<span class="title_ctx">${store.storename }</span>
									</h4>
									<div class="introduce_detail">
										<c:forEach var="pic" items="${store.stpics}">
											<img src="images/productDetail/${pic.imgpath }" alt="">
										</c:forEach>
										<p>
											${store.storectx}
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="rate" id="rat">
							<!-- 消费评价(分页)-->
							<h2 class="content_title">消费评价</h2>
							<h4 class="content_subtitle">我买过本单，<a href="#">我要评价</a></h4>
							<!-- 星星评论 -->
							<ul class="rate_star">
								<li><img src="images/productDetail/rate1.png" alt=""></li>
								<li><img src="images/productDetail/rate2.png" alt=""></li>
								<li class="last"><img src="images/productDetail/rate3.png" alt=""></li>
							</ul>
							<!-- 大家说 -->
							<div class="everyonesay">
								<span>大家都在说：</span>
								<ul>
									<li><a href="#">服务态度好（417）</a></li>
									<li><a href="#">味道很好（413）</a></li>
									<li><a href="#">菜量足（222）</a></li>
									<li><a href="#">环境不好（138）</a></li>
									<li><a href="#">位置好找（33）</a></li>
									<li><a href="#">性价比高（24）</a></li>
									<li><a href="#">上菜快（21）</a></li>
									<li class="sec"><a href="#">味道一般（47）</a></li>
									<li class="sec"><a href="#">位置有点偏（16）</a></li>
									<li class="sec"><a href="#">额外收费（9）</a></li>
								</ul>
							</div>
							<!-- 评论分页 -->
							<div class="ratePage">
								<div class="rateFilter">
									<ul>
										<li>全部</li>
										<li>晒图评论</li>
										<li>只看低分</li>
										<li class="last">
											<select size="1">
												<option value="时间排序" selected="selected">时间排序</option>
												<option value="默认排序">默认排序</option>
											</select>
										</li>
									</ul>
								</div>
								<ul class="rateCtx">
								<!-- 商品评论循环开始 -->
									<li>
										<div class="userinfo">
											<span class="userphoto">
												<img src="images/productDetail/user1.png" alt="">
											</span>
											<span class="username">
												绿丝带
											</span>
										</div>
										<div class="userrate">
											<span class="userRateStar">
												<img src="images/productDetail/ur.png" alt="">
												<i class="rateTime">
													2016-04-22
												</i>
											</span>
											<span class="userRateCtx">
												味道一般吧，对我来说感觉有些辣，不会再来吃了
											</span>
										</div>
									</li>
									<!-- 商品评论循环结束 -->
								</ul>
								<div class="pagination">
									<!-- 分页条 -->
								</div>
							</div>
						</div>
					</div>
					<div class="deal_buy_buttom">
						<!-- 评论下方价格导购 -->
						<table cellspacing="0" cellpadding="0">
							<tr>
								<td rowspan="2" class="now_price"><span class="moneysign">￥</span>79</td>
								<td class="price">门店价</td>
								<td class="count">折扣</td>
								<td class="sale">已售</td>
								<td class="basc">&nbsp;</td>
								<td rowspan="2" align="right">
									<img width='66px' height='26px' src="images/productDetail/buy.png" alt="">
									<img width='122px' height='26px' src="images/productDetail/addbuy.png" alt="">
								</td>
							</tr>
							<tr>
								<td><del>￥108</del></td>
								<td>7.3折</td>
								<td>4751</td>
							</tr>
						</table>
					</div>
					<div class="app">
						<!-- 美团手机版app二维码扫描 -->
						<img src="images/productDetail/app.png" alt="">
					</div>
				</div>
			</div>			
		</div>
		<!-- 侧边栏 -->
		<div class="more_sidebar">
			<ul class="appdownload">
				<li >
					<a href="#">
					<img src="images/productDetail/phoneapp.png" title="美团手机版" alt=""></a>
				</li>
				<li>
					<a href="#">
					<img src="images/productDetail/catmovieapp.png"  title="猫眼电影" alt=""></a>
				</li>
			</ul>
			<div class="answer">
					<h4>美团答疑
					</h4>
					<p>
						<img src="images/productDetail/answer.png" alt="">
						<a href="#">本单答疑</a>
						|
						<a href="#">我要提问</a>
					</p>
			</div>
			<div class="rec">
					<h4>
						<span>最近浏览</span>
						<a href="#">清空</a>
					</h4>
					<ul class="rec_ctx">
						<li>
							<dl>
								<dt><img src="images/productDetail/rec1.jpg" alt=""></dt>
								<dd class="rec_title"><a href="#">碉堡烤鱼2-3人餐</a></dd>
								<dd>
									<i>￥79</i>
									<span>门店价</span>
									<del>￥108</del>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><img src="images/productDetail/rec2.jpg" alt=""></dt>
								<dd class="rec_title"><a href="#">星巴克买一送一咖啡券1张</a></dd>
								<dd>
									<i>￥20</i>
									<span>门店价</span>
									<del>￥30</del>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><img src="images/productDetail/rec3.jpg" alt=""></dt>
								<dd class="rec_title"><a href="#">碉堡烤鱼2-3人餐</a></dd>
								<dd>
									<i>￥79</i>
									<span>门店价</span>
									<del>￥108</del>
								</dd>
							</dl>
						</li>
					</ul>
			</div>	
		</div>
	</div>
	<!-- 主体部分内容结束 -->
	
	<!-- 尾部 -->
	<div style="margin-top: 80px;">
		<iframe src="forCall/afooter.html" frameborder="0" scrolling="no" width="100%" height="450px"></iframe>
	</div>
</div>	
<!-- 进入该网页时网页底部的狗皮膏药 -->
<div class="fixadv">
	<span class="advintro">猫眼电影（美团旗下）</span>
	<img src="images/productDetail/adv.png" alt="">
	<span class="closeadv" title="关闭">×</span>
</div>


<!-- 点击加入购物车，提示成功 -->
<div class="carbox">
	<div class="addCarSuccess">	
	</div>
	<div class="mess">
		<p class="closeCarbox"><img src="images/productDetail/close.png" alt=""></p>
		<div class="prompt">
			<div class="ok"><img src="images/productDetail/ok.png" alt=""></div>
			<div class="okfont">
				<h3 class="x_title">成功加入购物车</h3>
				<p class="s_title">购物车内共有1种商品</p>
			</div>
			<div class="con">
				<a href="#"><img src="images/productDetail/cont.png" alt=""></a>
			</div>
			<div class="count">
				<a href="pay.jsp"><img src="images/productDetail/tocar.png" alt=""></a>
			</div>
		</div>
	</div>
</div>
<!-- 点击加入购物车，提示成功结束 -->
	<script type="text/javascript" src="framework/bootstrap/scripts/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/aheader.js"></script>
	<script type="text/javascript" src="js/productDetail.js"></script>
	<script type="text/javascript" src="js/jquery-pagination.1.0.js"></script>
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
			adv.initThumb();
			adv.initMenuBar();
			adv.initRemainTime();
			adv.initTimeoShow();
			adv.initSideBar();
			adv.initCurrentImg();
			adv.initChoosenPackage();
			adv.initChangeNum();
			adv.initAddCar();
			adv.initHideCar();
			adv.initclosefixadv();
			adv.initline();
			/* $(".pagination").pagination({
				url:"category.do",
				currentPage:${gp.currentPage},
				maxPage:${gp.countPage},
				disnum:7,
				typeid:${gp.typeid}
			}); */
		})(jQuery);
	</script>
</body>
</html>