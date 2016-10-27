package com.sist.di;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@RequestMapping("board")
	public String login_page(Model model){
		
		model.addAttribute("jsp", "board.jsp");
		model.addAttribute("board_jsp", "../board/list.jsp");
		return "main/main";
	}
}
