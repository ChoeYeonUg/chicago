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
	public int cateFirCount() {
		return bm.cateFirCount();
	}
	
	@Override
	public int cateFirTotalPage() {
		return bm.cateFirTotalPage();
	}
}
