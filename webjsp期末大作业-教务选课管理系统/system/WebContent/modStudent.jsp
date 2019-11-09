<%@ page language="java" contentType="text/html; charset=UTF-8"
 	import="com.xx17.cys.entity.*"
    pageEncoding="UTF-8"%>
<%
	Student s1 = (Student)request.getAttribute("one_student"); 
	String user =(String)session.getAttribute("username");
	System.out.println(" modeStuddent"+user);
	int admin=0;
	if(user.equals("蔡军帅")){
		admin=1;
	}
%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改学生信息</title>
<script type="text/javascript" src="js/fanye.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="page">
<jsp:include page="menu.jsp?col=1" flush="true"/>
	<!--主要内容部分-->
	<div class="content" style='background:#eee;height:800px;'>		
		<div id="form_1">
		<form action="change_student.do?action=upd&admin=<%=admin %>" method="post">
		<table width="80%" id="mytab"  border="1" class="t1" id="mytable">
			<tr>
				<td width="400">学号：</td>
				<td width="800"><input name="sno" size="80" value=<%=s1.getSno()  %>></td>
			</tr>
			<tr>
				<td width="400">密码：</td>
				<td width="800"><input name="co" size="80" value=<%=s1.getScode()  %>></td>
			</tr>
			<tr>
				<td width="400">确认密码：</td>
				<td width="800"><input name="cco" size="80" value=<%=s1.getScode()  %>></td>
			</tr>
			<tr>
				<td width="400">姓名：</td>
				<td width="800"><input name="sna" size="80" value=<%=s1.getSname()  %>></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td width="800"><input name="sg" size="80" value=<%=s1.getSgender()  %>></td>
			</tr>
			<tr>
				<td>专业：</td>
				<td width="800"><input name="sd" size="80" value=<%=s1.getSdept()  %>></td>
			</tr>
			<tr>
				<td>年级：</td>
				<td width="800"><input name="sgr" size="80" value=<%=s1.getSgrade()  %>></td>
			</tr>
			<tr>
				<td>生日：</td>
				<td width="800"><input name="sb" size="80" value=<%=s1.getSbirth()  %>></td>
			</tr>
			<tr>
				<td>电话：</td>
				<td width="800"><input name="sp" size="80" value=<%=s1.getSphone()  %>></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<input type="submit" value="保存">
				<input type="button" value="返回" onclick="location.href='myInformation.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</div>

</div>
<jsp:include page="foot.jsp" flush="true"/>