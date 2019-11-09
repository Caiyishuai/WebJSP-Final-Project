<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String col = request.getParameter("col");
	String user =(String)session.getAttribute("username");
	String TeaName =(String)session.getAttribute("TeaName");
	//System.out.println("user "+user);
	session.setAttribute("username", user);
	session.setAttribute("TeaName", TeaName);
%>
<!--默认样式-->
<link rel="stylesheet" href="css/reset.min.css">
<!--图标样式-->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.0/css/all.min.css'>
<!--主要样式-->
<link rel="stylesheet" href="css/style_body.css">
<style>
	.options a:link{
		text-decoration:none;
	}
		.options a:hover{
		text-decoration:none;
	}
		.options a:active{
		text-decoration:none;
	}

</style>

	<!--左侧导航-->
	<div class="navbar" style="height:700px;">
		<div class="user">
			<div class="user__pic"></div>
			<div class="user__name"><%=TeaName %></div>
		</div>
		<div class="bar">
			<div class="options">
				<ul>
					<li class="active"><a href="loginTea.jsp" style="color:white">主页</a></li>
					<span class="options__division">菜单目录</span>
					<li <%=col.equals("1")? "style='background-color:#00BFFF;'":"" %>><a href="teacherInformation.jsp" <%=col.equals("1")? "style='color: white;'":"" %>>个人信息</a></li>
					<li <%=col.equals("2")? "style='background-color:#00BFFF;'":"" %>><a href="myCourse.jsp" <%=col.equals("2")? "style='color: white;'":"" %>>我开的课</a></li>
					<li <%=col.equals("3")? "style='background-color:#00BFFF;'":"" %>><a href="teacherCourse.jsp" <%=col.equals("3")? "style='color: white;'":"" %>>所有课程信息</a></li>
					<li <%=col.equals("4")? "style='background-color:#00BFFF;'":"" %>><a href="teacherStatistic.jsp" <%=col.equals("4")? "style='color: white;'":"" %>>选课情况统计</a></li>					
					<li <%=col.equals("5")? "style='background-color:#00BFFF;'":"" %>><a href="#" <%=col.equals("5")? "style='color: white;'":"" %>>直播论坛</a></li>
					<li <%=col.equals("6")? "style='background-color:#00BFFF;'":"" %>><a href="#" <%=col.equals("6")? "style='color: white;'":"" %>>其它</a></li>
				</ul>
			</div>
			<div class="settings">
				<ul>
					<li class="acc-settings"><i class="fas fa-cog"></i> 设置</li>
					<li><i class="fas fa-sign-out-alt"></i><a href="index.jsp"> 退出</a></li>
				</ul>
			</div>
		</div>
	</div>
	