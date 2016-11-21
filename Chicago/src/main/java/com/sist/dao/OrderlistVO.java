package com.sist.dao;

import java.util.*;

/* Made By Choding */
public class OrderlistVO {
	
	private int Order_id;
	private String id;
	private String name;
	private int total_price;
	private Date order_date;
	private int delivery;
	private String refund_state;
	private int cnt;
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	List<BookVO> bList;
	
	public int getOrder_id() {
		return Order_id;
	}
	
	public void setOrder_id(int order_id) {
		Order_id = order_id;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getTotal_price() {
		return total_price;
	}
	
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	public Date getOrder_date() {
		return order_date;
	}
	
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	public int getDelivery() {
		return delivery;
	}
	
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	
	public String getRefund_state() {
		return refund_state;
	}
	
	public void setRefund_state(String refund_state) {
		this.refund_state = refund_state;
	}
	
	public List<BookVO> getbList() {
		return bList;
	}
	
	public void setbList(List<BookVO> bList) {
		this.bList = bList;
	}
	
}
