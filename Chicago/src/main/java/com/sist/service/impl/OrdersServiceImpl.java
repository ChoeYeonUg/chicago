package com.sist.service.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.dao.OrderBookVO;
import com.sist.dao.OrdersVO;
import com.sist.dao.mapper.BookMapper;
import com.sist.dao.mapper.OrderBookMapper;
import com.sist.dao.mapper.OrdersMapper;
import com.sist.service.OrdersService;

@Transactional(propagation = Propagation.REQUIRED,rollbackFor={Exception.class})
@Service("ordersService")
public class OrdersServiceImpl implements OrdersService{
	
	@Resource(name="ordersMapper")
	private OrdersMapper om;
	
	@Resource(name="orderBookMapper")
	private OrderBookMapper obm;
	
	@Resource(name="bookMapper")
	private BookMapper bm;
	
	
	@Override
	public void orderProcess(String[] bookList, int[] bookCount, OrdersVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		int order_id = om.newOrderId();
		vo.setOrder_id(order_id);
		
		om.newOrder(vo);
		
		if(bookList.length != bookCount.length) throw new Exception();		
		
		for(int i=0; i < bookList.length ;i++){
			OrderBookVO obVO = new OrderBookVO();
			obVO.setAmount(bookCount[i]);
			obVO.setBook_code(bookList[i]);
			obVO.setOrder_id(order_id);
			obm.insertOrBk(obVO);
			
			Map map = new HashMap();
			map.put("book_code", bookList[i]);
			map.put("amount", bookCount[i]);
			bm.bookCount(map);
		}
		
	}


	@Override
	public int orderTotalPage(int rowSize) {
		// TODO Auto-generated method stub
		return om.orderTotalPage(rowSize);
	}


	@Override
	public List<OrdersVO> printOrder(Map map) {
		// TODO Auto-generated method stub
		return om.printOrder(map);
	}


	@Override
	public int orderSearchTotalPage(Map map) {
		// TODO Auto-generated method stub
		return om.orderSearchTotalPage(map);
	}


	@Override
	public List<OrdersVO> printSearchOrder(Map map) {
		// TODO Auto-generated method stub
		return om.printSearchOrder(map);
	}

}
