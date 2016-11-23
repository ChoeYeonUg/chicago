package com.sist.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;

public interface WishlistService {
	
	//위시리스트
	public List<WishlistVO> inputMemberWishlist(Map map) throws Exception;
	public List<WishlistVO> memberWishlist(List<String> list, HttpServletRequest request) throws Exception;

}
