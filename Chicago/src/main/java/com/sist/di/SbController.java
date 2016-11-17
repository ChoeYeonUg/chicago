package com.sist.di;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.BookVO;
import com.sist.service.BookService;

@Controller
public class SbController {
	
	@Resource(name="bookService")
	private BookService bs;
	
	private static final Logger logger = LoggerFactory.getLogger(SbController.class);
	
	@RequestMapping("sb")
	public String sb_page(Model model, String book_code, HttpServletRequest req){
		
		try {
			HttpSession hs = req.getSession();
			List<String> list = (List<String>) hs.getAttribute("sbList");
			
			if(book_code != null && !book_code.equals("")){
				if(list == null){
					logger.info("************************* 장바구니 생성");
					list = new ArrayList<String>();
					list.add(book_code);
				}else{
					logger.info("************************* 장바구니 목록 추가");
					list.add(book_code);
					HashSet temp = new HashSet(list);
					// ArrayList 형태로 다시 생성
					list = new ArrayList<String>(temp);
				}
				hs.setAttribute("sbList", list);
			}			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		/*model.addAttribute("jsp", "sb.jsp");
		model.addAttribute("jsp", "../sb/sb.jsp");*/
		String str = req.getHeader("referer");
		System.out.println(str+"****************************************");
		return "redirect:"+str.substring(str.lastIndexOf("/")+1);
	}
	
	@RequestMapping("sbList")
	public String sbList(Model model, HttpServletRequest req ){
		
		HttpSession hs = req.getSession();
		List<String> list = (List<String>) hs.getAttribute("sbList");
		
		List<BookVO> bookList;
		try {
			bookList = bs.printSbList(list);
			model.addAttribute("bookList", bookList);		
			model.addAttribute("jsp", "sb.jsp");
			model.addAttribute("jsp", "../sb/sbList.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "main/main";
	}
}
