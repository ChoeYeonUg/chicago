package com.sist.di;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.BoardVO;
import com.sist.service.BoardService;


@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name="boardService")
	private BoardService bs;
	
	@RequestMapping("noticeboard")
	public String noticeboardListData(Model model,String page){

		if(page==null)
			page="1";
		
		//페이지 받아오기
		int curpage = Integer.parseInt(page);
		//열은 10줄씩
		int rowSize = 5;
	    //시작글
		int start = (curpage * rowSize) - (rowSize - 1);
		//끝글
		int end = curpage * rowSize;
		
		//해쉬맵 생성
		Map map = new HashMap();
		//맵에 시작,끝지점 담기
		map.put("start", start);
		map.put("end", end);
		
		try {			
			//화면에 뿌려줄 리스트를 list라는 이름으로 가져옴 
			List<BoardVO> list=bs.noticeboard_ListData(map);
		
						
			/*//토탈페이지 (딱히 쓰이지 않음)
			int totalpage = bs.notice_boardTotalPage();*/
			model.addAttribute("jsp", "board.jsp");
			model.addAttribute("board_jsp", "../board/list.jsp");
			model.addAttribute("boardjsp","../board/noticelist.jsp" );
			//list담아주기			
			model.addAttribute("list", list);
			//현재페이지 담기
			model.addAttribute("curpage", curpage);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return "main/main";
	}
	
	@RequestMapping("faqboard")
	public String faqboard(Model model,String page, String faq_category){
		int faq_cat = 0;
		int curpage = 1;
		
		if (page == null)
			page = "1"; // list.jsp
		if(faq_category == null) 
			faq_category= "0";
		try{
			curpage = Integer.parseInt(page);
			faq_cat = Integer.parseInt(faq_category);
			System.out.println(faq_cat);
		}catch(Exception e){			
			//만약 int값이 들어있지 않으면 0이다.
			faq_cat = 0;
		}		
		if(!(faq_cat >=0 && faq_cat<=6))
			faq_cat=0;
		logger.info(faq_cat+"");
		//열은 10줄씩
		int rowSize = 5;
	    //시작글
		int start = (curpage * rowSize) - (rowSize - 1);
		//끝글
		int end = curpage * rowSize;
		
		//해쉬맵 생성
		Map map1 = new HashMap();
		//맵에 시작,끝지점 담기
		map1.put("start", start);
		map1.put("end", end);
		map1.put("faq_category", faq_cat);
		
		String[] categoryList = {"전체", "회원", "상품", "주문결제", "배송", "교환/반품/환불", "기타"};
		//토탈페이지 
		try {
			int totalpage = bs.faq_boardTotalPage();
			List<BoardVO> flist;
			
			if(faq_cat==0){
				flist=bs.faqboard_AllListData(map1);
			}else{
				flist=bs.faqboard_CatListData(map1);
			}
						
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			
			model.addAttribute("categoryList",categoryList);
			model.addAttribute("flist", flist);
			model.addAttribute("faq_category",faq_cat);
			
			model.addAttribute("jsp", "board.jsp");
			model.addAttribute("board_jsp", "../board/list.jsp");
			model.addAttribute("boardjsp","../board/faqlist.jsp" );
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return "main/main";
	}
	
	
	@RequestMapping("secretboard")
	public String secretboard(Model model){
		
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/secretboard.jsp" );
		
		return "main/main";
	}
	
	@RequestMapping("reviewboard")
	public String reviewboard(Model model){
		
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/reviewlist.jsp" );
		
		return "main/main";
	}
	
	@RequestMapping("board_content")
	public String board_content(Model model){
		
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/secretboard.jsp" );
		
		return "main/main";
	}
	
	@RequestMapping("noticeboard_insert")
	public String noticeboard_insert(Model model){
		
		
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/noticeboard_insert.jsp" );
				
		return "main/main";
	}
	
	@RequestMapping("noticeboard_insert_ok")
	public String noticeboard_insert_ok(Model model,BoardVO vo){
		
		String subject=vo.getSubject();
		String content=vo.getContent();
		
		//해쉬맵 생성
		Map map = new HashMap();
		//받아온 제목과 내용 map에 담기
		map.put("subject", subject);
		map.put("content", content);
		
		try {
			
			bs.notice_insert(map);
			
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		
		//jsp를 거칠 필요 없이 바로 다시 noticeboard를 실행하면 그 페이지로 간다.
		return "redirect:noticeboard.do";
	}
	
	@RequestMapping("faqboard_insert")
	public String faq_insert(Model model){
		
		
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/faqboard_insert.jsp" );
				
		return "main/main";
	}
	
	@RequestMapping("faqboard_insert_ok")
	public String faqboard_insert_ok(Model model,BoardVO vo){
		
		String subject=vo.getSubject();
		String content=vo.getContent();
		int faq_category=vo.getFaq_category();
		System.out.println(faq_category);
		//해쉬맵 생성
		Map map = new HashMap();
		//받아온 제목과 내용 map에 담기
		map.put("subject", subject);
		map.put("content", content);
		map.put("faq_category",faq_category);
		
		try {
			
			bs.faq_insert(map);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}

		return "redirect:faqboard.do";
	}
}
