package com.sist.di;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sist.dao.WriterVO;
import com.sist.service.WriterService;

@Controller
public class SysopWriterController {

	@Resource(name="writerService")
	private WriterService ws;
	
	@RequestMapping("writer_management")
	public String writerManagement(String page, Model model, String ss, String fs,HttpServletRequest req){
		
		try {
			if (page == null)
				page = "1"; // list.jsp
			
			int curpage = Integer.parseInt(page);
			
			int rowSize = 10;
			int start = (curpage * rowSize) - (rowSize - 1);
			int end = curpage * rowSize;			
		
			Map map = new HashMap();
			
			map.put("start", start);
			map.put("end", end);
			List<WriterVO> list = null;
			int totalpage=1;
			if(ss == null || ss.equals("")){			
				list = ws.printSysopWriter(map);
				totalpage = ws.writerTotalPage(rowSize);
			}else{
				Map map2 = new HashMap();
				map2.put("ss", ss);
				map2.put("fs", fs);
				map2.put("rowSize", rowSize);

				map.put("ss", ss);
				map.put("fs", fs);
				model.addAttribute("fs", fs);
				model.addAttribute("ss", ss);
				list = ws.printSysopSearchWriter(map);
				totalpage = ws.writerSearchTotalPage(map2);
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
		model.addAttribute("jsp", "../sysop/writer_management.jsp");
		
		return "main/main";
	}
	
	@RequestMapping("add_writer")
	public String add_writer(Model model,HttpServletRequest req){
		
		WriterVO vo = new WriterVO();
		
		model.addAttribute("writer", vo);
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/add_writer.jsp");		
		return "main/main";
	}
	
	@RequestMapping(value ="add_writer_ok", method = RequestMethod.POST)
	public String add_writer_ok(Model model,HttpServletRequest req, WriterVO writer, String birthVal, String deathVal){
		
		try{
		if(birthVal != null && !birthVal.equals("")){
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			writer.setBirth(transFormat.parse(birthVal));
		}
		if(deathVal != null && !deathVal.equals("")){
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			writer.setDeath(transFormat.parse(deathVal));
		}
		
		
		ws.writerInsert(writer, req);
		
		}catch(Exception e){
			return "redirect:add_writer.do";
		}
			
		return "redirect:writer_management.do";
	}
	
	
	@RequestMapping(value ="add_writer_ok", method = RequestMethod.GET)
	public String add_writer_ok(HttpServletRequest req){
		
			
		return "redirect:writer_management.do";
	}
	
	@RequestMapping("writer_delete")
	public String writer_delete(HttpServletRequest req, int writer_no){
		
		try {
			ws.writerDelete(writer_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:writer_management.do";
	}
	
	@RequestMapping("update_writer")
	public String update_writer(Model model,HttpServletRequest req, int writer_no){
		
		WriterVO vo = null;
		try {
			vo = ws.updateWriter(writer_no);
			
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			if(vo.getBirth() != null){
				String birth = transFormat.format(vo.getBirth());
				model.addAttribute("birth", birth);
			}
			if(vo.getDeath() != null){
				String death =transFormat.format(vo.getDeath());
				model.addAttribute("death", death);
			}
			
			model.addAttribute("writer", vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		model.addAttribute("jsp", "sysop.jsp");
		model.addAttribute("jsp", "../sysop/update_writer.jsp");		
		return "main/main";
	}
	
	@RequestMapping("writer_update_ok")
	public String writer_update_ok(WriterVO writer, HttpServletRequest req, String birthVal, String deathVal){
		
		try{
			if(birthVal != null && !birthVal.equals("")){
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				writer.setBirth(transFormat.parse(birthVal));
			}
			if(deathVal != null && !deathVal.equals("")){
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				writer.setDeath(transFormat.parse(deathVal));
			}
			
			ws.updateWriterData(writer,req);
		}catch(Exception e){
			return "redirect:update_writer.do?writer_no"+writer.getWriter_no();
		}
		
		return "redirect:writer_management.do";
		
	}
	
}
