package com.sist.di;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.StoreVO;
import com.sist.service.StoreService;

@Controller
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	@Resource(name="storeService")
	private StoreService ss;
	
	@RequestMapping("store")
	public String store_page(Model model) {
		
		int storeCount =ss.storeCount();
		String[] storeList = ss.storeAllName();
		
		model.addAttribute("storeCount", storeCount);
		model.addAttribute("storeList", storeList);
		model.addAttribute("jsp", "store.jsp");
		model.addAttribute("jsp", "../store/store.jsp");
		return "main/main";
	}
	
	@RequestMapping("storeInfo")
	public String store_info_page(Model model, String store_name){
		
		StoreVO vo = ss.storeInfo(store_name);
		int storeCount =ss.storeCount();
		String[] storeList = ss.storeAllName();
		
		model.addAttribute("storeCount", storeCount);
		model.addAttribute("storeList", storeList);		
		model.addAttribute("vo", vo);
		
		model.addAttribute("jsp", "store.jsp");
		model.addAttribute("jsp", "../store/storeInfo.jsp");		
		return "main/main";
	}
	
}
