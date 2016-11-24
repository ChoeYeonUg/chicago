package com.sist.dao;

import java.util.*;

/* Made By Choding */
public class WishlistVO {
	
	private String id;
	private String name;
	private String book_name;
	private String book_code;
	private int amount;
	private int price;
	
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
	
	public String getBook_name() {
		return book_name;
	}
	
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	
	public String getBook_code() {
		return book_code;
	}
	
	public void setBook_code(String book_code) {
		this.book_code = book_code;
	}
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
}
