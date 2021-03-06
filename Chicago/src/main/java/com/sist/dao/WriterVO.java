package com.sist.dao;

import java.util.Date;
import java.util.List;

public class WriterVO {
	private int writer_no;
	private String writer_name;
	private Date birth;
	private Date death;
	private String info;
	private String img;
	private int bookCount;
	
	private List<BookVO> list;	
	
	public List<BookVO> getList() {
		return list;
	}
	public void setList(List<BookVO> list) {
		this.list = list;
	}
	public int getBookCount() {
		return bookCount;
	}
	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getWriter_no() {
		return writer_no;
	}
	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Date getDeath() {
		return death;
	}
	public void setDeath(Date death) {
		this.death = death;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
}
