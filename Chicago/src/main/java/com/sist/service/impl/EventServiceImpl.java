package com.sist.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sist.dao.EventVO;
import com.sist.dao.mapper.EventMapper;
import com.sist.service.EventService;

@Service("eventService")
public class EventServiceImpl implements EventService{
	@Resource(name="eventMapper")
	private EventMapper em;

	@Override
	public List<EventVO> schedule(Map map) {
		return em.schedule(map);
	}

	@Override
	public int scheduleTotalPage(Map map) {
		return em.scheduleTotalPage();
	}
	
	
	
}