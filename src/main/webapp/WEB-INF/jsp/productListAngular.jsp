<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.disableA{
	  pointer-events: none;
	  cursor: default;
	  color:gray;
	}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/angular.min.js"></script>
</head>
<body>	
	<div ng-app="myApp" ng-controller="myCtrl" ng-init="allProduct()" >
	<button ng-click="allProduct()">查询所有产品</button><br/>
	<input type="text" ng-model="id" />    <button ng-click="productById()">id查询</button><br/>
	<input type="text" ng-model="productname" />    <button ng-click="productByName()">产品名查询</button>
		<table border="1" id='tabletest'>
			<thead>
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
			</thead>
			<tbody>
				<tr ng-repeat="product in products">
					<td>{{product.id}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="product.productname">{{product.productname}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="product.category">{{product.category}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="product.price">{{product.price}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="product.image">{{product.image}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="product.barcode">{{product.barcode}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="product.qrcode">{{product.qrcode}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="product.description">{{product.description}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="product.productname">{{product.protime|date:'yyyy-MM-dd'}}</td>
					
				</tr>
			</tbody>
		</table>
		
		<script type="text/javascript">
		var app=angular.module("myApp",[]);
		app.controller("myCtrl", function($scope,$http){
			
			$scope.allProduct=function(){
				console.log("开始查询所有产品");
				$http({method:'get',url:"http://localhost:8080/opple/rest/products"})
				.success(function(data){
					console.log(data);//打印从后台接收的数据
					$scope.products=data.data;//将数据赋值给angular模型变量
				});			
			}
			
			$scope.productById=function(){
				console.log("进入根据id查询产品事件内"+$scope.id );
				$http({method:'get',url:"http://localhost:8080/opple/rest/product/id/" + $scope.id})
				.success(function(data){
					console.log(data);//打印从后台接收的数据
					$scope.products=data.data;//将数据赋值给angular模型变量
				});			
			}
			
			
			$scope.productByName=function(){
				console.log("进入根据产品名查询产品事件内"+$scope.productname );
				$http({method:'get',url:"http://localhost:8080/opple/rest/product?productname=" + $scope.productname})
				.success(function(data){
					console.log(data);//打印从后台接收的数据
					$scope.products=data.data;//将数据赋值给angular模型变量
				});			
			}	
			
		});		
		
		
		
		
		</script>	
		
		
		
		
		
			
	</div>
</body>
</html>