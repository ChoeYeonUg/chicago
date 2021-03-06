package com.sist.di;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.sist.dao.*;
import com.sist.service.*;

/* Made By Choding */
@Controller
public class OrderlistController {
	
	/* private */
	private static final Logger logger = LoggerFactory.getLogger(OrderlistController.class);
	@Resource(name="orderlistService")
	private OrderlistService ols;
	
	/* Member Orderlist Head And SideHead Menu */ 
	@RequestMapping("orderlist.do")
	public String orderlistMain_page(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/orderlist/OrderListMain.jsp");
		
		
		return "main/main";
		
	}
	
	/* Member Order SideMenu Include */
	@RequestMapping("memberOrderList.do")
	public String memberOrderlist_page(Model model, OrderlistVO vo, HttpServletRequest request, HttpServletResponse response, String typecheck, String page, String book_cnt, String ss) throws Exception {
		
		HttpSession hs = request.getSession();
		String sessionid = (String)hs.getAttribute("id");
		
		if(sessionid == null) {
			
			model.addAttribute("jsp", "member.jsp");
			model.addAttribute("member_jsp", "../login/login.jsp");
			
		} else {
			
			model.addAttribute("jsp", "member.jsp");
			model.addAttribute("member_jsp", "../member/MemberMain.jsp");
			
			try {
				if(page == null) page = "1";
				if(book_cnt == null) book_cnt = "1";
				
				int cnt = Integer.parseInt(book_cnt);
				int curPage = Integer.parseInt(page);
				int rowSize = 7;
				int start = (curPage * rowSize) - (rowSize - 1);
				int end = curPage * rowSize;
				int count = 0;
				
				Map map = new HashMap();
				map.put("rowSize", rowSize);
				map.put("start", start);
				map.put("end", end);
				map.put("id", sessionid);
				map.put("cnt", cnt);
				
				List<OrderlistVO> list = null;
				int totalPage = 1;
				if(ss == null || ss.equals("")) {
					
					list = ols.selectOrderlist(map);
					totalPage = ols.selectOrderlistTotalPage(map);
					
				} else {
					
					map.put("ss", ss);
					model.addAttribute("ss", ss);
					list = ols.searchOrderlist(map);
					totalPage = ols.searchOrderlistTotalPage(map);
					
				}
	
				int block = 10;
				int fromPage = ((curPage - 1) / block * block) + 1;
				int toPage = ((curPage - 1) / block * block) + block;
				
				if(toPage> totalPage) toPage = totalPage;			
				
				model.addAttribute("book_cnt", book_cnt);
				model.addAttribute("list", list);
				model.addAttribute("fromPage", fromPage);
				model.addAttribute("toPage", toPage);
				model.addAttribute("block", block);
				model.addAttribute("curPage", curPage);
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("start", start);
				model.addAttribute("end", end);
				
				model.addAttribute("cmi", "../member/orderlist/MemberOrderList.jsp");
				
				return "main/main";
				
			} catch (Exception ex) {
				
				ex.printStackTrace();
				
			}
			
		}
		
		return "main/main";
		
	}
	
	@RequestMapping("memberOrderlistDetail")
	public String memberOrderlistDetail(Model model,int order_id, BookVO vo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		HttpSession hs = request.getSession();
		String sessionid = (String)hs.getAttribute("id");

		try {
			
			Map map = new HashMap();
			map.put("id", sessionid);
			map.put("order_id", order_id);
			
			OrderlistVO list = ols.memberOrderlistDetail(map);
			
			model.addAttribute("list", list);
			
		} catch (Exception ex) {
			
			ex.printStackTrace();
			
		}
		
		model.addAttribute("cmi", "MemberOrderList.jsp");
		model.addAttribute("cmi", "../member/orderlist/MemberOrderListDetail.jsp");
	
		return "main/main";
	
	}
		
	/* Member Question HeadMenu */ 
	@RequestMapping("memberquestion.do")
	public String member_question_page(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberquestion/MemberQuestionMain.jsp");
		
		return "main/main";
		
	}
	
	@RequestMapping("deliOk")
	public String deliOk(Model model, HttpServletRequest req, HttpServletResponse resp, int order_id){
		
		try {
			HttpSession hs = req.getSession();
			String id = (String)hs.getAttribute("id");
			int grade = (Integer) hs.getAttribute("grade");
			ols.deliOk(order_id, grade, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:memberOrderList.do";
	}
	
	@RequestMapping("orderCancel")
	public String orderCancel(Model model, HttpServletRequest req, HttpServletResponse resp, int order_id){
		
		try {
			ols.cancelOrder(order_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:memberOrderList.do";
	}
	
}
