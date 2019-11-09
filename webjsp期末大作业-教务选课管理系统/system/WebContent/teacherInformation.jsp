<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,java.text.*,com.xx17.cys.entity.*" 
    import="java.sql.*,org.apache.commons.dbcp2.*" 
    import="javax.naming.*,javax.sql.*" pageEncoding="UTF-8"%>
<%

	String user =(String)session.getAttribute("username");
	session.setAttribute("username", user);
	//System.out.println("user "+user);
	List TeacherList = new ArrayList();
	Teacher teacher;
	Context initContext = new InitialContext();
	Context envContext = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/system");
	Connection conn = ds.getConnection();
	int rowCount=0;
	if(conn != null){  
	    //out.print("数据库连接成功！");
	    Statement stmt = conn.createStatement();
		//创建结果集合，集合与表的结构类似
		String sql = "select * from teacher where Tno=" + "'"+user+"'";
		//System.out.println("sql "+sql);
		ResultSet rs = stmt.executeQuery(sql);
		rs.last();
		rowCount=rs.getRow();
		System.out.println("rowCount "+rowCount);
		rs.first();
		teacher = new Teacher(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),"mima");
	  	TeacherList.add(teacher);
		while(rs.next()){
			//System.out.println("rs"+rs);
		  	teacher = new Teacher(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),"mima");
		  	TeacherList.add(teacher);
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
<jsp:include page="menuTea.jsp?col=1" flush="true"/>
	<!--主要内容部分-->
	<div class="content" style="border:0px solid #000;float:none;display:block;height:100%">
				<div style="width:100% ;float:none;display:block; ">
				<table width=90% border="1" class="t1" id="mytable">
				<tr><th>工号</th><th>密码</th><th>姓名</th>
				<th>性别</th><th>学院</th>
				</tr>
				<%
					Teacher t;
					for(int i=0;i<TeacherList.size();i++)
					{
						t = (Teacher)TeacherList.get(i);
				%>
				<tr <%=(i%2==0)? "class='a1'":"" %>>
					<td><%=t.getTno()%></td>
					<td><%=t.getTno()%></td>
					<td><%=t.getTname()%></td>
					<td><%=t.getTg()%></td>
					<td><%=t.getTc()%></td>		
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