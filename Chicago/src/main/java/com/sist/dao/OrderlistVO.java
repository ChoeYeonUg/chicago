package com.sist.dao;

import java.util.*;

public class OrderlistVO {
	
	private int Order_id;
	private String id;
	private String book_code;
	private String book_name;
	private int amount;
	private int total_price;
	private String payment;
	private Date order_date;
	private int delivery;
	private int account_info;
	private String refund_state;
	private int num;
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	List<OrderBookVO> oblist;
	List<OrdersVO> olist;
	
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
	
	public String getBook_code() {
		return book_code;
	}
	
	public void setBook_code(String book_code) {
		this.book_code = book_code;
	}
	
	public String getBook_name() {
		return book_name;
	}
	
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getTotal_price() {
		return total_price;
	}
	
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	public String getPayment() {
		return payment;
	}
	
	public void setPayment(String payment) {
		this.payment = payment;
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
	
	public int getAccount_info() {
		return account_info;
	}
	
	public void setAccount_info(int account_info) {
		this.account_info = account_info;
	}
	
	public String getRefund_state() {
		return refund_state;
	}
	
	public void setRefund_state(String refund_state) {
		this.refund_state = refund_state;
	}
	
	public List<OrderBookVO> getOblist() {
		return oblist;
	}
	
	public void setOblist(List<OrderBookVO> oblist) {
		this.oblist = oblist;
	}
	
	public List<OrdersVO> getOlist() {
		return olist;
	}
	
	public void setOlist(List<OrdersVO> olist) {
		this.olist = olist;
	}
	
}
