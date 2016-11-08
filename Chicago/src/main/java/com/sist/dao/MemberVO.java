package com.sist.dao;
/*
 *	CREATE TABLE member1(
 *	id VARCHAR2(20),
 *	pwd VARCHAR2(16) CONSTRAINT member_pwd_nn NOT NULL,
 *	name VARCHAR2(20) CONSTRAINT member_name_nn NOT NULL,
 *	addr VARCHAR2(100),
 *	zipcode NUMBER,
 *	phone VARCHAR2(15) CONSTRAINT member_phone_nn NOT NULL,
 *	gender NUMBER(1) CONSTRAINT member_gender_ck CHECK(gender IN(1,2)),
 *	email VARCHAR2(50),
 *	point NUMBER(10) DEFAULT 0,
 *	grade NUMBER(1) DEFAULT 5,
 *	CONSTRAINT member_id_pk PRIMARY KEY(id)
 *	);
 */
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String addr;
	private int zipcode;
	private String phone;
	private int gender;
	private String email;
	private int point;
	private int grade;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public int getZipcode() {
		return zipcode;
	}
	
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public int getGender() {
		return gender;
	}
	
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getPoint() {
		return point;
	}
	
	public void setPoint(int point) {
		this.point = point;
	}
	
	public int getGrade() {
		return grade;
	}
	
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
