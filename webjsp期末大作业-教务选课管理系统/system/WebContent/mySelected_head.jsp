<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,java.text.*,com.xx17.cys.entity.*" 
    import="java.sql.*,org.apache.commons.dbcp2.*" 
    import="javax.naming.*,javax.sql.*" pageEncoding="UTF-8"%>
<%
	String user =(String)session.getAttribute("username");
	session.setAttribute("username", user);

	Context initContext = new InitialContext();
	Context envContext = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/system");
	Connection conn = ds.getConnection(); 
	//out.print("数据库连接成功！");
    Statement stmt = conn.createStatement();
	//执行sql语句
	String sql = "select SUM(course.Credit) ";
	sql+="from v_selected_stu_tea_cou,course ";
	sql+="where v_selected_stu_tea_cou.Cno = course.Cno ";
	sql+="and Sno='"+user+"'";
	System.out.println("sql "+sql);
	//弄个对象来接它，结果集
	ResultSet rs = stmt.executeQuery(sql);
	int fen=0;
	while(rs.next()){
		fen=rs.getInt(1);
	}

	initContext = new InitialContext();
	envContext = (Context)initContext.lookup("java:/comp/env");
	ds = (DataSource)envContext.lookup("jdbc/system");
	conn = ds.getConnection(); 
	//out.print("数据库连接成功！");
   	stmt = conn.createStatement();
	int men=0;
	sql = "select count(*) ";
	sql+="from v_selected_stu_tea_cou ";
	sql+="where Sno='"+user+"'";
	System.out.println("sql "+sql);
	//弄个对象来接它，结果集
	ResultSet rs2 = stmt.executeQuery(sql);
	while(rs2.next()){
		men=rs2.getInt(1);
	}
	
%> 
<div style="width:100% ;float:none;display:block; height:60px; margin-top:0px;">
	<table width=90% border="1" class="t1">
		<tr class='a1'>
			<td>你共选了<%=men%>门课，共计<%=fen%>学分</td>
		</tr>
	</table>
</div>
<div style="width:100% ;float:none;display:block; height:60px; margin-top:10px;">
	<table width=90% border="1" class="t1">
		<tr class='a1'>
			<td><a href="mySelected_coll.jsp">按学院统计</a></td>
			<td><a href="mySelected_cou.jsp">所选课程详情</a></td>
			<td><a href="mySelected.jsp">选课结果</a></td>
			<td><a href="#">课表</a></td>
		</tr>
	</table>
</div>