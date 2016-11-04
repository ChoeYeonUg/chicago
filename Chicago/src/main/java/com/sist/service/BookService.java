package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.dao.BookVO;

public interface BookService {
	public List<BookVO> bookAllList();
	public List<BookVO> newBookCate(int category);
	public List<BookVO> bookListCateFirst(Map map);
	public int cateFirCount(int book_category);
	public int cateFirTotalPage(int book_category);
}
