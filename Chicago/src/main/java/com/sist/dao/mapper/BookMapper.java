package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.BookVO;
import com.sist.dao.ReviewVO;

public interface BookMapper {
	public List<BookVO> bookAllList();
	public List<BookVO> newBookCate(int category);
	public List<BookVO> bookListCateFirst(Map map);
	public int cateFirCount(int book_category);
	public int cateFirTotalPage(int book_category);
	public BookVO detailBook(String book_code);
	public void wishpop(Map map);
	//검색기능
	public List<BookVO> select(Map map);
	//관리자
	public List<BookVO> printSysopBook(Map map);
	public int printBookTotalPage(int rowSize);
	public List<BookVO> printSearchSysopBook(Map map);
	public int printSearchBookTotalPage(Map map);

	public BookVO purchase(String book_code);	
	public void bookCount(Map map);	
	
	//상세페이지리뷰게시판
	public List<ReviewVO> bookReviewList(String book_code);
	public void contentReviewinsert(ReviewVO vo);
	public int reviewIdCK(ReviewVO vo);
}
