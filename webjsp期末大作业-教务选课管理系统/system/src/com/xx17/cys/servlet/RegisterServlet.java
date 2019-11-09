package com.xx17.cys.servlet;

import java.io.*;
import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.xx17.cys.base.Tools;
import com.xx17.cys.javabean.*;

import java.util.*;


/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(
		description = "����ע���������", 
		urlPatterns = { 
				"/RegisterServlet", 
				"/reg.do",
				//"/register.do"
		})
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * ��ȡ��������
		 */
		String un = request.getParameter("userNumber");
		String um = request.getParameter("userName");
		String uc = request.getParameter("userPass");
		String cc = request.getParameter("confPass");
		String ud = request.getParameter("userDept");
		String up = request.getParameter("userPhone");
		String ug = request.getParameter("gender");
	    String ub = request.getParameter("birthday");
	    //System.out.println("birthday"+ub+" "+ub.length());
		String ugr = Integer.toString(Tools.getNum(request.getParameter("grade")));
	    String checkboxes[] = request.getParameterValues("read");
	    
		/*
		 * ����
		 */
	    String msg;
	    //System.out.println("checkboxes "+checkboxes);
	    //System.out.println("userNum "+un);
	    if(checkboxes==null)
	    {
			msg = "��û���Ķ����û�Э�顷";
			request.setAttribute("server_info", msg);
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);		
	    }
	    if(un==null||um==null||ud==null||up==null||ub.length()==0) {
			msg = "�뽫��Ϣ��д����";
			request.setAttribute("server_info", msg);
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);	
	    }
	    if(!uc.equals(cc)) {
			msg = "������������벻ͬ";
			request.setAttribute("server_info", msg);
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);	
	    }
	    //�ж���unѧ��������ʦ
	    //ѧ����λ����һλ1-4
	    //��ʦһλ����һλ��1
	    int f=1;
	    if(un.length()==4) {
	    	char ch=un.charAt(0);
	    	if(ch!='1' && ch!='2' && ch!='3'&& ch!='4') {
	    		f=0;
	    	}
	    }else if(un.length()==3) {
	    	char ch=un.charAt(0);
	    	if(ch!='1') {
	    		f=0;
	    	}else {
	    		f=2;
	    	}
	    }else {
	    	f=0;
	    }
	    if(f==0) {
			msg = "�������ѧ�Ż򹤺�����";
			request.setAttribute("server_info", msg);
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);	
	    }
	    /*
	     * 1��ѧ����2����ʦ����������
	     */
	    UserBean UB = new UserBean();
	    if(f==1) {
	    	UB.ins_stu(un,uc,um,ug,ud,ugr,ub,up);
			msg = "��ϲͬѧ��ע��ɹ����������ص�¼";
			request.setAttribute("server_info", msg);
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);	
	    }else if(f==2){
	    	UB.ins_tec(un,uc,um,ug,ud);
			msg = "��ϲ��ʦ��ע��ɹ����������ص�¼";
			request.setAttribute("server_info", msg);
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);	
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
