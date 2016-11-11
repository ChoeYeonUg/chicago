package com.sist.di;

import static org.hamcrest.CoreMatchers.instanceOf;

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
import com.sist.dao.ReviewVO;
import com.sist.service.BoardService;


@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name="boardService")
	private BoardService bs;	
	
	
	///////////////*공지사항*///////////////
	@RequestMapping("noticeboard")
	public String noticeboardListData(Model model,String page){
				
		if(page==null)
			page="1";			
		int curpage = Integer.parseInt(page);
		
		int rowSize = 5;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		int block=5;
		int fromPage = ((curpage-1)/block*block)+1;
		int toPage = ((curpage-1)/block*block)+block;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("rowSize", rowSize);
		map.put("category",1);
		
		/*로거쓰는 방법
		logger.info(block+"로거테스트");*/	
		
		try{	
			List<BoardVO> list=bs.noticeboard_ListData(map);			
			int totalpage = bs.boardTotalPage(map);			
			
			if(toPage> totalpage)
				toPage = totalpage;				
			
			model.addAttribute("list", list);
			model.addAttribute("block",block);					
			model.addAttribute("toPage", toPage);
			model.addAttribute("fromPage", fromPage);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			
			model.addAttribute("jsp", "board.jsp");
			model.addAttribute("board_jsp", "../board/list.jsp");
			model.addAttribute("boardjsp","../board/noticelist.jsp" );	
		}catch (Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
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

		Map map = new HashMap();
		map.put("subject", subject);
		map.put("content", content);
		
		try{			
			bs.notice_insert(map);			
		} catch (Exception e){
			e.getStackTrace();
			System.out.println(e.getMessage());
		}				
		return "redirect:noticeboard.do";
	}
	
	///////////////*faq게시판*///////////////
	@RequestMapping("faqboard")
	public String faqboard(Model model,String page, String faq_category){		
		
		int faq_cat = 0;
		int curpage = 1;
		
		if (page == null)
			page = "1"; 
		if(faq_category == null) 
			faq_category= "0";
		try{
			curpage=Integer.parseInt(page);
			faq_cat=Integer.parseInt(faq_category);			
		}catch(Exception e){			
			faq_cat=0;
		}
		if(!(faq_cat >=0 && faq_cat<=6))
			faq_cat=0;
		
		int rowSize = 5;
	    int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		int block=5;
		int fromPage = ((curpage-1)/block*block)+1;
		int toPage = ((curpage-1)/block*block)+block;
				
		Map map = new HashMap();		
		map.put("start", start);
		map.put("end", end);
		map.put("faq_category", faq_cat);
		map.put("rowSize", rowSize);
		map.put("category",2);
		
		String[] categoryList = {"전체", "회원", "상품", "주문결제", "배송", "교환/반품/환불", "기타"};
		
		int totalfaq;			
		int totalpage;
		List<BoardVO> flist;
		try{			
			if(faq_cat==0){
				flist=bs.faqboard_AllListData(map);
				totalfaq=bs.faq_boardTotalPage();
				totalpage=bs.boardTotalPage(map);				
			}else{
				flist=bs.faqboard_CatListData(map);
				totalfaq=bs.faq_CatboardTotalPage(faq_cat);
				totalpage=bs.faqtotalListPage(faq_cat);				
			}
			if(toPage> totalpage) toPage = totalpage;			
						
			model.addAttribute("block",block);
			model.addAttribute("fromPage", fromPage);
			model.addAttribute("toPage", toPage);			
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalfaq", totalfaq);
			model.addAttribute("totalpage", totalpage);
			
			model.addAttribute("flist", flist);
			model.addAttribute("categoryList",categoryList);			
			model.addAttribute("faq_category",faq_cat);
			
			model.addAttribute("jsp", "board.jsp");
			model.addAttribute("board_jsp", "../board/list.jsp");
			model.addAttribute("boardjsp","../board/faqlist.jsp" );
		}catch(Exception e){			
			e.printStackTrace();
		}
		return "main/main";
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

		Map map = new HashMap();
		map.put("subject", subject);
		map.put("content", content);
		map.put("faq_category",faq_category);
		
		try{			
			bs.faq_insert(map);
		}catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		return "redirect:faqboard.do";
	}
		
	///////////////*1:1게시판*///////////////
	@RequestMapping("secretboard")
	public String secretboard(Model model,String page,String fs,String ss){
		
		if(page==null)
			page="1";	
		
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		int block=5;
		int fromPage = ((curpage-1)/block*block)+1;
		int toPage = ((curpage-1)/block*block)+block;
		
		String msg="관리자가 삭제한 게시물입니다.";
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	    String today=sdf.format(new Date());
	    
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("rowSize", rowSize);
		map.put("category", 3);
		map.put("fs", fs);
		map.put("ss", ss);				
		
		List<BoardVO> list;
		int totalpage;
		try{		
			if(ss==null || ss==""){
				list=bs.secretboard_ListData(map);
				totalpage = bs.boardTotalPage(map);
			}else{
				list=bs.secret_find(map);
				totalpage= bs.secret_find_total(map);
			}
			if(toPage> totalpage) 
				toPage = totalpage;	
		
			model.addAttribute("fs", fs);
			model.addAttribute("ss", ss);
			model.addAttribute("block",block);
			model.addAttribute("fromPage", fromPage);
			model.addAttribute("toPage", toPage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("curpage", curpage);
			model.addAttribute("list", list);
			model.addAttribute("today",today);
			model.addAttribute("msg",msg);
		
			model.addAttribute("jsp", "board.jsp");
			model.addAttribute("board_jsp", "../board/list.jsp");
			model.addAttribute("boardjsp","../board/secretboard.jsp" );
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return "main/main";
	}		
	
	@RequestMapping("secret_content")
	public String secret_content(Model model, int board_no,String page){
		
		if(page==null)
			page="1";		
		int curpage = Integer.parseInt(page);
		
		try{				
			BoardVO vo=bs.secretboard_Content(board_no);		
	
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
	
	@RequestMapping("secretboard_insert")
	public String secret_insert(Model model){		
		
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/secretboard_insert.jsp" );
				
		return "main/main";
	}
	
	@RequestMapping("secretboard_insert_ok")
	public String secretboard_insert_ok(Model model,BoardVO vo){		
			
		try {
			bs.secret_insert(vo);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		return "redirect:secretboard.do";
	}
	
	@RequestMapping("secretboard_pwd_check")
	public String secretboard_pwd_check(Model model, String page, int board_no){
		
		if(page==null)
			page="1";
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
	public String secretboard_pwd_check_ok(Model model,String page,String pwd,int board_no){
		
		if(page==null)
			page="1";
		int curpage = Integer.parseInt(page);
					
		try{			
			String db_pwd=bs.getPwd(board_no);
			if(db_pwd.equals(pwd)){
				model.addAttribute("page",curpage);
				model.addAttribute("board_no",board_no);				
				
				return "redirect:secret_content.do";
			}
		}catch(Exception e){
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		return "redirect:secretboard.do";	
	}

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
		vo.setHit(vo.getHit()-2);
		try {
			
			bs.secret_update(vo);						
			model.addAttribute("board_no",board_no);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}		
		return "redirect:secret_content.do?board_no="+board_no;
	}
	@RequestMapping("secret_reply")
	public String secret_reply(Model model,int board_no){		
				
		model.addAttribute("board_no",board_no);		
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/secret_reply.jsp" );
		
		return "main/main";
	}
	
	@RequestMapping("secret_reply_ok")
	public String secret_reply_ok(Model model,String page,int board_no,BoardVO vo){
		
		if(page==null)
			page="1";		
		int curpage = Integer.parseInt(page);	
		
		try{
			BoardVO pvo=bs.secret_parentData(board_no);			
			
			vo.setGroup_id(pvo.getGroup_id());		
			vo.setGroup_step(pvo.getGroup_step() + 1);
			vo.setGroup_tab(pvo.getGroup_tab() + 1);
			vo.setRoot(board_no);		
			
			bs.secret_replyInsert(vo);
			bs.secret_depthIncrement(board_no);
			
			model.addAttribute("page",curpage);
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.getStackTrace();
		}	
		return "redirect:secretboard.do";
	}
	
	@RequestMapping("board_delete")
	public String secret_delete(Model model,int board_no, String page){
		if(page==null)
			page="1";		
		int curpage = Integer.parseInt(page);
			
		try{
			bs.board_delete(board_no);
			model.addAttribute("page",curpage);
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.getStackTrace();
		}
		return "redirect:secretboard.do";
	}
	
	///////////////*리뷰게시판*///////////////
	@RequestMapping("reviewboard")
	public String reviewboard(Model model,String page,String fs,String ss) throws Exception{
		if(page==null)
			page="1";		
		int curpage = Integer.parseInt(page);	
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = curpage * rowSize;
		int block=5;
		int fromPage = ((curpage-1)/block*block)+1;
		int toPage = ((curpage-1)/block*block)+block;
		
		
	/*	if(fs.equals("book_code")){
			fs="review.book_code";
			System.out.println("같음");
		}
		*/
		

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	    String today=sdf.format(new Date());
	    
	    Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("rowSize", rowSize);
		map.put("fs", fs);
		map.put("ss", ss);
			
	   
		List<ReviewVO> list;
		int totalpage;
		try{		
			if(ss==null || ss==""){
				list=bs.reviewlist(map);
				totalpage = bs.totalReviewPage(map);
			}else{
				
				
				list=bs.review_find(map);
				totalpage= bs.review_find_total(map);
			}
			if(toPage> totalpage) 
				toPage = totalpage;	
		
			
			for(ReviewVO vo:list){
				vo.setScore(vo.getScore()*20);				
			}
			
			model.addAttribute("fs", fs);
			model.addAttribute("ss", ss);
			model.addAttribute("block",block);
			model.addAttribute("fromPage", fromPage);
			model.addAttribute("toPage", toPage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("curpage", curpage);
			model.addAttribute("list", list);
			model.addAttribute("today",today);
			
		
			model.addAttribute("jsp", "board.jsp");
			model.addAttribute("board_jsp", "../board/list.jsp");
			model.addAttribute("boardjsp","../board/secretboard.jsp" );
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		model.addAttribute("boardjsp","../board/reviewlist.jsp" );
		
		return "main/main";
	}

	
	
	
}
