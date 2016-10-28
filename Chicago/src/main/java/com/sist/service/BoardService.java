package com.sist.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.sist.dao.BoardVO;

public interface BoardService {
	public List<BoardVO> noticeboard_ListData(Map map) throws Exception;
	public void notice_insert(Map map) throws Exception;
	/*	public int notice_boardTotalPage() throws Exception;*/
	public int faq_boardTotalPage() throws Exception;
	public List<BoardVO> faqboard_AllListData(Map map) throws Exception;
	public List<BoardVO> faqboard_CatListData(Map map) throws Exception;
	
	public void faq_insert(Map map) throws Exception;
}
	