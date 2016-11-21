package com.sist.service.impl;

import java.util.*;

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
	public int selectOrderlistTotalPage(Map map) throws Exception {
		return mapper.selectOrderlistTotalPage(map);
	}
	
	@Override
	public List<OrderlistVO> selectOrderlist(Map map) throws Exception {
		return mapper.selectOrderlist(map);
	}
	
	/*@Override
	public int searchOrderlistTotalPage(Map	map) throws Exception {
		return mapper.searchOrderlistTotalPage(map);
	}*/
	
	/*@Override
	public List<OrderlistVO> searchOrderlist(Map map) throws Exception {
		return mapper.searchOrderlist(map);
	}*/

}
