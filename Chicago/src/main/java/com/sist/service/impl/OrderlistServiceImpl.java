package com.sist.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.dao.mapper.*;
import com.sist.service.*;

/* Made By Choding */
@Service("orderlistService")
public class OrderlistServiceImpl implements OrderlistService{
	
	@Resource(name="orderlistMapper")
	private OrderlistMapper mapper;
	
	@Override
	public int memberOrderlistTotalPage(int rowSize) throws Exception {
		return mapper.memberOrderlistTotalPage(rowSize);
	}
	
	@Override
	public List<OrderlistVO> selectOrderlist(Map map) throws Exception {
		return mapper.selectOrderlist(map);
	}
	

	

}
