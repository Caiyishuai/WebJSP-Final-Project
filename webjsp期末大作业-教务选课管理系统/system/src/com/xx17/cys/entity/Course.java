package com.xx17.cys.entity;

public class Course {
	private String Cno; 
	private String Cname; 
	private String Tno; 
	private String Time; 
	private String TestTime; 
	private String Credit; 
	private String College;
	public String getCno() {
		return Cno;
	}
	public void setCno(String cno) {
		Cno = cno;
	}
	public String getCname() {
		return Cname;
	}
	public void setCname(String cname) {
		Cname = cname;
	}
	public String getTno() {
		return Tno;
	}
	public void setTno(String tno) {
		Tno = tno;
	}
	public String getTime() {
		return Time;
	}
	public void setTime(String time) {
		Time = time;
	}
	public String getTestTime() {
		return TestTime;
	}
	public void setTestTime(String testTime) {
		TestTime = testTime;
	}
	public String getCredit() {
		return Credit;
	}
	public void setCredit(String credit) {
		Credit = credit;
	}
	public String getCollege() {
		return College;
	}
	public void setCollege(String college) {
		College = college;
	} 
	public Course(String Cno, String Cname, String Tno, String Time,String TestTime, String Credit, String College) {
		super();
		this.Cno = Cno;
		this.Cname = Cname;
		this.Tno = Tno;
		this.Time = Time;
		this.TestTime = TestTime;
		this.Credit = Credit;
		this.College = College;
	}

	public Course() {
	}

}
