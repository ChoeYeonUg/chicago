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

	/*@Override
	public List<EventVO> dateCompare(String event_name){
		return em.dateCompare(event_name);
	}	*/
	@Override
	public List<EventVO> compareDate(Map map){
		return em.compareDate(map);
	}
	
	@Override
	public List<EventVO> schedule(Map map) {
		return em.schedule(map);
	}

	@Override
	public int scheduleTotalPage(Map map) {
		return em.scheduleTotalPage();
	}

	@Override
	public List<EventVO> printSysopEvent(Map map) throws Exception {
		// TODO Auto-generated method stub
		return em.printSysopEvent(map);
	}

	@Override
	public int eventTotalPage(int rowSize) throws Exception {
		// TODO Auto-generated method stub
		return em.eventTotalPage(rowSize);
	}

	@Override
	public List<EventVO> printSysopSearchEvent(Map map) throws Exception {
		// TODO Auto-generated method stub
		return em.printSysopSearchEvent(map);
	}

	@Override
	public int eventSearchTotalPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return em.eventSearchTotalPage(map);
	}

	@Override
	public void eventInsert(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		em.eventInsert(vo);
	}

	@Override
	public void eventDelete(int event_no) throws Exception {
		// TODO Auto-generated method stub
		em.eventDelete(event_no);
	}

	@Override
	public EventVO updateEvent(int event_no) throws Exception {
		// TODO Auto-generated method stub
		return em.updateEvent(event_no);
	}

	@Override
	public void updateEventData(EventVO vo) throws Exception {
		// TODO Auto-generated method stub
		em.updateEventData(vo);
	}
	
	
	
}