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
	<title>04商品分类</title>
	<link rel="stylesheet" href="css/aheader.css">
	<link rel="stylesheet" href="css/category.css">
	<link rel="stylesheet" href="css/pagination.css">
</head>
<body>
	<div class="category">
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
							<a href="shoppingcar.html">
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
			<!-- 广告 -->
			<div class="adv">
				<ul class="adv_content">
					<li><img src="images/category/adv1.jpg"></li>
					<li><img src="images/category/adv2.jpg"></li>
				</ul>
				<div class="error"><a href="#" ><abbr title="关闭"><img src="images/header/close.png" alt=""></abbr></a></div>
				<ul class="adv_icon">
					<li lang="0"></li>
					<li lang="1"></li>
				</ul>
			</div>
			<div class="server">
				<div class="log">
					<a href="index.jsp" target="_blank"><img src="images/header/meituan.png" alt=""></a>
				</div>
				<div class="city">
					<strong style="font-size:16px;">&nbsp;${areaname }</strong>
					<div  class="change_city"><a href="pro.do">切换城市</a></div>
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
		<!-- 头部分类导航 -->
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
							<li><a href="index.html">首页</a></li>
							<li><a href="#">今日新单</a></li>
							<li><a href="#">购物</a></li>
							<li><a href="#">身边外卖</a></li>
						</ul>
					</div>
			</div>
		</div>
		<!-- 查询过滤 -->
		<div class="filter">
			<div class="filter_sortbar_out">
				<!-- 过滤头部，动态显示过滤条件 -->
				<div class="filter_breadcrumb">
					 <form action="category.do" method="get">
					    <input type="hidden" class="forchange"/>
					    <input type="hidden" class="recordDeleteFilters" name="delf" value=""/>
						<ul>
							<li class="all">全部</li>
							<%-- <c:if test="${filters.typeid==0}">
							<li class="ctx">
								<span class="rightArrow">&gt;</span>
								<span class="ctx_title">
									<input type="text" value="${typesVO.typename}"  class="s_sort" readonly/>
									<input type="hidden" value="sortsDetail"/>
								</span>
								<span class="close">×</span>
							</li>
							<c:forEach var="st" items="${typesVO.superTypes}">
								<li class="ctx">
									<span class="rightArrow">&gt;</span>
									<span class="ctx_title">
										<input type="text" value="${st.typename}"  class="s_sort" readonly/>
										<input type="hidden" value="sortsDetail"/>
										<input type="hidden" class="hid" value="${typesVO.typeid}"/>
									</span>
									<span class="close">×</span>
								</li>
							</c:forEach>
							</c:if> --%>
							<c:if test="${filters!=null }">
								<c:if test="${filters.typeid!=0}">
									<li class="ctx">
										<span class="rightArrow">&gt;</span>
										<span class="ctx_title">
											<input type="text" value="${filters.typename}"  class="s_sort" readonly/>
											<input type="hidden" value="sortsDetail"/>
											<input type="hidden" class="hid" value="${filters.typeid}"/>
										</span>
										<span class="close">×</span>
									</li>
								</c:if>
								<c:if test="${filters.areaid!=0}">
									<li class="ctx">
										<span class="rightArrow">&gt;</span>
										<span class="ctx_title">
											<input type="text" value="${filters.areaname}"  class="s_sort" readonly/>
											<input type="hidden" value="sortsDistrict"/>
											<input type="hidden" class="hid" value="${filters.areaid}"/>
										</span>
										<span class="close">×</span>
									</li>
								</c:if>
								<c:if test="${filters.packname!=null}">
									<li class="ctx">
										<span class="rightArrow">&gt;</span>
										<span class="ctx_title">
											<input type="text" value="${filters.packname}"  class="s_sort" readonly/>
											<input type="hidden" value="sortsPackage"/>
											<input type="hidden" class="hid" value="${filters.packname}"/>
										</span>
										<span class="close">×</span>
									</li>
								</c:if>
							</c:if>
						</ul>
					</form>
				</div>
				<!-- 过滤详情，显示不同的过滤要求供用户选择 -->
				<div class="filter_section_wrapper">
					<c:if test="${fn:length(typesVO.thirdTypes)!=0 }">
						<div class="sorts sortsDetail">
							<hr width="100%" size="1" noshade="true"  color="white"/>
							<label>分类：</label>
							<ul>
								<li><a class="all" href="javascript:;">全部</a></li>
								<!-- 类型循环开始 -->
								<c:forEach var="ft" items="${typesVO.thirdTypes}">
									<li><a href="javascript:;" lang="${ft.typeid }" lan="typeid">${ft.typename }</a></li>
								</c:forEach>
								<!-- 类型循环结束 -->
							</ul>
						</div>
					</c:if>
					<c:if test="${fn:length(thirdAreas)!=0 }">
						<div class="sorts sortsDistrict">
							<hr width="100%" size="1" noshade="true"  color="white"/>
							<label>区域：</label>
							<ul>
								<li><a  class="all" href="javascript:;">全部</a></li>
								<li>
									<a href="#" class="hot">
										<img src="images/category/subway.png" alt="15*15" width="11px" height="13px">
										地铁附近
									</a>
								</li>
								<!-- 所选择的市的下面的区循环开始 -->
								<c:forEach var="area" items="${thirdAreas }">
									<li><a href="javascript:;" lang="${area.areaid}" lan="areaid">${area.areaname }</a></li>
								</c:forEach>
								<!-- 所选择的市的下面的区循环开始 -->
							</ul>
						</div>
					</c:if>
					<c:if test="${fn:length(packs)!=0 }">
						<div class="sorts sortsPackage">
							<hr width="100%" size="1" noshade="true"  color="white"/>
							<label>人数：</label>
							<ul>
								<li><a  class="all" href="#">全部</a></li>
								<!-- 食品类下的所有套餐类型循环开始 -->
								<c:forEach var="pack" items="${packs }">
									<li><a href="javascript:;" lang="${pack.packname}" lan="packname">${pack.packname }</a></li>
								</c:forEach>
								<!-- 食品类下的所有套餐类型循环结束 -->
							</ul>
						</div>
					</c:if>
				</div>
			</div>
			<!-- 过滤结果排序 -->
			<div class="filter_sort">
				<ul>
					<li class="current"><a href="#" title="默认排序">默认</a></li>
					<li class="withsort">
						<a href="#" title="销量从高到低">
							<span class="sortby">销量</span><span class="sortsWay">↓</span>
							<input type="hidden" value="0">
						</a>
					</li>
					<li class="withsort">
						<a href="#" title="价格从低到高">
							<span class="sortby">价格</span><span class="sortsWay">↓</span>
							<input type="hidden" value="0">
						</a>
					</li>
					<li class="withsort">
						<a href="#" title="好评从高到低">
							<span class="sortby">好评</span><span class="sortsWay">↓</span>
							<input type="hidden" value="0">
						</a>
					</li>
					<li class="withsort">
						<a href="#" title="发布时间从新到旧">
							<span class="sortby">发布时间</span><span class="sortsWay">↓</span>
							<input type="hidden" value="0">
						</a>
					</li>
				</ul>
			</div>
		</div>	
		<!-- 主体部分 -->	
		<div class="main">
			<div class="content">
				<!-- 商品查询分页 -->
				<div class="pageData">
					<%-- <input type="hidden" value="${gp.typeid }" name="typeid"/> --%>
					<ul>
					<!-- 商品信息循环开始 -->
						<c:forEach var="goods" items="${gp.gvo}">
						<li>
							<dl>
								<dt>
									<a href="single.do?goodsid=${goods.goodsid }"><img src="images/index/${goods.defaultpic }" alt="350*214" width="350px" height="214px"></a>
								</dt>
								<dd class="title">
									<h3>
										<a href="single.do?goodsid=${goods.goodsid }" title="舌尚世纪缘自助餐厅" target="_blank" hidefocus="true" rel="nofollow">
											<span class="x_title">
												<c:if test="${fn:length(goods.goodsname)<=14 }">
													${goods.goodsname }
												</c:if>
												<c:if test="${fn:length(goods.goodsname)>14}">
													${fn:substring(goods.goodsname,0,14)}..
												</c:if>
											</span><br/>
											<span class="s_title">
												<c:if test="${fn:length(goods.goodsadv)<=19 }">
													${goods.goodsadv}
												</c:if>
												<c:if test="${fn:length(goods.goodsadv)>19}">
													${fn:substring(goods.goodsadv,0,19)}..
												</c:if>
											</span>
										</a>
									</h3>
								</dd>
								<dd class="discount">
									<span class="price">
										¥
										<strong>${goods.groprice}</strong>
									</span>
									<span class="cut">立减${goods.cut }</span>
									<span class="value">
										门店价
										<del>¥${goods.storeprice}</del>
									</span>
								</dd>
								<dd class="sales">
									<span class="salescount">
										已售
										<strong>${goods.sales}</strong>
									</span>
									<!-- 此处为跨页锚链接 -->
									<a href="productDetail.jsp#rat" target="_blank">
										<!-- 五个星星为父框的背景。span设置颜色和width就可以制造比例的效果 -->
										<span class="bgstar">
											<span class="fgstar"></span>
										</span>
										${goods.evalnums}人评价
									</a>
								</dd>
							</dl>
						</li>
						</c:forEach>
					<!-- 商品信息循环结束 -->
					</ul>
				</div>
				<div class="pagination">
					<!-- 分页条 -->
				</div>
			</div>
			<div class="sidebar">
				<!-- 侧边栏 -->
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
	<script type="text/javascript" src="framework/bootstrap/scripts/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/aheader.js"></script>
	<script type="text/javascript" src="js/category.js"></script>
	<script type="text/javascript" src="js/jquery-pagination.1.0.js"></script>
	<script type="text/javascript">
		;(function($){
			aheader.initStar();
			aheader.initApp();
			aheader.initAppMark();
			aheader.initRightDownMenu();
			aheader.initMenuStyle();
			aheader.initSortAll();
			aheader.initRightMenu();
			aheader.initMenuStyle2();
			aheader.initPoint();
			category.initFilterTop();
			category.initAddFilterTop();
			category.initCloseSsort();
			category.initWithsort();
			category.initUnderline();
			category.initSideBar();
			category.initclosefixadv();
			$(".pagination").pagination({
				url:"category.do",
				currentPage:${gp.currentPage},
				maxPage:${gp.countPage},
				disnum:7,
				typeid:${gp.typeid}
			});
			/* category.initTrigersubmit(); */
		})(jQuery);
	</script>
</body>
</html>
