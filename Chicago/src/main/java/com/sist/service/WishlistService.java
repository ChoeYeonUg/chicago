package com.sist.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;

public interface WishlistService {
	
	//위시리스트
	public WishlistVO inputMemberWishlist(Map map) throws Exception;
	public List<WishlistVO> memberWishlist(String id) throws Exception;
	public BookVO purchase(String book_code);
	public WishlistVO deleteMemberWishlist(Map map) throws Exception;

}
