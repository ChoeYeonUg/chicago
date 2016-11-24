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
public class WishlistController {
	
	/* private */
	private static final Logger logger = LoggerFactory.getLogger(WishlistController.class);
	
	@Resource(name="wishlistService")
	private WishlistService ws;
	
	@RequestMapping("memberWishform")
	public String memberWishList(Model model, String book_code, HttpServletRequest request) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		HttpSession hs = request.getSession();
		String sessionid = (String)hs.getAttribute("id");

		try {
			
			if(sessionid != null && !sessionid.equals("")) {
				if(book_code != null && !book_code.equals("")) {
						
					Map map = new HashMap();
					map.put("id", sessionid);
					map.put("book_code", book_code);
					List<String> list = (List<String>)ws.inputMemberWishlist(map);
						
					model.addAttribute("list", list);
					
				} else {
					
					Map map = new HashMap();
					map.put("id", sessionid);
					map.put("book_code", book_code);
					List<String> list = (List<String>)ws.inputMemberWishlist(map);
					
					model.addAttribute("list", list);
					
				}
				
			}
			
		} catch (Exception ex) {
			
			ex.printStackTrace();
			
		}
		
		String str = request.getHeader("referer");
		System.out.println(str+"****************************************");
		return "redirect:"+str.substring(str.lastIndexOf("/")+1);
		
	}
	
	/* Member Wishlist Include */
	@RequestMapping("wishlist")
	public String memberWishlist_page(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		HttpSession hs = request.getSession();
		String sessionid = (String)hs.getAttribute("id");
		
		String id = sessionid;
		
		try {
			
				
			List<WishlistVO>list = ws.memberWishlist(id);
			
			model.addAttribute("list", list);
			model.addAttribute("cmi", "MemberWishform.jsp");
			model.addAttribute("cmi", "../member/memberwishlist/MemberWishList.jsp");
				
			} catch (Exception ex) {
				
				ex.printStackTrace();
				
			}
			
			return "main/main";
			
		}
	
	@RequestMapping("deleteMemberWishlist")
	public String deleteMemberWishlist(Model model, HttpServletRequest request, HttpServletRequest response, String book_code) throws Exception{
		
		HttpSession hs = request.getSession();
		String sessionid = (String) hs.getAttribute("id");
		List<String> list = (List<String>) hs.getAttribute("wishist");
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		if(list != null) {
			
			Map map = new HashMap();
			map.put("id", sessionid);
			ws.deleteMemberWishlist(map);
			
		}
			
			return "redirect:wishlist.do";
		
	}
		
}
