package com.sist.di;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class LoginController {

	
	@RequestMapping("login")
	public String login_page(Model model){
		
		model.addAttribute("jsp", "login");
		model.addAttribute("jsp", "../login/login.jsp");
		return "main/main";
	}
}
