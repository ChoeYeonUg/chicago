package com.sist.di;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SysopEventController {
	
	@RequestMapping("event_management")
	public String writerManagement(String page, Model model, String ss, String fs,HttpServletRequest req){
		
		
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/event_management.jsp");		
		return "main/main";
	}
}
