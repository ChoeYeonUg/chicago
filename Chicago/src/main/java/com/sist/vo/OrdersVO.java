package com.sist.vo;

import java.util.Date;
import java.util.List;

public class OrdersVO {
	private int Order_id;
	private String name;
	private String id;
	private int delivery;
	private int zipcode;
	private String addr;
	private String payment;
	private Date order_date;
	private int total_price;
	private int account_info;
	private String refund_state;
	private String memo;
	private int saving;
	
	public int getSaving() {
		return saving;
	}
	public void setSaving(int saving) {
		this.saving = saving;
	}
	List<OrderBookVO> list;
		
	public List<OrderBookVO> getList() {
		return list;
	}
	public void setList(List<OrderBookVO> list) {
		this.list = list;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	public int getDelivery() {
		return delivery;
	}
	public void setDelivery(int delivery) {
		this.delivery = delivery;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
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
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
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
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
}
