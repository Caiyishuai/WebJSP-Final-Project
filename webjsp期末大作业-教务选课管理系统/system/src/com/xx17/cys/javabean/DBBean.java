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
	
	//�������ݿ�����
	public Connection getConnection() {
		
		try {	
			/*ʹ�þ�̬���ݿ����ӳ�*/
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/system");
			//�������ӳ�����
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// ��ȡSQL���ɼ�¼��
	public ResultSet executeQuery(String sql) {
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			System.out.println("���ؽ����");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	// ��ȡSQL��Ӽ�¼
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
