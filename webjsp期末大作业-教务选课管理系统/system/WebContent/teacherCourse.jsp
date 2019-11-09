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
	int rowCount=0;
	if(conn != null){  
	    //out.print("数据库连接成功！");
	    Statement stmt = conn.createStatement();
		//创建结果集合，集合与表的结构类似
		ResultSet rs = stmt.executeQuery("select * from v_choose_course");
		rs.last();
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
		stmt.close();
		conn.close();
	}	
	//int ok =(int)request.getAttribute("is_success");
	int who=0;
	if(user.equals("蔡军帅")){
		who=1;
	}else if(user.length()==3){
		who=2;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程信息</title>
<script type="text/javascript" src="js/fanye.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
</head>
<body>
<div class="page">
<jsp:include page="menuTea.jsp?col=3" flush="true"/>
	<!--主要内容部分-->
	<div class="content" style="border:0px solid #000;float:none;display:block;height:100%">
				<div style="width:100% ;float:none;display:block; ">
				<table width=90% border="1" class="t1" id="mytable">
				<tr><th>课程号</th><th>课程名</th><th>授课教师工号</th><th>上课时间</th>
				<th>考试时间</th><th>学分</th><th>开课学院</th></tr>
				<%
					Course cou;
					for(int i=0;i<coursetlist.size();i++)
					{
						cou = (Course)coursetlist.get(i);
				%>
				<tr <%=(i%2==0)? "class='a1'":"" %>>
				<td><%=cou.getCno()%></td>
				<td><a href="Choose.do?action=find&Cno=<%=cou.getCno()%>&who=<%=who %>"><%=cou.getCname()%></a></td>
				<td><%=cou.getTno()%></td>
				<td><%=cou.getTime()%></td>
				<td><%=cou.getTestTime()%></td>
				<td><%=cou.getCredit()%></td>
				<td><%=cou.getCollege()%></td>
				</tr>
				<%
					}
				%>
					<tr><td colspan="8">共有<%=rowCount %> 门课</td></tr>
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
<script>
// 发送成功的提示框（置顶）

</script>