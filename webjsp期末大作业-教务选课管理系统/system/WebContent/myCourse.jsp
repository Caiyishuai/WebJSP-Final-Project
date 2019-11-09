<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,java.text.*,com.xx17.cys.entity.*" 
    import="java.sql.*,org.apache.commons.dbcp2.*" 
    import="javax.naming.*,javax.sql.*" pageEncoding="UTF-8"%>
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
	String sql = "select * from course where Tno="+"'"+user+"'";
	System.out.println("sql "+sql);
	ResultSet rs = stat.executeQuery(sql);
	List coursetlist = new ArrayList();
	Course course;
	rs.last();
	int rowCount=0;
	rowCount=rs.getRow();
	rs.first();
  	course = new Course(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
  	coursetlist.add(course);
	while(rs.next()){
		//System.out.println("rs"+rs);
	  	course = new Course(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
	  	coursetlist.add(course);
	}
	rs.last();
	rowCount=rs.getRow();
	rs.close();
	stat.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我开的课</title>
<script type="text/javascript" src="js/fanye.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="page">
<jsp:include page="menuTea.jsp?col=2" flush="true"/>
	<!--主要内容部分-->
	<div class="content" style="border:0px solid #000;float:none;display:block;height:100%">
			<div style="width:100% ;float:none;display:block; ">
				<table width="90%" border="1" class="t1" id="mytable">
					<tr><th>课程号</th><th>课程名</th><th>教师工号</th><th>开课时间</th>
					<th>考试时间</th><th>学分</th><th>开课学院</th></tr>
					<%
						Course cou;
						for(int i=0;i<coursetlist.size();i++)
						{
							cou = (Course)coursetlist.get(i);
					%>
					<tr <%=(i%2==0)? "class='a1'":"" %>>
					<td><%=cou.getCno()%></td>
					<td><%=cou.getCname()%></td>
					<td><%=cou.getTno()%></td>
					<td><%=cou.getTime()%></td>
					<td><%=cou.getTestTime()%></td>
					<td><%=cou.getCredit()%></td>
					<td><%=cou.getCollege()%></td>
					<%
						}
					%>
					<tr><td colspan="8">共有<%=rowCount %>门课</td></tr>
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
    goPage(1,12);
};
</script>