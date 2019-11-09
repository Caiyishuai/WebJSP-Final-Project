<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,java.text.*" 
    import="java.sql.*" pageEncoding="UTF-8"%>
<%
	String user =(String)session.getAttribute("username");
	//数据库连接实例
	String driverName = "com.mysql.jdbc.Driver";
	Class.forName(driverName).newInstance();
	//Class c = new Class(driverName);
	
	String url="jdbc:mysql://localhost:3306/courseselectsystem?user=root&password=caiyishuai";
	url += "&useUnicode=true&characterEncoding=utf8";
	//建立数据库连接
	Connection conn = DriverManager.getConnection(url);	
	System.out.println(conn);//能输出就连接成功了
	//建立语句执行环境
	Statement stat = conn.createStatement(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>历年成绩</title>
</head>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<body>
<%=user %>
<% if(user.equals("蔡军帅")){
			out.println("您好，管理员！");
			String sql = "select Sname,Cname,Score from v_grade ";
			//弄个对象来接它，结果集
			ResultSet rs = stat.executeQuery(sql);
	%>
		<table width="1000" border="1" class="middle">
			<tr><th>姓名</th><th>课程名</th><th>成绩</th>
			<%
				while(rs.next())
				{
			%>
			<tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td></tr>
			<%
				}
			%>
		</table>
<%
	   }

%>
</body>
</html>