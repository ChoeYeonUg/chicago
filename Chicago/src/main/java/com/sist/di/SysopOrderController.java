package com.sist.di;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.OrdersVO;
import com.sist.service.OrdersService;

@Controller
public class SysopOrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(SysopOrderController.class);
	
	@Resource(name="ordersService")
	private OrdersService os;
	
	@RequestMapping("sales_management")
	public String salesManagement(String page, Model model, String ss, String fs,HttpServletRequest req){
		
		try {
			if (page == null)
				page = "1"; // list.jsp
			
			int curpage = Integer.parseInt(page);
			
			int rowSize = 1;
			int start = (curpage * rowSize) - (rowSize - 1);
			int end = curpage * rowSize;			
		
			Map map = new HashMap();
			
			map.put("start", start);
			map.put("end", end);
			List<OrdersVO> list = null;
			int totalpage=1;
			if(ss == null || ss.equals("")){			
				list = os.printOrder(map);
				totalpage = os.orderTotalPage(rowSize);
			}else{
				Map map2 = new HashMap();
				map2.put("ss", ss);
				map2.put("fs", fs);
				map2.put("rowSize", rowSize);
				logger.info(map2.get("rowSize")+"");
				map.put("ss", ss);
				map.put("fs", fs);
				model.addAttribute("fs", fs);
				model.addAttribute("ss", ss);
				list = os.printSearchOrder(map);
				totalpage = os.orderSearchTotalPage(map2);
			}
			
			int block=10;
			int formPage = ((curpage-1)/block*block)+1;
			int toPage = ((curpage-1)/block*block)+block;
			
			if(toPage> totalpage) toPage = totalpage;			
			
			model.addAttribute("formpage", formPage);
			model.addAttribute("topage", toPage);
			model.addAttribute("block", block);
			model.addAttribute("curpage", curpage);
			model.addAttribute("totalpage", totalpage);
			model.addAttribute("start", start);
			model.addAttribute("end", end);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/sales_statement.jsp");		
		return "main/main";
	}
}
