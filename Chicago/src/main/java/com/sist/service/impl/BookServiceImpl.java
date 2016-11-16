package com.sist.service.impl;

import java.util.ArrayList;
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
	
	@Override
	public int getSelectTotal(Map map) {
		return bm.selectTotal(map);			
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
	
	// 도서관리 추가하기
	@Override
	public void printSysopBookInsert(Map map) {
		bm.printSysopBookInsert(map);
	}
	
	// 도서관리 수정하기
	@Override
	public void printSysopBookUpdate(BookVO vo) {
		bm.printSysopBookUpdate(vo);
	}
	
	// 도서관리 상세페이지
	@Override
	public BookVO printSysopBookDetail(String book_code) {
		return bm.printSysopBookDetail(book_code);
	}
	
	// 리뷰 게시판
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

	@Override
	public List<BookVO> printSbList(List<String> list)throws Exception{
		// TODO Auto-generated method stub
		List<BookVO> bookList = new ArrayList<BookVO>();
		
		for(String book_code : list){
			BookVO vo = bm.printSbList(book_code);
			bookList.add(vo);
		}
		
		return bookList;
	}
}
