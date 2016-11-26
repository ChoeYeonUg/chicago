package com.sist.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sist.vo.WriterVO;

public interface WriterService {
	public List<WriterVO> printWriter(Map map) throws Exception;
	public int printWriterTotalPage(Map map) throws Exception;
	public List<WriterVO> printSearchWriter(Map map) throws Exception;
	public int printSearchWriterTotalPage(Map map) throws Exception;
	public WriterVO detailWriter(int writer_no) throws Exception;
	
	//관리자메뉴
	public List<WriterVO> printSysopWriter(Map map) throws Exception;
	public int writerTotalPage(int rowSize) throws Exception;
	public List<WriterVO> printSysopSearchWriter(Map map) throws Exception;
	public int writerSearchTotalPage(Map map) throws Exception;
	public void writerInsert(WriterVO vo, HttpServletRequest req) throws Exception;
	public void writerDelete(int writer_no) throws Exception;
	public WriterVO updateWriter(int writer_no) throws Exception;
	public void updateWriterData(WriterVO vo, HttpServletRequest req) throws Exception;
}
