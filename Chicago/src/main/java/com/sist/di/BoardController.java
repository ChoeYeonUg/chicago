package com.sist.di;

import java.text.SimpleDateFormat;
import java.util.Date;
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
		try {	
			
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
			map.put("rowSize", rowSize);
			map.put("category",1);
			//토탈페이지 (카테고리1세팅)			
			int totalpage = bs.boardTotalPage(map);
			//블록세팅
			int block=5;
			int fromPage = ((curpage-1)/block*block)+1;
			int toPage = ((curpage-1)/block*block)+block;
			
			if(toPage> totalpage) toPage = totalpage;	
			//화면에 뿌려줄 리스트를 list라는 이름으로 가져옴 
			List<BoardVO> list=bs.noticeboard_ListData(map);
		
			
			model.addAttribute("jsp", "board.jsp");
			model.addAttribute("board_jsp", "../board/list.jsp");
			model.addAttribute("boardjsp","../board/noticelist.jsp" );
			model.addAttribute("block",block);
			model.addAttribute("fromPage", fromPage);
			model.addAttribute("toPage", toPage);
			model.addAttribute("totalpage", totalpage);
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
		map1.put("rowSize", rowSize);
		map1.put("category",2);
		
		String[] categoryList = {"전체", "회원", "상품", "주문결제", "배송", "교환/반품/환불", "기타"};
		//토탈건수 
		try {
			int totalfaq;			
			int totalpage;
			if(faq_cat==0){
				totalfaq = bs.faq_boardTotalPage();
				totalpage = bs.boardTotalPage(map1);
			}else{
				totalfaq = bs.faq_CatboardTotalPage(faq_cat);
				totalpage= bs.faqtotalListPage(faq_cat);
			}
			
			//블록세팅
			int block=5;
			int fromPage = ((curpage-1)/block*block)+1;
			int toPage = ((curpage-1)/block*block)+block;
			
			if(toPage> totalpage) toPage = totalpage;
			
			List<BoardVO> flist;
			
			if(faq_cat==0){
				flist=bs.faqboard_AllListData(map1);
			}else{
				flist=bs.faqboard_CatListData(map1);
			}
						
			model.addAttribute("block",block);
			model.addAttribute("fromPage", fromPage);
			model.addAttribute("toPage", toPage);			
			model.addAttribute("curpage", curpage);
			//카테고리 총 건수
			model.addAttribute("totalfaq", totalfaq);
			//카테고리 총 페이지
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
	public String secretboard(Model model,String page,String fs,String ss){
		try {	
			
			
			if(page==null)
				page="1";
			
			//페이지 받아오기
			int curpage = Integer.parseInt(page);
			//열은 10줄씩
			int rowSize = 10;
		    //시작글
			int start = (curpage * rowSize) - (rowSize - 1);
			//끝글
			int end = curpage * rowSize;

			
			//해쉬맵 생성
			Map map = new HashMap();
			//맵에 시작,끝지점 담기
			map.put("start", start);
			map.put("end", end);
			map.put("rowSize", rowSize);
			map.put("category", 3);
			map.put("fs", fs);
			map.put("ss", ss);
			//토탈페이지 (카테고리3세팅)			
			int totalpage ;

			
		
			
					
			List<BoardVO> list;
			if(ss==null || ss==""){
				list=bs.secretboard_ListData(map);
				totalpage = bs.boardTotalPage(map);
			}else{
				list=bs.secret_find(map);
				totalpage= bs.secret_find_total(map);
			}
			
			 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			 String today=sdf.format(new Date());
		
				
				//블록세팅
				int block=5;
				int fromPage = ((curpage-1)/block*block)+1;
				int toPage = ((curpage-1)/block*block)+block;
				if(toPage> totalpage) toPage = totalpage;
				String msg="관리자가 삭제한 게시물입니다.";
		
				
			model.addAttribute("jsp", "board.jsp");
			model.addAttribute("board_jsp", "../board/list.jsp");
			model.addAttribute("boardjsp","../board/secretboard.jsp" );
			model.addAttribute("fs", fs);
			model.addAttribute("ss", ss);
			model.addAttribute("block",block);
			model.addAttribute("fromPage", fromPage);
			model.addAttribute("toPage", toPage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("today",today);
			model.addAttribute("msg",msg);
			
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
	
	@RequestMapping("secretboard_insert")
	public String secret_insert(Model model){
		
		
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/secretboard_insert.jsp" );
				
		return "main/main";
	}
	
	@RequestMapping("secretboard_insert_ok")
	public String secretboard_insert_ok(Model model,BoardVO vo){		
			
		String id=vo.getId();
		String subject=vo.getSubject();
		String content=vo.getContent();
		String pwd=vo.getPwd();
		int secret=vo.getSecret();
		
		System.out.println(id+"  "+subject+"  "+content+"  "+pwd+"  "+secret);
		
		//해쉬맵 생성
		Map map = new HashMap();
		//받아온 제목과 내용 map에 담기
		map.put("subject", subject);
		map.put("content", content);
		map.put("id",id);
		map.put("secret",secret);
		map.put("pwd", pwd);
						
		try {
			bs.secret_insert(map);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}

		return "redirect:secretboard.do";
	}
	
	@RequestMapping("secret_content")
	public String secret_content(Model model, int board_no,String page){
		System.out.println(board_no+"이라궁");
		try{
		if(page==null)
			page="1";
		//페이지 받아오기
		int curpage = Integer.parseInt(page);
				
		BoardVO vo=bs.secretboard_Content(board_no);
		System.out.println(vo.getHit());
		//bs.hitIncrememt(board_no);
		model.addAttribute("page",curpage);
		model.addAttribute("vo",vo);
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("board_no",board_no);
		model.addAttribute("boardjsp","../board/secret_content.jsp" );
		}catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
			
		return "main/main";
	}
	
	@RequestMapping("secretboard_pwd_check")
	public String secretboard_pwd_check(Model model, String page, int board_no){
		
		if(page==null)
			page="1";
		//페이지 받아오기
		int curpage = Integer.parseInt(page);
		
		try{
		String db_pwd=bs.getPwd(board_no);
		
		model.addAttribute("db_pwd",db_pwd);
		
		model.addAttribute("board_no",board_no);
		model.addAttribute("page",curpage);
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/secretboard_pwd_check.jsp" );
		
		}catch(Exception e){
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		
		return "main/main";
	}
	
	@RequestMapping("secretboard_pwd_check_ok")
	public String secretboard_pwd_check_ok(Model model,String page,String pwd, int board_no){
			System.out.println(pwd + "입력받은 비번");
		try{
			if(page==null)
				page="1";
			//페이지 받아오기
			int curpage = Integer.parseInt(page);
						
			String db_pwd=bs.getPwd(board_no);
			System.out.println(db_pwd);
			if(db_pwd.equals(pwd)){
				
				
				model.addAttribute("page",curpage);
				model.addAttribute("board_no",board_no);
				
				return "redirect:secret_content.do";
			}
			}catch (Exception e) {
				e.getStackTrace();
				System.out.println(e.getMessage());
			}
		return "redirect:secretboard.do";	
	}
	/*@RequestMapping("secret_delete")
	public String secret_delete(Model model){
		
		return "";
	}*/
	@RequestMapping("secret_update")
	public String secret_update(Model model,int board_no){
		
		try{
			BoardVO vo=bs.secretboard_Content(board_no);
		
			model.addAttribute("vo",vo);		
			
			model.addAttribute("jsp", "board.jsp");
			model.addAttribute("board_jsp", "../board/list.jsp");
			model.addAttribute("boardjsp","../board/secret_update.jsp" );
		
		}catch(Exception e){
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		
		return "main/main";
	}
	
	@RequestMapping("secret_update_ok")
	public String secret_update_ok(Model model,BoardVO vo){
		int board_no=vo.getBoard_no();
	
		try {
			String pwd=vo.getPwd();
			int hit=vo.getHit();
			System.out.println(vo.getHit());
			String subject=vo.getSubject();
			String content=vo.getContent();
			int secret=vo.getSecret();
			
			//해쉬맵 생성
			Map map = new HashMap();
			//받아온 제목과 내용 map에 담기
			map.put("subject", subject);
			map.put("content", content);
			map.put("secret", secret);
			map.put("pwd",pwd);
			map.put("board_no", board_no);
			map.put("hit", hit-2);
			System.out.println(hit);
			bs.secret_update(map);
			
			model.addAttribute("board_no",board_no);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		
		return "redirect:secret_content.do?board_no="+board_no;
	}
	@RequestMapping("secret_reply")
	public String secret_reply(Model model){

		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/secret_reply.jsp" );
		
		return "main/main";
	}
	
	@RequestMapping("board_delete")
	public String secret_delete(Model model,int board_no, String page){
		if(page==null)
			page="1";
		//페이지 받아오기
		int curpage = Integer.parseInt(page);
		try{
			bs.board_delete(board_no);
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.getStackTrace();
		}
		
		model.addAttribute("page",curpage);
		
		return "redirect:secretboard.do";
	}

}
