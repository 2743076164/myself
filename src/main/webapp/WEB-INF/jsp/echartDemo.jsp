<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/admin/js/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div Id="main" style="wIdth: 400px; height: 200px;"></div>

	<div Id="bing" style="wIdth: 400px; height: 200px;"></div>

	<div Id="yibubingchart" style="wIdth: 400px; height: 200px;"></div>
	
	
	
	
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));

		var bingchart = echarts.init(document.getElementById('bing'));

		var yibubingchart = echarts.init(document.getElementById('yibubingchart'));
		
		
		
		

		// 指定图表的配置项和数据
		var option = {
			title : {
				text : '第一个 ECharts 实例'
			},
			tooltip : {},
			legend : {
				data : [ '销量' ]
			},
			xAxis : {
				data : [ "衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子" ]
			},
			yAxis : {},
			series : [ {
				name : '销量',
				type : 'bar',
				data : [ 5, 20, 36, 10, 10, 20 ]
			} ]
		};

		var bingoption = {
			series : [ {
				name : '访问来源',
				type : 'pie',
				radius : '55%',

				data : [ {
					value : 235,
					name : '视频广告'
				}, {
					value : 274,
					name : '联盟广告'
				}, {
					value : 310,
					name : '邮件营销'
				}, {
					value : 335,
					name : '直接访问'
				}, {
					value : 400,
					name : '搜索引擎'
				} ]
			} ]
		};
		
		
		setInterval(function () {
		$.get('http://localhost:8080/opple/rest/products', function(data) {
			console.log(data.data[0].price);
			var Id = new Array();
			var price = new Array();
			for (var i = 0; i < data.data.length; i++) {
				console.log(Id[0]);
				Id.push(data.data[i].id);
				price.push(data.data[i].price);
			}
			console.log(Id[0]);

			yibubingchart.hideLoading();
			yibubingchart.setOption({
				title : {
					text : '产品价格图'
				},
				tooltip : {},

				legend : {
					data : [ {
						name : '价格',
						// 强制设置图形为圆。
						icon : 'bar',
						// 设置文本为红色
						textStyle : {
							color : 'green'
						}
					} ]
				},

				xAxis : {
					type : 'category',
					data : Id
				},
				yAxis : {
					type : 'value'
				},
				series : [ {
					data : price,
					type : 'line'
				} ]

			})

		}, 'json'),10000});
		
		
		
		
			
		
		
		
		
		
		
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);

		bingchart.setOption(bingoption);
	</script>
</body>
<html>