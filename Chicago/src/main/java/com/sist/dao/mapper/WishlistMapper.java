package com.sist.dao.mapper;

import java.util.*;
import com.sist.dao.*;

/* Made By Choding */ 
public interface WishlistMapper {
	
	public WishlistVO inputMemberWishlist(Map map) throws Exception;
	public List<WishlistVO> memberWishlist(String id) throws Exception;
	public BookVO purchase(String book_code);
	public WishlistVO deleteMemberWishlist(Map map) throws Exception;
	
}
