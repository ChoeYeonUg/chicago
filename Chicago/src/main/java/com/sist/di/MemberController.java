package com.sist.di;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	
	@RequestMapping("member")
	public String member_page(Model model){
		
		model.addAttribute("jsp", "member");
		model.addAttribute("jsp", "../member/member.jsp");
		return "main/main";
	}
}
