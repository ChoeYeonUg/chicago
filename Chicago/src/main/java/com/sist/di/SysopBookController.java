package com.sist.di;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.BookService;

@Controller
public class SysopBookController {
	
	private static final Logger logger = LoggerFactory.getLogger(SysopBoardController.class);
	
	@Resource(name="bookService")
	private BookService bs;
	
	@RequestMapping("book_management")
	public String bookManagement(String page, Model model, String ss, String fs,HttpServletRequest req){
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/book_management.jsp");		
		return "main/main";
	}
	
	
}
