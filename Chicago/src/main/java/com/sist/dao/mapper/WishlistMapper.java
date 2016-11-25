package com.sist.dao.mapper;

import java.util.*;
import com.sist.dao.*;

/* Made By Choding */ 
public interface WishlistMapper {
	
	public void inputMemberWishlist(Map map) throws Exception;
	public List<WishlistVO> memberWishlist(String id) throws Exception;
	public int countWishlist(Map map) throws Exception;
	public void deleteWishlist(String id);
	public void wlDeleteBook(Map map);
	
}
