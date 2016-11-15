package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.dao.EventVO;

public interface EventMapper {
	public List<EventVO> schedule(Map map);
	public int scheduleTotalPage();
}
