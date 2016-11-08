package com.sist.di;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.dao.BoardVO;
import com.sist.dao.ReviewVO;
import com.sist.service.BoardService;

@Controller
public class SysopBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	@Resource(name="boardService")
	private BoardService bs;
	
	//책관리
	@RequestMapping("board_management")
	public String boardManagement(String page, Model model, String ss, String fs,HttpServletRequest req){
		
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
			List<BoardVO> list = null;
			int totalpage=1;
			if(ss == null || ss.equals("")){			
				list = bs.printSysopBoard(map);
				totalpage = bs.printboardTotalPage(rowSize);
			}else{
				Map map2 = new HashMap();
				map2.put("ss", ss);
				map2.put("fs", fs);
				map2.put("rowSize", rowSize);

				map.put("ss", ss);
				map.put("fs", fs);
				model.addAttribute("fs", fs);
				model.addAttribute("ss", ss);
				list = bs.printSearchSysopBoard(map);
				totalpage = bs.printSearchBoardTotalPage(map2);
			}
			
			int block=10;
			int formPage = ((curpage-1)/block*block)+1;
			int toPage = ((curpage-1)/block*block)+block;
			
			if(toPage> totalpage) toPage = totalpage;			
			String msg="관리자가 삭제한 게시물입니다.";
			
			model.addAttribute("msg",msg);
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
		model.addAttribute("jsp", "../sysop/board_management.jsp");		
		return "main/main";
	}
	
	@RequestMapping("reviewboard_management")
	public String reviewboard_management(String page, Model model, String ss, String fs,HttpServletRequest req){
		
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
			List<ReviewVO> list = null;
			int totalpage=1;
			if(ss == null || ss.equals("")){			
				list = bs.printSysopReviewBoard(map);
				totalpage = bs.printboardReviewTotalPage(rowSize);
			}else{
				Map map2 = new HashMap();
				map2.put("ss", ss);
				map2.put("fs", fs);
				map2.put("rowSize", rowSize);

				map.put("ss", ss);
				map.put("fs", fs);
				model.addAttribute("fs", fs);
				model.addAttribute("ss", ss);
				list = bs.printSearchReviewSysopBoard(map2);
				totalpage = bs.printSearchBoardTotalPage(map2);
			}
			
			int block=10;
			int formPage = ((curpage-1)/block*block)+1;
			int toPage = ((curpage-1)/block*block)+block;
			
			if(toPage> totalpage) toPage = totalpage;			
			
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
		model.addAttribute("jsp", "../sysop/board_review_management.jsp");		
		return "main/main";
	}
	
	//게시판관리:관리페이지에서바로삭제
	@RequestMapping("board_management_delete")
	public String board_management_delete(Model model,int board_no,HttpServletRequest req){
		try {
			bs.board_delete(board_no);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		
		
		return "redirect:board_management.do";
	}
	
	//게시판관리:세부내용팝업
	@RequestMapping("board_management_content")
	public String board_management_content(Model model,int board_no,HttpServletRequest req){
		try{
			BoardVO vo=bs.boardManagementContent(board_no);
			model.addAttribute("vo", vo);
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.getStackTrace();	
		}		
		
		return "sysop/boardContentPopUp";
	}
	
	//게시판관리:세부내용팝업에서 삭제
	@RequestMapping("board_contentManagement_delete")
	@ResponseBody
	public String board_contentManagement_delete(Model model,int board_no,HttpServletRequest req){			
		try{		
			bs.board_delete(board_no);				
		}catch(Exception e){
			System.out.println(e.getMessage());
			e.getStackTrace();	
		}		
		return "<script>" + "opener.parent.location.reload();" + "window.close();"+ "</script>";
	}
	
	//리뷰관리:관리페이지에서바로삭제
	@RequestMapping("reviewboard_management_delete")
	public String reviewboard_management_delete(Model model,int review_no,HttpServletRequest req){
		try {
			bs.board_reviewManagement_delete(review_no);
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}	
		
		return "redirect:reviewboard_management.do";
	}

	//리뷰관리:세부내용팝업
		@RequestMapping("boardReview_management_content")
		public String boardReview_management_content(Model model,int review_no,HttpServletRequest req){
			try{
				ReviewVO vo=bs.boardManagementReviewContent(review_no);
				model.addAttribute("vo", vo);
			}catch(Exception e){
				System.out.println(e.getMessage());
				e.getStackTrace();	
			}		
			
			return "sysop/boardReviewContentPopUp";
		}
		
		//게시판관리:세부내용팝업에서 삭제
		@RequestMapping("boardreview_contentManagement_delete")
		@ResponseBody
		public String boardreview_contentManagement_delete(Model model,int review_no,HttpServletRequest req){			
			try{		
				bs.board_reviewManagement_delete(review_no);			
			}catch(Exception e){
				System.out.println(e.getMessage());
				e.getStackTrace();	
			}		
			return "<script>" + "opener.parent.location.reload();" + "window.close();"+ "</script>";
		}
		
	
}
