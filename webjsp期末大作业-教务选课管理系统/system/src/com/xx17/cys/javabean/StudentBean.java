package com.xx17.cys.javabean;

import java.sql.ResultSet;

import com.xx17.cys.entity.Student;

public class StudentBean {

	public Student getStuBySno(String nid) {
		Student stu = new Student();
		String sql = "select * from student where Sno="+nid;
		DBBean db = new DBBean();
		db.getConnection();
		
		ResultSet rs = db.executeQuery(sql);
		try {
			if(rs.next()) {
				stu.setSno(rs.getString(1));
				stu.setSname(rs.getString(2));
				stu.setSgender(rs.getString(3));
				stu.setSdept(rs.getString(4));
				stu.setSgrade(rs.getString(5));
				stu.setSbirth(rs.getString(6));
				stu.setSphone(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return stu;
	}

	
	public void del(String nid) {
		String sql = "delete from student where Sno="+nid;

		
		DBBean db = new DBBean();	
		db.getConnection();
		db.executeUpdata(sql);		
	}
	
	public String getCode(String nid) {
		String sql = "select ucode from user where uid="+nid;

		String code="";
		DBBean db = new DBBean();	
		db.getConnection();
		ResultSet rs = db.executeQuery(sql);
		try {
			if(rs.next()) {
				code = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return code;
	}
	
	public void upd(String sno,String sna,String sg,String sd,String sgr,String sb,String sp,String co) {
		String sql = "update student set Sno='"+sno+"',Sname='"+sna+"',Sgender='"+sg;
		sql += "',Sdept='"+sd+"',Sgrade='"+sgr+"',Sbirth='"+sb+"',Sphone='"+sp+"' where Sno="+"'"+sno+"'";
		System.out.println("here: "+sql);
		
		DBBean db = new DBBean();	
		db.getConnection();
		db.executeUpdata(sql);	
		
		sql="update user set uid='"+sno+"',ucode='"+co+"' where uid="+"'"+sno+"'";
		System.out.println("here: "+sql);
		db.getConnection();
		db.executeUpdata(sql);	
	}
}
