package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.dao.OrdersVO;

public interface OrdersService {
	public void orderProcess(String[] bookList, int[] bookCount, OrdersVO vo) throws Exception;
	public int orderTotalPage(int rowSize);
	public List<OrdersVO> printOrder(Map map);
	public int orderSearchTotalPage(Map map);
	public List<OrdersVO> printSearchOrder(Map map);
	public void deliveryChange(Map map);
}
