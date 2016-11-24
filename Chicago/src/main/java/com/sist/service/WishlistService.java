package com.sist.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;

public interface WishlistService {
	
	//위시리스트
	public void inputMemberWishlist(Map map) throws Exception;
	public List<WishlistVO> memberWishlist(String id) throws Exception;
	public void deleteWishlist(String id,String book_code) throws Exception;
	public void wlDeleteBook(Map map) throws Exception;

}
