package com.sist.dao.mapper;

import java.util.*;

import com.sist.dao.*;

/* Made By Choding */
public interface OrderlistMapper {
	
	public List<OrderlistVO> selectOrderlist(Map map);
	public int selectOrderlistTotalPage(Map map);
	public List<OrderlistVO> searchOrderlist(Map map);
	public int searchOrderlistTotalPage(Map map);
	public List<OrderlistVO> memberOrderlistDetail(Map map);
	
}
