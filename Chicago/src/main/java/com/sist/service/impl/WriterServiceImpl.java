package com.sist.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.dao.WriterVO;
import com.sist.dao.mapper.WriterMapper;
import com.sist.service.WriterService;

@Service("writerService")
public class WriterServiceImpl implements WriterService{
	
	@Resource(name="writerMapper")
	private WriterMapper wm;
	
	@Override
	public List<WriterVO> printWriter(int book_category) throws Exception {
		// TODO Auto-generated method stub
		return wm.printWriter(book_category);
	}
	
}
