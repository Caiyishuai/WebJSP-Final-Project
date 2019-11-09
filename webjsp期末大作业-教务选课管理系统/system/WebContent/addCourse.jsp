<%@ page language="java" contentType="text/html; charset=UTF-8"
 	import="com.xx17.cys.entity.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>增加课程</title>
<script type="text/javascript" src="js/fanye.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="page">
<jsp:include page="menu.jsp?col=3" flush="true"/>
	<!--主要内容部分-->
	<div class="content" style='background:#eee;height:800px;'>		
		<div id="form_1">
		<form action="change_course.do?action=save" method="post">
		<table width="80%" id="mytab"  border="1" class="t1" id="mytable">
			<tr>
				<td width="400">课程号：</td>
				<td width="800"><input name="Cno" size="80" value=""></td>
			</tr>
			<tr>
				<td width="400">课程名：</td>
				<td width="800"><input name="Cname" size="80" value=""></td>
			</tr>
			<tr>
				<td>任课老师工号：</td>
				<td width="800"><input name="Tno" size="80" value=""></td>
			</tr>
			<tr>
				<td>上课时间：</td>
				<td width="800"><input name="Time" size="80" value=""></td>
			</tr>
			<tr>
				<td>考试时间：</td>
				<td width="800"><input name="TestTime" size="80" value=""></td>
			</tr>
			<tr>
				<td>学分：</td>
				<td width="800"><input name="Credit" size="80" value=""></td>
			</tr>
			<tr>
				<td>开课学院：</td>
				<td width="800"><input name="College" size="80" value=""></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<input type="submit" value="保存">
				<input type="button" value="返回" onclick="location.href='CourseAdmin.jsp'">
				</td>
			</tr>
		</table>
		</form>
	</div>

</div>
<jsp:include page="foot.jsp" flush="true"/>