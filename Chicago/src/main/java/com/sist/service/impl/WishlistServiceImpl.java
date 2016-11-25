package com.sist.service.impl;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.dao.mapper.*;
import com.sist.service.*;

/* Made By Choding */
@Service("wishlistService")
public class WishlistServiceImpl implements WishlistService {
	
	@Resource(name="wishlistMapper")
	private WishlistMapper mapper;
	
	@Override
	public void inputMemberWishlist(Map map) throws Exception {
		
		int count = mapper.countWishlist(map);
		
		if(count == 0)	mapper.inputMemberWishlist(map);
	}
	
	@Override
	public List<WishlistVO> memberWishlist(String id)throws Exception{
		
		
		List<WishlistVO> wishList = mapper.memberWishlist(id);
		
		return wishList;
	}

	@Override
	public void deleteWishlist(String id, String book_code) throws Exception {
		// TODO Auto-generated method stub
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("book_code", book_code);
		int count = mapper.countWishlist(map);
		if(count == 1){
			mapper.deleteWishlist(id);
		}
	}

	@Override
	public void wlDeleteBook(Map map) throws Exception {
		// TODO Auto-generated method stub
		mapper.wlDeleteBook(map);		
	}	
}
