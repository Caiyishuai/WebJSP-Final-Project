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
	String sql = "select * from course";
	//弄个对象来接它，结果集
	ResultSet rs = stat.executeQuery(sql);
	
	//rs.last();//先到最后一行
	//out.println("共有"+rs.getRow()+"人");//看看行号输出
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理选课课程</title>
</head>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<body>
<!-- 从数据库中调取所有的课程信息 -->
<table width="1000" border="1" class="middle">
	<tr><th>课程号</th><th>课程名</th><th>任课教师工号</th><th>上课时间</th>
	<th>考试时间</th><th>学分</th><th>开课学院</th></tr>
	<%
		while(rs.next())
		{
	%>
	<tr><td><%=rs.getString(1)%></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td><td><%=rs.getString(6) %></td>
	<td><%=rs.getString(7) %></td></tr>
	<%
		}
	rs.last();
	%>
	<tr><td colspan="7">共有<%=rs.getRow() %> 门课</td></tr>
</table>


</body>
</html>