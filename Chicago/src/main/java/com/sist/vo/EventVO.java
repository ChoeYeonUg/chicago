package com.sist.vo;

import java.util.Date;

public class EventVO {
	private int event_no;
	private String event_name;
	private String store_name;
	private Date start_day;
	private Date end_day;
	private String description;
	private String dbday;
	private Date stday;
	public Date getStday() {
		return stday;
	}
	public void setStday(Date stday) {
		this.stday = stday;
	}
	public Date getEdday() {
		return edday;
	}
	public void setEdday(Date edday) {
		this.edday = edday;
	}
	private Date edday;
	
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public Date getStart_day() {
		return start_day;
	}
	public void setStart_day(Date start_day) {
		this.start_day = start_day;
	}
	public Date getEnd_day() {
		return end_day;
	}
	public void setEnd_day(Date end_day) {
		this.end_day = end_day;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
