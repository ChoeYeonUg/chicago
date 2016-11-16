package com.sist.di;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sist.dao.BookVO;
import com.sist.service.BookService;

@Controller
public class SysopBookController {

	private static final Logger logger = LoggerFactory.getLogger(SysopBoardController.class);

	@Resource(name = "bookService")
	private BookService bs;

	@RequestMapping("book_management")
	public String bookManagement(String page, Model model, String ss, String fs, String book_code, HttpServletRequest req) {

		try {
			if (page == null)
				page = "1"; // list.jsp

			int curpage = Integer.parseInt(page);

			int rowSize = 10;
			int start = (curpage * rowSize) - (rowSize - 1);
			int end = curpage * rowSize;

			Map map = new HashMap();

			map.put("start", start);
			map.put("end", end);
			List<BookVO> list = null;
			int totalpage = 1;
			if (ss == null || ss.equals("")) {
				list = bs.printSysopBook(map);
				totalpage = bs.printBookTotalPage(rowSize);
			} else {
				Map map2 = new HashMap();
				map2.put("ss", ss);
				map2.put("fs", fs);
				map2.put("rowSize", rowSize);

				map.put("ss", ss);
				map.put("fs", fs);
				model.addAttribute("fs", fs);
				model.addAttribute("ss", ss);
				list = bs.printSearchSysopBook(map);
				totalpage = bs.printSearchBookTotalPage(map2);
			}

			int block = 10;
			int formPage = ((curpage - 1) / block * block) + 1;
			int toPage = ((curpage - 1) / block * block) + block;

			if (toPage > totalpage)
				toPage = totalpage;
			
			model.addAttribute("book_code", book_code);
			model.addAttribute("formpage", formPage);
			model.addAttribute("topage", toPage);
			model.addAttribute("block", block);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("start", start);
			model.addAttribute("end", end);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/book_management.jsp");

		return "main/main";
	}

	// 도서관리 상세페이지
	@RequestMapping("book_mngDetail")
	public String printSysopBookDetail(Model model, String book_code, HttpServletRequest req) {
		
		HttpSession hs = req.getSession();
		String id = (String) hs.getAttribute("id");

		BookVO bookMngDetail = bs.printSysopBookDetail(book_code);

		model.addAttribute("bookMngDetail", bookMngDetail);
		model.addAttribute("book_code", book_code);

		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/book_mngDetail.jsp");
		return "main/main";
	}
	
	// 도서관리 추가하기
	@RequestMapping("book_mngInsert")
	public String printSysopBookInsert(Model model, HttpServletRequest req) {
		
		model.addAttribute("jsp", "sysop.jsp");
		/*model.addAttribute("sysop_jsp", "../sysop/book_management.jsp");*/
		model.addAttribute("jsp","../sysop/book_mngInsert.jsp");
		BookVO vo = new BookVO();
		model.addAttribute("vo", vo);
		
		return "main/main";
	}
	
	// 도서관리 추가하기 전달
	@RequestMapping(value="book_mngInsertOk", method = RequestMethod.POST)
	public String printSysopBookInsertOk(Model model, BookVO vo, HttpServletRequest req) {

		String book_code = vo.getBook_code();
		String book_name = vo.getBook_name();
		int book_category = vo.getBook_category();
		String writer = vo.getWriter();
		String publisher = vo.getPublisher();
		int amount = vo.getAmount();
		int out_of_print = vo.getOut_of_print();
		int pages = vo.getPages();
		String book_content = vo.getBook_content();
		int price = vo.getPrice();
		Date publication = vo.getPublication();
		
		Map map = new HashMap();
		map.put("book_code", book_code);
		map.put("book_name", book_name);
		map.put("book_category", book_category);
		map.put("writer", writer);
		map.put("publisher", publisher);
		map.put("amount", amount);
		map.put("out_of_print", out_of_print);
		map.put("pages", pages);
		map.put("book_content", book_content);
		map.put("price", price);
		map.put("publication", publication);
		
		try {
			bs.printSysopBookInsert(map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}	
		return "redirect:book_management.do";
	}
	
	// 도서관리 수정하기 
	@RequestMapping("book_mngUpdate")
	public String printSysopBookUpdate(Model model, String book_code, HttpServletRequest req) {
		try {
			BookVO vo = bs.detailBook(book_code);
			
			model.addAttribute("vo", vo);
			model.addAttribute("jsp", "sysop.jsp");
			model.addAttribute("jsp", "../sysop/book_mngUpdate.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return "main/main";
	}
	
}
