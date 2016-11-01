package com.sist.di;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.BookVO;
import com.sist.service.BookService;

@Controller
public class BookController {

	// 내용추가(16.10.31)
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);

	@Resource(name = "bookService")
	private BookService bs;

	// 기존내용
	@RequestMapping("book")
	public String login_page(Model model) {

		// 내용추가 (16.10.31)
		List<BookVO> bookList = bs.bookAllList();
		List<BookVO> newBookList1 = bs.newBookCate1();
		List<BookVO> newBookList2 = bs.newBookCate2();
		List<BookVO> newBookList3 = bs.newBookCate3();
		List<BookVO> newBookList4 = bs.newBookCate4();

		model.addAttribute("bookList", bookList);
		model.addAttribute("newBookCate1", newBookList1);
		model.addAttribute("newBookCate2", newBookList2);
		model.addAttribute("newBookCate3", newBookList3);
		model.addAttribute("newBookCate4", newBookList4);

		// 기존내용
		model.addAttribute("jsp", "book.jsp");
		model.addAttribute("book_jsp", "../book/list.jsp");
		return "main/main";
	}

}
