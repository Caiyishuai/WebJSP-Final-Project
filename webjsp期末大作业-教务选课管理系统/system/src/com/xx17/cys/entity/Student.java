package com.xx17.cys.entity;

public class Student {
	private String Sno;
	private String Sname;
	private String Sgender;
	private String Sdept;
	private String Sgrade;
	private String Sbirth;
	private String Sphone;
	private String Scode;

	public String getSno() {
		return Sno;
	}

	public void setSno(String sno) {
		Sno = sno;
	}

	public String getSname() {
		return Sname;
	}

	public void setSname(String sname) {
		Sname = sname;
	}

	public String getSgender() {
		return Sgender;
	}

	public void setSgender(String sgender) {
		Sgender = sgender;
	}

	public String getSdept() {
		return Sdept;
	}

	public void setSdept(String sdept) {
		Sdept = sdept;
	}

	public String getSgrade() {
		return Sgrade;
	}

	public void setSgrade(String sgrade) {
		Sgrade = sgrade;
	}

	public String getSbirth() {
		return Sbirth;
	}

	public void setSbirth(String sbirth) {
		Sbirth = sbirth;
	}

	public String getSphone() {
		return Sphone;
	}

	public void setSphone(String sphone) {
		Sphone = sphone;
	}

	public String getScode() {
		return Scode;
	}
	
	public void setScode(String scode) {
		Scode = scode;
	}
	
	public Student(String Sno, String Sname, String Sgender, String Sdept,String Sgrade, String Sbirth, String Sphone,String Scode) {
		super();
		this.Sno = Sno;
		this.Sname = Sname;
		this.Sgender = Sgender;
		this.Sgrade = Sgrade;
		this.Sdept = Sdept;
		this.Sbirth = Sbirth;
		this.Sphone = Sphone;
		this.Scode = Scode;
	}

	public Student() {
		
	}

}
