package com.sist.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sist.dao.WriterVO;
import com.sist.dao.mapper.WriterMapper;
import com.sist.service.WriterService;

@Service("writerService")
public class WriterServiceImpl implements WriterService{
	
	@Resource(name="writerMapper")
	private WriterMapper wm;
	
	@Override
	public List<WriterVO> printWriter(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.printWriter(map);
	}

	@Override
	public int printWriterTotalPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.printWriterTotalPage(map);
	}

	@Override
	public List<WriterVO> printSearchWriter(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.printSearchWriter(map);
	}

	@Override
	public int printSearchWriterTotalPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.printSearchWriterTotalPage(map);
	}

	@Override
	public WriterVO detailWriter(int writer_no) throws Exception {
		// TODO Auto-generated method stub
		return wm.detailWriter(writer_no);
	}

	@Override
	public List<WriterVO> printSysopWriter(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.printSysopWriter(map);
	}

	@Override
	public int writerTotalPage(int rowSize) throws Exception {
		// TODO Auto-generated method stub
		return wm.writerTotalPage(rowSize);
	}

	@Override
	public List<WriterVO> printSysopSearchWriter(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.printSearchWriter(map);
	}

	@Override
	public int writerSearchTotalPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return wm.writerSearchTotalPage(map);
	}

	@Override
	public void writerInsert(WriterVO vo, HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		
		String uploadPath = "C://download";

		File dir = new File(uploadPath);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)req;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    while(iterator.hasNext()){
	    	String uploadFileName = iterator.next();
			MultipartFile mFile = multipartHttpServletRequest.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();
			String saveFileName = originalFileName;

			if(saveFileName != null && !saveFileName.equals("")) {
				if(new File(uploadPath + saveFileName).exists()) {
					saveFileName = "img_"+System.currentTimeMillis();
				}
				try {
					mFile.transferTo(new File(uploadPath +"\\" + saveFileName));
					vo.setImg(saveFileName);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	    }
	    
		wm.writerInsert(vo);
	}

	@Override
	public void writerDelete(int writer_no) throws Exception {
		// TODO Auto-generated method stub
		wm.writerDelete(writer_no);
	}

	@Override
	public WriterVO updateWriter(int writer_no) throws Exception {
		// TODO Auto-generated method stub
		return wm.updateWriter(writer_no);
	}

	@Override
	public void updateWriterData(WriterVO vo, HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		
		String uploadPath = "C://download";

		File dir = new File(uploadPath);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)req;
	    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	    while(iterator.hasNext()){
	    	String uploadFileName = iterator.next();
			MultipartFile mFile = multipartHttpServletRequest.getFile(uploadFileName);
			String originalFileName = mFile.getOriginalFilename();
			String saveFileName = originalFileName;

			if(saveFileName != null && !saveFileName.equals("")) {
				if(new File(uploadPath + saveFileName).exists()) {
					saveFileName = "img_"+System.currentTimeMillis();
				}
				try {
					mFile.transferTo(new File(uploadPath +"\\" + saveFileName));
					vo.setImg(saveFileName);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	    }
	    
	    if(vo.getImg()==null || vo.getImg().equals("")){
	    	WriterVO check = wm.updateWriter(vo.getWriter_no());
	    	vo.setImg(check.getImg());
	    }	    
		
		wm.updateWriterData(vo);
	}
	
}
