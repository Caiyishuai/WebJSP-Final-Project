package com.xx17.cys.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.xx17.cys.javabean.UserBean;
import java.net.*;
import com.xx17.cys.base.*;
import com.xx17.cys.entity.Login;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({ "/LoginServlet", "/login.do" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//定义一个全局变量，用以保存当前已登录的人数
	private int usercount = 0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
                *  另一种注销方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    //保存用户名和密码
    protected void saveUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
    	String isSave = request.getParameter("remember");
    	String uname = request.getParameter("username");
    	//System.out.println(isSave);
    	if(isSave!=null) {
    		Cookie cookie = new Cookie("username", URLEncoder.encode(uname,"UTF-8"));
    		//System.out.println(uname);
    		//一分钟来计时
    		cookie.setMaxAge(60*24*30);
    		//把cookie放进response
    		response.addCookie(cookie);
    	}
    }
    //注销
    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	HttpSession session = request.getSession();
    	session.invalidate();
    	//response.sendRedirect("index.jsp");
    	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    	
    	ServletContext application = request.getServletContext();
    	usercount--;
    	application.setAttribute("usernum", usercount);
    	
    	request.setAttribute("status", "注销成功！");
    	rd.forward(request, response);
    }
  
    //登录
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	String uname = request.getParameter("username");//获取学号或工号
		String upass = request.getParameter("userpass");//获取用户名
		UserBean ub = new UserBean();

		
		RequestDispatcher rd;
		Login user = new Login();
		user = ub.login(uname, upass);

		if(user.getUid()!=null){			
			System.out.println("登录成功！");

			/* 定义application */
	    	ServletContext application = this.getServletContext();
	    	Object num = application.getAttribute("usernum");
	    	if(num==null){
	    		usercount = 0;
	    	}else{
	    		usercount = (Integer)num;
	    	}
	    	usercount++;
			application.setAttribute("usernum", usercount);
			
			/* 调用保存 cookie 的方法 */
			saveUser(request, response);
			
			/* 定义session */
			HttpSession session = request.getSession();		
			
			if(uname.equals("蔡军帅")){
				rd = request.getRequestDispatcher("loginAdmin.jsp");

				session.setAttribute("username", uname);
				session.setAttribute("StuName", uname);
			}
			else if(uname.length()==4){
				rd = request.getRequestDispatcher("loginOK.jsp");
				session.setAttribute("username", uname);
				
				String StuNname = ub.getStuName(uname);
				//System.out.println("StuNname "+StuNname);
				session.setAttribute("StuName", StuNname);
			}
			else if(uname.length()==3) {
				rd = request.getRequestDispatcher("loginTea.jsp");
				session.setAttribute("username", uname);
				
				String TeaNname = ub.getTeaName(uname);
				session.setAttribute("TeaName", TeaNname);
			}
			else{
				System.out.println("登录失败！");
				rd = request.getRequestDispatcher("failure.jsp");
			}
		}else{
				System.out.println("登录失败！");
				rd = request.getRequestDispatcher("failure.jsp");
			}
			System.out.println("准备跳转页面");
			rd.forward(request, response);
		
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * 不带状态的跳转：response.sendRedirext("index.jsp")
		 * 带状态的页面跳转：RequestDispatcher.forward(request,response)
		 */		
		
		//判断登录还是登出
		String act = request.getParameter("action");
		if(act.equals("in")) {
			login(request,response);
		}else {
			logout(request,response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
