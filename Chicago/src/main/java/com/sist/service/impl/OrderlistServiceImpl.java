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
	public List<OrderlistVO> selectOrderlist(Map map) throws Exception {
		return mapper.selectOrderlist(map);
	}
	
	@Override
	public int selectOrderlistTotalPage(Map map) throws Exception {
		return mapper.selectOrderlistTotalPage(map);
	}
	
	@Override
	public List<OrderlistVO> searchOrderlist(Map map) throws Exception {
		return mapper.searchOrderlist(map);
	}
	
	@Override
	public int searchOrderlistTotalPage(Map	map) throws Exception {
		return mapper.searchOrderlistTotalPage(map);
	}
	
	@Override
	public OrderlistVO memberOrderlistDetail(Map map) throws Exception {
		return mapper.memberOrderlistDetail(map);
	}

	@Override
	public void deliOk(int order_id,int grade, String id) throws Exception {
		// TODO Auto-generated method stub
		
		mapper.changeDeli(order_id);
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("order_id", order_id);
		mapper.updatePoint(map);
		
		int total = mapper.totalPrice(id);
		if(total > 100000 && grade==5){
			mapper.changeGrade(id);
		}
		
		
	}

	@Override
	public void cancelOrder(int order_id) throws Exception {
		// TODO Auto-generated method stub
		mapper.refund(order_id);
		mapper.changeDeli(order_id);
		
		List<OrderBookVO> list = mapper.cancelBook(order_id);
		for(OrderBookVO vo : list){
			mapper.changeAmount(vo);
		}
		
		
	}

}
