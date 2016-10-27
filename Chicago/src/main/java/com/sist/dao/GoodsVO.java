package com.sist.dao;

import java.util.Date;

public class GoodsVO {
	private String book_code;
	private String book_name;
	private int book_category;
	private String writer;
	private String publisher;
	private int amount;
	private int out_of_print;
	private int pages;
	private String book_content;
	private int price;
	private Date publication;
	private int writer_no;
	private String img;
	
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
	public int getBook_category() {
		return book_category;
	}
	public void setBook_category(int book_category) {
		this.book_category = book_category;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getOut_of_print() {
		return out_of_print;
	}
	public void setOut_of_print(int out_of_print) {
		this.out_of_print = out_of_print;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public String getBook_content() {
		return book_content;
	}
	public void setBook_content(String book_content) {
		this.book_content = book_content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getPublication() {
		return publication;
	}
	public void setPublication(Date publication) {
		this.publication = publication;
	}
	public int getWriter_no() {
		return writer_no;
	}
	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}
