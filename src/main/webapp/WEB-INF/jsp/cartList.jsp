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
	订单列表
	<table width="100%" border=1>
		<tr align="center">
			<td>订单编号</td>
			<td>产品编号</td>
			<td>用户编号</td>
			<td>数量</td>
			<td>状态</td>
			<td>下单日期</td>
			
			
			
		</tr>
		<c:forEach items="${cartList}" var="cart">
			<tr align="center">
				<td scope="row">${cart.id}</td>
				<td>${cart.productId}</td>
				<td>${cart.userId}</td>
				<td>${cart.number}</td>
				<td>${cart.status}</td>
				<td><fmt:formatDate value="${cart.cartTime }"
						pattern="yyyy-MM-dd" /></td>
				

				
				
			</tr>
		</c:forEach>
	</table>

</body>
</html>