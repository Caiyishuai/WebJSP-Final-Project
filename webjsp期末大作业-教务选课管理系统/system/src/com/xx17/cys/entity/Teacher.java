package com.xx17.cys.entity;

public class Teacher {
	
	private String Tno;
	private String Tname;
	private String Tg;
	private String Tc;
	private String Tcode;
	
	
	public String getTno() {
		return Tno;
	}
	public void setTno(String tno) {
		Tno = tno;
	}
	public String getTname() {
		return Tname;
	}
	public void setTname(String tname) {
		Tname = tname;
	}
	public String getTg() {
		return Tg;
	}
	public void setTg(String tg) {
		Tg = tg;
	}
	public String getTc() {
		return Tc;
	}
	public void setTc(String tc) {
		Tc = tc;
	}

	public String getTcode() {
		return Tcode;
	}
	
	public void setScode(String scode) {
		Tcode = scode;
	}
	
	public Teacher(String a, String b, String c, String d,String e) {
		super();
		this.Tno = a;
		this.Tname = b;
		this.Tg = c;
		this.Tc = d;
		this.Tcode = e;
	}
	
	public Teacher() {
	}
	

}
