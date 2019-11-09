<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,java.text.*" 
    import="java.sql.*" pageEncoding="UTF-8"%>
<%
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
	String sql = "select * from teacher ";
	//弄个对象来接它，结果集
	ResultSet rs = stat.executeQuery(sql);
	
	//rs.last();//先到最后一行
	//out.println("共有"+rs.getRow()+"人");//看看行号输出
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生选课情况</title>
<script type="text/javascript" src="js/fanye.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="page">
<jsp:include page="menu.jsp?col=6" flush="true"/>
	<!--主要内容部分-->
	<div class="content" style="border:0px solid #000;float:none;display:block;height:100%">
			<div style="width:100% ;float:none;display:block; ">
				<table width="90%" border="1" class="t1" id="mytable">
					<tr><th>工号</th><th>姓名</th><th>性别</th><th>学院</th>
					<%
						int i=1;
						while(rs.next())
						{
					%>
					<tr <%=(i==1)? "class='a1'":"" %>><td><%=rs.getString(1)%></td><td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td>
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
</body>
</html>
<script type="text/javascript" language="javascript"> 
window.onload = function(){ 
    goPage(1,15);
};
</script>