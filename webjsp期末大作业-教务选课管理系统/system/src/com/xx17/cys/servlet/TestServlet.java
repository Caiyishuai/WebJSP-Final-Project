package com.xx17.cys.servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import org.codehaus.jackson.map.ObjectMapper;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.*;

import com.xx17.cys.entity.Product;
import com.xx17.cys.javabean.DBBean;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sql = "select * from v_count_college order by number desc";
		//System.out.println(sql);
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
		
		System.out.println("这里是doPost");
		//定义一个list集合
		

		// 数据添加到集合里面，这里可以改为获取sql数据信息，然后转为json字符串，然后存到list中。
		//这里把“类别名称”和“销量”作为两个属性封装在一个Product类里，
		//每个Product类的对象都可以看作是一个类别（X轴坐标值）与销量（Y轴坐标值）的集合。
		//list.add(new Product("短袖", 10));
		//list.add(new Product("牛仔裤", 20));
		//list.add(new Product("羽绒服", 30));

		Gson gson2 = new Gson();
		String json = gson2.toJson(list);
		
		//ObjectMapper mapper = new ObjectMapper(); // 提供java-json相互转换功能的类

		//String json = mapper.writeValueAsString(list); // 将list中的对象转换为Json字符串

		System.out.println(json);

		// 将json字符串数据返回给前端
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(json);
	}
}