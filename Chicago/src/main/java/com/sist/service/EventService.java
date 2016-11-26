package com.sist.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sist.vo.EventVO;

public interface EventService {
	public List<EventVO> schedule(Map map);
	public int scheduleTotalPage(Map map);
	public List<EventVO> dayToday(Map map);
//	public List<EventVO> dateCompare(String event_name);
	public List<EventVO> compareDate(Map map);
	public int dayPage(Map map);
	//관리자메뉴
	public List<EventVO> printSysopEvent(Map map) throws Exception;
	public int eventTotalPage(int rowSize) throws Exception;
	public List<EventVO> printSysopSearchEvent(Map map) throws Exception;
	public int eventSearchTotalPage(Map map) throws Exception;
	public void eventInsert(EventVO vo) throws Exception;
	public void eventDelete(int event_no) throws Exception;
	public EventVO updateEvent(int event_no) throws Exception;
	public void updateEventData(EventVO vo) throws Exception;
}
