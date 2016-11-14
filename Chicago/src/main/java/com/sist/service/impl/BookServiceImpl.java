package com.sist.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.dao.BookVO;
import com.sist.dao.ReviewVO;
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
	
	@Override
	public BookVO detailBook(String book_code) {
		return bm.detailBook(book_code);
	}
	
	public void wishpop(Map map) {
		bm.wishpop(map);
	}

	@Override
	public BookVO purchase(String book_code) {
		// TODO Auto-generated method stub
		return bm.purchase(book_code);
	}
	
	@Override
	public List<BookVO> getSelect(Map map) {
		return bm.select(map);
	}
	
	//관리자 메뉴
	@Override
	public List<BookVO> printSysopBook(Map map) {
		// TODO Auto-generated method stub
		return bm.printSysopBook(map);
	}

	@Override
	public int printBookTotalPage(int rowSize) {
		// TODO Auto-generated method stub
		return bm.printBookTotalPage(rowSize);
	}

	@Override
	public List<BookVO> printSearchSysopBook(Map map) {
		// TODO Auto-generated method stub
		return bm.printSearchSysopBook(map);
	}

	@Override
	public int printSearchBookTotalPage(Map map) {
		// TODO Auto-generated method stub
		return bm.printSearchBookTotalPage(map);
	}
	
	@Override
	public List<ReviewVO> bookReviewList(String book_code) {
		// TODO Auto-generated method stub
		return bm.bookReviewList(book_code);
	}

	@Override
	public void contentReviewinsert(ReviewVO vo) {
		// TODO Auto-generated method stub
		bm.contentReviewinsert(vo);
	}

	@Override
	public int reviewIdCK(ReviewVO vo) {
		// TODO Auto-generated method stub
		return bm.reviewIdCK(vo);
	}

	@Override
	public int categoryCount() {
		// TODO Auto-generated method stub
		return bm.categoryCount();
	}
}
