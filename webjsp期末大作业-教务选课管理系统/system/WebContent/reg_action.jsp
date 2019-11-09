<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="com.xx17.cys.base.*"
    pageEncoding="UTF-8"
    errorPage="error.jsp.
    
    "
    %>
<%
	request.setCharacterEncoding("utf-8");
    String ucode = request.getParameter("usercode");//接收register.jsp里的usercode
    String upass = request.getParameter("userpass");
    String cpass = request.getParameter("confpass");
    String email = request.getParameter("email");
    String checkboxes[] = request.getParameterValues("read");
    //String birthday = request.getParameter("birthday");
    //System.out.println("birthday"+birthday);
    if(checkboxes==null)
    {
		String msg = "您没有阅读《用户协议》";
		request.setAttribute("server_info", msg);
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response);		
    }
    int uoccu = Tools.getNum(request.getParameter("occupation"));
    String[] uintr = request.getParameterValues("hobby");
	out.print("用户名为: " + ucode + "<br>");
	out.print("密码为: " + upass+ "<br>");
	out.print("职业：" + uoccu+ "<br>");
	if(uintr!=null){
		out.print("你有" + uintr.length + "个兴趣"+ "<br>");
	}
	else{
		out.print("你没有兴趣爱好"+ "<br>");
	}
	
	if(ucode.equals("管理员")){
		//response.sendRedirect("register.jsp");页面跳转
		String msg = ucode + "不能使用！";
		request.setAttribute("server_info", msg);
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response);
	}
	if(ucode.length()<8 || ucode.length()>20){
		String msg = "用户名长度不对";
		request.setAttribute("server_info", msg);
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response);
	}
	boolean f=true;
	for(int i=0;i<ucode.length();i++){
		char ch=ucode.charAt(i);
		if(!(ch>='0' && ch<='9') && !((ch>='A' && ch<='Z'  ||  ch>='a' && ch<='z'))){
			f=false;
		}
	}
	if(f==false){
		String msg = "用户名只能包含数字和字母";
		request.setAttribute("server_info", msg);
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response);	
	}
	if(upass.length()<8 || upass.length()>20){
		String msg = "密码长度不对";
		request.setAttribute("server_info", msg);
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response);
		//request.getRequestDispatcher("error,jsp").forward(request,response);
	}	
	if(!cpass.equals(upass)){
		String msg = "确认密码与密码不同";
		request.setAttribute("server_info", msg);
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response);
	}
	f=false;
	for(int i=4;i<email.length()-2;i++){
		char c=email.charAt(i);
		if(c=='@'){
			f=true;
			break;
		}
	}
	if(f==false){
		String msg = "输入的邮箱不合法";
		request.setAttribute("server_info", msg);
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response);	
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>