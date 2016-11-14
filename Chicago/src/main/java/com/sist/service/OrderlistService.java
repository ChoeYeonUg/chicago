package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.dao.*;

public interface OrderlistService {
	
	public int memberOrderlistTotalPage(String id) throws Exception;
	public List<OrderlistVO> selectOrderlist(Map map) throws Exception;
	
}
