package com.xx17.cys.javabean;

import java.sql.*;
import com.xx17.cys.entity.*;

public class UserBean {

	//String[] uname = {"²Ì¾üË§","test0001","test0002","test0003","test0004","test0005","Caijunshuai","²Ì¾üË§"};
	//String[] upass = {"caiyishuai","12345678","11111111","12344321","12341234","12121212","88888888","88888888"};
	
	public Login login(String un,String up) {
		Login log = new Login();			
		
		String sql = "select uid,ucode from user where uid='"+un+"' and ucode='"+up+"'";
		
		//System.out.println(sql);
		
		DBBean db = new DBBean();	
		
		db.getConnection();
		ResultSet rs = db.executeQuery(sql);
		try {
			if(rs.next())
			{
				log.setUid(rs.getString(1));
				log.setUcode(rs.getString(2));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return log;
	}
	
	public String getStuName(String un) {
		
		String StuName="";		
		String sql = "select Sname from student where Sno='"+un+"'";
		
		System.out.println(sql);
		
		DBBean db = new DBBean();	
		
		db.getConnection();
		ResultSet rs = db.executeQuery(sql);
		try {
			if(rs.next())
			{
				StuName=rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return StuName;
	}
	public String getTeaName(String un) {
		
		String TeaName="";		
		String sql = "select Tname from teacher where Tno='"+un+"'";
		
		System.out.println(sql);
		
		DBBean db = new DBBean();	
		
		db.getConnection();
		ResultSet rs = db.executeQuery(sql);
		try {
			if(rs.next())
			{
				TeaName=rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return TeaName;
	}
	
	public void ins_stu(String un,String uc ,String um,String ug,String ud,String ugr,String date,String up) {
		
		
		String sql = "insert into student ";
		sql += "values('"+un+"','"+um+"','"+ug+"','"+ud+"','"+ugr+"','"+date+"','"+up+"')";
		System.out.println(sql);
		DBBean db = new DBBean();
		db.getConnection();
		db.executeUpdata(sql);
		sql = "insert into user values('"+un+"','"+uc+"')";
		db.getConnection();
		db.executeUpdata(sql);
	}
	
	public void ins_tec(String un,String uc,String um,String ug,String ud) {
		
		String sql = "insert into teacher ";
		sql += "values('"+un+"','"+um+"','"+ug+"','"+ud+"')";
		System.out.println(sql);
		DBBean db = new DBBean();
		db.getConnection();	
		db.executeUpdata(sql);
		sql = "insert into user values('"+un+"','"+uc+"')";
		db.getConnection();
		db.executeUpdata(sql);
	}
	
}
