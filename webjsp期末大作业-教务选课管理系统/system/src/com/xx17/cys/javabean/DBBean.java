package com.xx17.cys.javabean;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public final class DBBean {

	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public DBBean() {
		
	}
	
	//建立数据库连接
	public Connection getConnection() {
		
		try {	
			/*使用静态数据库连接池*/
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/system");
			//建立连接池连接
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 提取SQL生成记录集
	public ResultSet executeQuery(String sql) {
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("返回结果集");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	// 提取SQL添加记录
	public int executeUpdata(String sql){
		int result = 0;
		
		try{
			stmt = conn.createStatement();
			//System.out.println(sql);
			result = stmt.executeUpdate(sql);
			System.out.println("result "+result);
		}catch(Exception e){
			e.printStackTrace();
			
		}		
		return result;
		
	}
}
