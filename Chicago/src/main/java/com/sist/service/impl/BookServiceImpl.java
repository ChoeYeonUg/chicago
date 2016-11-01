package com.sist.service.impl;

import java.util.List;

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
	public List<BookVO> newBookCate1() {
		return bm.newBookCate1();
	}
	@Override
	public List<BookVO> newBookCate2() {
		return bm.newBookCate2();
	}
	@Override
	public List<BookVO> newBookCate3() {
		return bm.newBookCate3();
	}
	@Override
	public List<BookVO> newBookCate4() {
		return bm.newBookCate4();
	}
}
