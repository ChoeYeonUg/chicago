package com.sist.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sist.dao.BoardVO;
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
	public void secret_insert(Map map) throws Exception {
		mapper.secret_insert(map);
		
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
	public void secret_update(Map map) throws Exception {		
		mapper.secret_update(map);	
		
	}

	

}
