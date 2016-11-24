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
	
	@Resource(name="bookMapper")
	private BookMapper bm;
	
	@Override
	public WishlistVO inputMemberWishlist(Map map) throws Exception {
		return mapper.inputMemberWishlist(map);
	}
	
	@Override
	public List<WishlistVO> memberWishlist(String id)throws Exception {
		return mapper.memberWishlist(id);
	}
	
	@Override
	public BookVO purchase(String book_code) {
		return bm.purchase(book_code);
	}
	
	@Override
	public void deleteMemberWishlist(Map map) throws Exception {
		mapper.deleteMemberWishlist(map);
	}
	
}
