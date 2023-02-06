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
	<div ng-app="myApp" ng-controller="myCtrl" ng-init="allUser()" >
	<button ng-click="allUser()">查询所有用户</button><br/>
	<input type="text" ng-model="id" />    <button ng-click="userById()">id查询</button><br/>
	<input type="text" ng-model="username" />    <button ng-click="userByName()">用户名查询</button>
		<table border="1" id='tabletest'>
			<thead>
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
			</thead>
			<tbody>
					<tr ng-repeat="user in users">
					<td>{{user.id}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="user.username">{{user.username}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="user.password">{{user.password}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="user.role">{{user.role}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="user.registertime">{{user.registertime|date:'yyyy-MM-dd'}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="user.cardid">{{user.cardid}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="user.address">{{user.address}}</td>
					<td ng-dblclick="edit($event,$index)" ng-model="user.telephone">{{user.telephone}}</td>
				</tr>
			</tbody>
		</table>
		
		<script type="text/javascript">
		var app=angular.module("myApp",[]);
		app.controller("myCtrl", function($scope,$http){
			
			$scope.allUser=function(){
				console.log("开始查询所有用户");
				$http({method:'get',url:"http://localhost:8080/opple/rest/users"})
				.success(function(data){
					console.log(data);//打印从后台接收的数据
					$scope.users=data.data;//将数据赋值给angular模型变量
				});			
			}
			
			$scope.userById=function(){
				console.log("进入根据id查询用户事件内"+$scope.id );
				$http({method:'get',url:"http://localhost:8080/opple/rest/user/id/" + $scope.id})
				.success(function(data){
					console.log(data);//打印从后台接收的数据
					$scope.users=data.data;//将数据赋值给angular模型变量
				});			
			}
			
			
			$scope.userByName=function(){
				console.log("进入根据用户名查询用户事件内"+$scope.username );
				$http({method:'get',url:"http://localhost:8080/opple/rest/user?username=" + $scope.username})
				.success(function(data){
					console.log(data);//打印从后台接收的数据
					$scope.users=data.data;//将数据赋值给angular模型变量
				});			
			}	
			
		});		
		
		
		
		
		</script>	
		
		
		
		
		
			
	</div>
</body>
</html>