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

	<div ng-app="product" ng-controller="insert">
	<form id="insertProduct">
		<table width="100%" border=1>
			<tr>
				<td>产品名称</td>
				<td><input type="text" name="productname" size="60" placeholder="产品名称" ng-model="productname" /></td>
			</tr>
			<tr>
				<td>产品类型</td>
				<td><select name="category" ng-model="category" style="width: 100%;">
						<option selected="selected">吊顶灯</option>
						<option>吸顶灯</option>
						<option>筒灯</option>
						<option>壁灯</option>
						<option>镜前灯</option>
				</select></td>
			</tr>
			<tr>
				<td>产品价格</td>
				<td><input type="text" name="price" size="60" ng-model="price" /></td>
			</tr>
			
			<tr>
				<td>上传图片</td>
				<td><input type="file" name="image" accept="images/jpeg"
					id='file' onchange='change()' ng-model="image" /></td>
			</tr>
			<tr>
				<td>图片预览</td>
				<td><img src="" alt="" width="200" height="200" id='preview' /></td>
			</tr>
			<tr>
				<td>条形码</td>
				<td><input type="text" name="barcode" size="60" ng-model="barcode" /></td>
			</tr>
			<tr>
				<td>二维码</td>
				<td><input type="text" name="qrcode" size="60" ng-model="qrcode" /></td>
			</tr>
			<tr>
				<td>产品详情</td>
				<td><textarea rows="10" cols="50" name="description" ng-model="description"> </textarea></td>
			</tr>
			<tr>
				<td>生产日期</td>
				<td><input type="date" name="protime"
					size="60" ng-model="protime" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="提交" ng-click="insertProduct()" /><input type="submit" value="提交" ng-click="productByName2()" />
				</td>
			
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		var app=angular.module("product",[]);	
		app.controller("insert",function($scope,$http){
		    $scope.insertProduct = function(){
		        console.log("进入增加产品事件：  " +$scope.productname );    
		        var jsonObj={				            
			            "productname": $scope.productname,
			            "category": $scope.category,
			            "price": $scope.price,
			            "image": $scope.image,
			            "barcode": $scope.barcode,				            
			            "description": $scope.description,
			            "protime": $scope.protime
		               }
		        var JSONstr1 = JSON.stringify(jsonObj);
		        console.log("增加产品 ，生成JSONstr1：  " + JSONstr1);    		            
		        $http({
		        	method:'post',
		        	url:'http://localhost:8080/opple/rest/product',data:JSONstr1})
		        .then(function successCallback(response) {
		        	console.log(response);//打印从后台接收的数据
		        	if(response.data.code==201){
		        		alert('产品增加成功');
		        	}else {
		        		alert('产品增加失败！！！！');
		        	}
                 },function errorCallback(response) {
                     // 请求失败执行代码
                 })
		    };   
		    
		    $scope.productByName2=function(){
				console.log("进入根据id查询产品事件内"+$scope.productname );    
		        var jsonObj={				            
			            "productname": $scope.productname,
			            "category": $scope.category,
			            "price": $scope.price,
			            "image": $scope.image,
			            "barcode": $scope.barcode,				            
			            "description": $scope.description,
			            "protime": $scope.protime
		               }
		        var JSONstr1 = JSON.stringify(jsonObj);
		        console.log("增加产品 ，生成JSONstr1：  " + JSONstr1);    		           
		        $http({
		        	method:'post',
		        	url:'http://localhost:8080/opple/rest/product',data:JSONstr1})
		        	.success(function(response){
 					console.log(response);//打印从后台接收的数据
 					if(response.code==201){
		        		alert('产品增加成功');
		        	}else {
		        		alert('产品增加失败！！！！');
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