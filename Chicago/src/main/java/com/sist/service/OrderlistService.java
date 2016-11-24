package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.dao.*;

public interface OrderlistService {
	
	public List<OrderlistVO> selectOrderlist(Map map) throws Exception;
	public int selectOrderlistTotalPage(Map map) throws Exception;
	public List<OrderlistVO> searchOrderlist(Map map) throws Exception;
	public int searchOrderlistTotalPage(Map map) throws Exception;
	public List<OrderlistVO> memberOrderlistDetail(Map map) throws Exception;
	
}
