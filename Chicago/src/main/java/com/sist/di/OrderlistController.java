package com.sist.di;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import com.sist.service.*;

/* Made By Choding */

@Controller
public class OrderlistController {
	
	/* private */
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Resource(name="memberService")
	private MemberService ms;
	
	/* Member Orderlist HeadMenu */ 
	@RequestMapping("orderlist.do")
	public String orderlistMain_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/orderlist/OrderListMain.jsp");
			
		return "main/main";
		
	}
	
	@RequestMapping("memberOrderList.do")
	public String memberOrderlist_page(Model model, HttpServletRequest request) {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		model.addAttribute("MemberMain_cmi", "MemberMain.jsp");
		model.addAttribute("cmi", "../member/orderlist/MemberOrderList.jsp");
		
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
	
	
	
}
