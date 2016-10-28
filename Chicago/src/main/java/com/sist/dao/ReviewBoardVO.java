package com.sist.dao;

import java.util.Date;

public class ReviewBoardVO {
	private int rv_no;
	private String rv_id;
	private String rv_bookcode;
	private String rv_subject;
	private String rv_content;
	private int rv_score;
	private Date rv_date;
	public int getRv_no() {
		return rv_no;
	}
	public void setRv_no(int rv_no) {
		this.rv_no = rv_no;
	}
	public String getRv_id() {
		return rv_id;
	}
	public void setRv_id(String rv_id) {
		this.rv_id = rv_id;
	}
	public String getRv_bookcode() {
		return rv_bookcode;
	}
	public void setRv_bookcode(String rv_bookcode) {
		this.rv_bookcode = rv_bookcode;
	}
	public String getRv_subject() {
		return rv_subject;
	}
	public void setRv_subject(String rv_subject) {
		this.rv_subject = rv_subject;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public int getRv_score() {
		return rv_score;
	}
	public void setRv_score(int rv_score) {
		this.rv_score = rv_score;
	}
	public Date getRv_date() {
		return rv_date;
	}
	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}
	
}
