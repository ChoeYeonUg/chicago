package com.sist.dao.mapper;

import java.util.*;

import com.sist.dao.*;

/* Made By Choding */
public interface OrderlistMapper {
	
	public int memberOrderlistTotalPage(String id);
	public List<OrderlistVO> selectOrderlist(Map map);
	
	
}
