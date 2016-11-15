package com.sist.service;

import java.util.List;
import java.util.Map;

import com.sist.dao.EventVO;

public interface EventService {
	public List<EventVO> schedule(Map map);
	public int scheduleTotalPage(Map map);
}
