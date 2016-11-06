package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.OrdersVO;

public interface OrdersMapper {
	public int newOrderId();
	public void newOrder(OrdersVO vo);
	public int orderTotalPage(int rowSize);
	public List<OrdersVO> printOrder(Map map);
	public int orderSearchTotalPage(Map map);
	public List<OrdersVO> printSearchOrder(Map map);
	public void deliveryChange(Map map);
}
