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
	产品列表
	<table width="100%" border=1>
		<tr align="center">
			<td>产品编号</td>
			<td>产品名称</td>
			<td>类别</td>
			<td>价格</td>
			<td>图片</td>
			<td>条形码</td>
			<td>二维码</td>
			<td>产品详情</td>
			<td>生产日期</td>
			
			
			
		</tr>
		<c:forEach items="${productList}" var="product">
			<tr align="center">
				<td scope="row">${product.id}</td>
				<td>${product.productname}</td>
				<td>${product.category}</td>
				<td>${product.price}</td>
				<td><img src="${pageContext.request.contextPath }/DisplayImage?src=${product.image}" alt="" width="90" height="70" id='preview'/></td>	
				<td>${product.barcode}</td>
				<td>${product.qrcode}</td>
				<td>${product.description}</td>
				<td><fmt:formatDate value="${product.protime }"
						pattern="yyyy-MM-dd" /></td>
						

				
				
			</tr>
		</c:forEach>
	</table>

</body>
</html>