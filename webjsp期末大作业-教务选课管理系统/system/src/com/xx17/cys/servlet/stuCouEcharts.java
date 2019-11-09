package com.xx17.cys.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xx17.cys.entity.Product;
import com.xx17.cys.javabean.DBBean;

/**
 * Servlet implementation class stuCouEcharts
 */
@WebServlet("/stuCouEcharts")
public class stuCouEcharts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stuCouEcharts() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("hhh");
		String user = (String)request.getParameter("user");
		System.out.println("useruser "+user);
		String sql="Select College,Count(*) from course where cno in ";
		sql+="(SELECT Cno from v_choose_course where Cno in ";
		sql+="(SELECT Cno from v_selected_admin where Sno='"+user+"')) group by College";

		List<Product> list = new ArrayList<Product>();
		DBBean db = new DBBean();	
		db.getConnection();
		ResultSet rs = db.executeQuery(sql);
		try {
			while(rs.next())
			{
				list.add(new Product(rs.getString(1), rs.getInt(2)));
				System.out.println(rs.getString(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
		
		//System.out.println("这里是doPost");
		Gson gson2 = new Gson();
		String json = gson2.toJson(list);
		System.out.println(json);
		// 将json字符串数据返回给前端
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(json);
	}
}