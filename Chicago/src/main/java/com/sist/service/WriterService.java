package com.sist.service;

import java.util.List;

import com.sist.dao.WriterVO;

public interface WriterService {
	public List<WriterVO> printWriter(int book_category) throws Exception;
}
