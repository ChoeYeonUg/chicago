package com.sist.di;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	public String login_page(Model model, String page, String sd, String af,HttpServletRequest req){
		if(page == null) {
			page = "1";
		}
		
		int curPage = Integer.parseInt(page); 
		int rowSize = 10; 
		int start = (curPage * rowSize) - (rowSize-1); 
		int end = curPage * rowSize; 
		/*SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
		String today=sdf.format(new Date());*/
	//	System.out.println(today);
		Map map = new HashMap();
		map.put("start", start); 
		map.put("end", end);
		
		
		/*if(strYear != null)
		{
		  year = Integer.parseInt(strYear);
		  month = Integer.parseInt(strMonth);
		 
		}else{
		 
		}*/
		
		
	//	map.put("today", today);
		
	//	sd=String.valueOf(Integer.parseInt(today)+1);
	//	sd=today;		
		
	
		/*if(bf!=null){
			today=String.valueOf(Integer.parseInt(today)-1);			
		}
		if(af!=null){
			today=String.valueOf(Integer.parseInt(today)+1);
		}
		sd=String.valueOf(Integer.parseInt(today)+1);
		map.put("sd", sd);*/
	//	today=String.valueOf(Integer.parseInt(today)-1);
		
		int totalPage = es.scheduleTotalPage(map);
		
		List<EventVO> eventSchedule = es.schedule(map);
		
		int block = 5;
		int fromPage = ((curPage-1)/block*block)+1;
		int toPage = ((curPage-1)/block*block)+block;
		if(toPage>totalPage) {
			toPage = totalPage;
		}
	
	    model.addAttribute("sd",sd);
	//	model.addAttribute("today",today);
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
	public String event_month(Model model, String page,HttpServletRequest req){
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
		
		Calendar cal = Calendar.getInstance();
		 
		String strYear = req.getParameter("year");
		String strMonth = req.getParameter("month");
		 
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int date = cal.get(Calendar.DATE);
//		int startD = cal.get(java.util.Calendar.DAY_OF_WEEK);
//		String sUseDate = Integer.toString(year); 
		if(strYear != null)
		{
		  year = Integer.parseInt(strYear);
		  month = Integer.parseInt(strMonth);
		  cal.set(year, month,1);
		}else{
		 
		}
		//년도/월 셋팅
		cal.set(year, month, 1);
		 
		int startDay = cal.getMinimum(java.util.Calendar.DATE);
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		int startD = cal.get(java.util.Calendar.DAY_OF_WEEK);
		int newLine = 0;
		String sUseDate = Integer.toString(year);
		
		//오늘 날짜 저장.
		Calendar todayCal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
		int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
	//	index = Integer.parseInt(req.getParameter(Integer.toString(index))); 
		sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
	//	sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
		
		String iUseDate = sUseDate;
		String dateUse = "";
	//	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	//	SimpleDateFormat nya=new SimpleDateFormat("yyyy-MM");
		/*SimpleDateFormat year=new SimpleDateFormat("yyyy");
		SimpleDateFormat month=new SimpleDateFormat("MM");
		SimpleDateFormat day=new SimpleDateFormat("dd");*/
		String today=sdf.format(new Date());
	//	String indentifire = nya.format(new Date());
		
		//int day = Integer.toString(cal.get(Calendar.DATE));
		
		
		/*String strYear = req.getParameter("year");
		String strMonth = req.getParameter("month");
		*/
		
		 	
		
		map.put("startDay", startDay);
		map.put("endDay", endDay);
		map.put("startD", startD);
		map.put("newLine", newLine);
		map.put("year", year);
		map.put("month", month);
		map.put("day", date);
		
		
		
		List<EventVO> eventSchedule = es.schedule(map);
	//	List<>
		
		model.addAttribute("dateUse",dateUse);
		model.addAttribute("iUseDate",iUseDate);
		model.addAttribute("sUseDate",sUseDate);
		model.addAttribute("startDay",startDay);
		model.addAttribute("endDay",endDay);
		model.addAttribute("startD",startD);
		model.addAttribute("newline",newLine);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("sUseDate",sUseDate);
		model.addAttribute("startDay",startDay);
		model.addAttribute("endDay",endDay);
		model.addAttribute("newLine",newLine);
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
	public String event_week(Model model, String page,HttpServletRequest req) throws ParseException{
		if(page == null) {
			page = "1";
		}
		
		int curPage = Integer.parseInt(page); 
		int rowSize = 10; 
		int start = (curPage * rowSize) - (rowSize-1); 
		int end = curPage * rowSize; 
		int block = 5;
		Map map = new HashMap(); 
		map.put("start", start); 
		map.put("end", end); 
		SimpleDateFormat sYear=new SimpleDateFormat("yyyy");
		int totalPage = es.scheduleTotalPage(map);
		int fromPage = ((curPage-1)/block*block)+1;
		int toPage = ((curPage-1)/block*block)+block;
		if(toPage>totalPage) {
			toPage = totalPage;
		}
					
		SimpleDateFormat sMonth=new SimpleDateFormat("MM");
		SimpleDateFormat sDay=new SimpleDateFormat("dd");
	/*	String year=sYear.format(new Date());
		String month=sMonth.format(new Date());
		String day=sDay.format(new Date());
	*/
		Calendar cal= Calendar.getInstance ();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int date = cal.get(Calendar.DATE);
		
		
		map.put("month", month);
		map.put("year", year);
		map.put("day",date);
		
		List<EventVO> eventSchedule = es.schedule(map);
		
		String strYear = req.getParameter("year");
		String strMonth = req.getParameter("month");
		 
//		int startD = cal.get(java.util.Calendar.DAY_OF_WEEK);
//		String sUseDate = Integer.toString(year); 
		if(strYear != null)
		{
		  year = Integer.parseInt(strYear);
		  month = Integer.parseInt(strMonth);
		 
		}else{
		 
		}
		
		
		
	/*	cal.set(Calendar.YEAR, Integer.parseInt(year));
		cal.set(Calendar.MONTH, Integer.parseInt(month));
		cal.set(Calendar.DATE, Integer.parseInt(day));*/
		String dotw = " "; 
		
		java.util.Date yeap = new java.util.Date();
		SimpleDateFormat formatTime = new SimpleDateFormat("EEE", Locale.KOREAN);		
		String yeapString = formatTime.format(yeap);
		
		/*switch (cal.get(Calendar.DAY_OF_WEEK)){
		case 1:
			dotw = "일요일";
			break;
		case 2:
			dotw = "월요일";
			break;
		case 3:
			dotw = "화요일";
			break;
		case 4:
			dotw = "수요일";
			break;
		case 5:
			dotw = "목요일";
			break;
		case 6:
			dotw = "금요일";
			break;
		case 7:
			dotw = "토요일";
			break;
		}*/
/*		
		//오늘 날짜 데이터
		 String thisDay = new java.text.SimpleDateFormat ("yyyy-MM-dd").format(new java.util.Date()); 
		 //하루 증가된 날짜 계산을 위해서 
		 String thisDayMore = thisDay.replaceAll("-","");
		 int thisDayMoreInt = Integer.parseInt(thisDayMore);
		 thisDayMoreInt = thisDayMoreInt+1;
		 thisDayMore = String.valueOf(thisDayMoreInt);
		 
		 SimpleDateFormat sdfmt = new SimpleDateFormat("yyyyMMdd"); 
		 Date date = sdfmt.parse(thisDayMore);
		 
		 thisDayMore = new java.text.SimpleDateFormat ("yyyy-MM-dd").format(date);
		
		//6일전 날짜 계산을 위해서 
		// Calendar cal = Calendar.getInstance();
		 cal.add(cal.DATE,-1);
		 
		 String  thisDayMiner = cal.get(cal.YEAR)+"-"+cal.get(cal.MONTH)+"-"+cal.get(cal.DATE);
//		 SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd"); 
		 Date date1 = sdfmt.parse(thisDayMiner);
		 thisDayMiner = new java.text.SimpleDateFormat ("yyyy-MM-dd").format(date1);
	*/	
	/*	model.addAttribute("thisDayMiner",thisDayMiner);
		model.addAttribute("thisDayMore",thisDayMore);*/
		model.addAttribute("yeapString",yeapString);
		model.addAttribute("dotw",dotw);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("day",date);
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
