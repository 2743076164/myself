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

<title>购物车</title>

<script>

//设置cookie
var setCookie = function (name, value, day) {
//当设置的时间等于0时，不设置expires属性，cookie在浏览器关闭后删除
var expires = day * 24 * 60 * 60 * 1000;
var exp = new Date();
exp.setTime(exp.getTime() + expires);
document.cookie = name + "=" + value + ";expires=" + exp.toUTCString();
};



function changeProductNum(cartid) {	
	
	let price=document.getElementById("price"+cartid).value;
	let num=document.getElementById("num"+cartid).value;
	let ss=0;
	let re=document.getElementById("total1"+cartid);
	let tt=document.getElementById("total");
	if(isNaN(price)||isNaN(num))           /*用自带函数isNaN判断是否为数字*/
	{ 
		alert('必须为整数');     /*输入非文字弹出提示*/
		return false;
	}
	 ss =parseInt(price)*parseInt(num);    /*parseInt表示数值相加如果直接s1+s2 ，那就会显示s1s2 */
	
setCookie("num"+cartid,num,7)
setCookie("price"+cartid,price,7);
	
	 re.value=ss;	
	jisuan();
	
	
	
	 
}


function jisuan() {	
  var total = 0;
  var totalnum=0;
  var check=document.getElementById("check");
  var tt=document.getElementById("total");  
  var ttnum=document.getElementById("totalnum"); 
  var price = $('input[name="price"]')
  var num = $('input[name="num"]')   
  for (var i = 0; i < price.length; i++) {    	 
  	 total += (parseFloat(price[i].value) * parseFloat(num[i].value));
  	 totalnum += parseInt(num[i].value);
  	 
  	 
  	 
     // if (check.checked) {
    //      total += (parseFloat(price[i].value) * parseFloat(num[i].value));
    //  }   
  }
  
  tt.value=total;
  ttnum.value=totalnum;
}


</script>
</head>

<body >

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
				<em></em>订单管理
			</div>
			<div class="Order_form_style">

				<div class="Order_Operation">
					<div class="left">
						<label><input name="" type="checkbox" value=""
							class="checkbox" />全选</label>
					</div>
					<div class="right_search">
						<input name="" type="text" class="add_Ordertext"
							placeholder="请输入产品标题或订单号进行搜索" /><input name="" type="submit"
							value="搜索订单" class="search_order" />
					</div>
				</div>
				
<form action="goorder" method="post">			
				<div class="Order_form_list"       >
						<table>
							<thead>
								<tr>
									<td class="list_name_title0">商品</td>
									<td class="list_name_title1">单价(元)</td>
									<td class="list_name_title2">数量</td>
									<td class="list_name_title4">总价(元)</td>
									<td class="list_name_title6">操作</td>
								</tr>
							</thead>
							<c:forEach items="${userCartList}" var="userCart">
								<tbody>
									<tr class="Order_info">
										<td colspan="6" class="Order_form_time"><input
											name="check" type="checkbox" value="checked" class="checkbox" />"${userCart.cartTime}"</td>
									</tr>
									<tr class="Order_Details">
										<td colspan="3">
											<table class="Order_product_style">
												<tbody>
													<tr>
														<td>
															<div class="product_name clearfix">
																<a href="#" class="product_img"><img
																	src="${pageContext.request.contextPath}/DisplayImage?src=${userCart.product.image}"
																	alt="" width="80px" height="70px" /></a> <a href="3"
																	class="p_name">${userCart.product.productname}</a>

															</div>
														</td>
														<td><input name="price" type="text"
															id="price${userCart.id}" size="5" readonly="readonly"
															value="${userCart.product.price}" /></td>
														<td id="${userCart.id}"><input name="num"
															id="num${userCart.id}" size="3" type="text"
															onchange="changeProductNum(${userCart.id})"
															value="${userCart.number}" /></td>
													</tr>
												</tbody>
											</table>
										</td>
										<td class="split_line"><input name="total1"
											readonly="readonly"
											value="${userCart.product.price*userCart.number}"
											id="total1${userCart.id}" size="10" type="text" /></td>
										<td class="operating"><a href="#" class="Delivery_btn">删除</a>
										</td>
									</tr>
									<tr>
										<td class="xj"><span id="total_item_1"></span></td>
										<td></td>
									</tr>
								</tbody>
							</c:forEach>

							<table>
								<tr>
									<td>总价：<input name="total" id="total" value="0"
										readonly="readonly" /></td>
									<td>总件数：<input name="totalnum" id="totalnum" value="0"
										readonly="readonly" /></td>
									<td class="operating"><a href="#" class="Delivery_btn">
											<input name="" type="submit" value="去结算" class="Delivery_btn" /></td>
								</tr>
							</table>
						</table>



					</div>
</form>	
			</div>
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
			为生活充电在线 <span>招商热线：****-********</span> 客服热线：400-******
		</div>
	</div>
</div>
</body>
</html>
