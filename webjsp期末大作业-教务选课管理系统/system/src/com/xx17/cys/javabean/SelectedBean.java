package com.xx17.cys.javabean;
import java.sql.*;

public class SelectedBean {

	public String add(String Sno, String Cno) {
		String ok="1";
		String sql = "insert into selection(Sno,Cno) values("+"'"+Sno+"','"+Cno+"')";
		System.out.println("here: "+sql);
		
		DBBean db = new DBBean();	
		db.getConnection();
		//��ǰûѡ��
		if(search(Sno,Cno)==1) {
			//��ôѡ
			db.executeUpdata(sql);	
		}else {
			ok="0";
		}
		//ok=1��ʾѡ�γɹ�
		return ok;
			
	}	
	
	public int search(String Sno,String Cno) {
		int ok=1;
		String sql = "select * from selection where Sno="+"'"+Sno+"' and Cno='"+Cno+"'";
		System.out.println("here2: "+sql);
		DBBean db = new DBBean();	
		db.getConnection();
		ResultSet rs = db.executeQuery(sql);
		System.out.println("rs "+rs);
		try {
			if (rs.next()) {
				//�Ѿ����ڵ��ˣ��Ͳ�ok
				ok=0;
			}
		}catch(Exception e){
			e.printStackTrace();
			
		}	
		System.out.println("ok "+ok);
		return ok;
	}
	public void del(String Sno,String Cno) {
		String sql = "delete from selection where Sno="+"'"+Sno+"' and Cno='"+Cno+"'";
		System.out.println("here2: "+sql);
		DBBean db = new DBBean();	
		db.getConnection();
		db.executeUpdata(sql);

	}
}
