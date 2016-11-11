package com.sist.dao.mapper;

import java.util.List;

import com.sist.dao.WriterVO;

public interface WriterMapper {
	public List<WriterVO> printWriter(int book_category);
}
