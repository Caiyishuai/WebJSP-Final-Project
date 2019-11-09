<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,java.text.*,com.xx17.cys.entity.*" 
    import="java.sql.*,org.apache.commons.dbcp2.*" 
    import="javax.naming.*,javax.sql.*" pageEncoding="UTF-8"%>
<%

	String user =(String)session.getAttribute("username");
	session.setAttribute("username", user);
	//System.out.println("user "+user);
	List studentlist = new ArrayList();
	Student student;
	Context initContext = new InitialContext();
	Context envContext = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/system");
	Connection conn = ds.getConnection();
	int rowCount=0;
	if(conn != null){  
	    //out.print("数据库连接成功！");
	    Statement stmt = conn.createStatement();
		//创建结果集合，集合与表的结构类似
		String sql = "select * from student where Sno=" + "'"+user+"'";
		//System.out.println("sql "+sql);
		ResultSet rs = stmt.executeQuery(sql);
		rs.last();
		rowCount=rs.getRow();
		System.out.println("rowCount "+rowCount);
		rs.first();
	  	student = new Student(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),"mima");
	  	studentlist.add(student);
		while(rs.next()){
			//System.out.println("rs"+rs);
		  	student = new Student(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),"mima");
		  	studentlist.add(student);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人信息</title>
<script type="text/javascript" src="js/fanye.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="page">
<jsp:include page="menuStu.jsp?col=1" flush="true"/>
	<!--主要内容部分-->
	<div class="content" style="border:0px solid #000;float:none;display:block;height:100%">
				<div style="width:100% ;float:none;display:block; ">
				<table width=90% border="1" class="t1" id="mytable">
				<tr><th>学号</th><th>姓名</th><th>性别</th><th>专业</th>
				<th>年级</th><th>生日</th><th>联系电话</th><th>操作</th></tr>
				<%
					Student stu;
					for(int i=0;i<studentlist.size();i++)
					{
						stu = (Student)studentlist.get(i);
				%>
				<tr <%=(i%2==0)? "class='a1'":"" %>>
				<td><%=stu.getSno()%></td>
				<td><%=stu.getSname()%></td>
				<td><%=stu.getSgender()%></td>
				<td><%=stu.getSdept()%></td>
				<td><%=stu.getSgrade()%></td>
				<td><%=stu.getSbirth()%></td>
				<td><%=stu.getSphone()%></td>
				<td>
				<a href="change_student.do?action=mod&nid=<%=stu.getSno()%>">
					<img src="images/mod.png" width=30 >
				</a>		
				</td>
				</tr>
				<%
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
    goPage(1,15);
};
</script>