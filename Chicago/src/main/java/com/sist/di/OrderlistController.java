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
	public String memberOrderlist_page(Model model, HttpServletRequest request, String typecheck) {
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		try{
			Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
			String check = (String) flashMap.get("check");
			model.addAttribute("cmi", "../member/orderlist/MemberOrderList.jsp");
			HttpSession hs = request.getSession();
			String sessionid = (String)hs.getAttribute("id");
			
			Map map = new HashMap();
			
			map.put("id", sessionid);
			List<OrderlistVO> list = ols.selectOrderlist(map);
			
			model.addAttribute("list", list);
			
			
		}catch(Exception ex) {
			typecheck="mo";
			
			model.addAttribute("typecheck", typecheck);
			model.addAttribute("cmi", "../member/MemberSecurePassword.jsp");
			
		}
		
		return "main/main";
		
	}
	
	
	@RequestMapping("guestOrderL"
			+ "ist.do")
	public String guestOrderlist_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/orderlist/GuestOrderList.jsp");
		
		return "main/main";
		
	}
	
	
	
}
