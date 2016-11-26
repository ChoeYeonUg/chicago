package com.sist.di;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sist.service.EventService;
import com.sist.service.StoreService;
import com.sist.vo.EventVO;
import com.sist.vo.WriterVO;

@Controller
public class SysopEventController {
	
	@Resource(name="eventService")
	private EventService es;
	
	@Resource(name="storeService")
	private StoreService ss;
	
	@RequestMapping("event_management")
	public String eventManagement(String page, Model model, String ss, String fs,HttpServletRequest req){
		
		try {
			if (page == null)
				page = "1"; // list.jsp
			
			int curpage = Integer.parseInt(page);
			
			int rowSize = 10;
			int start = (curpage * rowSize) - (rowSize - 1);
			int end = curpage * rowSize;			
		
			Map map = new HashMap();
			
			map.put("start", start);
			map.put("end", end);
			List<EventVO> list = null;
			int totalpage=1;
			if(ss == null || ss.equals("")){			
				list = es.printSysopEvent(map);
				totalpage = es.eventTotalPage(rowSize);
			}else{
				Map map2 = new HashMap();
				map2.put("ss", ss);
				map2.put("fs", fs);
				map2.put("rowSize", rowSize);
				map.put("ss", ss);
				map.put("fs", fs);
				model.addAttribute("fs", fs);
				model.addAttribute("ss", ss);
				list = es.printSysopSearchEvent(map);
				totalpage = es.eventSearchTotalPage(map2);
			}
			
			int block=10;
			int formPage = ((curpage-1)/block*block)+1;
			int toPage = ((curpage-1)/block*block)+block;
			
			if(toPage> totalpage) toPage = totalpage;			
			
			model.addAttribute("formpage", formPage);
			model.addAttribute("topage", toPage);
			model.addAttribute("block", block);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("start", start);
			model.addAttribute("end", end);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/event_management.jsp");		
		return "main/main";
	}
	
	@RequestMapping("add_event")
	public String add_writer(Model model,HttpServletRequest req){
		
		EventVO vo = new EventVO();
		
		model.addAttribute("event", vo);
		
		String[] storeName = ss.storeAllName();
		
		model.addAttribute("storeList", storeName);
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/add_event.jsp");		
		return "main/main";
	}
	
	@RequestMapping(value ="add_event_ok", method = RequestMethod.POST)
	public String add_event_ok(Model model,HttpServletRequest req, EventVO event, String startDay, String endDay){
		
		try{
		if(startDay != null && !startDay.equals("")){
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			event.setStart_day(transFormat.parse(startDay));
		}
		if(endDay != null && !endDay.equals("")){
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			event.setEnd_day(transFormat.parse(endDay));
		}
		
		es.eventInsert(event);
		
		}catch(Exception e){
			return "redirect:add_event.do";
		}
			
		return "redirect:event_management.do";
	}
	
	
	@RequestMapping(value ="add_event_ok", method = RequestMethod.GET)
	public String add_event_ok(HttpServletRequest req){
		
		return "redirect:event_management.do";
	}
	
	@RequestMapping("event_delete")
	public String event_delete(HttpServletRequest req, int event_no){
		
		try {
			es.eventDelete(event_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:event_management.do";
	}
	
	@RequestMapping("update_event")
	public String update_event(Model model,HttpServletRequest req, int event_no){
		
		EventVO vo = null;
		try {
			vo = es.updateEvent(event_no);
			
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			if(vo.getStart_day() != null){
				String startDay = transFormat.format(vo.getStart_day());
				model.addAttribute("startDay", startDay);
			}
			if(vo.getEnd_day() != null){
				String endDay =transFormat.format(vo.getEnd_day());
				model.addAttribute("endDay", endDay);
			}
			
			model.addAttribute("event", vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String[] storeName = ss.storeAllName();
		model.addAttribute("storeList", storeName);
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/update_event.jsp");		
		return "main/main";
	}
	
	@RequestMapping("update_event_ok")
	public String event_update_ok(EventVO event, HttpServletRequest req, String startDay, String endDay){
		
		try{
			if(startDay != null && !startDay.equals("")){
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				event.setStart_day(transFormat.parse(startDay));
			}
			if(endDay != null && !endDay.equals("")){
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				event.setEnd_day(transFormat.parse(endDay));
			}
			
			es.updateEventData(event);
		}catch(Exception e){
			return "redirect:update_event.do?event_no"+event.getEvent_no();
		}
		
		return "redirect:event_management.do";
		

	}
}
