<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
用户列表
	<table width="100%" border=1>
		<tr align="center">
			<td>用户编号</td>
			<td>用户名称</td>
			<td>密码</td>
			<td>身份</td>
			<td>注册日期</td>
			<td>卡号</td>
			<td>地址</td>
			<td>手机号</td>
			
			
			
		</tr>
		<c:forEach items="${userList}" var="user">
			<tr align="center">
				<th scope="row">${user.id}</th>
				<th>${user.username}</th>
				<th>${user.password}</th>
				<th>${user.role}</th>
				<td><fmt:formatDate value="${user.registertime }"
						pattern="yyyy-MM-dd" /></td>
						<th>${user.cardid}</th>
						<th>${user.address}</th>
						<th>${user.telephone}</th>
						

			
				
			</tr>
		</c:forEach>
	</table>
</body>
</html>