<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div ng-app="product" ng-controller="productController" ng-init="allProduct()">
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
					<td>操作</td>
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
					<td ng-dblclick="edit($event,$index)" ng-model="product.protime">{{product.protime|date:'yyyy-MM-dd'}}</td>
					<td><a href="" id="{{product.id}}" ng-click="updateProduct($index,$event)" class="disableA">修改</a>     
					<a href="" ng-click="deleteProduct($event,$index)">删除</a></td>
				</tr>
			</tbody>
		</table>
		
		
		<script type="text/javascript">
		var app= angular.module("product",[]);
		app.controller("productController", function($scope,$http){
			$scope.allProduct=function(){
				console.log("开始查询所有产品");				
				$http({method:'get',url:"http://localhost:8080/opple/rest/products"})
				.success(function(data){
					console.log(data);//打印从后台接收的数据
					$scope.products=data.data;//将数据赋值给angular模型变量				
					});
			}
		
		
		
		$scope.edit=function(e,$index){
			console.log("双击开始" + $index);
	    	  var td = $(e.target);
	    	  var txt = td.text();
	    	  var input = $("<input type='text' value='" + txt + "' style='width:150px;height:26px;'/>");
	    	  td.html(input);
	    	  input.click(function() { return false; });
	    	  //获取焦点
	    	  input.trigger("focus");
	    	  //文本框失去焦点后提交内容，重新变为文本
	    	  input.blur(function() {
	    	    var newtxt = $(this).val();
	    	     //判断文本有没有修改
	    	    if (newtxt != txt) {
	    	      td.html(newtxt);
	    	      var id=$scope.products[$index].id;
	    	      $('#'+id).removeClass();
	    	      alert('有产品信息被修改，请单击修改按钮确认！')
	    	    }
	    	    else
	    	    {
	    	      td.html(txt);
	    	    }
	    	  });
	    	};
	    	
	    	
	    	
	    	$scope.updateProduct = function($index,e){
				console.log("进入修改产品信息"+$scope.products[$index].id); 
				    	var tr=(e.target).parentNode.parentNode;
				    	var tds=tr.getElementsByTagName("td");
				        var jsonObj = {				                
				                "id": tds[0].innerHTML,
				                "productname": tds[1].innerHTML,
				                "category": tds[2].innerHTML,
				                "price": tds[3].innerHTML,
				                "image": tds[4].innerHTML,
				                "barcode": tds[5].innerHTML,
				                "qrcode": tds[6].innerHTML,
				                "description": tds[7].innerHTML,
				                "protime": tds[8].innerHTML				                
				            }
				        var JSONstr1 = JSON.stringify(jsonObj);
				        console.log("jsonObj:    "+ JSONstr1);
				        
				        $http({method:'put',url:'http://localhost:8080/opple/rest/product',data:JSONstr1,
				        	headers:{'Content-Type': 'application/json'}})
				        .then(function successCallback(response) {
				        	console.log(response);//打印从后台接收的数据
				        	alert('产品修改成功');
				        	$scope.allProduct();
		                 },function errorCallback(response) {
		                     // 请求失败执行代码
		                	 $scope.allProduct();
		                 })
				    };
				    
				    
				    $scope.deleteProduct=function(e,$index){				
						console.log("进入根据id查询产品事件内"+$scope.products[$index].id );
								$http({method:'delete',url:"http://localhost:8080/opple/rest/product/" + $scope.products[$index].id,headers:{'Content-Type': 'application/json'}})
								.then(function successCallback(response) {
						        	console.log(response);//打印从后台接收的数据
						        	alert('产品删除成功');
						        	$scope.allProduct();
				                 },function errorCallback(response) {
				                     // 请求失败执行代码
				                	 $scope.allProduct();
				                 })	
							};
	    	
	    	
		});
		</script>
		
		
	</div>
</body>
</html>