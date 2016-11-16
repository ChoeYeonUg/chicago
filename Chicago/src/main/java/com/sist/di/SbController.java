package com.sist.di;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.BookVO;
import com.sist.service.BookService;

@Controller
public class SbController {
	
	@Resource(name="bookService")
	private BookService bs;	
	
	@RequestMapping("sb")
	public String sb_page(Model model, String book_code, HttpServletRequest req){
		
		try {
			HttpSession hs = req.getSession();
			List<String> list = (List<String>) hs.getAttribute("sbList");
			
			if(list == null){
				list = new ArrayList<String>();
				list.add(book_code);
			}else{
				list.add(book_code);
				
				HashSet temp = new HashSet(list);
				// ArrayList 형태로 다시 생성
				list = new ArrayList<String>(temp);
			}
			hs.setAttribute("sbList", list);
			
			List<BookVO> bookList = bs.printSbList(list);
			model.addAttribute("bookList", bookList);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		model.addAttribute("jsp", "sb.jsp");
		model.addAttribute("jsp", "../sb/sb.jsp");
		return "main/main";
	}
}
