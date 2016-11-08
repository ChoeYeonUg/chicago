package com.sist.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sist.dao.BoardVO;
import com.sist.dao.ReviewVO;
import com.sist.dao.mapper.BoardMapper;
import com.sist.dao.mapper.MemberMapper;
import com.sist.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService{	

	@Resource(name="boardMapper")
	private BoardMapper mapper;

	@Override
	public List<BoardVO> noticeboard_ListData(Map map) throws Exception {		
		List<BoardVO> list=mapper.noticelist(map);		
		return list;
	}

	@Override
	public int boardTotalPage(Map map) throws Exception {
		return mapper.totalPage(map);
	}
	

	@Override
	public int faqtotalListPage(int faq_category) throws Exception {		
		return mapper.faqtotalListPage(faq_category);
	}

	
	@Override
	public int faq_boardTotalPage() throws Exception {
		return mapper.faqTotalPage();
	}

	@Override
	public int faq_CatboardTotalPage(int faq_category) throws Exception {		
		return  mapper.faqCatTotalPage(faq_category);
	}

	
	@Override
	public List<BoardVO> faqboard_AllListData(Map map) throws Exception {
		List<BoardVO> list=mapper.faqlist(map);		
		return list;
	}

	@Override
	public List<BoardVO> faqboard_CatListData(Map map) throws Exception {
		return mapper.catfaqlist(map);
	}
	
	@Override
	public void notice_insert(Map map) throws Exception {
		mapper.notice_insert(map);
	}

	@Override
	public void faq_insert(Map map) throws Exception {
		mapper.faq_insert(map);		
	}

	@Override
	public List<BoardVO> secretboard_ListData(Map map) throws Exception {
		List<BoardVO> list=mapper.secretlist(map);		
		return list;
	}

	@Override
	public void secret_insert(BoardVO vo) throws Exception {
		mapper.secret_insert(vo);
		
	}

	@Override
	public BoardVO secretboard_Content(int board_no) throws Exception {		
		mapper.hitIncrement(board_no);				
		return mapper.secret_content(board_no); 
	}

	@Override
	public String getPwd(int board_no) throws Exception {		
		return mapper.getPwd(board_no);		 				
	}

	@Override
	public void secret_update(BoardVO vo) throws Exception {		
		mapper.secret_update(vo);			
	}

	@Override
	public List<BoardVO> secret_find(Map map) throws Exception {
		List<BoardVO> list=mapper.secret_find(map);		
		return list;
	}

	@Override
	public int secret_find_total(Map map) throws Exception {		
		return mapper.secret_find_total(map);
	}

	@Override
	public void board_delete(int board_no) throws Exception {		
		BoardVO vo=mapper.board_deleteData(board_no);
		if(vo.getDepth()==0){
			mapper.board_delete(board_no);
		}else{
			mapper.secret_admin_delete(board_no);
		}		
	}

	@Override
	public BoardVO secret_parentData(int board_no) throws Exception {		
		BoardVO pvo=mapper.secret_parentData(board_no);
		mapper.secret_stepIncrement(pvo);		
		return pvo;
	}	

	@Override
	public void secret_replyInsert(BoardVO vo) throws Exception {
		mapper.secret_replyInsert(vo);
	}

	@Override
	public void secret_depthIncrement(int board_no) throws Exception {
		mapper.secret_depthIncrement(board_no);
	}

	///////////////////////////////////////////////////////////////////////////////////
	////////////////////////////관리자

	@Override
	public List<BoardVO> printSysopBoard(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mapper.printSysopBoard(map);
	}

	@Override
	public int printboardTotalPage(int rowSize) throws Exception {
		// TODO Auto-generated method stub
		return mapper.printboardTotalPage(rowSize);
	}

	@Override
	public List<BoardVO> printSearchSysopBoard(Map map) {
		// TODO Auto-generated method stub
		return mapper.printSearchSysopBoard(map);
	}

	@Override
	public int printSearchBoardTotalPage(Map map) {
		// TODO Auto-generated method stub
		return mapper.printSearchBoardTotalPage(map);
	}

	@Override
	public BoardVO boardManagementContent(int board_no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.boardManagementContent(board_no);
	}

	
	@Override
	public List<ReviewVO> printSysopReviewBoard(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mapper.printSysopReviewBoard(map);
	}

	@Override
	public int printboardReviewTotalPage(int rowSize) throws Exception {
		// TODO Auto-generated method stub
		return mapper.printboardReviewTotalPage(rowSize);
	}

	@Override
	public List<ReviewVO> printSearchReviewSysopBoard(Map map) {
		// TODO Auto-generated method stub
		return mapper.printSearchReviewSysopBoard(map);
	}

	@Override
	public int printSearchReviewBoardTotalPage(Map map) {
		// TODO Auto-generated method stub
		return mapper.printSearchReviewBoardTotalPage(map);
	}

	@Override
	public void board_reviewManagement_delete(int review_no) throws Exception {
		mapper.board_reviewManagement_delete(review_no);		
	}

	@Override
	public ReviewVO boardManagementReviewContent(int review_no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.boardManagementReviewContent(review_no);
	}


	
	
}
