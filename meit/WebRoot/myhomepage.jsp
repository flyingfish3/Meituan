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
	<title>10我的主页</title>
	<link rel="stylesheet" href="css/aheader.css">
	<link rel="stylesheet" href="css/myhomepage.css">
	<link rel="stylesheet" href="css/home.css">
</head>
<body>
<div class="container">
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
						<li><a href="myorders.html" target="_blank">我的订单</a></li>
						<li class="dnMe" style="width:84px">
							<a href="myhomepage.html" target="_blank">我的美团
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
					<img src="images/header/meituan.png" alt="">
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
					<dd class="sort_left_list">
						<div class="Title">
							<div class="someMain"><a href="#">美食</a></div>
							<div class="someMore">
								<a href="#">自助餐</a>
								<a href="#">代金券</a>
								<img src="images/index/arrowRight.png"/>
							</div>
						</div>
						<div class="foodMenu">
							<table>
								<th><a href="#">美食</a></th>
								<tr>
									<td><a href="#">代金券</a></td>
									<td><a href="#">咖啡酒吧茶馆</a></td>
								</tr>
								<tr>
									<td><a href="#">甜点饮品</a></td>
									<td><a href="#">京菜鲁菜</a></td>
								</tr>
								<tr>
									<td><a href="#">火锅</a></td>
									<td><a href="#">云贵菜</a></td>
								</tr>
								<tr>
									<td><a href="#">自助餐</a></td>
									<td><a href="#">东南亚菜</a></td>
								</tr>
								<tr>
									<td><a href="#">小吃快餐</a></td>
									<td><a href="#">海鲜</a></td>
								</tr>
								<tr>
									<td><a href="#">日韩料理</a></td>
									<td><a href="#">素食</a></td>
								</tr>
								<tr>
									<td><a href="#">西餐</a></td>
									<td><a href="#">台湾/客家菜</a></td>
								</tr>
								<tr>
									<td><a href="#">聚餐宴请</a></td>
									<td><a href="#">创意菜</a></td>
								</tr>
								<tr>
									<td><a href="#">烧烤烤肉</a></td>
									<td><a href="#">汤/粥/炖菜</a></td>
								</tr>
								<tr>
									<td><a href="#">东北菜</a></td>
									<td><a href="#">蒙菜</a></td>
								</tr>
								<tr>
									<td><a href="#">川湘菜</a></td>
									<td><a href="#">新疆菜</a></td>
								</tr>
								<tr>
									<td><a href="#">江浙菜</a></td>
									<td><a href="#">其他美食</a></td>
								</tr>
								<tr>
									<td><a href="#">香锅烤鱼</a></td>
									<td><a href="#"></a></td>
								</tr>
								<tr>
									<td><a href="#">粤港菜</a></td>
									<td><a href="#"></a></td>
								</tr>
								<tr>
									<td><a href="#">中式烧烤/烤串</a></td>
									<td><a href="#"></a></td>
								</tr>
								<tr>
									<td><a href="#">西北菜</a></td>
									<td><a href="#"></a></td>
								</tr>
							</table>
						</div>
					</dd>
					<dd class="sort_left_list">
						<div class="Title">
							<div class="someMain"><a href="#">酒店/客栈</a></div>
							<div class="someMore">
								<a href="#">经济型酒店</a>
								<img src="images/index/arrowRight.png"/>
							</div>
						</div>
						<div class="hotelMenu">
							<table>
								<th><a href="#">酒店</a></th>
								<tr>
									<td><a href="#">经济型酒店</a></td>
								</tr>
								<tr>
									<td><a href="#">豪华酒店</a></td>
								</tr>
								<tr>
									<td><a href="#">主题酒店</a></td>
								</tr>
								<tr>
									<td><a href="#">度假酒店/度假村</a></td>
								</tr>
								<tr>
									<td><a href="#">公寓型酒店</a></td>
								</tr>
								<tr>
									<td><a href="#">客栈</a></td>
								</tr>
								<tr>
									<td><a href="#">青年旅社</a></td>
								</tr>
							</table>
						</div>
					</dd>
					<dd class="sort_left_list">
						<div class="Title">
							<div class="someMain"><a href="#">电影/在线选座</a></div>	
							<div class="someMore">
								<img src="images/index/arrowRight.png"/>
							</div>						
						</div>
						<div class="movieMenu">
							<table>
								<th><a href="#">当前热映</a></th>
								<th><a href="#">热门影院</a></th>
								<tr>
									<td><a href="#">火锅英雄</a></td>
									<td><a href="#">星河国际影城</a></td>
								</tr>
								<tr>
									<td><a href="#">我的特工爷爷</a></td>
									<td><a href="#">万达影城</a></td>
								</tr>
								<tr>
									<td><a href="#">睡着我上铺的兄弟</a></td>
									<td><a href="#">新街口国际影城</a></td>
								</tr>
								<tr>
									<td><a href="#">伦敦陷落</a></td>
									<td><a href="#">大华电影院</a></td>
								</tr>
								<tr>
									<td><a href="#">蝙蝠侠大战超人：...</a></td>
									<td><a href="#">中影国际影城</a></td>
								</tr>
								<tr>
									<td><a href="#">疯狂动物城</a></td>
									<td><a href="#">UME国际影城</a></td>
								</tr>
								<tr>
									<td><a href="#">荒野猎人</a></td>
									<td><a href="#">龙行国际影城</a></td>
								</tr>
								<tr>
									<td><a href="#">灵偶契约</a></td>
									<td><a href="#">金逸影城</a></td>
								</tr>
								<tr>
									<td><a href="#">太空熊猫英雄归来</a></td>
									<td><a href="#">大地影院</a></td>
								</tr>
								<tr>
									<td><a href="#">不速之客</a></td>
									<td><a href="#">幸福蓝海国际影城</a></td>
								</tr>
							</table>
						</div>
					</dd>
					<dd class="sort_left_list">
						<div class="Title">
							<div class="someMain"><a href="#">KTV</a></div>
						</div>
					</dd>
					<dd class="sort_left_list">
						<div class="Title">
							<div class="someMain"><a href="#">休闲娱乐</a></div>
							<div class="someMore">
								<a href="#">足疗按摩</a>
								<img src="images/index/arrowRight.png"/>
							</div>
						</div>
						<div class="funMenu">
							<table>
								<th><a href="#">休闲娱乐</a></th>
								<tr>
									<td><a href="#">KTV</a></td>
								</tr>
								<tr>
									<td><a href="#">其他娱乐</a></td>
								</tr>
								<tr>
									<td><a href="#">演出赛事</a></td>
								</tr>
								<tr>
									<td><a href="#">桌游/电玩</a></td>
								</tr>
								<tr>
									<td><a href="#">运动健康</a></td>
								</tr>
								<tr>
									<td><a href="#">4D/5D电影</a></td>
								</tr>
								<tr>
									<td><a href="#">足疗按摩</a></td>
								</tr>
								<tr>
									<td><a href="#">洗浴/汗蒸</a></td>
								</tr>
								<tr>
									<td><a href="#">DIY手工</a></td>
								</tr>
								<tr>
									<td><a href="#">密室逃脱</a></td>
								</tr>
								<tr>
									<td><a href="#">酒吧/咖啡</a></td>
								</tr>
							</table>
						</div>
					</dd>
					<dd class="sort_left_list">
						<div class="Title">
							<div class="someMain"><a href="#">周边游/旅游</a></div>
							<div class="someMore">
								<img src="images/index/arrowRight.png"/>
							</div>	
						</div>
						<div class="tourMenu">
							<table>
								<th><a href="#">周边游</a></th>
								<th><a href="#">旅游</a></th>
								<tr>
									<td><a href="#">温泉</a></td>
									<td><a href="#">境外游</a></td>
								</tr>
								<tr>
									<td><a href="#">景点</a></td>
									<td><a href="#">景点门票</a></td>
								</tr>
								<tr>
									<td><a href="#">主题公园</a></td>
									<td><a href="#">国内游</a></td>
								</tr>
								<tr>
									<td><a href="#">水上乐园</a></td>
								</tr>
								<tr>
									<td><a href="#">动植物园</a></td>
								</tr>
								<tr>
									<td><a href="#">海洋馆</a></td>
								</tr>
								<tr>
									<td><a href="#">展览馆</a></td>
								</tr>
								<tr>
									<td><a href="#">游船</a></td>
								</tr>
								<tr>
									<td><a href="#">高空观景</a></td>
								</tr>
								<tr>
									<td><a href="#">真人CS</a></td>
								</tr>
								<tr>
									<td><a href="#">漂流</a></td>
								</tr>
								<tr>
									<td><a href="#">单车出租</a></td>
								</tr>
								<tr>
									<td><a href="#">其他游玩</a></td>
								</tr>
								<tr>
									<td><a href="#">农家乐</a></td>
								</tr>
							</table>
						</div>
					</dd>
					<dd class="sort_left_list">
						<div class="Title">
							<div class="someMain"><a href="#">生活服务</a></div>
							<div class="someMore">
								<a href="#">婚纱摄影</a>
								<a href="#">个性写真</a>
								<img src="images/index/arrowRight.png"/>
							</div>
						</div>
						<div class="serveMenu">
							<table>
								<th><a href="#">生活服务</a></th>
								<tr>
									<td><a href="#">婚纱摄影</a></td>
								</tr>
								<tr>
									<td><a href="#">个性写真</a></td>
								</tr>
								<tr>
									<td><a href="#">亲子摄影</a></td>
								</tr>
								<tr>
									<td><a href="#">其他摄影</a></td>
								</tr>
								<tr>
									<td><a href="#">培训课程</a></td>
								</tr>
								<tr>
									<td><a href="#">其他生活</a></td>
								</tr>
								<tr>
									<td><a href="#">汽车服务</a></td>
								</tr>
								<tr>
									<td><a href="#">体检/齿科</a></td>
								</tr>
								<tr>
									<td><a href="#">衣物/皮具洗护</a></td>
								</tr>
								<tr>
									<td><a href="#">鲜花</a></td>
								</tr>
								<tr>
									<td><a href="#">母婴亲子</a></td>
								</tr>
								<tr>
									<td><a href="#">配镜</a></td>
								</tr>
								<tr>
									<td><a href="#">照片冲印</a></td>
								</tr>
								<tr>
									<td><a href="#">商场购物卡</a></td>
								</tr>
								<tr>
									<td><a href="#">服饰鞋包</a></td>
								</tr>
								<tr>
									<td><a href="#">电器数码</a></td>
								</tr>
							</table>
						</div>
					</dd>
					<dd class="sort_left_list">
						<div class="Title">
							<div class="someMain"><a href="#">购物</a></div>
							<div class="someMore">
								<a href="#">男装</a>
								<a href="#">女装</a>
								<img src="images/index/arrowRight.png"/>
							</div>
						</div>
						<div class="shopMenu">
							<table>
								<th><a href="#">购物</a></th>
								<tr>
									<td><a href="#">女装</a></td>
								</tr>
								<tr>
									<td><a href="#">男装</a></td>
								</tr>
								<tr>
									<td><a href="#">内衣</a></td>
								</tr>
								<tr>
									<td><a href="#">鞋靴</a></td>
								</tr>
								<tr>
									<td><a href="#">食品</a></td>
								</tr>
								<tr>
									<td><a href="#">家居日用</a></td>
								</tr>
								<tr>
									<td><a href="#">美妆</a></td>
								</tr>
								<tr>
									<td><a href="#">箱包</a></td>
								</tr>
								<tr>
									<td><a href="#">运动户外</a></td>
								</tr>
								<tr>
									<td><a href="#">配饰手表</a></td>
								</tr>
								<tr>
									<td><a href="#">母婴玩具</a></td>
								</tr>
								<tr>
									<td><a href="#">家纺</a></td>
								</tr>
								<tr>
									<td><a href="#">数码电器</a></td>
								</tr>
								<tr>
									<td><a href="#">家具家装</a></td>
								</tr>
								<tr>
									<td><a href="#">汽车用品</a></td>
								</tr>
								<tr>
									<td><a href="#">本地购物</a></td>
								</tr>
							</table>
						</div>
					</dd>
					<dd class="sort_left_list">
						<div class="Title">
							<div class="someMain"><a href="#">丽人</a></div>
							<div class="someMore">
								<a href="#">美发</a>
								<a href="#">美甲</a>
								<img src="images/index/arrowRight.png"/>
							</div>
						</div>
						<div class="beautyMenu">
							<table>
								<th><a href="#">丽人</a></th>
								<tr>
									<td><a href="#">美发</a></td>
								</tr>
								<tr>
									<td><a href="#">美甲</a></td>
								</tr>
								<tr>
									<td><a href="#">美容美体</a></td>
								</tr>
								<tr>
									<td><a href="#">瑜伽/舞蹈</a></td>
								</tr>								
							</table>
						</div>
					</dd>
				</div>
			</dl>
		</div>
		<div class="sort_center">
				<div class="sort_center_top">
					<ul>
						<li><a href="index.html">首页</a></li>
						<li><a href="#">今日新单</a></li>
						<li><a href="#">购物</a></li>
						<li><a href="#">身边外卖</a></li>
					</ul>
				</div>
		</div>
		<div class="sort_right">
			<div class="sort_ringht_top"></div>
		</div>
	</div>
	<div class="home">
		<!-- 左侧导航栏 -->
		<div class="left_menu">
			<dl>
				<dt class="title"><a href="myhomepage.html">我的主页</a></dt>
				<dt>我的订单</dt>
				<dd>
					<ul>
						<li><a href="myorders.html">团购订单</a></li>
						<li><a href="#">电影选座</a></li>
						<li><a href="#">酒店预订</a></li>
						<li><a href="#">KTV预订</a></li>
						<li><a href="#">我的抽奖</a></li>
						<li><a href="#">我的收藏</a></li>
					</ul>
				</dd>
				<dt>我的评价</dt>
				<dd>
					<ul>
						<li><a href="#">待评价</a></li>
						<li><a href="#">已评价</a></li>
					</ul>
				</dd>
				<dt>退款维权</dt>
				<dd>
					<ul>
						<li><a href="#">我的退款</a></li>
					</ul>
				</dd>
				<dt>我的账户</dt>
				<dd class="lastdd">
					<ul>
						<li><a href="#">我的积分</a></li>
						<li><a href="#">抵用券</a></li>
						<li><a href="#">我的余额</a></li>
						<li><a href="#">账户设置</a></li>
						<li><a href="#">安全中心</a></li>
					</ul>
				</dd>
			</dl>
		</div>
		<!-- 右侧主要内容 -->
		<div class="home_ctx">
			<div class="homecontainer">
				<div class="top">
					<div class="photo" title="上传头像">
						<!-- <img src="images/homepage/photo.jpg" alt=""> -->
					</div>
					<div class="introduction">
						<div class="greeting">
							上午好，<span>sunny</span>
							<img src="images/homepage/vip.png" alt="">
						</div>
						<div class="safety">
							<a class="bindPhone" href="#" title="绑定手机，15252525252,换绑">
								<img src="images/homepage/bp.png" alt="">
							</a>
							<a class="editFiles">
								<img src="images/homepage/ef.png" href="#" title="编辑资料" alt="">
							</a>
							<span class="safetyLevel">
								安全等级
								<i>低</i>
							</span>
						</div>
					</div>
					<div class="account">
						<ul>
							<li>当前余额<a href="#">0</a></li>
							<li>积分<a href="#">93</a></li>
							<li class="lastli">抵用券<a href="#">0</a></li>
						</ul>
					</div>
				</div>
				<!-- 我的成长值 -->
				<div class="growth">
					<div class="growth_title">
						<div class="growth_count">
							我的成长值
							<span title="您打败了上海80%的小伙伴">928</span>
						</div>
						<div class="growth_help"><a href="#">如何获得成长值？</a></div>
					</div>
					<div class="growth_ctx">
						<ul class="growthBar">
							<li class="first"></li>
							<li class="second"></li>
							<li class="third"></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
						<div class="growthLevel">
							<img src="images/homepage/level.png" alt="">
						</div>
						<div class="growthLevelNumber">
							<ul>
								<li>0</li>
								<li>100</li>
								<li>300</li>
								<li>1000</li>
								<li>3000</li>
								<li>8000</li>
								<li>20000</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 我的特权 -->
				<div class="privilege">
					<h3 class="priv_title">我的特权</h3>
					<ul class="priv_ctx">
							<li class="item">
								<div class="priv_icon"><img src="images/homepage/pv1.png" alt=""></div>
								<div class="priv_name">身份铭牌</div>
								<div class="priv_detail">彰显你的会员身份</div>
							</li>
							<li class="item">
								<div class="priv_icon"><img src="images/homepage/pv2.png" alt=""></div>
								<div class="priv_name">积分抵现限额</div>
								<div class="priv_detail">积分就是可以当钱花</div>
							</li>
							<li class="item">
								<div class="priv_icon"><img src="images/homepage/pv3.png" alt=""></div>
								<div class="priv_name">免费试吃</div>
								<div class="priv_detail">V4以上特权</div>
							</li>
							<li class="item">
								<div class="priv_icon"><img src="images/homepage/pv4.png" alt=""></div>
								<div class="priv_name">评价红名展示</div>
								<div class="priv_detail">能让您在众多小伙伴中脱颖而出</div>
							</li>
							<li class="item">
								<div class="priv_icon"><img src="images/homepage/pv5.png" alt=""></div>
								<div class="priv_name">极速退款</div>
								<div class="priv_detail">买错了，立刻为您退款</div>
							</li>
							<li class="item">
								<div class="priv_icon"><img src="images/homepage/pv6.png" alt=""></div>
								<div class="priv_name">客服优先接入</div>
								<div class="priv_detail">优先为您处理您的问题</div>
							</li>
					</ul>
				</div>
				<!-- 成长值发放规则示例 -->
				<div class="growthRule">
					<h3 class="rule_title">成长值发放规则示例</h3>
					<div class="rule_ctx">
						<table class="example" cellpadding="0" cellspacing="0">
							<tr>
								<th>示例</th>
								<th>分值</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>1.PC端购买金额</td>
								<td>1元=1成长值</td>
								<td></td>
							</tr>
							<tr>
								<td>2.移动端购买金额</td>
								<td>1元=1成长值</td>
								<td></td>
							</tr>
							<tr>
								<td>3.初次设置登录密码安全等级达到“强”</td>
								<td>10成长值</td>
								<td><a href="#">立即设置</a></td>
							</tr>
							<tr>
								<td>4.初次设置支付密码</td>
								<td>20成长值</td>
								<td><a href="#">立即设置</a></td>
							</tr>
							<tr>
								<td>5.初次设置安保问题</td>
								<td>50成长值</td>
								<td><a href="#">立即设置</a></td>
							</tr>
							<tr>
								<td>6.初次设置登录密码</td>
								<td>5成长值</td>
								<td><a href="#">立即设置</a></td>
							</tr>
							<tr>
								<td>7.初次绑定手机</td>
								<td>15成长值</td>
								<td>已完成</td>
							</tr>
						</table>
						<div class="app_bar">
							<h4>手机购买也能送成长值哦</h4>
							<a href="#" class="iphone">
								<img src="images/homepage/iphone.png" alt="">
								iPhone版下载
							</a>
							<a href="#" class="android">
								<img src="images/homepage/android.png" alt="">
								Android版下载
							</a>
							<div class="mark">
								<img src="images/homepage/mark.png" alt="">
							</div>
							<p>暂不支持微信安卓版扫码</p>
						</div>
						<div class="additional">
							<p>
								说明：<br/>
								1.退款时，会减去获得的成长值<br/>
								2.从2014年6月26日开始，用户满足成长值规则3到规则7，也能获得成长值。
							</p>
						</div>
					</div>
				</div>
				<!-- 我的成长记录 -->
				<div class="growthRecord">
					<h3>我的成长记录</h3>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<th>时间</th>
							<th>详情</th>
							<th>成长值</th>
						</tr>
						<tr>
							<td>2016-03-01 13:10</td>
							<td>
								购买 -
								<a href="#"> 安然纳米汗蒸-单人安然纳米汗蒸</a>
							</td>
							<td>+10</td>
						</tr>
						<tr>
							<td>2015-06-17 21:30</td>
							<td>
								退款 -
								<a href="#">金百合专业女子养生坊精油开背套餐</a>
							</td>
							<td>-38</td>
						</tr>
						<tr>
							<td>2015-06-15 11:05</td>
							<td>
								购买 -
								<a href="#">佑米造型美发套餐</a>
							</td>
							<td>+88</td>
						</tr>
						<tr>
							<td>2015-06-09 07:27</td>
							<td>
								购买 -
								<a href="#">金百合专业女子养生坊精油开背套餐</a>
							</td>
							<td>+38</td>
						</tr>
						<tr>
							<td>2015-04-07 19:03</td>
							<td>
								购买 -
								<a href="#"> 浪漫生活自助烤肉浪漫生活自助烤肉午/晚餐2选1，龙眠大道</a>
							</td>
							<td>+76</td>
						</tr>
						<tr>
							<td>2015-01-20 11:26</td>
							<td>
								购买 -
								<a href="#">  诸葛烤鱼代金券1张</a>
							</td>
							<td>+156</td>
						</tr>
						<tr>
							<td>2015-01-20 11:26</td>
							<td>
								购买 -
								<a href="#"> 浪漫生活自助烤肉浪漫生活自助烤肉午/晚餐2选1，龙眠大道</a>
							</td>
							<td>+76</td>
						</tr>
						<tr>
							<td>2014-09-20 09:17</td>
							<td>
								购买 -
								<a href="#">星美国际影城电影票1张，格致路</a>
							</td>
							<td>+40</td>
						</tr>
					</table>
					<ul class="pagination">
						<li><a href="#" class="current">1</a></li>
						<li><a href="#" class="nocurr">2</a></li>
						<li><a href="#" class="nocurr">下一页</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 尾部 -->
	<div style="margin-top: 60px;">
		<iframe src="forCall/afooter.html" frameborder="0" scrolling="no" width="100%" height="450px"></iframe>
	</div>
</div>	
	<script type="text/javascript" src="framework/bootstrap/scripts/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/aheader.js"></script>
	
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
			aheader.initNews();
		})(jQuery);
	</script>
</body>
</html>