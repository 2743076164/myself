<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="${pageContext.request.contextPath}/front/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/front/css/style.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/front/css/user_style.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/front/skins/all.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/front/js/jquery-1.8.3.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/front/js/jquery.SuperSlide.2.1.1.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/front/js/common_js.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/front/js/footer.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/front/layer/layer.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/front/js/iCheck.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/front/js/custom.js"
	type="text/javascript"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/front/js/angular.min.js"></script>

<title>订单结算</title>

<script>
function getCookieNum(cartid) {	
	 console.log(getCookie("num")+cartid);	
}
</script>

</head>

<body>
<head>
<div id="header_top">
	<div id="top">
		<div class="Inside_pages">
			<div class="Collection">
				<a href="#" class="green">请登录</a> <a href="#" class="green">免费注册</a>
			</div>
			<div class="hd_top_manu clearfix">
				<ul class="clearfix">
					<li class="hd_menu_tit" data-addclass="hd_menu_hover"><a
						href="#">首页</a></li>
					<li class="hd_menu_tit" data-addclass="hd_menu_hover"><a
						href="#">我的小充</a></li>
					<li class="hd_menu_tit" data-addclass="hd_menu_hover"><a
						href="#">消息中心</a></li>
					<li class="hd_menu_tit" data-addclass="hd_menu_hover"><a
						href="#">商品分类</a></li>
					<li class="hd_menu_tit" data-addclass="hd_menu_hover"><a
						href="#">我的购物车<b>(23)</b></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="header" class="header page_style">
		<div class="logo">
			<a href="index.html"><img src="${pageContext.request.contextPath}/admin/images/lolo.PNG" /></a>
		</div>
		<!--结束图层-->
		<div class="Search">
			
		</div>
		<!--购物车样式-->
		<div class="hd_Shopping_list" id="Shopping_list">
			<div class="s_cart">
				<a href="#">我的购物车</a> <i class="ci-right">&gt;</i><i
					class="ci-count" id="shopping-amount">0</i>
			</div>
			<div class="dorpdown-layer">
				<div class="spacer"></div>
				<!--<div class="prompt"></div><div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>-->
				<ul class="p_s_list">
					<li>
						<div class="img">
							<img src="images/tianma.png">
						</div>
						<div class="content">
							<p class="name">
								<a href="#">产品名称</a>
							</p>
							<p>颜色分类:紫花8255尺码:XL</p>
						</div>
						<div class="Operations">
							<p class="Price">￥55.00</p>
							<p>
								<a href="#">删除</a>
							</p>
						</div>
					</li>
				</ul>
				<div class="Shopping_style">
					<div class="p-total">
						共<b>1</b>件商品 共计<strong>￥ 515.00</strong>
					</div>
					<a href="Shop_cart.html" title="去购物车结算" id="btn-payforgoods"
						class="Shopping">去购物车结算</a>
				</div>
			</div>
		</div>
	</div>
	<!--菜单栏-->
	<div class="Navigation" id="Navigation">
		<ul class="Navigation_name">
			<li><a href="Home.html">首页</a></li>
			<li><a href="#">你身边的超市</a></li>
			<li><a href="#">预售专区</a><em class="hot_icon"></em></li>
			<li><a href="products_list.html">商城</a></li>
			<li><a href="#">半小时生活圈</a></li>
			<li><a href="#">好评商户</a></li>
			<li><a href="#">热销活动</a></li>
			<li><a href="Brands.html">联系我们</a></li>
		</ul>
	</div>
	<script>$("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});</script>
</div>
</head>
<div class="user_style clearfix">
	<div class="user_center clearfix">
		<div class="left_style">
			<div class="menu_style">
				
				<div class="sideMen">
					<!--菜单列表图层-->
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_1"></em>我的购物车
						</dt>
						<dd>
							<ul>
								<li><a href="用户中心-我的订单.html">我的订单</a></li>
								<li><a href="用户中心-收货地址.html">收货地址</a></li>
								<li><a href="用户中心-产品预订.html">产品预订</a></li>
							</ul>
						</dd>
					</dl>
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_2"></em>会员管理
						</dt>
						<dd>
							<ul>
								<li><a href="#"> 用户信息</a></li>
								<li><a href="#"> 我的收藏</a></li>
								<li><a href="#"> 我的留言</a></li>
								<li><a href="#">我的标签</a></li>
								<li><a href="#"> 我的推荐</a></li>
								<li><a href="#"> 我的评论</a></li>
							</ul>
						</dd>
					</dl>
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_3"></em>账户管理
						</dt>
						<dd>
							<ul>
								<li><a href="用户中心-账户管理.html">账户余额</a></li>
								<li><a href="用户中心-消费记录.html">消费记录</a></li>
								<li><a href="#">跟踪包裹</a></li>
								<li><a href="#">资金管理</a></li>
							</ul>
						</dd>
					</dl>
					<dl class="accountSideOption1">
						<dt class="transaction_manage">
							<em class="icon_4"></em>分销管理
						</dt>
						<dd>
							<ul>
								<li><a href="#">店铺管理</a></li>
								<li><a href="#">我的盟友</a></li>
								<li><a href="#">我的佣金</a></li>
								<li><a href="#">申请提现</a></li>
							</ul>
						</dd>
					</dl>
				</div>
				<script>jQuery(".sideMen").slide({titCell:"dt", targetCell:"dd",trigger:"click",defaultIndex:0,effect:"slideDown",delayTime:300,returnDefault:true});</script>
			</div>
		</div>
		<!--右侧样式-->
		<div class="right_style">
			<div class="title_style">
				<em></em>订单确认
			</div>
			<div class="Order_form_style">

<form action="order" method="post">
  <div class="user_address_style" >
   
   <div class="menu_style"><div class="user_title">收货人信息</div></div>
      <div class="add_address">
    <span class="name">默认送货地址</span>
    <table cellpadding="0" cellspacing="0" width="100%">
     <tr><td class="label_name">收&nbsp;货&nbsp;&nbsp;人：</td><td><input name="username" type="text" value="${user.username}" class="add_text" style=" width:600px" readonly="readonly" /><i></i></td></tr>
     <tr><td class="label_name">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td><td ><input name="address" value="${user.address}" type="text" class="add_text" style=" width:600px" readonly="readonly"/><i></i></td></tr>
     <tr><td class="label_name">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td><td><input name="telephone" value="${user.telephone}" type="text" class="add_text" style=" width:600px" readonly="readonly"/>&nbsp;&nbsp;</td></tr>
    
    </table>
   </div>
     <br/>
   <div class="add_address">
    <span class="name">使用新的送货地址</span>
    <table cellpadding="0" cellspacing="0" width="100%">
     <tr><td class="label_name">收&nbsp;货&nbsp;&nbsp;人：</td><td><input name="newname" type="text"  class="add_text" style=" width:600px"/><i>*</i></td></tr>
    
     <tr><td class="label_name">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</td><td><textarea name="newaddress" cols="" rows="" style=" width:600px; height:70px; margin:5px 0px"></textarea><i>*</i></td></tr>
     <tr><td class="label_name">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td><td><input name="newtelephone" type="text" class="add_text" style=" width:600px"/>&nbsp;&nbsp;(选填)</td></tr>
      <tr class="moren_dz" style="color: #999"><td class="label_name"></td><td><label><input name="" type="checkbox" value="" />设置为默认地址</label>
      </td></tr>
    </table>
   </div>
    <div class="menu_style"><div class="user_title">结&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;算</div></div>
    <div class="add_address">
   
    <table cellpadding="0" cellspacing="0" width="100%">
     <tr><td class="label_name">总价：</td><td><input name="total" type="text" value="${total}" class="add_text" style=" width:200px" readonly="readonly"/>元, 一共 <input name="totalnum" type="text" value="${totalnum}" class="add_text" style=" width:200px" readonly="readonly"/>件</td></td></tr>
     <tr><td class="label_name">支付方式：</td><td><input name="" type="submit" style=" width:100px" value="&nbsp;&nbsp;&nbsp;&nbsp;微信支付&nbsp;&nbsp;&nbsp;&nbsp;"  class="add_dzbtn"/></td></tr>
 
    </table>
   </div>
</div>
			</form>
		</div>
		<script>
            $(document).ready(function(){
              $('.Order_form_style input').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
              });
            });
            
 </script>


	</div>
</div>
</div>
<!--网站地图-->
<div class="fri-link-bg clearfix"></div>
<!--网站地图END-->
<!--网站页脚-->
<div class="copyright">
	<div class="copyright-bg">
		<div class="hotline">
			
		</div>
	</div>
</div>
</body>
</html>
