package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.dao.BookVO;
import com.sist.dao.ReviewVO;

public interface BookService {
	public List<BookVO> bookAllList();

	public List<BookVO> newBookCate(int category);

	public List<BookVO> bookListCateFirst(Map map);

	// 카테고리별 리스트
	public int cateFirCount(int book_category);

	public int cateFirTotalPage(int book_category);

	// 상세 페이지
	public BookVO detailBook(String book_code);

	/* public void wishpop(Map map); */ // 위시리스트 팝업 창 기능 --> 삭제함
	public BookVO purchase(String book_code);

	// 검색기능
	public List<BookVO> getSelect(Map map);

	public int getSelectTotal(Map map);

	// 도서관리
	public List<BookVO> printSysopBook(Map map);

	public int printBookTotalPage(int rowSize);

	public List<BookVO> printSearchSysopBook(Map map);

	public int printSearchBookTotalPage(Map map);
	
	// 도서관리 상세페이지
	public BookVO printSysopBookDetail(String book_code);
	
	// 도서관리 수정페이지
	public void printSysopBookUpdate(BookVO vo);

	// 상세페이지리뷰게시판
	public List<ReviewVO> bookReviewList(String book_code);

	public void contentReviewinsert(ReviewVO vo);

	public int reviewIdCK(ReviewVO vo);

	public int categoryCount();
}
