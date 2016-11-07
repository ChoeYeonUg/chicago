package com.sist.di;

import java.util.ArrayList;
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

import com.sist.dao.MemberVO;
import com.sist.service.MemberService;

@Controller
public class SysopController {
	
	private static final Logger logger = LoggerFactory.getLogger(SysopController.class);
	
	@Resource(name="memberService")
	private MemberService ms;
	
	@RequestMapping("sysop")
	public String sysop_page(Model model,HttpServletRequest req){
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/sysop.jsp");
		return "main/main";
	}
	
	@RequestMapping("member_management")
	public String memberManagement(String page, Model model, String ss, String fs,HttpServletRequest req){
		
		try {
			if (page == null)
				page = "1"; // list.jsp
			
			int curpage = Integer.parseInt(page);
			
			int rowSize = 1;
			int start = (curpage * rowSize) - (rowSize - 1);
			int end = curpage * rowSize;			
		
			Map map = new HashMap();
			
			map.put("start", start);
			map.put("end", end);
			List<MemberVO> list = null;
			int totalpage=1;
			if(ss == null || ss.equals("")){			
				list = ms.memberList(map);
				totalpage = ms.memberTotalPage(rowSize);
			}else{
				Map map2 = new HashMap();
				map2.put("ss", ss);
				map2.put("fs", fs);
				map2.put("rowSize", rowSize);
				
				map.put("ss", ss);
				map.put("fs", fs);
				model.addAttribute("fs", fs);
				model.addAttribute("ss", ss);
				list = ms.memberSearch(map);
				totalpage = ms.memberSearchPage(map2);
				
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
		model.addAttribute("jsp", "../sysop/member_management.jsp");		
		return "main/main";
	}
	
	@RequestMapping("changeGrade")
	public String changeGrade(String id, int grade, Model model,HttpServletRequest req){
		
		Map map = new HashMap();
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
	public String boardManagement(Model model,HttpServletRequest req){
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/board_management.jsp");		
		return "main/main";
	}
	
	@RequestMapping("book_management")
	public String bookManagement(Model model,HttpServletRequest req){
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/book_management.jsp");		
		return "main/main";
	}
	
	
}
