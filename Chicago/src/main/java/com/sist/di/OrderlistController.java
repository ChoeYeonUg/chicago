package com.sist.di;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
	public String orderlistMain_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/orderlist/OrderListMain.jsp");
			
		return "main/main";
		
	}
	
	/* Member Order SideMenu Include */
	@RequestMapping("memberOrderList.do")
	public String memberOrderlist_page(Model model, OrderlistVO vo, HttpServletRequest request, String typecheck, String page, String deliveryType) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		
		HttpSession hs = request.getSession();
		String sessionid = (String)hs.getAttribute("id");
		
		if(vo.getDelivery()==1) {
			deliveryType = "배송준비중";
		} else if(vo.getDelivery()==2) {
			deliveryType = "배송중";
		} else if(vo.getDelivery()==2) {
			deliveryType = "배송완료";
		} else {
			deliveryType = "??????";
		}
		
		if(page == null) page = "1";
		
		int curPage = Integer.parseInt(page);
		int rowSize = 7;
		int start = (curPage * rowSize) - (rowSize - 1);
		int end = curPage * rowSize;
		int block = 10;
		int fromPage = ((curPage - 1) / block * block) + 1;
		int toPage = ((curPage - 1) / block * block) + block;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("rowSize", rowSize);
		map.put("id", sessionid);
		
		try {
			List<OrderlistVO> list = ols.selectOrderlist(map);
			int totalPage = ols.memberOrderlistTotalPage(sessionid);
			
			if(toPage > totalPage) toPage = totalPage;
			
			model.addAttribute("deliveryType", deliveryType);
			model.addAttribute("list", list);
			model.addAttribute("block", block);
			model.addAttribute("toPage", toPage);
			model.addAttribute("fromPage", fromPage);
			model.addAttribute("curPage", curPage);
			model.addAttribute("totalPage", totalPage);
			
			model.addAttribute("cmi", "../member/orderlist/MemberOrderList.jsp");
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return "main/main";
		
	}
	
	
	@RequestMapping("guestOrderList.do")
	public String guestOrderlist_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/orderlist/GuestOrderList.jsp");
		
		return "main/main";
		
	}
	
	

	
	
	/* Member Wishlist HeadMenu */ 
	@RequestMapping("wish.do")
	public String member_wish_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberwishlist/MemberWishList.jsp");
		
		return "main/main";
		
	}
	
	
	
	/* Member Question HeadMenu */ 
	@RequestMapping("memberquestion.do")
	public String member_question_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/memberquestion/MemberQuestionMain.jsp");
		
		return "main/main";
		
	}
	
}
