package com.sist.di;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class BookController {
	
	
	@RequestMapping("book")
	public String login_page(Model model){
		
		model.addAttribute("jsp", "book.jsp");
		model.addAttribute("book_jsp", "../book/list.jsp");
		return "main/main";
	}
}
