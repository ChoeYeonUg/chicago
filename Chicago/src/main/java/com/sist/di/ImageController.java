package com.sist.di;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageController {

	@RequestMapping("imageSrc")
	public void viewIamge(String src, Model model, HttpServletResponse response){
		
		
		try{
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		 
		String imagePath = "c://download//"+src;
		 
		//해당 아이디에 맞는 이미지를 찾는 조건문 간단하게 if로 구현 하였지만 기타 방식으로 데이터를 가져오면 됩니다.
		 
		File file = new File(imagePath);
		int size = (int)file.length();
		//out.clear();
		bos = new BufferedOutputStream(response.getOutputStream());
		byte b[] = new byte[2048];
		int read = 0;
		if( size>0 && file.isFile() ) {
		    bis = new BufferedInputStream(new FileInputStream(file));
		    while((read=bis.read(b))!=-1 ) {
		        bos.write(b,0,read);
		    }
		} 
		bos.close();
		bis.close();
	}catch(Exception e){
		
	}
		
		return;
	}
}
