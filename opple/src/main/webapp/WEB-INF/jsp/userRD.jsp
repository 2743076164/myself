<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.disableA {
	pointer-events: none;
	cursor: default;
	color: gray;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/angular.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div ng-app="user" ng-controller="userController" ng-init="allUser()">
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
					<td>操作</td>
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
					
					<td><a href="" id="{{user.id}}"
						ng-click="updateUser($index,$event)" class="disableA">修改</a> <a
						href="" ng-click="deleteUser($event,$index)">删除</a></td>
				</tr>
			</tbody>
		</table>


		<script type="text/javascript">
			var app = angular.module("user", []);
			app.controller("userController",function($scope, $http) {
								$scope.allUser = function() {
									console.log("开始查询所有用户");
									$http({
												method : 'get',
												url : "http://localhost:8080/opple/rest/users"
											}).success(function(data) {
										console.log(data);//打印从后台接收的数据
										$scope.users = data.data;//将数据赋值给angular模型变量				
									});
								}

								$scope.edit = function(e, $index) {
									console.log("双击开始" + $index);
									var td = $(e.target);
									var txt = td.text();
									var input = $("<input type='text' value='" + txt + "' style='width:150px;height:26px;'/>");
									td.html(input);
									input.click(function() {
										return false;
									});
									//获取焦点
									input.trigger("focus");
									//文本框失去焦点后提交内容，重新变为文本
									input
											.blur(function() {
												var newtxt = $(this).val();
												//判断文本有没有修改
												if (newtxt != txt) {
													td.html(newtxt);
													var id = $scope.users[$index].id;
													$('#' + id).removeClass();
													alert('有用户信息被修改，请单击修改按钮确认！')
												} else {
													td.html(txt);
												}
											});
								};

								$scope.updateUser = function($index, e) {
									console.log("进入修改用户信息"
											+ $scope.users[$index].id);
									var tr = (e.target).parentNode.parentNode;
									var tds = tr.getElementsByTagName("td");
									var jsonObj = {
										"id" : tds[0].innerHTML,
										"username" : tds[1].innerHTML,
										"password" : tds[2].innerHTML,
										"role" : tds[3].innerHTML,
										"registertime" : tds[4].innerHTML,
										"cardid" : tds[5].innerHTML,
										"address" : tds[6].innerHTML,
										"telephone" : tds[7].innerHTML
									}
									var JSONstr1 = JSON.stringify(jsonObj);
									console.log("jsonObj:    " + JSONstr1);

									$http(
											{
												method : 'put',
												url : 'http://localhost:8080/opple/rest/user',
												data : JSONstr1,
												headers : {
													'Content-Type' : 'application/json'
												}
											}).then(
											function successCallback(response) {
												console.log(response);//打印从后台接收的数据
												alert('用户信息修改成功');
												$scope.allUser();
											},
											function errorCallback(response) {
												// 请求失败执行代码
												$scope.allUser();
											})
								};

								$scope.deleteUser = function(e, $index) {
									console.log("进入根据id查询用户事件内"
											+ $scope.users[$index].id);
									$http(
											{
												method : 'delete',
												url : "http://localhost:8080/opple/rest/user/id/"
														+ $scope.users[$index].id,
												headers : {
													'Content-Type' : 'application/json'
												}
											}).then(
											function successCallback(response) {
												console.log(response);//打印从后台接收的数据
												alert('用户删除成功');
												$scope.allUser();
											},
											function errorCallback(response) {
												// 请求失败执行代码
												$scope.allUser();
											})
								};

							});
		</script>


	</div>
</body>
</html>