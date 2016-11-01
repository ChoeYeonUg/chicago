package com.sist.dao.mapper;

import java.util.List;

import com.sist.dao.BookVO;

public interface BookMapper {
	public List<BookVO> bookAllList();
	public List<BookVO> newBookCate1();
	public List<BookVO> newBookCate2();
	public List<BookVO> newBookCate3();
	public List<BookVO> newBookCate4();
}
