package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.BookVO;
import com.sist.dao.ReviewVO;

public interface BookMapper {
	public List<BookVO> bookAllList();

	public List<BookVO> newBookCate(int category);

	public List<BookVO> bookListCateFirst(Map map);

	// 카테고리 별 리스트
	public int cateFirCount(int book_category);

	public int cateFirTotalPage(int book_category);

	// 도서 상세 페이지
	public BookVO detailBook(String book_code);

	public void wishpop(Map map);

	// 도서 상세페이지 내 검색기능
	public List<BookVO> select(Map map);

	public int selectTotal(Map map);

	// 도서관리자 메뉴
	public List<BookVO> printSysopBook(Map map);

	public int printBookTotalPage(int rowSize);

	public List<BookVO> printSearchSysopBook(Map map);

	public int printSearchBookTotalPage(Map map);
	
	// 관리자 페이지 insert에서 book_code 확인하기
	public int codeCheck(String book_code);
	
	// 도서 관리자 추가하기 
	public void printSysopBookInsert(BookVO vo);
	
	// 도서 관리자 수정하기
	public BookVO printSysopBookUpdate(String book_code);
	public void printSysopBookUpdateData(BookVO vo);
	
	// 도서 관리자 상세 페이지
	public BookVO printSysopBookDetail(String book_code);
	
	// 바로구매 페이지 
	public BookVO purchase(String book_code);

	public void bookCount(Map map);

	// 상세페이지리뷰게시판
	public List<ReviewVO> bookReviewList(String book_code);

	public void contentReviewinsert(ReviewVO vo);

	public int reviewIdCK(ReviewVO vo);

	public int categoryCount();
	
	//장바구니
	public BookVO printSbList(String book_code);
}
