package com.xx17.cys.servlet;

import java.io.IOException;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xx17.cys.entity.*;
import com.xx17.cys.javabean.*;

/**
 * Servlet implementation class ChooseCourse
 */
@WebServlet({ "/ChooseCourse", "/Choose.do" })
public class ChooseCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChooseCourse() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void choose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Cno = request.getParameter("Cno");
		String Sno = request.getParameter("Sno");
		
		SelectedBean Sb = new SelectedBean();
		String ok = Sb.add(Sno,Cno);
				
    	RequestDispatcher rd = request.getRequestDispatcher("chooseCourse.jsp");
    	request.setAttribute("is_success", ok);
    	rd.forward(request, response);
	}
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Cno = request.getParameter("Cno");
		String Sno = request.getParameter("Sno");
		
		SelectedBean Sb = new SelectedBean();
		Sb.del(Sno,Cno);
		response.sendRedirect("mySelected.jsp");
	}
	
	protected void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Cno = request.getParameter("Cno");
		String who = request.getParameter("who");
		
		CourseBean Cb = new CourseBean();
		Course c = Cb.getCourseByCno(Cno);

    	RequestDispatcher rd = request.getRequestDispatcher("course.jsp");
    	request.setAttribute("course", c);
    	request.setAttribute("who", who);
    	rd.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String act = request.getParameter("action");
		if(act.equals("ins")) {
			choose(request, response);
		}else if(act.equals("del")) {
			delete(request, response);
		}else if(act.equals("find")) {
			find(request,response);
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
