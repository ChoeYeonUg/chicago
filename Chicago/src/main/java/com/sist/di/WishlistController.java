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
	
	@RequestMapping("memberWishList")
	public String wishlistForm(Model model, String book_code, HttpServletRequest request) throws Exception {
		
		try {
			model.addAttribute("jsp", "member.jsp");
			model.addAttribute("member_jsp", "../member/MemberMain.jsp");
			
			HttpSession hs = request.getSession();
			String sessionid = (String)hs.getAttribute("id");
			
			Map map = new HashMap();
			map.put("id", sessionid);
			map.put("book_code", book_code);
			
			List<WishlistVO> list = ws.inputMemberWishlist(map);
					
			model.addAttribute("list", list);
			
		} catch (Exception ex) {
			
			ex.printStackTrace();
			
		}
		
		return "main/main";
		
	}
	
	/* Member Wishlist Include */
	@RequestMapping("wish.do")
	public String memberWishlist_page(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		HttpSession hs = request.getSession();
		String sessionid = (String)hs.getAttribute("id");
		
			List<String> list = (List<String>) hs.getAttribute("wishList");
			
			List<WishlistVO> wishList = null;
			try {
				if(list != null){
					
					wishList = ws.memberWishlist(list, request);
					
				}
				
				model.addAttribute("wishList", wishList);
				model.addAttribute("cmi", "MemberWishform.jsp");
				model.addAttribute("cmi", "../member/memberwishlist/MemberWishList.jsp");
				
			} catch (Exception ex) {
				
				ex.printStackTrace();
				
			}
			
			return "main/main";
			
		}
		
}
