package com.sist.di;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WriterController {

	@RequestMapping("writer")
	public String writerInfo(Model model){
		
		model.addAttribute("jsp", "writer.jsp");
		model.addAttribute("jsp", "../writer/writer.jsp");		
		
		return "main/main";
	}
	
}
