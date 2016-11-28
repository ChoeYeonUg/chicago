package com.sist.dao.mapper;

import java.util.*;

import com.sist.dao.*;

/* Made By Choding */
public interface OrderlistMapper {
	
	public List<OrderlistVO> selectOrderlist(Map map);
	public int selectOrderlistTotalPage(Map map);
	public List<OrderlistVO> searchOrderlist(Map map);
	public int searchOrderlistTotalPage(Map map);
	public OrderlistVO memberOrderlistDetail(Map map);
	public void changeDeli(int order_id);
	public int totalPrice(String id);
	public void changeGrade(String id);
	public void changeAmount(OrderBookVO vo);
	public void refund(int order_id);
	public void updatePoint(Map map);
	public List<OrderBookVO> cancelBook(int order_id);
	
}
