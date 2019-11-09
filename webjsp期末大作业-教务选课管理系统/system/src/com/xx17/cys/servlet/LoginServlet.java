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
	//����һ��ȫ�ֱ��������Ա��浱ǰ�ѵ�¼������
	private int usercount = 0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
                *  ��һ��ע������
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    //�����û���������
    protected void saveUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	
    	String isSave = request.getParameter("remember");
    	String uname = request.getParameter("username");
    	//System.out.println(isSave);
    	if(isSave!=null) {
    		Cookie cookie = new Cookie("username", URLEncoder.encode(uname,"UTF-8"));
    		//System.out.println(uname);
    		//һ��������ʱ
    		cookie.setMaxAge(60*24*30);
    		//��cookie�Ž�response
    		response.addCookie(cookie);
    	}
    }
    //ע��
    protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	HttpSession session = request.getSession();
    	session.invalidate();
    	//response.sendRedirect("index.jsp");
    	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    	
    	ServletContext application = request.getServletContext();
    	usercount--;
    	application.setAttribute("usernum", usercount);
    	
    	request.setAttribute("status", "ע���ɹ���");
    	rd.forward(request, response);
    }
  
    //��¼
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	String uname = request.getParameter("username");//��ȡѧ�Ż򹤺�
		String upass = request.getParameter("userpass");//��ȡ�û���
		UserBean ub = new UserBean();

		
		RequestDispatcher rd;
		Login user = new Login();
		user = ub.login(uname, upass);

		if(user.getUid()!=null){			
			System.out.println("��¼�ɹ���");

			/* ����application */
	    	ServletContext application = this.getServletContext();
	    	Object num = application.getAttribute("usernum");
	    	if(num==null){
	    		usercount = 0;
	    	}else{
	    		usercount = (Integer)num;
	    	}
	    	usercount++;
			application.setAttribute("usernum", usercount);
			
			/* ���ñ��� cookie �ķ��� */
			saveUser(request, response);
			
			/* ����session */
			HttpSession session = request.getSession();		
			
			if(uname.equals("�̾�˧")){
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
				System.out.println("��¼ʧ�ܣ�");
				rd = request.getRequestDispatcher("failure.jsp");
			}
		}else{
				System.out.println("��¼ʧ�ܣ�");
				rd = request.getRequestDispatcher("failure.jsp");
			}
			System.out.println("׼����תҳ��");
			rd.forward(request, response);
		
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * ����״̬����ת��response.sendRedirext("index.jsp")
		 * ��״̬��ҳ����ת��RequestDispatcher.forward(request,response)
		 */		
		
		//�жϵ�¼���ǵǳ�
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
