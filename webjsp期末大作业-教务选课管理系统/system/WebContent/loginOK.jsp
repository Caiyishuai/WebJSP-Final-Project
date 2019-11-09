<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*String user =(String)session.getAttribute("usernum");
	System.out.println("user "+user);
	session.setAttribute("usernum", user);
	if(user==null){
		user = "请登录！";
	}
	else{
	    int ucount = (Integer)application.getAttribute("usernum");
		user = "欢迎回来，"+ user + "你是第" + ucount 
				+ "个登录用户[<a href='login.do?action=out'>注销</a>]";
	}*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>优秀的教务管理系统</title>
<script type="text/javascript" src="js/fanye.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="page">
<jsp:include page="menuStu.jsp?col=0" flush="true"/>
	<!--主要内容部分-->
	<div class="content" style="border:0px solid #000;float:none;display:block;height:100%">
		<div id="info">
			<div>
				<span class="left">同学你好！欢迎登录！！！</span><span></span>
				<span class="right"> 学校 |  邮箱 | 社区 |  帮助 </span>
			</div>
</div>
	</div>
</div>
<%@ include file="foot.jsp" %>
</body>
</html>