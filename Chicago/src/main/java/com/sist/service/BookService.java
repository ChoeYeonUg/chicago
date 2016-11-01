package com.sist.service;

import java.util.List;

import com.sist.dao.BookVO;

public interface BookService {
	public List<BookVO> bookAllList();
	public List<BookVO> newBookCate1();
	public List<BookVO> newBookCate2();
	public List<BookVO> newBookCate3();
	public List<BookVO> newBookCate4();
	
}
