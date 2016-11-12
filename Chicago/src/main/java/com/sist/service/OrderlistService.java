package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.dao.*;

public interface OrderlistService {
	
	public List<OrderlistVO> selectOrderlist(Map map) throws Exception;
	
}
