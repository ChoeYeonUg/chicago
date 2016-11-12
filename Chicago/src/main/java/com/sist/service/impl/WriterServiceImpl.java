package com.sist.service.impl;

import java.util.List;
import java.util.Map;

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
	public List<WriterVO> printWriter(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.printWriter(map);
	}

	@Override
	public int printWriterTotalPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.printWriterTotalPage(map);
	}

	@Override
	public List<WriterVO> printSearchWriter(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.printSearchWriter(map);
	}

	@Override
	public int printSearchWriterTotalPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.printSearchWriterTotalPage(map);
	}
	
}
