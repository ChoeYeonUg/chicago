package com.sist.di;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.EventVO;
import com.sist.service.EventService;
@Controller
public class EventController {
	@Resource(name="eventService")
	private EventService es;
	
	@RequestMapping("event")
	public String login_page(Model model, String page){
		if(page == null) {
			page = "1";
		}
		
		int curPage = Integer.parseInt(page); 
		int rowSize = 10; 
		int start = (curPage * rowSize) - (rowSize-1); 
		int end = curPage * rowSize; 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
		String today=sdf.format(new Date());
		
		
		Map map = new HashMap(); 
		map.put("start", start); 
		map.put("end", end);
		map.put("today", today);
		int totalPage = es.scheduleTotalPage(map);
		
		List<EventVO> eventSchedule = es.schedule(map);
		
		int block = 5;
		int fromPage = ((curPage-1)/block*block)+1;
		int toPage = ((curPage-1)/block*block)+block;
		if(toPage>totalPage) {
			toPage = totalPage;
		}
		
	    
	    
		model.addAttribute("today",today);
		model.addAttribute("curPage", curPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("page", page);
		model.addAttribute("schedule",eventSchedule);
		model.addAttribute("jsp", "event.jsp");
		model.addAttribute("event_jsp", "../event/event.jsp");
		return "main/main";
	}
	
	@RequestMapping("event_month")
	public String event_month(Model model, String page){
		if(page == null) {
			page = "1";
		}
		
		int curPage = Integer.parseInt(page); 
		int rowSize = 10; 
		int start = (curPage * rowSize) - (rowSize-1); 
		int end = curPage * rowSize; 
		
		
		Map map = new HashMap(); 
		map.put("start", start); 
		map.put("end", end); 
		
		int totalPage = es.scheduleTotalPage(map);
		
		
		int block = 5;
		int fromPage = ((curPage-1)/block*block)+1;
		int toPage = ((curPage-1)/block*block)+block;
		if(toPage>totalPage) {
			toPage = totalPage;
		}
		
		List<EventVO> eventSchedule = es.schedule(map);
		
		model.addAttribute("curPage", curPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("page", page);
		model.addAttribute("schedule",eventSchedule);
		model.addAttribute("jsp", "event.jsp");
		model.addAttribute("event_jsp", "../event/month.jsp");
		return "main/main";
	}
	
	@RequestMapping("event_week")
	public String event_week(Model model, String page){
		if(page == null) {
			page = "1";
		}
		
		int curPage = Integer.parseInt(page); 
		int rowSize = 10; 
		int start = (curPage * rowSize) - (rowSize-1); 
		int end = curPage * rowSize; 
		
		
		Map map = new HashMap(); 
		map.put("start", start); 
		map.put("end", end); 
		
		int totalPage = es.scheduleTotalPage(map);
		
		
		int block = 5;
		int fromPage = ((curPage-1)/block*block)+1;
		int toPage = ((curPage-1)/block*block)+block;
		if(toPage>totalPage) {
			toPage = totalPage;
		}
		
		List<EventVO> eventSchedule = es.schedule(map);
		
		model.addAttribute("curPage", curPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("page", page);
		model.addAttribute("schedule",eventSchedule);
		model.addAttribute("jsp", "event.jsp");
		model.addAttribute("event_jsp", "../event/week.jsp");
		return "main/main";
	}
	@RequestMapping("event_day")
	public String event_day(Model model ,String page){
		if(page == null) {
			page = "1";
		}
		
		int curPage = Integer.parseInt(page); 
		int rowSize = 10; 
		int start = (curPage * rowSize) - (rowSize-1); 
		int end = curPage * rowSize; 
		
		
		Map map = new HashMap(); 
		map.put("start", start); 
		map.put("end", end); 
		
		int totalPage = es.scheduleTotalPage(map);
		
		
		int block = 5;
		int fromPage = ((curPage-1)/block*block)+1;
		int toPage = ((curPage-1)/block*block)+block;
		if(toPage>totalPage) {
			toPage = totalPage;
		}
		
		List<EventVO> eventSchedule = es.schedule(map);
		
		model.addAttribute("curPage", curPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("page", page);
		model.addAttribute("schedule",eventSchedule);
		model.addAttribute("jsp", "event.jsp");
		model.addAttribute("event_jsp", "../event/day.jsp");
		return "main/main";
	}
}
