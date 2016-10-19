package com.sist.di;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("main")
	public String main_page(Model model){
		
		model.addAttribute("jsp", "default.jsp");
		
		
		logger.info(this.toString() + "정상호출");
		return "main/main";
	}
}
