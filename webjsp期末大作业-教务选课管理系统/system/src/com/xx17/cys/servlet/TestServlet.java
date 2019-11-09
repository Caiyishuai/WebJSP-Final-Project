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
		
		System.out.println("������doPost");
		//����һ��list����
		

		// ������ӵ��������棬������Ը�Ϊ��ȡsql������Ϣ��Ȼ��תΪjson�ַ�����Ȼ��浽list�С�
		//����ѡ�������ơ��͡���������Ϊ�������Է�װ��һ��Product���
		//ÿ��Product��Ķ��󶼿��Կ�����һ�����X������ֵ����������Y������ֵ���ļ��ϡ�
		//list.add(new Product("����", 10));
		//list.add(new Product("ţ�п�", 20));
		//list.add(new Product("���޷�", 30));

		Gson gson2 = new Gson();
		String json = gson2.toJson(list);
		
		//ObjectMapper mapper = new ObjectMapper(); // �ṩjava-json�໥ת�����ܵ���

		//String json = mapper.writeValueAsString(list); // ��list�еĶ���ת��ΪJson�ַ���

		System.out.println(json);

		// ��json�ַ������ݷ��ظ�ǰ��
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(json);
	}
}