<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/angular.min.js"></script>

</head>
<body>

	<div ng-app="user" ng-controller="insert">
	<form id="insertUseradd">
		<table width="100%" border=1>
			<tr>
				<td>用户名称</td>
				<td><input type="text" name="username" size="60" placeholder="用户名称" ng-model="username" /></td>
			</tr>
			<tr>
				<td>用户密码</td>
				<td><input type="text" name="password" size="60" ng-model="password" /></td>
			</tr>
			<tr>
				<td>用户身份</td>
				<td><select name="role" ng-model="role" style="width: 100%;">
						<option selected="selected">普通用户</option>
						<option>送货员</option>
						<option>安装员</option>
						<option>维修员</option>
				</select></td>
			</tr>
			<tr>
				<td>注册日期</td>
				<td><input type="date" name="registertime" size="60" ng-model="registertime" /></td>
			</tr>
			<tr>
				<td>卡号</td>
				<td><input type="text" name="cardid" size="60" ng-model="cardid" /></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" name="address" size="60" ng-model="address" /></td>
			</tr>
			<tr>
				<td>手机号</td>
				<td><input type="text" name="telephone" size="60" ng-model="telephone" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="提交" ng-click="insertUser()" /><input type="submit" value="提交" ng-click="userByName2()" />
				</td>
			
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		var app=angular.module("user",[]);	
		app.controller("insert",function($scope,$http){
		    $scope.insertUser = function(){
		        console.log("进入注册用户事件：  " +$scope.username );    
		        var jsonObj={				            
			            "username": $scope.username,
			            "password": $scope.password,
			            "role": $scope.role,
			            "registertime": $scope.registertime,
			            "cardid": $scope.cardid,
			            "address": $scope.address,
			            "telephone": $scope.telephone
		               }
		        var JSONstr1 = JSON.stringify(jsonObj);
		        console.log("注册用户 ，生成JSONstr1：  " + JSONstr1);    		            
		        $http({
		        	method:'post',
		        	url:'http://localhost:8080/opple/rest/users',data:JSONstr1})
		        .then(function successCallback(response) {
		        	console.log(response);//打印从后台接收的数据
		        	if(response.data.code==201){
		        		alert('用户注册成功');
		        	}else {
		        		alert('用户注册失败！！！！');
		        	}
                 },function errorCallback(response) {
                     // 请求失败执行代码
                 })
		    };   
		    
		    $scope.userByName2=function(){
				console.log("进入根据id查询用户事件内"+$scope.username );    
		        var jsonObj={				            
		        		"username": $scope.username,
			            "password": $scope.password,
			            "role": $scope.role,
			            "registertime": $scope.registertime,
			            "cardid": $scope.cardid,
			            "address": $scope.address,
			            "telephone": $scope.telephone
		               }
		        var JSONstr1 = JSON.stringify(jsonObj);
		        console.log("注册用户 ，生成JSONstr1：  " + JSONstr1);    		           
		        $http({
		        	method:'post',
		        	url:'http://localhost:8080/opple/rest/users',data:JSONstr1})
		        	.success(function(response){
 					console.log(response);//打印从后台接收的数据
 					if(response.code==201){
		        		alert('用户注册成功');
		        	}else {
		        		alert('用户注册失败！！！！');
		        	}
	                 },function errorCallback(response) {
	                     // 请求失败执行代码
	                 })
			    };   
			});
		</script> 
	
	
</div>

</body>




<script>
	function change() {
		var pic = document.getElementById("preview"), file = document
				.getElementById("file");
		var ext = file.value.substring(file.value.lastIndexOf(".") + 1)
				.toLowerCase();
		// gif在IE浏览器暂时无法显示
		if (ext != 'png' && ext != 'jpg' && ext != 'jpeg') {
			alert("图片的格式必须为png或者jpg或者jpeg格式！");
			file.value = '';
			return;
		}
		var isIE = navigator.userAgent.match(/MSIE/) != null, isIE6 = navigator.userAgent
				.match(/MSIE 6.0/) != null;
		if (isIE) {
			file.select();
			var reallocalpath = document.selection.createRange().text;
			// IE6浏览器设置img的src为本地路径可以直接显示图片
			if (isIE6) {
				pic.src = reallocalpath;
			} else {
				// 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
				pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\""
						+ reallocalpath + "\")";
				// 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
				pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
			}
		} else {
			html5Reader(file);
		}
	}
	function html5Reader(file) {
		var file = file.files[0];
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e) {
			var pic = document.getElementById("preview");
			pic.src = this.result;
		}
	}
</script>



</html>
