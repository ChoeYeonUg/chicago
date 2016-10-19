package com.sist.di;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class EventController {
	@RequestMapping("event")
	public String login_page(Model model){
		
		model.addAttribute("jsp", "event");
		model.addAttribute("jsp", "../event/event.jsp");
		return "main/main";
	}
}
