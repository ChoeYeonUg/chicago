package com.sist.di;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.WriterVO;
import com.sist.service.WriterService;

@Controller
public class WriterController {

	@Resource(name="writerService")
	private WriterService ws;
	
	@RequestMapping("writer")
	public String writerInfo(Model model){
		
		try {
			List<WriterVO> list = ws.printWriter(new Integer(2));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("jsp", "writer.jsp");
		model.addAttribute("jsp", "../writer/writer.jsp");		
		
		return "main/main";
	}
	
}
