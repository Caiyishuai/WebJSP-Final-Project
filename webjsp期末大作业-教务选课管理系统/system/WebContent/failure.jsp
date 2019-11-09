<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<title>选课系统</title>
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
</head>

<body>
	<!-- title -->
	<h1>
		欢迎使用帅帅精心研制的教务选课管理系统
	</h1>
	<!-- //title -->

	<!-- content -->
	<div class="container-agille">
		<div class="formBox level-login">
			<div class="box boxShaddow"></div>
			<div class="box loginBox">
				<h3>登录失败！</h3>
				<form class="form1" action="login.do?action=in" method="post">
					<div class="f_row-2">
						用户名或密码错误！
					</div>
					<input class="submit-w3" value="返回" onclick="window.location.href='index.jsp'">
				</form>
			</div>
			<div class="box forgetbox agile">
				<a href="#" class="back icon-back">
					<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					 viewBox="0 0 199.404 199.404" style="enable-background:new 0 0 199.404 199.404;" xml:space="preserve">
						<polygon points="199.404,81.529 74.742,81.529 127.987,28.285 99.701,0 0,99.702 99.701,199.404 127.987,171.119 74.742,117.876 
			  199.404,117.876 " />
					</svg>
				</a>
				<h3>Reset Password</h3>
				<form class="form" action="#" method="post">
					<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>
					<div class="f_row last">
						<label>Email Id</label>
						<input type="email" name="email" placeholder="Email" class="input-field" required>
						<u></u>
					</div>
					<button class="btn button submit-w3">
						<span>Reset</span>
					</button>
				</form>
			</div>
	
			<a href="#" class="regTag icon-add">
				<i class="fa fa-repeat" aria-hidden="true"></i>

			</a>
		</div>
	</div>
	<!-- //content -->

	<!-- copyright -->
	<div class="footer-w3ls" style="margin:150px 0 50 0 ;">
		<h2>&copy; 版权归属2019 浙江财经大学信工学院17信息1班蔡怡帅
		</h2>
	</div>
	<!-- //copyright -->


	<!-- js files -->
	<!-- Jquery -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- //Jquery -->
	<!-- input fields js -->
	<script src="js/input-field.js"></script>
	<!-- //input fields js -->

	<!-- password-script -->
	<script>
		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}
	</script>
	<!-- //password-script -->
	<!-- //js files -->


</body>

</html>