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
	<title>06购物车</title>
	<link rel="stylesheet" href="css/shoppingcar.css">
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
								<a href="#" class="app">
								<img class="phone"src="images/header/phone.png" alt="10*15">
								手机美团
								<img src="images/header/down.png" class="menuArrow" alt="5*3">
							</a>
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
						<li class="press_current">提交订单</li>
						<li>选择支付方式</li>
						<li>购买成功</li>
					</ol>
					<div class="press">
						<div class="pressbar">
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
	<!-- !!!!!!!!!!!!!!!!!!!!!需要提交的订单!!!!!!!!!!!!!!!!!!!! -->
	<form action="pay.jsp">
		<!-- 我的购物车 -->
		<div class="shopcar">
			<div class="shopcar_title">
				<img src="images/buycar/car.png" alt="">
				<span class="title">我的购物车</span>
				<span class="number"><i>${fn:length(cgoodsVO) }</i>/20</span>
			</div>
			<div class="shopcar_ctx">
				<table cellpadding="0" cellspacing="0">
					<tr class="for_th">
						<th class="choose">
							<input type="hidden" value="0">
							<label for="sa" class="selectAll">√</label>
							<span id="sa">全选</span>
						</th>
						<th class="list">
							项目
						</th>
						<th class="price">
							单价
						</th>
						<th class="number">
							数量
						</th>
						<th class="count">
							小计
						</th>
						<th class="del">
							操作
						</th>
					</tr>
					<c:forEach items="${cgoodsVO }" var="cg">
						<tr>
							<td>
								<input type="hidden" value="0" class="forchoose">
								<label class="selectSingle">√</label>
							</td>
							<td class="imga">
								<img src="images/index/${cg.defaultpic }" alt="" width="75px" height="45px">
								<a href="productDetail.do?goodsid=${cg.goodsid }">${cg.goodsadv }</a>
							</td>
							<td>
								<span class="RMB">¥</span><i>${cg.groprice }</i>
							</td>
							<td>
								<div class="amount">
									<div class="minus">-</div><input type="text" value="${cg.buynum }"/><div class="add">+</div>
								</div>
							</td>
							<td><span class="RMB">¥</span><i class="singlecount">${cg.groprice*cg.buynum }</i></td>
							<td class="method"><a href="delsinglegac.do?goodsid=${cg.goodsid }">删除</a></td>
						</tr>
					</c:forEach>
				</table>
				<div class="vouchers">
					<div class="voucher">
						<input type="hidden" value="0">
						<label class="discount">√</label>
						使用抵用券抵扣：
						<span>-¥0</span>
					</div>
					<div class="vouchersmark">
						<div class="vmt"></div>
						<div class="vmctx">
							<span>添加抵用券</span>
							<input type="text" placeholder="输入抵用券密码"/><button>验证密码</button>
						</div>
					</div>
				</div>
				<div class="IEMGs">
					<div class="IEMG">
						<input type="hidden" value="0">
						<label class="discount">√</label>
						使用积分值抵扣：
						<span>-¥0</span>
					</div>
					<div class="IEMGmark" style="display:none">
						<div class="vmt">
						</div>
					</div>
				</div>
				<div class="countAll">
					<div class="count_number">已选<span>${fn:length(cgoodsVO) }</span>件商品</div>&nbsp;
					<div class="count_money">应付总额：<span>¥</span><span class="countAllMoney">0</span></div>
				</div>
			</div>
		</div>
		<!-- 提交部分 -->
		<div class="addOthers">
			<div class="add_tel">
				您的手机号 ${user.tel }
				<a href="#">绑定新手机号</a>
			</div>
			<div class="add_submit">
				<button type="submit">提交订单</button>
			</div>
		</div>
	</form>
	<!-- 您可能感兴趣 -->
	<div class="recommend">
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<!-- 尾部 -->
	<div style="margin-top: 80px;">
		<iframe src="forCall/afooter.html" frameborder="0" scrolling="no" width="100%" height="450px"></iframe>
	</div>
	<script type="text/javascript" src="framework/bootstrap/scripts/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/shoppingcar.js"></script>
	<script type="text/javascript">
		;(function($){
			car.initSaveStar();
			car.initDownMenu1();
			car.initDownMark();
			car.initDownMenu2();
			car.initMenuColor();
			car.initChoose();
			car.initChooseAll();
			car.initChangeNum();
			car.initDiscount();
			car.initNews();
		})(jQuery);
	</script>
</body>
</html>