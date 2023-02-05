<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>登录</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css" />

<body>

<div class="login-container">
	<h1>登录</h1>
	
	
	
	<form action="userLogin" method="post" id="loginForm">
		<div>
			<input class="a" type="text" name="username" class="username" placeholder="用户名" autocomplete="off"/>
		</div>
		<div>
			<input class="a" type="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input class="b" type="radio" name="role" value="普通用户"><label>普通用户</label>
			<input type="radio" name="role" value="管理员"> <label>管理员</label>
			
		</div>
		<input class="a" id="submit" type="submit" value="登录" >
	</form>

	<a href="register">
		<input class="a" type="submit" class="register-tis" value="还有没有账号？" >
	</a>

</div>

<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/common.js"></script>
<!--背景图片自动更换-->
<script src="${pageContext.request.contextPath}/admin/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/supersized-init.js"></script>
<!--表单验证-->
<script src="${pageContext.request.contextPath}/admin/js/jquery.validate.min.js?var1.14.0"></script>
</body>
</html>