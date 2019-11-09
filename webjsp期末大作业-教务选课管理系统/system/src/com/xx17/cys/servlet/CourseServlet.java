package com.xx17.cys.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xx17.cys.entity.Course;
import com.xx17.cys.javabean.CourseBean;
import com.xx17.cys.javabean.StudentBean;

/**
 * Servlet implementation class CourseServlet
 */
@WebServlet({"/CourseServlet", "/change_course.do" })
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void addcou(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("addCourse.jsp");
		rd.forward(request, response);
		
	}
	
	protected void modcou(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nid = request.getParameter("nid");
		System.out.println("nid  " +nid);
		CourseBean sb = new CourseBean();
		Course cou = sb.getCourseByCno(nid);
		
		request.setAttribute("one_course", cou);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("modCourse.jsp");
		rd.forward(request, response);
	}
	
	protected void delcou(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nid = request.getParameter("nid");
		CourseBean cb = new CourseBean();
		cb.del(nid);
		
		response.sendRedirect("CourseAdmin.jsp");
	
	}
	
	protected void updcou(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Cno = request.getParameter("Cno");
		String Cname = request.getParameter("Cname");
		String Tno = request.getParameter("Tno");
		String Time = request.getParameter("Time");
		String TestTime = request.getParameter("TestTime");
		String Credit = request.getParameter("Credit");
		String College = request.getParameter("College");	
		CourseBean cb = new CourseBean();
		cb.upd(Cno,Cname,Tno,Time,TestTime,Credit,College);
		
		response.sendRedirect("CourseAdmin.jsp");
	}
	
	protected void inscou(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Cno = request.getParameter("Cno");
		String Cname = request.getParameter("Cname");
		String Tno = request.getParameter("Tno");
		String Time = request.getParameter("Time");
		String TestTime = request.getParameter("TestTime");
		String Credit = request.getParameter("Credit");
		String College = request.getParameter("College");
		CourseBean cb = new CourseBean();
		cb.add(Cno,Cname,Tno,Time,TestTime,Credit,College);
		
		response.sendRedirect("CourseAdmin.jsp");	
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String act = request.getParameter("action");
		if(act.equals("add")) {
			addcou(request, response);
		}else if(act.equals("mod")) {
			modcou(request, response);
		}else if(act.equals("del")) {
			delcou(request, response);
		}else if(act.equals("upd")) {
			updcou(request, response);
		}else if(act.equals("save")) {
			inscou(request, response);
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
