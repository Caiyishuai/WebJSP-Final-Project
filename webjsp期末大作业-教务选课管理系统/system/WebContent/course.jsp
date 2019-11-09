<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*,java.text.*,com.xx17.cys.entity.*" 
    import="java.sql.*,org.apache.commons.dbcp2.*" 
    import="javax.naming.*,javax.sql.*" pageEncoding="UTF-8"%>
<%
	Course c1 = (Course)request.getAttribute("course");
	String who = (String)request.getAttribute("who");
	System.out.println("who "+who);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程详情</title>
</head>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<body>
<% 
	if(who.equals("1")){
		%><jsp:include page="menu.jsp?col=3" flush="true"/>
<% 
	}else if(who.equals("2")){
		%><jsp:include page="menuTea.jsp?col=3" flush="true"/>
<%		
	}else{
		%><jsp:include page="menuStu.jsp?col=3" flush="true"/>
<%		
	}
	System.out.println("turn_to");
%>

	<!--主要内容部分-->
	<div class="content" style="border:0px solid #000;float:none;display:block;height:100%">
				<div style="width:100% ;float:none;display:block; ">
		<table width="80%" id="mytab"  border="1" class="t1" id="mytable">
			<tr>
				<td width="400">课程号：</td>
				<td width="800"><%=c1.getCno()  %></td>
			</tr>
			<tr>
				<td width="400">课程名：</td>
				<td width="800"><%=c1.getCname()  %></td>
			</tr>
			<tr>
				<td>任课老师工号：</td>
				<td width="800"><%=c1.getTno()  %></td>
			</tr>
			<tr>
				<td>上课时间：</td>
				<td width="800"><%=c1.getTime()  %></td>
			</tr>
			<tr>
				<td>考试时间：</td>
				<td width="800"><%=c1.getTestTime()  %></td>
			</tr>
			<tr>
				<td>学分：</td>
				<td width="800"><%=c1.getCredit()  %></td>
			</tr>
			<tr>
				<td>开课学院：</td>
				<td width="800"><%=c1.getCollege()  %></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<%
					String turn_to = "";
					if(who.equals("1")){
						turn_to = "CourseAdmin";
					}else if(who.equals("2")){
						turn_to = "teacherCourse";
					}else{
						turn_to="chooseCourse";
					}
					System.out.println("turn_to");
				%>
				<input type="button" value="返回" onclick="location.href='<%=turn_to %>.jsp'">
				</td>
			</tr>
		</table>
	</div>	
	</div>
<%@ include file="foot.jsp" %>
</body>
</html>