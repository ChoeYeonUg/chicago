package com.sist.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
	// book_code 확인하기
	public boolean goodsBookCode(String book_code);
	
	// 도서관리 추가하기
	public void printSysopBookInsert(BookVO vo, HttpServletRequest req);
	
	// 도서관리 수정하기
	public BookVO printSysopBookUpdate(String book_code);
	public void printSysopBookUpdateData(BookVO vo, HttpServletRequest req);
	
	// 도서관리 상세페이지
	public BookVO printSysopBookDetail(String book_code);
	
	// 상세페이지리뷰게시판
	public List<ReviewVO> bookReviewList(String book_code);

	public void contentReviewinsert(ReviewVO vo);

	public int reviewIdCK(ReviewVO vo);

	public int categoryCount();
	
	//장바구니
	public List<BookVO> printSbList(List<String> list) throws Exception;
}
