package com.sist.di;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SbController {
	@RequestMapping("sb")
	public String sb_page(Model model){
		
		model.addAttribute("jsp", "sb.jsp");
		model.addAttribute("jsp", "../sb/sb.jsp");
		return "main/main";
	}
}
