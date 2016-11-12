package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.WriterVO;

public interface WriterMapper {
	public List<WriterVO> printWriter(Map map);
	public int printWriterTotalPage(Map map);
	public List<WriterVO> printSearchWriter(Map map);
	public int printSearchWriterTotalPage(Map map);
}
