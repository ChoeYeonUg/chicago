package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.WriterVO;

public interface WriterMapper {
	public List<WriterVO> printWriter(Map map);
	public int printWriterTotalPage(Map map);
	public List<WriterVO> printSearchWriter(Map map);
	public int printSearchWriterTotalPage(Map map);
	public WriterVO detailWriter(int writer_no);
	//관리자메뉴
	public List<WriterVO> printSysopWriter(Map map);
	public int writerTotalPage(int rowSize);
	public List<WriterVO> printSysopSearchWriter(Map map);
	public int writerSearchTotalPage(Map map);
}
