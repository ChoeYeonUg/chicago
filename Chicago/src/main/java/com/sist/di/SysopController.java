package com.sist.di;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SysopController {
	
	@RequestMapping("sysop")
	public String sysop_page(Model model){
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/sysop.jsp");
		return "main/main";
	}
}
