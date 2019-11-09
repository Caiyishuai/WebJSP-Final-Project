<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,java.text.*" 
    import="java.sql.*" pageEncoding="UTF-8"%>
<%
	String user =(String)session.getAttribute("username");
	session.setAttribute("username", user);
	//数据库连接实例
	String driverName = "com.mysql.jdbc.Driver";
	Class.forName(driverName).newInstance();
	//Class c = new Class(driverName);
	
	String url="jdbc:mysql://localhost:3306/courseselectsystem?user=root&password=caiyishuai";
	url += "&useUnicode=true&characterEncoding=utf8";
	//建立数据库连接
	Connection conn = DriverManager.getConnection(url);	
	//out.println(conn);//能输出就连接成功了
	//建立语句执行环境
	Statement stat = conn.createStatement(); 
	//执行sql语句
	String sql = "select Cno,Cname,COUNT(*) from v_selected_stu_tea_cou where Tno='"+user+"' group by Cno";
	System.out.println("界面sql "+sql);
	//弄个对象来接它，结果集
	ResultSet rs = stat.executeQuery(sql);
	
	//rs.last();//先到最后一行
	//out.println("共有"+rs.getRow()+"人");//看看行号输出
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>选课情况统计</title>
<script type="text/javascript" src="js/fanye.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<!-- 1.引入 echarts.js -->
<script type="text/javascript" src="js/echarts.js"></script>
<!-- 引入jquery.js -->
<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
</head>
<body>
<div class="page">
<jsp:include page="menuTea.jsp?col=4" flush="true"/>
	<!--主要内容部分-->
	<div class="content" style="border:0px solid #000;float:none;display:block;height:100%">		
		<jsp:include page="teacherStatistic_head.jsp" flush="true"/>
			<div style="width:100% ;float:none;display:block; ">
			
				<div id="xuehao"><%=user %></div>
				<div style="width:100% ;float:none;display:block; ">
					<!-- 2.为ECharts准备一个具备大小（宽高）的Dom -->
					<div id="main" style="width: 1100px; height: 280px; margin:0 0 0 0;"></div>
				</div>
			
				<table width="90%" border="1" class="t1" id="mytable">
					<tr><th>课程号</th><th>课程名</th><th>选课人数</th></tr>
					<%
						int i=1;
						while(rs.next())
						{
					%>
					<tr <%=(i==1)? "class='a1'":"" %>><td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					</tr>
					<%
						i=1-i;
						}
					%>
				</table>
			</div>
		
			 <div style="margin:10px auto;border:0px solid #f00;float:none;width:100%;display:block;height:20px;">
			    <table width="60%" align="right">
	        	<tr>
	        	<td><div id="barcon" name="barcon3"></div></td>
	        	</tr>
	    		</table>
	    	</div>
	    </div>
				
</div>
<%@ include file="foot.jsp" %>
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'));
		var user = document.getElementById('xuehao').innerHTML;
		//alert(user);
		//3.初始化，默认显示标题，图例和xy空坐标轴
		myChart.setOption({
			   title : {
			        text: '按学院统计选课门数',
			        //subtext: '纯属虚构',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
		        legend: {
		            orient : 'vertical',
		            x : 'left',
		            data:[]
		        },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {
			                show: true, 
			                type: ['pie', 'funnel'],
			                option: {
			                    funnel: {
			                        x: '25%',
			                        width: '50%',
			                        funnelAlign: 'left',
			                        max: 1548
			                    }
			                }
			            },
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    series : [
			        {
			            name:'选课门数',
			            type:'pie',
			            radius : '65%',
			            center: ['50%', '60%'],
			            data:[]
			        }
			    ]
		});

		//4.设置加载动画(非必须)
		myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

		//5.定义数据存放数组(动态变)
		var statisticsData = [];   //这是我自己建的空数组，为了把异步拿到的数据push进去
		var statisticsName = [];
		//6.ajax发起数据请求
		$.ajax({
			type : "post",
			async : true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
			url : "teaCouEcharts", //请求发送到TestServlet
			data : {'user':user},
			dataType : "json", //返回数据形式为json

			//7.请求成功后接收数据name+num两组数据
			success : function(result) {
				//result为服务器返回的json对象
				if (result) {
					//8.取出数据存入数组
					for (var i = 0; i < result.length; i++) {
		                var statisticsObj = {name:'',value:''};   //因为ECharts里边需要的的数据格式是这样的
		                statisticsObj.name = result[i].name;
		                statisticsName.push(result[i].name);
		                statisticsObj.value = result[i].num;
		                statisticsData.push(statisticsObj);   //把拿到的异步数据push进我自己建的数组里
					}

					myChart.hideLoading(); //隐藏加载动画

					//9.覆盖操作-根据数据加载数据图表
					myChart.setOption({
		                legend: {
		                	show: true,
		                    x: '10%',
		                    data: statisticsName //这里是图表上的数据 				
		                },
		                series: [{
		                    name: '选课门数',
		                    type: 'pie',
		                    radius : '70%',
		                    center: ['50%', '60%'],
		                    data: statisticsData,    //这里是异步加载系列列表
		                    
			                itemStyle: {
			                    normal: {
			                        color: function(params) {
			                            // build a color map as your need.
			                            var colorList = [
			                              '#FF0000','#FF7D00','#FFFF00','#00FF00','#00FFFF',
			                               '#0000FF','#FF00FF','#FAD860','#F3A43B','#60C0DD',
			                               '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
			                            ];
			                            return colorList[params.dataIndex];
			                        },			　　
			                    }
			                },
		                    
		                    
		                }]
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
<script type="text/javascript" language="javascript"> 
window.onload = function(){ 
    goPage(1,5);
};
</script>
</body>
</html>