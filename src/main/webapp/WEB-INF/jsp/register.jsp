<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css" />
<body>

<div class="register-container">
	<h1>注册</h1>
	
	<form action="userRegister" method="post" id="">
		<div>
			<input class="a" type="text" name="username" class="username" placeholder="您的用户名" autocomplete="off"/>
		</div>
		<div>
			<input class="a" type="password" name="password" class="password" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input class="a" type="password" name="password2" class="password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input class="b" type="radio" name="role" value="普通用户"><label>普通用户</label>
		
			
		</div>
		<div>
			<input class="a" type="text" name="cardid" class="cardid" placeholder="输入银行卡号"  />
		</div>
		<div>
			<input class="a" type="text" name="address" class="address" placeholder="送货地址"  />
		</div>
		<div>
			<input class="a" type="text" name="telephone" class="telephone" placeholder="手机号"  />
		</div>
		

		<input class="a" id="submit" type="submit" value="注 册" >
	</form>
	<a href="login">
		<input class="a" class="register-tis" type="submit" value="已经有账号？" >
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