package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.BookVO;

public interface BookMapper {
	public List<BookVO> bookAllList();
	public List<BookVO> newBookCate(int category);
	public List<BookVO> bookListCateFirst(Map map);
	public int cateFirCount(int book_category);
	public int cateFirTotalPage(int book_category);
	public BookVO detailBook(String book_code);
	public void wishpop(Map map);
	public BookVO purchase(String book_code);
	public void bookCount(Map map);
}
