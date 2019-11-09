<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>echarts测试</title>
<!-- 1.引入 echarts.js -->
<script type="text/javascript" src="js/echarts.js"></script>
<!-- 引入jquery.js -->
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
</head>
<body style="margin: 5% 26% 0% 29%;">
	<div style="text-align: center;">
		<h2>欢迎访问jsp+servlet+echarts动态网页</h2>
		<h3>作者：蔡怡帅</h3>
		<h3>时间：2018/7/13</h3>
	</div>
	<!-- 2.为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 1200px; height: 400px; margin:0 0 0 0;"></div>

	
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'));

		//3.初始化，默认显示标题，图例和xy空坐标轴
		myChart.setOption({

			title : {
				text : '按学院统计选课人数'
			},
			tooltip : {},

			legend : {

				data : [ '人数' ]
			},
			xAxis : {
				data : []
			},
			yAxis : {},
			series : [ {
				name : '人数',
				type : 'bar',
				data : []
			} ]
		});

		//4.设置加载动画(非必须)
		myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

		//5.定义数据存放数组(动态变)
		var names = []; //建立一个类别数组（实际用来盛放X轴坐标值）
		var nums = []; //建立一个销量数组（实际用来盛放Y坐标值）

		//6.ajax发起数据请求
		$.ajax({
			type : "post",
			async : true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
			url : "TestServlet", //请求发送到TestServlet
			data : {},
			dataType : "json", //返回数据形式为json

			//7.请求成功后接收数据name+num两组数据
			success : function(result) {
				//result为服务器返回的json对象
				if (result) {
					//8.取出数据存入数组
					for (var i = 0; i < result.length; i++) {
						names.push(result[i].name); //迭代取出类别数据并填入类别数组
					}
					for (var i = 0; i < result.length; i++) {
						nums.push(result[i].num); //迭代取出销量并填入销量数组
					}

					myChart.hideLoading(); //隐藏加载动画

					//9.覆盖操作-根据数据加载数据图表
					myChart.setOption({
						xAxis : {
							data : names,
						    axisLabel:{  
						    interval:0,//横轴信息全部显示  
						    }

						},
						series : [ {
							// 根据名字对应到相应的数据
							name : '人数',
							data : nums,
			                itemStyle: {
			                    normal: {
			　　　　　　　　　　　　　　//好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，
			                        color: function(params) {
			                            // build a color map as your need.
			                            var colorList = [
			                              '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
			                               '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
			                               '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
			                            ];
			                            return colorList[params.dataIndex]
			                        },			　　
			                    }
			                },
						} ]
					});

				}

			},
			error : function(errorMsg) {
				//请求失败时执行该函数
				alert("图表请求数据失败!");
				myChart.hideLoading();
			}
		})
	</script>
</body>
</html>
