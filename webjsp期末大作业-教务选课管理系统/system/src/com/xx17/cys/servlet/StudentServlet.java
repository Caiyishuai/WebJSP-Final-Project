package com.xx17.cys.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xx17.cys.entity.Student;
import com.xx17.cys.javabean.CourseBean;
import com.xx17.cys.javabean.StudentBean;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet({ "/StudentServlet", "/change_student.do" })
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void addstu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}
	
	//修改学生信息
	protected void modstu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nid = request.getParameter("nid");
		System.out.println("nid  " +nid);
		StudentBean sb = new StudentBean();
		Student stu = sb.getStuBySno(nid);
		String code = sb.getCode(nid);
		stu.setScode(code);
		
		request.setAttribute("one_student", stu);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("modStudent.jsp");
		rd.forward(request, response);
	}
	
	//删除学生信息
	protected void delstu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nid = request.getParameter("nid");
		StudentBean sb = new StudentBean();
		sb.del(nid);
		
		response.sendRedirect("studentInformation.jsp");
	}
	
	protected void getstu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}
	
	protected void insstu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	//更新学生信息
	protected void updstu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sno = request.getParameter("sno");
		String co = request.getParameter("co");
		String cco = request.getParameter("cco");
		String sna = request.getParameter("sna");
		String sg = request.getParameter("sg");
		String sd = request.getParameter("sd");
		String sgr = request.getParameter("sgr");
		String sb = request.getParameter("sb");
		String sp = request.getParameter("sp");
		StudentBean SB = new StudentBean();
		
		if(co.equals(cco)) {
			SB.upd(sno,sna,sg,sd,sgr,sb,sp,co);
			//System.out.println("已更新！！！");
		}
		else {
			response.getWriter().print("<script>alert('对不起，你两次输入的密码不一致！')</script>");
		}
		String admin = request.getParameter("admin");
		System.out.println("admin "+admin+"!");
		if(admin.equals("1")) {
			response.sendRedirect("studentInformation.jsp");
		}
		else{
			response.sendRedirect("myInformation.jsp");
		}
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String act = request.getParameter("action");
		if(act.equals("add")) {
			addstu(request, response);
		}else if(act.equals("mod")) {
			modstu(request, response);
		}else if(act.equals("del")) {
			delstu(request, response);
		}else if(act.equals("upd")) {
			updstu(request, response);
		}else if(act.equals("save")) {
			insstu(request, response);
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
