<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="error.jsp"%>
<%
	String ser_msg = (String)request.getAttribute("server_info");
	//System.out.print(ser_msg);
	//String pic = (String)request.getAttribute("pic");
%>
<head>
	<title>教务管理系统，请注册</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Validate Login & Register Forms Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- Meta tag Keywords -->

	<!-- css files -->
	<link rel="stylesheet" href="css/style_login.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Magra:400,700&amp;subset=latin-ext" rel="stylesheet">
	<!-- //web-fonts -->
	<link href="css/style.css" rel="stylesheet" type="text/css"/>
	<style>
	dl{width: 500px;margin: 0px 0px 0px 0px;}
	dt{width: 80px; float: left; height: 40px; text-align: right;}
	dd{width: 360px; float: left; height: 40px; margin: 0px 0px 0px 10px;}
	input[type=text],input[type=password]{width: 300px; height: 25px; border-radius: 10px; border solid 2px #999;}
	#main{
		width:500px;
		margin:auto;
		height:300px;
	}
	#main h2{
		text-aligh:center;
		margin-left:0px;
	}
	#info{color:#f00; font-weight:bold;}
	#information{
		width:500px;
		margin: 0px 0px 0px 0px;
	}
	</style>
</head>

<body>
	<!-- title -->
	<h1>
	 	请填写注册信息
	</h1>
	<!-- //title -->

	<!-- content -->

<body>
	<div class="container-agille">
		<div class="formBox level-login">
			<div class="box boxShaddow"></div>
			<div class="box loginBox">
			
							
				<div id="main" >
				<h3>用户注册</h3>
				<!-- 提交，发生动作 reg_action.jsp-->
				<form action="reg.do" method="post">
					<div class="f_row-2">
						<input type="text" class="input-field" placeholder="学号/工号" name="userNumber" required>
					</div>
					<div class="f_row-2">
						<input type="password" class="input-field" placeholder="密码" name="userPass" required>
					</div>
					<div class="f_row-2">
						<input type="password" class="input-field" placeholder="重复密码" name="confPass" required>
					</div>
					<div class="f_row-2">
						<input type="text" class="input-field" placeholder="姓名" name="userName" required>
					</div>
					<div class="f_row-2">
						<input type="text" class="input-field" placeholder="专业/所属学院" name="userDept" required>
					</div>
					<div class="f_row-2 last">
						<input type="text" name="userPhone" placeholder="联系方式" class="input-field" required>
					</div>
					<div id="information">
						<dl>
							<dt>性别：</dt><dd><input type="radio" name="gender" value="男" checked>
								男 <input type="radio" name="gender" value="女">女</dd>
							<dt>年级：</dt><dd><select name="grade">
								<option value="1">大一</option>
								<option value="2">大二</option>
								<option value="3">大三</option>
								<option value="4">大四</option>
							</select></dd>
							<dt>出生日期：</dt><dd><input type="date" name="birthday"></dd>
							<dd><input type="checkbox" name="read" value="1">我已阅读《用户协议》并且是本校学生</dd>
						
							<%=ser_msg == null? "":"<dt></dt><dd><span id='info'>"+ser_msg+"</span></dd>"%>
							<dt></dt><dd><input type="submit" value="注 册">&nbsp;&nbsp;
							<input type="button" value="返 回" onclick="window.location.href='index.jsp'"></dd>
						</dl>
					</div>
				</form>
				</div>
			
			
			
			</div>
		</div>
	</div>
	
	<!-- copyright -->
	<div class="footer-w3ls" style="margin:270px 0 50 0 ;">
		<h2>&copy; 版权归属2019 浙江财经大学信工学院17信息1班蔡怡帅
		</h2>
	</div>
	<!-- //copyright -->
</body>
</html>