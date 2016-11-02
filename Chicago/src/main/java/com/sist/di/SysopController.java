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

import com.sist.dao.MemberVO;
import com.sist.service.MemberService;

@Controller
public class SysopController {
	
	private static final Logger logger = LoggerFactory.getLogger(SysopController.class);
	
	@Resource(name="memberService")
	private MemberService ms;
	
	@RequestMapping("sysop")
	public String sysop_page(Model model){
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/sysop.jsp");
		return "main/main";
	}
	
	@RequestMapping("member_management")
	public String memberManagement(String page, Model model){
		
		
		try {
			if (page == null)
				page = "1"; // list.jsp
			
			int curpage = Integer.parseInt(page);
			
			int rowSize = 1;
			int start = (curpage * rowSize) - (rowSize - 1);
			int end = curpage * rowSize;			

			int totalpage = ms.memberTotalPage(rowSize);
			
			int block=10;
			int formPage = ((curpage-1)/block*block)+1;
			int toPage = ((curpage-1)/block*block)+block;
			
			if(toPage> totalpage) toPage = totalpage;
			
			Map map = new HashMap();
			
			map.put("start", start);
			map.put("end", end);
			
			
			model.addAttribute("formpage", formPage);
			model.addAttribute("topage", toPage);
			model.addAttribute("block", block);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("start", start);
			model.addAttribute("end", end);
			System.out.println(totalpage);
			List<MemberVO> list = ms.memberList(map);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/member_management.jsp");		
		return "main/main";
	}
	
	@RequestMapping("changeGrade")
	public String changeGrade(String id, int grade, Model model){
		
		Map map = new HashMap();
		logger.info("asdfasdfji");
		map.put("id", id);
		map.put("grade", grade);
		
		try {
			ms.updateGrade(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:member_management.do";
	}
	
	@RequestMapping("deleteMember")
	public String deleteMember(String id){
		
		try {
			ms.memberDelete(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return "redirect:member_management.do";
	}
	
	//책관리
	@RequestMapping("board_management")
	public String boardManagement(Model model){
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/board_management.jsp");		
		return "main/main";
	}
	
	@RequestMapping("book_management")
	public String bookManagement(Model model){
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/book_management.jsp");		
		return "main/main";
	}
	
	@RequestMapping("sales_management")
	public String salesManagement(Model model){
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/sales_management.jsp");		
		return "main/main";
	}
}
