package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.sist.dao.BoardVO;
import com.sist.dao.ReviewVO;

import oracle.net.aso.e;

public interface BoardService {
	//공통
	public int boardTotalPage(Map map) throws Exception;
	public void board_delete(int board_no) throws Exception;
	//공지사항
	public List<BoardVO> noticeboard_ListData(Map map) throws Exception;	
	public void notice_insert(Map map) throws Exception;	
	//FAQ게시판
	public void secret_insert(BoardVO vo) throws Exception;
	public int faqtotalListPage(int faq_category) throws Exception;
	public int faq_boardTotalPage() throws Exception;
	public int faq_CatboardTotalPage(int faq_category) throws Exception;
	public List<BoardVO> faqboard_AllListData(Map map) throws Exception;
	public List<BoardVO> faqboard_CatListData(Map map) throws Exception;
	public void faq_insert(Map map) throws Exception;		
	//1:1게시판
	public List<BoardVO> secretboard_ListData(Map map) throws Exception;
	public BoardVO secretboard_Content(int board_no) throws Exception; 
	public String getPwd(int board_no) throws Exception;
	public void secret_update(BoardVO vo) throws Exception;
	public List<BoardVO> secret_find(Map map) throws Exception;
	public int secret_find_total(Map map) throws Exception;	
	public BoardVO secret_parentData(int board_no) throws Exception;
	public void secret_replyInsert(BoardVO vo) throws Exception;
	public void secret_depthIncrement(int board_no) throws Exception;
	public String idMine(Map map) throws Exception;
	public void insertMine(Map map) throws Exception;
	
	//관리자 전용 메뉴
	public List<BoardVO> printSysopBoard(Map map) throws Exception;
	public int printboardTotalPage(int rowSize) throws Exception;
	public List<BoardVO> printSearchSysopBoard(Map map);
	public int printSearchBoardTotalPage(Map map);
	public BoardVO boardManagementContent(int board_no) throws Exception;
	
	public List<ReviewVO> printSysopReviewBoard(Map map) throws Exception;
	public int printboardReviewTotalPage(int rowSize) throws Exception;
	public List<ReviewVO> printSearchReviewSysopBoard(Map map);
	public int printSearchReviewBoardTotalPage(Map map);
	public void board_reviewManagement_delete(int review_no) throws Exception;
	public ReviewVO boardManagementReviewContent(int review_no) throws Exception;
	
	//리뷰게시판
	public List<ReviewVO> reviewlist(Map map) throws Exception;
	public int totalReviewPage(Map map) throws Exception;
	public List<ReviewVO> review_find(Map map) throws Exception;
	public int review_find_total(Map map) throws Exception;

}
	