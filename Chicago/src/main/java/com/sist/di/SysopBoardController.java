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

import com.sist.dao.BoardVO;
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
	
	
}
