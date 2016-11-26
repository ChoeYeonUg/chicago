package com.sist.dao.mapper;

import java.util.List;
import java.util.Map;

import com.sist.vo.EventVO;
import com.sist.vo.WriterVO;

public interface EventMapper {
	public List<EventVO> schedule(Map map);
	public int scheduleTotalPage();
//	public List<EventVO> dateCompare(String event_name);
	public List<EventVO> compareDate(Map map);
	public List<EventVO> dayToday(Map map);
	public int dayPage(Map map);
	//관리자메뉴
	public List<EventVO> printSysopEvent(Map map);
	public int eventTotalPage(int rowSize);
	public List<EventVO> printSysopSearchEvent(Map map);
	public int eventSearchTotalPage(Map map);
	public void eventInsert(EventVO vo);
	public void eventDelete(int event_no);
	public EventVO updateEvent(int event_no);
	public void updateEventData(EventVO vo);
}
