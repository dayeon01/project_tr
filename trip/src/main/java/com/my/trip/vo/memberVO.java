package com.my.trip.vo;


public class memberVO {

	private int mno, mailaddr;
	private String name, id, pw, tel, mail, addr1, addr2, addr3, jdate;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public int getMailaddr() {
		return mailaddr;
	}
	public void setMailaddr(int mailaddr) {
		this.mailaddr = mailaddr;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	
	public String getJdate() {
		return jdate;
	}
	public void setJdate(String jdate) {
		this.jdate = jdate;
	}
	/*
	 * public String setStrDate(Date d) { return new
	 * SimpleDateFormat("yyyy/MM/dd").format(d); } public String getJoindate() {
	 * return joindate; } public void setJoindate(String jdate) { joindate = jdate;
	 * } public Date getJdate() { return jdate; } public void setJdate(Date jdate) {
	 * this.jdate = jdate; }
	 */
	@Override
	public String toString() {
		return "joinVO [mno=" + mno + ", name=" + name + ", id=" + id + ", pw=" + pw + ", tel=" + tel + ", mail=" + mail
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3  + ", jdate="
				+ jdate + "]";
	}
	
	
	
	
}
