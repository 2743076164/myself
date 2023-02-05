<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>index</title>
<meta name="description" content="[!--pagedes--]" />
<meta name="keywords" content="[!--pagekey--]" />
<link href="${pageContext.request.contextPath}/admin/css/master.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/admin/css/bases.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-1.1.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.SuperSlide.2.2.js"></script>
<link href="${pageContext.request.contextPath}/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/supplie.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/admin/css/style1.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="head clearfix yh">

	<!--logo-->
    <div class="logo block clearfix">
    	<a href="#" class="fleft"><img src="${pageContext.request.contextPath}/admin/images/logo.PNG"></a>
        <div class="fright">
        	<p class="tright"><a onclick="SetHome(window.location)" href="javascript:void(0)">欢迎您：${user.username}</a> | <a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">加入收藏</a></p>
            <br>
        </div>
    </div>
    
    <!--nav-->
	<div class="nav clearfix">
    	<ul class="block">
        	<li><a href="index">首页</a></li>
    
            <li><a href="login" class="L">用户登录</a></li>
            <li><a href="register" class="L">注册用户</a></li> 
            <li><a href="cart" class="L">购物车</a></li>
             <li><a href="#" class="L">关于我们</a></li>
            <li><a href="#" class="L">联系我们</a></li>
        </ul>
    </div>
    
    <div class="focusBox">
			<ul class="pic">
					<li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/admin/images/banner.PNG"/></a></li>
					<li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/admin/images/banner.PNG"/></a></li>
					<li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/admin/images/banner.PNG"/></a></li>
					<li><a href="#" target="_blank"><img src="${pageContext.request.contextPath}/admin/images/banner.PNG"/></a></li>
			</ul>
			<ul class="hd">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
	</div>


</div>

<div class="main clearfix ofHidden block yh">

	<!--左侧-->
	<div class="sidebar fleft">
    	<div class="title">商品种类</div>
        <ul class="menu">
        	<li>饼干</li>
            <li>膨化食品</li>
            <li>奶酪</li>
            <li>辣条</li>
            <li>其他</li>
        </ul>
        <div class="title mt10">联系我们</div>
        <div class="contact_nr">
        	<p><b class="f15">网站首发：W</b></p>
            <p>防伪码：UENRHR1241515</p>
            <p>联系方式：TEL-1309485733</p>
            <p>所属：W</p>
            <p></p>
        </div>
        
    </div>

	<!--右侧-->
    <div class="main_right fright">
   <div class="clearfix">
   <div class="">
        	<div class="t1"><a href=""><img src=""></a><span>产品列表</span></div>
    <c:forEach items="${productList}" var="product">
	<ul>
	<li><a href="productDetail?id=${product.id}"><img src="${pageContext.request.contextPath }/DisplayImage?src=${product.image}"	alt="" width="150" height="100" /></a></li>
	<li><a href="#">${product.productname}</a></li>
	<li class="price">${product.price}</li>
	<li>已售：2333件</li>
	</ul>
	</c:forEach>
               
   </div>
    	
</div>

       
        
        <!--产品展示-->
        <div class="cp_show clearfix">
        	<div class="title t1"><a href=""><img src="${pageContext.request.contextPath}/admin/images/more.jpg"></a>产品展示</div>
            <div class="picScroll">
		
		<ul>
			<li><a target="_blank" href="#"><img _src="${pageContext.request.contextPath}/admin/images/cp_cp.jpg" src="images/blank.png" /><p>产品展示名称</p></a></li>
			<li><a target="_blank" href="#"><img _src="${pageContext.request.contextPath}/admin/images/cp_cp.jpg" src="images/blank.png" /><p>产品展示名称</p></a></li>
			<li><a target="_blank" href="#"><img _src="${pageContext.request.contextPath}/admin/images/cp_cp.jpg" src="images/blank.png" /><p>产品展示名称</p></a></li>
			<li><a target="_blank" href="#"><img _src="${pageContext.request.contextPath}/admin/images/cp_cp.jpg" src="images/blank.png" /><p>产品展示名称</p></a></li>
			<li><a target="_blank" href="#"><img _src="${pageContext.request.contextPath}/admin/images/cp_cp.jpg" src="images/blank.png" /><p>产品展示名称</p></a></li>
			<li><a target="_blank" href="#"><img _src="${pageContext.request.contextPath}/admin/images/cp_cp.jpg" src="images/blank.png" /><p>产品展示名称</p></a></li>
			<li><a target="_blank" href="#"><img _src="${pageContext.request.contextPath}/admin/images/cp_cp.jpg" src="images/blank.png" /><p>产品展示名称</p></a></li>
			<li><a target="_blank" href="#"><img _src="${pageContext.request.contextPath}/admin/images/cp_cp.jpg" src="images/blank.png" /><p>产品展示名称</p></a></li>
			<li><a target="_blank" href="#"><img _src="${pageContext.request.contextPath}/admin/images/cp_cp.jpg" src="images/blank.png" /><p>产品展示名称</p></a></li>
			<li><a target="_blank" href="#"><img _src="${pageContext.request.contextPath}/admin/images/cp_cp.jpg" src="images/blank.png" /><p>产品展示名称</p></a></li>
		</ul>

	</div>
        </div>
        


<div class="foot tcenter yh f13">
	<p>联系方式： 13000000000</p>
	<p>备案号：141@124212REDA</p>
    
</div>


<script src="${pageContext.request.contextPath}/admin/js/all.js" type="text/javascript"></script>
</body>
</html>
