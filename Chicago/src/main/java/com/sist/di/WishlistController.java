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
public class WishlistController {
	
	/* private */
	private static final Logger logger = LoggerFactory.getLogger(WishlistController.class);
	
	@Resource(name="wishlistService")
	private WishlistService ws;
	
	@RequestMapping("MemberWishform")
	public String wishlistForm(Model model, String book_code, HttpServletRequest request) {
		
		try {
			model.addAttribute("jsp", "member.jsp");
			model.addAttribute("member_jsp", "../member/MemberMain.jsp");
			
			HttpSession hs = request.getSession();
			String sessionid = (String)hs.getAttribute("id");
			
			List<String> list = (List<String>) hs.getAttribute("wishList");
			
			if(book_code != null && !book_code.equals("")){
				if(list == null) {
					
					logger.info("************************* 위시리스트 생성");
					list = new ArrayList<String>();
					list.add(book_code);
					
				} else {
					
					logger.info("************************* 위시리스트 목록 추가");
					list.add(book_code);
					
					HashSet temp = new HashSet(list);
					
					list = new ArrayList<String>(temp);
				}
				
				hs.setAttribute("wishList", list);
				
			}			
			
		} catch (Exception ex) {
			
			ex.printStackTrace();
			
		}
		
		String str = request.getHeader("referer");
		System.out.println(str+"****************************************");
		return "redirect:"+str.substring(str.lastIndexOf("/")+1);
		
	}
	
	/* Member Wishlist Include */
	@RequestMapping("wish.do")
	public String memberWishlist_page(Model model, HttpServletRequest request) throws Exception {
		
		model.addAttribute("jsp", "member.jsp");
		model.addAttribute("member_jsp", "../member/MemberMain.jsp");
		
		HttpSession hs = request.getSession();
		String sessionid = (String)hs.getAttribute("id");
		
			List<String> list = (List<String>) hs.getAttribute("wishList");
			
			List<WishlistVO> wishList = null;
			try {
				if(list != null){
					
					wishList = ws.memberWishlist(list);
					
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
