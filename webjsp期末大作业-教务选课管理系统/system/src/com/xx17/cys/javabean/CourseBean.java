package com.xx17.cys.javabean;

import java.sql.ResultSet;

import com.xx17.cys.entity.Course;

public class CourseBean {

	public void add(String Cno, String Cname, String Tno, String Time, String TestTime,String Credit,String College) {
		String sql = "insert into course values('"+Cno+"','"+Cname+"','"+Tno;
		sql += "',"+Time+",'"+TestTime+"','"+Credit+"','"+College+"')";
		System.out.println("here: "+sql);
		
		DBBean db = new DBBean();	
		db.getConnection();
		db.executeUpdata(sql);		
	}	
	
	
	public Course getCourseByCno(String nid) {
		Course cou = new Course();
		String sql = "select * from course where Cno="+nid;
		DBBean db = new DBBean();
		db.getConnection();
		
		ResultSet rs = db.executeQuery(sql);
		try {
			if(rs.next()) {
				cou.setCno(rs.getString(1));
				cou.setCname(rs.getString(2));
				cou.setTno(rs.getString(3));
				cou.setTime(rs.getString(4));
				cou.setTestTime(rs.getString(5));
				cou.setCredit(rs.getString(6));
				cou.setCollege(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return cou;
	}
	public void upd(String Cno, String Cname, String Tno, String Time, String TestTime,String Credit,String College) {
		String sql = "update course set Cno='"+Cno+"',Cname='"+Cname+"',Tno='"+Tno;
		sql += "',Time='"+Time+"',TestTime='"+TestTime+"',Credit='"+Credit+"',College='"+College+"' where Cno="+"'"+Cno+"'";
		//System.out.println("here: "+sql);
		
		DBBean db = new DBBean();	
		db.getConnection();
		db.executeUpdata(sql);		
	}	
	
	public void del(String nid) {
		String sql = "delete from course where cno="+nid;

		
		DBBean db = new DBBean();	
		db.getConnection();
		db.executeUpdata(sql);		
	}
	
}
