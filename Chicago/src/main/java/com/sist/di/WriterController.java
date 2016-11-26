package com.sist.di;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.service.BookService;
import com.sist.service.WriterService;
import com.sist.vo.BookVO;
import com.sist.vo.WriterVO;

@Controller
public class WriterController {
	
	private static final Logger logger = LoggerFactory.getLogger(WriterController.class);

	@Resource(name="writerService")
	private WriterService ws;
	
	@Resource(name = "bookService")
	private BookService bs;
	
	@RequestMapping("writer")
	public String writerInfo(String page, Model model, String ss, String book_category){
		
		try {
			if (page == null)
				page = "1"; // list.jsp
			if(book_category == null){
				book_category = "1";
			}
			int bc = Integer.parseInt(book_category);
			
			int curpage = Integer.parseInt(page);
			
			int rowSize = 3;
			int start = (curpage * rowSize) - (rowSize - 1);
			int end = curpage * rowSize;			
		
			Map map = new HashMap();
			map.put("rowSize", rowSize);
			map.put("start", start);
			map.put("end", end);
			map.put("book_category", bc);
			List<WriterVO> list = null;
			int totalpage=1;
			if(ss == null || ss.equals("")){			
				list = ws.printWriter(map);
				totalpage = ws.printWriterTotalPage(map);
			}else{

				map.put("ss", ss);
				model.addAttribute("ss", ss);
				list = ws.printSearchWriter(map);
				totalpage = ws.printSearchWriterTotalPage(map);
			}
			
			int block=10;
			int formPage = ((curpage-1)/block*block)+1;
			int toPage = ((curpage-1)/block*block)+block;
			
			if(toPage> totalpage) toPage = totalpage;
			
			int categoryCount = bs.categoryCount();
			model.addAttribute("book_category", bc);
			model.addAttribute("startBookname", new Integer(0));
			model.addAttribute("maxBookname", new Integer(8));
			model.addAttribute("categoryCount", categoryCount);
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
		
		model.addAttribute("jsp", "writer.jsp");
		model.addAttribute("jsp", "../writer/writer.jsp");		
		
		return "main/main";
	}
	
	@RequestMapping("writerDetail")
	public String writerDetail(int writer_no, Model model, HttpServletResponse response, HttpServletRequest request){
		WriterVO vo = null;
		try {
			vo = ws.detailWriter(writer_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		if(vo.getImg() != null && vo.getImg().indexOf("http://") == -1){
			String imagePath;
			imagePath = "imageSrc.do?src="+vo.getImg();
			model.addAttribute("imagePath", imagePath);
		}else if(vo.getImg() != null && vo.getImg().indexOf("http://") <= 0){
			model.addAttribute("imagePath", vo.getImg());
		}else{
			model.addAttribute("imagePath", "images\\writer_noimage.gif");
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("jsp", "writer.jsp");
		model.addAttribute("jsp", "../writer/writer_detail.jsp");		
		return "main/main";
	}
	
}
