package com.sist.di;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@RequestMapping("store")
	public String store_page(Model model) {

		model.addAttribute("jsp", "store");
		model.addAttribute("jsp", "../store/store.jsp");
		return "main/main";
	}
}
