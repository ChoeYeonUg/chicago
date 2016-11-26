package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.vo.BoardVO;
import com.sist.vo.ReviewVO;

public interface BoardMapper {
	/*공지사항 리스트*/
	public List<BoardVO> noticelist(Map map);	
	/*카테고리별 토탈페이지 다 받음*/
	public int totalPage(Map map);
	/*faq보드 내의 카테고리별 토탈페이지를 받음*/
	public int faqtotalListPage(int faq_category); 
	/*faq보드 총 건수*/
	public int faqTotalPage();
	/*faq보드 내의 카테고리별 건수*/
	public int faqCatTotalPage(int faq_category);
	public List<BoardVO> faqlist(Map map);
	public List<BoardVO> catfaqlist(Map map);	
	public void notice_insert(Map map);
	public void faq_insert(Map map);
	public void secret_insert(BoardVO vo);
	/*1:1게시판 리스트*/
	public List<BoardVO> secretlist(Map map);	
	public void hitIncrement(int board_no);
	public BoardVO secret_content(int board_no);
	public String getPwd(int board_no);
	public void secret_update(BoardVO vo);
	public List<BoardVO> secret_find(Map map);
	public int secret_find_total(Map map);
	public BoardVO board_deleteData(int board_no);
	public void board_delete(int board_no);
	public void secret_admin_delete(int board_no);
	public BoardVO secret_parentData(int board_no);
	public void secret_stepIncrement(BoardVO vo);
	public void secret_replyInsert(BoardVO vo);
	public void secret_depthIncrement(int board_no);
	public String idMine(Map map);
	public void insertMine(Map map);
	
	//관리자 전용 메뉴	
	public List<BoardVO> printSysopBoard(Map map);
	public int printboardTotalPage(int rowSize);
	public List<BoardVO> printSearchSysopBoard(Map map);
	public int printSearchBoardTotalPage(Map map);
	public BoardVO boardManagementContent(int board_no);
	
	public List<ReviewVO> printSysopReviewBoard(Map map);
	public int printboardReviewTotalPage(int rowSize);
	public List<ReviewVO> printSearchReviewSysopBoard(Map map);
	public int printSearchReviewBoardTotalPage(Map map);
	public void board_reviewManagement_delete(int review_no);
	public ReviewVO boardManagementReviewContent(int review_no);
	
	//리뷰게시판
	public List<ReviewVO> reviewlist(Map map);
	public int totalReviewPage(Map map);
	public List<ReviewVO> review_find(Map map);
	public int review_find_total(Map map);
	
}	
