package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.BoardVO;

public interface BoardMapper {
	public List<BoardVO> noticelist(Map map);
	/*public int noticeTotalPage();*/
	public int faqTotalPage();
	public List<BoardVO> faqlist(Map map);
	public List<BoardVO> catfaqlist(Map map);	
	public void notice_insert(Map map);
	public void faq_insert(Map map);
	
}
