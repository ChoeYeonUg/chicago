package com.sist.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.dao.BookVO;
import com.sist.dao.mapper.BookMapper;
import com.sist.service.BookService;

@Service("bookService")
public class BookServiceImpl implements BookService{
	@Resource(name="bookMapper")
	private BookMapper bm;
	
	@Override
	public List<BookVO> bookAllList() {
		return bm.bookAllList();
	}
	
	@Override
	public List<BookVO> newBookCate(int category) {
		return bm.newBookCate(category);
	}

	@Override
	public List<BookVO> bookListCateFirst(Map map) {
		return bm.bookListCateFirst(map);
	}
	
	@Override
	public int cateFirCount(int book_category) {
		return bm.cateFirCount(book_category);
	}
	
	@Override
	public int cateFirTotalPage(int book_category) {
		return bm.cateFirTotalPage(book_category);
	}
}
