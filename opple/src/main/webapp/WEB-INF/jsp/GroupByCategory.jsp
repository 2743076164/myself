<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="${pageContext.request.contextPath}/admin/js/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
</head>
<body>
	<div id="main" style="width: 600px; height: 400px;"></div>
	
	<div Id="bing" style="wIdth: 600px; height: 400px;"></div>
	
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'));
		
		var bingchart = echarts.init(document.getElementById('bing'));
		
		setInterval(function() {
			$.get('http://localhost:8080/opple/rest/product/numByCategory',
					function(data) {
						console.log(data.data);
						var category = new Array();
						var num = new Array();
						for (var i = 0; i < data.data.length; i++) {
							category.push(data.data[i].category);
							num.push(data.data[i].num);
						}
						myChart.hideLoading();
						myChart.setOption({
							title : {
								text : '产品类别与数量关系图'
							},
							tooltip : {},

							legend : {
								data : [ {
									name : '数量',
									// 强制设置图形为圆。
									icon : 'bar',
									// 设置文本为红色
									textStyle : {
										color : 'green'
									}
								} ]
							},


							xAxis : {
								type: 'category',
								data : category
							},
							yAxis : {
								type: 'value'
							},
							series : [ {
								name : '数量',
								type : 'line',
								data : num
							} ]

						})

					}, 'json');
		}, 10000);
		
		
		setInterval(function() {
			$.get('http://localhost:8080/opple/rest/cart/numberByProductId',
					function(data) {
						console.log(data.data);
						var productId = new Array();
						var number = new Array();
						for (var i = 0; i < data.data.length; i++) {
							productId.push(data.data[i].productId);
							number.push(data.data[i].number);
						}
						bingchart.hideLoading();
						bingchart.setOption({
							title : {
								text : '产品ID(唯一)与销量关系图'
							},
							tooltip : {},

							legend : {
								data : [ {
									name : '销量',
									// 强制设置图形为圆。
									icon : 'bar',
									// 设置文本为红色
									textStyle : {
										color : 'blue'
									}
								} ]
							},


							xAxis : {
								type: 'category',
								data : productId
								//data : category
							},
							yAxis : {
								type: 'value'
							},
							series : [ {
								name : '销量',
								type : 'bar',
								data : number
							} ]

						})

					}, 'json');
		}, 10000);
		
	</script>
</body>
<html>