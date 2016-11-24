package com.sist.dao.mapper;

import java.util.*;
import com.sist.dao.*;

/* Made By Choding */ 
public interface WishlistMapper {
	
	public WishlistVO inputMemberWishlist(Map map) throws Exception;
	public WishlistVO memberWishlist(String book_code) throws Exception;
	
}
