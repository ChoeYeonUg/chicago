package com.sist.dao.mapper;

import java.util.*;

import com.sist.dao.*;

/* Made By Choding */
public interface OrderlistMapper {
	
	public List<OrderlistVO> selectOrderlist(Map map) throws Exception;
	public int selectOrderlistTotalPage(Map map) throws Exception;
	public List<OrderlistVO> searchOrderlist(Map map) throws Exception;
	public int searchOrderlistTotalPage(Map map) throws Exception;
	public List<OrderlistVO> memberOrderlistDetail(Map map) throws Exception;
	
}
