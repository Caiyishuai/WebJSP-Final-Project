<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,java.text.*,com.xx17.cys.entity.*" 
    import="java.sql.*,org.apache.commons.dbcp2.*" 
    import="javax.naming.*,javax.sql.*" pageEncoding="UTF-8"%>
<%
	String user =(String)session.getAttribute("username");
	session.setAttribute("username", user);
	List coursetlist = new ArrayList();
	Course course;
	Context initContext = new InitialContext();
	Context envContext = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/system");
	Connection conn = ds.getConnection(); 
	//out.print("数据库连接成功！");
    Statement stmt = conn.createStatement();
	//创建结果集合，集合与表的结构类似
	ResultSet rs = stmt.executeQuery("select * from v_selected_admin where Sno="+"'"+user+"'");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>选课情况</title>
<script type="text/javascript" src="js/fanye.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="page">
<jsp:include page="menuStu.jsp?col=4" flush="true"/>
	<!--主要内容部分-->
	<div class="content" style="border:0px solid #000;float:none;display:block;height:100%">
			<jsp:include page="mySelected_head.jsp" flush="true"/>					
				
				<div style="width:100% ;float:none;display:block; ">
				<table width=90% border="1" class="t1" id="mytable">
					<tr><th>学号</th><th>姓名</th><th>课程号</th><th>课程名</th><th>删除</th></tr>
					<%
						int i=1;
						while(rs.next())
						{
					%>
					<tr <%=(i==1)? "class='a1'":"" %>><td><%=rs.getString(1)%></td><td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td>
					<td>
						<a href="Choose.do?action=del&Sno=<%=user %>&Cno=<%=rs.getString(3)%>">
							<img src="images/del.png" width=30>
						</a>
					</td>
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
        	<td><div id="barcon" name="barcon"></div></td>
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
    goPage(1,10);
};
</script>