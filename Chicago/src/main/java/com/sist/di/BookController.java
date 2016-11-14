package com.sist.di;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.dao.BookVO;
import com.sist.dao.ReviewVO;
import com.sist.service.BookService;

@Controller
public class BookController {

	// 내용추가(16.10.31)
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);

	@Resource(name = "bookService")
	private BookService bs;

	// 도서 메인 페이지 
	@RequestMapping("book")
	public String login_page(Model model) {

		// 내용추가 (16.10.31)
		//List<BookVO> bookList = bs.bookAllList();
		List<BookVO> newBookList1 = bs.newBookCate(1);
		List<BookVO> newBookList2 = bs.newBookCate(2);
		List<BookVO> newBookList3 = bs.newBookCate(3);
		List<BookVO> newBookList4 = bs.newBookCate(4);

		//model.addAttribute("bookList", bookList);
		model.addAttribute("newBookCate1", newBookList1);
		model.addAttribute("newBookCate2", newBookList2);
		model.addAttribute("newBookCate3", newBookList3);
		model.addAttribute("newBookCate4", newBookList4);

		// 기존내용
		model.addAttribute("jsp", "book.jsp");
		model.addAttribute("book_jsp", "../book/list.jsp");
		return "main/main";
	}
	
	// 카테고리 별 리스트 보여주는 페이지 
	@RequestMapping("categoryList")
	public String book_cate_page1(Model model, int book_category, String page, String book_code, String sch_type, String sch_value) {
		// 페이지 구하기 
		if(page == null) {
			page = "1"; // 첫번째 페이지를 메인으로 보여주기 
		}
		
		int curPage = Integer.parseInt(page); // 현재 페이지를 숫자값으로 바꿔주기
		int rowSize = 10; // 1페이지에 10개의 목록이 나오도록 값 주기
		int start = (curPage * rowSize) - (rowSize-1); // 시작글
		int end = curPage * rowSize; // 마지막글
		
/*		int bcate = Integer.parseInt(book_category);*/
		
		Map map = new HashMap(); // 해쉬맵 생성
		map.put("start", start); // 맵에 시작글 넣어주기
		map.put("end", end); // 맵에 마지막글 넣어주기
		map.put("category", book_category); // 맵에 총 권수 넣어주기

		int totalPage = bs.cateFirTotalPage(book_category);
		int count = bs.cateFirCount(book_category);
		count = count - ((curPage*5)-5);
		
		// 블록 나누기
		int block = 5;
		int fromPage = ((curPage-1)/block*block)+1;
		int toPage = ((curPage-1)/block*block)+block;
		if(toPage>totalPage) {
			toPage = totalPage;
		}
		List<BookVO> cateList;
		
		// 검색 조건이 들어가지 않을 때 
		if(sch_type == null || sch_type.equals("")) {
			cateList = bs.bookListCateFirst(map);
		}
		// 검색 조건이 들어갔을 때 
		else{
			model.addAttribute("sch_type", sch_type);
			model.addAttribute("sch_value", sch_value);
			map.put("sch_type", sch_type);
			map.put("sch_value", sch_value);
			cateList = bs.getSelect(map);
		}
		
		model.addAttribute("curPage", curPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("book_category", book_category);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		model.addAttribute("block", block);
		model.addAttribute("count", count);
		model.addAttribute("cateList", cateList);
		model.addAttribute("page", page);
		model.addAttribute("book_code",book_code);
		model.addAttribute("jsp", "book.jsp");
		model.addAttribute("book_jsp", "../book/categoryList.jsp");
		return "main/main";
	}
		
	// 디테일 페이지 
	@RequestMapping("bookDetail")
	public String detailBookList(Model model, String book_code, HttpServletRequest req) {
		
		HttpSession hs = req.getSession();
		
		String id = (String) hs.getAttribute("id");
		
		BookVO detailBook = bs.detailBook(book_code);
		// 수량정보
		int defAmount = 1;
		
		try{
		List<ReviewVO> list=bs.bookReviewList(book_code);
		
		Double starSum=0.0;
		for(ReviewVO rvo:list){
			starSum+=rvo.getScore();			
		}
		
		double starAvg;
		Double staravg=(Double)starSum/list.size();
		
		if(starSum==0.0){
			starAvg=0.0;
		}else{
			starAvg=Double.parseDouble(String.format("%.2f", staravg*20));
		}
		
		for(ReviewVO rvo:list){
			rvo.setScore(rvo.getScore()*20);				
		}		
		
		ReviewVO vo=new ReviewVO();
		int rv_idCk=0;
		if(id != null){
			vo.setId(id);
			vo.setBook_code(book_code);
			rv_idCk=bs.reviewIdCK(vo);
		}		
		
		model.addAttribute("rv_idCk",rv_idCk);
		model.addAttribute("starAvg",starAvg);
		model.addAttribute("list",list);
		model.addAttribute("detailBook", detailBook);
		model.addAttribute("book_code", book_code);
		model.addAttribute("defAmount", defAmount);
		model.addAttribute("jsp","book.jsp");
		model.addAttribute("book_jsp", "../book/bookDetail.jsp");
		
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.getStackTrace();
		}
		return "main/main";
	}
	
	@RequestMapping("sbPage")
	public String sbPage(Model model) {
		
		return "book/sbPage";
	}
	
/*	//검색하기
	String sch_type = request.getParameter("sch_type");
	String sch_value = request.getParameter("sch_value");
	
	Map mapSearch = new HashMap();
	mapSearch.put("sch_type", sch_type);
	mapSearch.put("sch_value", sch_value);
	model.addAttribute("mapSearch", mapSearch);
	
	List<BookVO> list = bs.getSelect(mapSearch);
	model.addAttribute("list", list);*/


/*	@RequestMapping("wishlist")
	public String wishlistPage(Model model) {
		
		return "member/wishlist";
	}
*/
	@RequestMapping("bookReviewContent")
	public String bookReviewContent(Model model,String book_code){
		BookVO detailBook = bs.detailBook(book_code);
		
		model.addAttribute("detailBook", detailBook);
		model.addAttribute("model", model);
		model.addAttribute("book_code", book_code);
		
		return"book/bookReviewContent";
	}
	
	
	@RequestMapping("bookContentReviewInsert")
	@ResponseBody
	public String bookContentReviewInsert(Model model,ReviewVO vo){
		
		String ss=vo.getStar_input();
		String ss1=ss.replaceAll("_",".");
		Double score=Double.parseDouble(ss1);
		vo.setScore(score);
		
		bs.contentReviewinsert(vo);
		
		
		return "<script>" + "opener.parent.location.reload();" + "window.close();"+ "</script>";
		
	}
	
}
