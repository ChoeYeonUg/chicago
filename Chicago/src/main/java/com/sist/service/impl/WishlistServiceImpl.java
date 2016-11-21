package com.sist.service.impl;

import java.util.*;

import javax.annotation.Resource;
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
	public List<WishlistVO> memberWishlist(List<String> list)throws Exception{
		
		List<WishlistVO> wishList = new ArrayList<WishlistVO>();
		
		for(String book_code : list){
			System.out.println(book_code);
			WishlistVO vo = mapper.memberWishlist(book_code);
			wishList.add(vo);
		}
		
		return wishList;
	}
	
}